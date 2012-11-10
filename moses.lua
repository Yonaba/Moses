--- ## Moses: <em>A utility-belt library for functional programming in Lua.</em><br/>
-- @author Roland_Yonaba
-- @copyright 2012
-- @license [MIT](http://www.opensource.org/licenses/mit-license.php)
-- @script moses

-- Internalisation
local next, type, unpack, select = next, type, unpack, select
local setmetatable, getmetatable = setmetatable, getmetatable
local t_insert, t_sort = table.insert, table.sort
local t_remove,t_concat = table.remove, table.concat
local randomseed, random, huge = math.randomseed, math.random, math.huge
local floor, max, min = math.floor, math.max, math.min
local getfenv = getfenv
local unpack = unpack
local pairs,ipairs = pairs,ipairs
local _ = {}


-- ======== Private helpers

local function f_max(a,b) return a>b end
local function f_min(a,b) return a<b end
local function clamp(var,a,b) return (var<a) and a or (var>b and b or var) end
local function isTrue(_,value) return value and true end
local function iNot(value) return not value end
local function count(t)
	local i
    for k,v in pairs(t) do i = (i or 0) + 1 end
	return i
end
local function extract(list,comp,transform,...)
  local _ans
  local transform = transform or _.identity
  for index,value in pairs(list) do
    if not _ans then _ans = transform(value,...)
    else
      local value = transform(value,...)
      _ans = comp(_ans,value) and _ans or value
    end
  end
  return _ans
end

-- Internal counter for unique ids generation
local unique_id_counter = -1

-- ========= Collection functions

--- Calls function `f` on each key-value of a given collection. <br/><em>Aliased as @{forEach}</em>.
-- @name each
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(key,value,...)`
-- @tparam var_arg ... extra-args to be passed to function `f`
-- @see forEach
function _.each(list,f,...)
  if not _.isObject(list) then return end
  for index,value in pairs(list) do
    f(index,value,...)
  end
  return list
end

--- Alias for @{each}.
-- @function forEach
-- @param list
-- @param f 
-- @param ...
_.forEach = _.each

--- Maps function `f` on each key-value of a given collection. Collects
-- and returns the outputs.<br/><em>Aliased as @{collect}</em>.
-- @name map
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(key,value,...)`
-- @tparam var_arg ... extra-args to be passed to function `f`
-- @treturn table a table of results
-- @see collect
function _.map(list,f,...)
  local _list = {}
  for index,value in pairs(list) do
    _list[index] = f(index,value,...)
  end
  return _list
end

--- Alias for @{map}.
-- @function collect
-- @param list
-- @param f 
-- @param ...
_.collect = _.map

--- Reduces an entire collection. Folds from left to right to a single value, 
-- with respect to a given iterator and an initial state.
-- The given function takes a state and a value, and returns a new state.
-- <br/><em>Aliased as @{inject}, @{foldl}</em>.
-- @name reduce
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(state,value)`
-- @tparam state state an initial state of reduction. Defaults to the first value in the list.
-- @treturn state state a final state of reduction
-- @see inject
-- @see foldl
function _.reduce(list,f,state)
  for _,value in pairs(list) do
    state = not state and value or f(state,value)
  end
  return state
end

--- Alias for @{reduce}.
-- @function inject
-- @param list
-- @param f 
-- @param state
_.inject = _.reduce

--- Alias for @{reduce}.
-- @function foldl
-- @param list
-- @param f 
-- @param state
_.foldl = _.reduce

--- Reduces an entire collection. Folds from right to left to a single value, 
-- with respect to a given iterator and an initial state.
-- The given function takes a state and a value, and returns a new state.
-- <br/><em>Aliased as @{injectr}, @{foldr}</em>.
-- @name reduceRight
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(state,value)`
-- @tparam state state an initial state of reduction. Defaults to the last value in the list.
-- @treturn state state a final state of reduction
-- @see injectr
-- @see foldr
function _.reduceRight(list,f,state)
  return _.reduce(_.reverse(list),f,state)
end

--- Alias for @{reduceRight}.
-- @function injectr
-- @param list
-- @param f 
-- @param state
_.injectr = _.reduceRight

--- Alias for @{reduceRight}.
-- @function foldr
-- @param list
-- @param f 
-- @param state
_.foldr = _.reduceRight

--- Reduces a collection while saving intermediate states.
-- Folds the collection from left to right to a single value, 
-- with respect to a given iterator and an initial state.
-- The given function takes a state and a value, and returns a new state. 
-- The function returns an array of intermediate states.
-- <br/><em>Aliased as @{mapr}</em>
-- @name mapReduce
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(state,value)`
-- @tparam state state an initial state of reduction. Defaults to the last value in the list.
-- @treturn table an array of states
-- @see mapr
function _.mapReduce(list,f,state)
  local t = {}
  for i,value in pairs(list) do
    t[i] = not state and value or f(state,value)
    state = t[i]
  end
  return t
end

--- Alias for @{mapReduce}.
-- @function mapr
-- @param list
-- @param f 
-- @param state
_.mapr = _.mapReduce

--- Reduces a collection while saving intermediate states. It proceeds in reverse order,
-- folding the collection from right to left to a single value, 
-- with respect to a given iterator and an initial state.
-- The given function takes a state and a value, and returns a new state. 
-- The function returns an array of intermediate states.
-- <br/><em>Aliased as @{maprr}</em>
-- @name mapReduceRight
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(state,value)`
-- @tparam state state an initial state of reduction. Defaults to the last value in the list.
-- @treturn table an array of states
-- @see maprr
function _.mapReduceRight(list,f,state)
  return _.mapReduce(_.reverse(list),f,state)
end

--- Alias for @{mapReduceRight}.
-- @function maprr
-- @param list
-- @param f 
-- @param state
_.maprr = _.mapReduceRight

--- Looks for an object in a collection. <br/><em>Aliased as @{any}, @{some}</em>
-- @name include
-- @tparam table list a collection
-- @tparam object item a value to be searched
-- @treturn boolean a boolean : __true__ when found, __false__ otherwise
-- @see any
-- @see some
function _.include(list,item)
  local _iter = _.isFunction(item) and item or _.isEqual
  for _,value in pairs(list) do
    if _iter(value,item) then return true end
  end
  return false
end

--- Alias for @{include}.
-- @function any
-- @param list
-- @param item
_.any = _.include

--- Alias for @{include}.
-- @function some
-- @param list
-- @param item
_.some = _.include

--- Looks for an object index in a collection. <br/><em>Aliased as @{where}, @{find}</em>
-- @name detect
-- @tparam table list a collection
-- @tparam object item a value to be searched
-- @treturn key the object key or __nil__
-- @see find
-- @see where
function _.detect(list,item)
  local _iter = _.isFunction(item) and item or _.isEqual
  for key,arg in pairs(list) do
    if _iter(arg,item) then return key end
  end
end

--- Alias for @{detect}.
-- @function find
-- @param list
-- @param item
_.find = _.detect

--- Alias for @{detect}.
-- @function where
-- @param list
-- @param item
_.where = _.detect

--- Selects and extracts objects passing an iterator test. 
-- <br/><em>Aliased as @{filter}</em>
-- @name select
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(key,value,...)`
-- @tparam var_arg ... extra-args to be passed to function `f`
-- @treturn table the selected objects
-- @see filter
function _.select(list,f,...)
  local _mapped = _.map(list,f,...)
  local _list = {}
  for index,value in pairs(_mapped) do
    if value then _list[#_list+1] = list[index] end
  end
  return _list
end

--- Alias for @{select}.
-- @function filter
-- @param list
-- @param f
-- @param ...
_.filter = _.select

--- Clones a collection, rejecting objects passing an iterator test. 
-- <br/><em>Aliased as @{discard}</em>
-- @name reject
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(key,value,...)`
-- @tparam var_arg ... extra-args to be passed to function `f`
-- @treturn table the remaining objects
-- @see discard
function _.reject(list,f,...)
  local _mapped = _.map(list,f,...)
  local _list = {}
  for index,value in pairs (_mapped) do
    if not value then _list[#_list+1] = list[index] end
  end
  return _list
end

--- Alias for @{reject}.
-- @function discard
-- @param list
-- @param f
-- @param ...
_.discard = _.reject

--- Tests if all objects in a collection passes an iterator test. <br/><em>Aliased as @{every}</em>
-- @name all
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(key,value,...)`
-- @tparam var_arg ... extra-args to be passed to function `f`
-- @treturn boolean __true__ or __false__
-- @see every
function _.all(list,f,...)
  return ((#_.select(_.map(list,f,...), isTrue)) == (#list))
end

--- Alias for @{all}.
-- @function every
-- @param list
-- @param f
-- @param ...
_.every = _.all

--- Invokes a method on each object in a collection.
-- @name invoke
-- @tparam table list a collection
-- @tparam function method a function, prototyped as `f(object,...)`
-- @tparam var_arg ... extra-args to be passed to function `method`
-- @treturn table an array of results
function _.invoke(list,method,...)
  local args = {...}
  return _.map(list, function(__,v)
        if _.isObject(v) then
			if _.has(v,method) then
				if _.isCallable(v[method]) then
					return v[method](v,unpack(args))
				else return v[method]
				end
			else
				if _.isCallable(method) then
					return method(v,unpack(args))
				end
			end
		elseif _.isCallable(method) then
			return method(v,unpack(args))
		end
	end)
end

--- Extracts property-values from a collection of objects.
-- @name pluck
-- @tparam table list a collection
-- @tparam string a property, to index in each object: `object[property]`
-- @treturn table an array of values for the specified property
function _.pluck(list,property)
  return _.reject(_.map(list,function(__,value)
      return value[property]
    end),
  iNot)
end

--- Returns the maximum value in a collection. If an iterator is passed, it will
-- be used to extract the property value by which all objects will be ranked.
-- @name max
-- @tparam table list a collection
-- @tparam function iter an iterator function, prototyped as `iter(value,...)`
-- @tparam var_arg ... extra-args to be passed to function `iter`
-- @treturn value the maximum property value found
function _.max(list,iter,...)
  return extract(list,f_max,iter,...)
end

--- Returns the minimum value in a collection. If an iterator is passed, it will
-- be used to extract the property value by which all objects will be ranked.
-- @name min
-- @tparam table list a collection
-- @tparam function iter an iterator function, prototyped as `iter(value,...)`
-- @tparam var_arg ... extra-args to be passed to function `iter`
-- @treturn value the minimum property value found
function _.min(list, iter,...)
  return extract(list,f_min, iter,...)
end

--- Returns a shuffled copy of a given collection. If a seed is provided, it will 
-- be used to init the random number generator.
-- @name shuffle
-- @tparam table list a collection
-- @tparam number seed a seed
-- @treturn table a shuffled copy of the given collection
function _.shuffle(list,seed)
  if seed then randomseed(seed) end
  local _shuffled = {}
  _.each(list,function(index,value)
           local randPos = floor(random()*index)+1
          _shuffled[index] = _shuffled[randPos]
          _shuffled[randPos] = value
        end)
  return _shuffled
end

--- Tests if two collections are the same. I.e, they feature the same objects, but not
-- necessarily at the same keys 
-- @name same
-- @tparam table a a collection
-- @tparam table b a collection
-- @treturn boolean __true__ or __false__
function _.same(a,b)
  return _.all(a, function (i,v)
			return _.include(b,v)
		end)
    and _.all(b, function (i,v)
			return _.include(a,v)
		end)
end

--- Sorts a collection. If a comparison function is given, it will be used to sort objects
-- @name sort
-- @tparam table list a collection
-- @tparam function comp a comparison function prototyped as `comp(a,b)`
-- @treturn table the given list, sorted.
function _.sort(list,comp)
  t_sort(list,comp)
  return list
end

--- Converts a list of __var_args__ to a collection.
-- @name toArray
-- @tparam var_arg ... variable number of arguments
-- @treturn table an array of all passed-in args
function _.toArray(...) 
  return {...} 
end

--- Splits a collection into subsets. Each subset feature objects grouped by the result of passing it through an iterator. 
-- If iterator is a string instead of a function, groups by the property named by iterator on each of the values. 
-- @name groupBy
-- @tparam table list a collection
-- @tparam function iter an iterator function, prototyped as `iter(key,value,...)`
-- @tparam var_arg ... extra-args to be passed to function `iter`
-- @treturn table a new collection with items grouped by subsets
function _.groupBy(list,iter,...)
  local var_arg = {...}
  local _list = {}
  local _iter = _.isFunction(iter) and iter
    or (_.isString(iter) and function(_,item)
        return item[iter](item,unpack(var_arg))
      end)
  if not _iter then return end
  _.each(list, function(i,v)
      local _key = _iter(i,v)
      if _list[_key] then _list[_key][#_list[_key]+1] = v
      else _list[_key] = {v}
      end
    end)
  return _list
end

--- Groups objects in a collection and counts them.
-- @name countBy
-- @tparam table list a collection
-- @tparam function iter an iterator function, prototyped as `iter(key,value,...)`
-- @tparam var_arg ... extra-args to be passed to function `iter`
-- @treturn table a new collection with subsets names and count
function _.countBy(list,iter,...)
  local var_arg = {...}
	local stats = {}
	_.each(list,function(i,v)
			local key = iter(i,v,unpack(var_arg))
			stats[key] = (stats[key] or 0) +1
		end)
	return stats
end

--- Counts the number of values in a collection. If being passed more than one args
-- it will return the number of passed-in args.
-- @name size
-- @tparam var_arg ... a variable number of arguments
-- @treturn number a size
function _.size(...)
  local args = {...}
  local arg1 = args[1]
  if _.isNil(arg1) then
    return 0
  elseif _.isObject(arg1) then
    return count(args[1])
  else
    return count(args)
  end
end

--- Checks if all the keys of `other` object exists in a `list`. It does not
-- compares values. The test is not commutative, i.e `list` may contains keys
-- not existing in `other`.
-- @name contains
-- @tparam table list a collection
-- @tparam table other a collection
-- @treturn boolean __true__ or __false__
function _.contains(list,other)
  for key in pairs(other) do
    if not list[key] then return false end
  end
  return true
end

--- Checks if both given lists have the same keys. It does not compares values.
-- @name sameKeys
-- @tparam table listA a collection
-- @tparam table listB a collection
-- @treturn boolean __true__ or __false__
function _.sameKeys(listA,listB)
  _.each(listA,function(key)
      if not listB[key] then return false end
     end)
  _.each(listB,function(key)
      if not listA[key] then return false end
     end)
  return true
end

-- ========= Array functions

--- Reverses values in a given array. The passed-in array should not be sparse.
-- @name reverse
-- @tparam table array an array
-- @treturn table a copy of the given array, reversed
function _.reverse(array)
  local _array = {}
  for i = #array,1,-1 do
    _array[#_array+1] = array[i]
  end
  return _array
end

--- Collects values from a given array. The passed-in array should not be sparse. 
-- This function collects values as long as they satisfy a given predicate. 
-- Therefore, it returns on the first false test.
-- <br/><em>Aliased as @{takeWhile}</em>
-- @name selectWhile
-- @tparam table array an array
-- @tparam function f an iterator function prototyped as `f(key,value,...)`
-- @tparam var_arg ... extra-args to be passed to function `f`
-- @treturn table a new table containing the first truthy values collected
-- @see takeWhile
function _.selectWhile(array,f,...)
  local t = {}
  for i,v in ipairs(array) do
    if f(i,v,...) then t[i] = v else break end
  end
  return t
end

--- Alias for @{selectWhile}.
-- @function takeWhile
-- @param array
-- @param f
-- @param ...
_.takeWhile = _.selectWhile

--- Collects values from a given array. The passed-in array should not be sparse. 
-- This function collects values as soon as they do not satisfy a given predicate. 
-- Therefore it returns on the first true test.
-- <br/><em>Aliased as @{rejectWhile}</em>
-- @name dropWhile
-- @tparam table array an array
-- @tparam function f an iterator function prototyped as `f(key,value,...)`
-- @tparam var_arg ... extra-args to be passed to function `f`
-- @treturn table a new table containing the first falsy values collected
-- @see rejectWhile
function _.dropWhile(array, f,...)
  local _i
  for i,v in ipairs(array) do
    if not f(i,v,...) then
      _i = i
      break
    end
  end
  if _.isNil(_i) then return {} end
  return _.rest(array,_i)
end

--- Alias for @{dropWhile}.
-- @function rejectWhile
-- @param array
-- @param f
-- @param ...
_.rejectWhile = _.dropWhile

--- Returns the index at which a value should be inserted. This returned index is determined so that it maintains the sort. 
-- If a comparison function is passed, it will be used to determine the sort ranking of each 
-- value, including the passed-in value.
-- @name sortedIndex
-- @tparam table array an array
-- @tparam value the value to be inserted
-- @tparam function comp an comparison function prototyped as `f(a,b)`
-- @treturn index the index at which the passed-in value should be inserted
function _.sortedIndex(array,value,comp,sort)
  local _comp = comp or f_min
  if sort then _.sort(array,_comp) end
  for i = 1,#array do
    if not _comp(array[i],value) then return i end
  end
  return #array+1
end

--- Returns the index of the given value in an array. If the passed-in value exists
-- more than once in the array, it will return the index of the first occurence.
-- @name indexOf
-- @tparam table array an array
-- @tparam value the value to be searched
-- @treturn index the index of the passed-in value or __nil__
function _.indexOf(array, value)
  for k = 1,#array do
    if array[k] == value then return k end
  end
end

--- Returns the last occurence index of a given value.
-- @name lastIndexOf
-- @tparam table array an array
-- @tparam value the value to be searched
-- @treturn index the index of the last occurence of the passed-in value or __nil__
function _.lastIndexOf(array,value)
  local key = _.indexOf(_.reverse(array),value)
  if key then return #array-key+1 end
end

--- Adds all passed-in values at the top of an array. The latter args will come the 
-- first in the given array.
-- @name add
-- @tparam table array an array
-- @tparam var_arg ... a variable number of arguments
-- @treturn table the passed-in array
function _.add(array,...)
  _.each({...},function(i,v) t_insert(array,1,v) end)
  return array
end

--- Pushes all passed-in values at the end of an array. 
-- @name push
-- @tparam table array an array
-- @tparam var_arg ... a variable number of arguments
-- @treturn table the passed-in array
function _.push(array,...)
  _.each({...}, function(i,v) array[#array+1] = v end)
  return array
end

--- Removes and returns the value at the top of a given array. 
-- <br/><em>Aliased as @{shift}</em>
-- @name pop
-- @tparam table array an array
-- @treturn value the popped value
-- @see shift
function _.pop(array)
  local retValue = array[1]
  t_remove(array,1)
  return retValue
end

--- Alias for @{pop}.
-- @function shift
-- @param array
_.shift = _.pop

--- Removes and returns the value at the end of a given array. 
-- @name unshift
-- @tparam table array an array
-- @treturn value the popped value
function _.unshift(array)
  local retValue = array[#array]
  t_remove(array)
  return retValue
end

--- Trims all values indexed within the range `[start,finish]`. 
-- <br/><em>Aliased as @{rmRange}</em>
-- @name removeRange
-- @tparam table array an array
-- @tparam index start the lower bound index, defaults to the first index in the array.
-- @tparam index finish the upper bound index, defaults to the array length.
-- @treturn table the passed-in array
-- @see rmRange
function _.removeRange(array,start,finish)
  local array = _.clone(array)
  local i,n = (next(array)),#array
  if n < 1 then return array end

  start = clamp(start or i,i,n)
  finish = clamp(finish or n,i,n)

  if finish < start then return array end

  local count = finish - start + 1
  local i = start
  while count > 0 do
    t_remove(array,i)
    count = count - 1
  end
  return array
end

--- Alias for @{removeRange}.
-- @function rmRange
-- @param array
-- @param start
-- @param finish
_.rmRange = _.removeRange

--- Slices values indexed within `[start,finish]` range. 
-- @name slice
-- @tparam table array an array
-- @tparam index start the lower bound index, defaults to the first index in the array.
-- @tparam index finish the upper bound index, defaults to the array length.
-- @treturn table a new array
function _.slice(array,start,finish)
  return _.select(array, function(index)
      return (index >= (start or next(array)) and index <= (finish or #array))
    end)
end

--- Returns the first N values in an array. <br/><em>Aliased as @{head}, @{take}</em>
-- @name first
-- @tparam table array an array
-- @tparam number n the number of values to be collected, defaults to 1.
-- @treturn table a new array
-- @see head
-- @see take
function _.first(array,n)
  local n = n or 1
  return _.slice(array,1, min(n,#array))
end

--- Alias for @{first}.
-- @function head
-- @param array
-- @param n
_.head = _.first

--- Alias for @{first}.
-- @function take
-- @param array
-- @param n
_.take = _.first

--- Returns all values in an array excluding the last N values. 
-- @name initial
-- @tparam table array an array
-- @tparam number n the number of values to be left, defaults to the array length.
-- @treturn table a new array
function _.initial(array,n)
  if n and n < 0 then return end
  return _.slice(array,1, n and #array-(min(n,#array)) or #array-1)
end

--- Returns the last N values in an array. 
-- @name last
-- @tparam table array an array
-- @tparam number n the number of values to be collected, defaults to the array length.
-- @treturn table a new array
function _.last(array,n)
  if n and n <= 0 then return end
  return _.slice(array,n and #array-min(n-1,#array-1) or 2,#array)
end

--- Trims all values before index. <br/><em>Aliased as @{tail}</em>
-- @name rest
-- @tparam table array an array
-- @tparam index index an index
-- @treturn table a new array
-- @see tail
function _.rest(array,index)
  if index and index > #array then return {} end
  return _.slice(array,index and max(1,min(index,#array)) or 1,#array)
end

--- Alias for @{rest}.
-- @function tail
-- @param array
-- @param index
_.tail = _.rest

--- Trims all falsy values. 
-- @name compact
-- @tparam table array an array
-- @treturn table a new array
function _.compact(array)
  return _.reject(array, function (_,value)
		return not value
	end)
end

--- Flattens a nested array. Passing `shallow` will only flatten at the first single level.
-- @name flatten
-- @tparam table array an array
-- @tparam boolean shallow specifies the flattening depth
-- @treturn table a new array, flattened
function _.flatten(array, shallow)
  local shallow = shallow or false
  local new_flattened
  local _flat = {}
  for key,value in pairs(array) do
    if _.isObject(value) and not shallow then
      new_flattened = _.flatten (value)
      _.each(new_flattened, function(_,item) _flat[#_flat+1] = item end)
    else _flat[#_flat+1] = value
    end
  end
  return _flat
end

--- Returns values from an array not present in all passed-in args. <br/><em>Aliased as @{without}</em>
-- @name difference
-- @tparam table array an array
-- @tparam var_arg ... a variable number of arguments
-- @treturn table a new array
-- @see without
function _.difference(array,...)
  local values = _.toArray(...)
  return _.select(array,function(i,value)
      return not _.include(values,value)
    end)
end

--- Alias for @{difference}.
-- @function without
-- @param array
-- @param ...
_.without = _.difference

--- Produces a duplicate-free version of a given array. Passing `isSorted` will
-- provide a much faster version, but will produce the desired result if the array
-- is properly sorted. If `iter` is passed, it will be used to compute new values based on 
-- a transformation. 
-- <br/><em>Aliased as @{unique}</em>
-- @name uniq
-- @tparam table array an array
-- @tparam boolean isSorted whether or not the passed-in array is already sorted, defaults to `false`
-- @tparam function iter an iterator function prototyped as `iter(key,value,...)`
-- @tparam var_arg ... extra-args to be passed to `iter` function
-- @treturn table a new array
-- @see unique
function _.uniq(array,isSorted,iter,...)
  local init = iter and _.map(array,iter,...) or array
  local result = {}
  if not isSorted then
    for __,v in ipairs(init) do
      if not _.include(result,v) then
		result[#result+1] = v
		end
    end
  return result
  end

  result[#result+1] = init[1]
  for i = 2,#init do
    if init[i] ~= result[#result] then
		result[#result+1] = init[i]
	end
  end
  return result
end

--- Alias for @{uniq}.
-- @function unique
-- @param array
-- @param isSorted
-- @param iter
-- @param ...
_.unique = _.uniq

--- Returns the duplicate-free union of all passed in arrays.
-- @name union
-- @tparam var_arg ... a variable number of arrays arguments
-- @treturn table a new array
function _.union(...)
  return _.uniq(_.flatten({...}))
end

--- Returns the  intersection of all passed-in arrays. 
-- Each value in the result is present in each of the passed-in arrays.
-- @name intersection
-- @tparam table array an array
-- @tparam var_arg ... a variable number of array arguments
-- @treturn table a new array
function _.intersection(array,...)
  local arg = {...}
  local _intersect = {}
  for i,value in ipairs(array) do
    if _.all(arg,function(i,v)
          return _.include(v,value)
        end) then
      t_insert(_intersect,value)
    end
  end
  return _intersect
end

--- Merges together values of each of the passed-in arrays in subsets. 
-- Only values at the same position in the initial array are merged.
-- @name zip
-- @tparam var_arg ... a variable number of array arguments
-- @treturn table a new array
function _.zip(...)
  local arg = {...}
  local _len = _.max(_.map(arg,function(i,v)
      return #v
    end))
  local _ans = {}
  for i = 1,_len do
    _ans[i] = _.pluck(arg,i)
  end
  return _ans
end

--- Clones `array` and appends `other` to the result.
-- @name append
-- @tparam table array an array
-- @tparam table other an array
-- @treturn table a new array
function _.append(array,other)
  local t = {}
  for i,v in ipairs(array) do t[i] = v end
  for i,v in ipairs(other) do t[#t+1] = v end
  return t
end

--- Produce a flexible list of numbers. If one positive value is passed, will count from 0 to that value, 
-- with a default step of 1. If two values were passed, will count from the first one to the second one, with the 
-- same default step of 1. A third passed value will be considered a step value.
-- <br/><em>Aliased as @{count}</em> 
-- @name range
-- @tparam var_arg ... a variable list of numbers
-- @treturn table a new array of numbers
-- @see count
function _.range(...)
  local arg = {...}
  local _start,_stop,_step
  if #arg==0 then return {}
  elseif #arg==1 then _stop,_start,_step = arg[1],0,1
  elseif #arg==2 then _start,_stop,_step = arg[1],arg[2],1
  elseif #arg == 3 then _start,_stop,_step = arg[1],arg[2],arg[3]
  end
  if (_step and _step==0) then return {} end
  local _ranged = {}
  local _steps = max(floor((_stop-_start)/_step),0)
  for i=1,_steps do _ranged[#_ranged+1] = _start+_step*i end
  if #_ranged>0 then t_insert(_ranged,1,_start) end
  return _ranged
end

--- Alias for @{range}.
-- @function count
-- @param ...
_.count = _.range

--- Inverts `key-value` pairs. Keys becomes values, while values becomes keys.
-- <br/><em>Aliased as @{mirror}</em> 
-- @name invert
-- @tparam table array a given array
-- @treturn table a new array
-- @see mirror
function _.invert(array)
  local _ret = {}
  _.each(array,function(i,v) _ret[v] = i end)
  return _ret
end

--- Alias for @{invert}.
-- @function mirror
-- @param array
_.mirror = _.invert

--- Concatenates values in a given array. Handles booleans as well. If `sep` string is
-- passed, it will be used as a separator. Optional `i` and `j` will only concatenate
-- values within `[i,j]` range. <br/><em>Aliased as @{join}</em> 
-- @name concat
-- @tparam table array a given array
-- @tparam string sep a separator string, defaults to `''`.
-- @tparam number i the starting index, defaults to 1.
-- @tparam number j the final index, defaults to the array length.
-- @treturn string a string
-- @see join
function _.concat(array,sep,i,j)
  local _array = _.map(array,function(i,v)
		return tostring(v)
	end)
	return t_concat(_array,sep,i,j)

end

--- Alias for @{concat}.
-- @function join
-- @param array
-- @param sep
-- @param i
-- @param j
_.join = _.concat

-- ========= Utility functions
 
function _.identity(value)
  return value
end

function _.once(f)
  local _internal = 0
  local _args = {}
  return function(...)
      _internal = _internal+1
      if _internal<=1 then _args = {...} end
      return f(unpack(_args))
    end
end

function _.memoize(f,hash)
  local _cache = setmetatable({},{__mode = 'kv'})
  local _hasher = hash or _.identity
  return function (...)
      local _hashKey = _hasher(...)
      local _result = _cache[_hashKey]
      if not _result then _cache[_hashKey] = f(...) end
      return _cache[_hashKey]
    end
end
_.cache = _.memoize

function _.after(f,count)
  local _limit,_internal = count, 0
  return function(...)
      _internal = _internal+1
      if _internal >= _limit then return f(...) end
    end
end

function _.compose(...)
  local f = _.reverse {...}
  return function (...)
      local _temp
      for i,func in pairs(f) do
        _temp = _temp and func(_temp) or func(...)
      end
      return _temp
    end
end

function _.wrap(func,wrapper)
	return function (...)
      return  wrapper(func,...)
    end
end

function _.times(n,iter,...)
  local results = {}
  for i = 1,n do
    results[i] = iter(i,...)
  end
  return results
end

function _.bind(func,v)
  return function (...)
      return func(v,...)
    end
end

function _.bindn(func,...)
  local iArg = {...}
  return function (...)
      return func(unpack(_.append(iArg,{...})))
    end
end

function _.uniqueId(template,...)
	unique_id_counter = unique_id_counter + 1
	if template then
		if _.isString(template) then
			return template:format(unique_id_counter)
		elseif _.isFunction(template) then
			return template(unique_id_counter,...)
		end
	end
	return unique_id_counter
end
_.uId = _.uniqueId


function _.keys(obj)
  local _oKeys = {}
  _.each(obj,function(key,_) _oKeys[#_oKeys+1]=key end)
  return _oKeys
end

function _.values(obj)
  local _oValues = {}
  _.each(obj,function(_,value) _oValues[#_oValues+1]=value end)
  return _oValues
end

function _.pairs(obj)
  local paired= {}
  _.each(obj,function(k,v)
		paired[#paired+1] = {k,v}
	end)
	return paired
end

function _.extend(destObj,...)
	local sources = {...}
	_.each(sources,function(__,source)
		if _.isObject(source) then
			_.each(source,function(key,value)
				destObj[key] = value
			end)
		end
	end)
	return destObj
end

function _.functions(obj,output)
  if not obj then return _.sort(_.keys(_)) end
  local _methods = output or {}
  _.each(obj,function(key,value)
      if _.isFunction(value) then
		_methods[#_methods+1]=key
	  end
    end)
	local mt = getmetatable(obj)
	if mt and mt.__index then
		_.functions(mt.__index,_methods)
	end
   return _.sort(_methods)
end
_.methods = _.functions

function _.clone(obj,shallow)
	if not _.isObject(obj) then return obj end
  local _obj = {}
  _.each(obj,function(i,v)
    if _.isObject(v) then
      if not shallow then
		_obj[i] = _.clone(v,shallow)
	  else _obj[i] = v
	  end
	else
		_obj[i] = v
	end
  end)
  return _obj
end

function _.has(obj, key)
  return obj[key]~=nil
end

function _.pick(obj, ...)
	local whitelist = _.flatten {...}
	local _picked = {}
	_.each(whitelist,function(key,property)
			if obj[property] then
				_picked[property] = obj[property]
			end
		end)
	return _picked
end
_.choose = _.pick

function _.omit(obj,...)
	local blacklist = _.flatten {...}
	local _picked = {}
	_.each(obj,function(key,value)
			if not _.include(blacklist,key) then
				_picked[key] = value
			end
		end)
	return _picked
end
_.drop = _.omit

function _.template(obj,template)
  _.each(template,function(i,v)
	if not obj[i] then
		obj[i] = v
	end
  end)
  return obj
end
_.defaults = _.template

function _.isEqual(objA,objB,useMt)
	local typeObjA = type(objA)
	local typeObjB = type(objB)
  if typeObjA~=typeObjB then return false end
  if typeObjA~='table' then return (objA==objB) end

  local mtA = getmetatable(objA)
  local mtB = getmetatable(objB)

  if useMt then
	if mtA or mtB and mtA.__eq or mtB.__eq then
		return (objA==objB)
	end
  end

  if _.size(objA)~=_.size(objB) then return false end

  for i,v1 in pairs(objA) do
    local v2 = objB[i]
    if _.isNil(v2) or not _.isEqual(v1,v2,useMt) then return false end
  end

  for i,v1 in pairs(objB) do
    local v2 = objA[i]
    if _.isNil(v2) then return false end
  end

  return true
end

function _.result(obj,method,...)
  if obj[method] then
    if _.isCallable(obj[method]) then
      return obj[method](obj,...)
    else return obj[method]
    end
  end
  if _.isCallable(method) then return method(obj,...) end
end

function _.isObject(obj)
  return type(obj) == 'table'
end

function _.isCallable(obj)
  return (_.isFunction(obj) or
		 (_.isObject(obj) and getmetatable(obj)
					         and getmetatable(obj).__call~=nil) or false)
end

function _.isArray(obj)
	if not _.isObject(obj) then return false end
	return _.all(_.keys(obj),function(i,v)
			return _.isNumber(v)
		end)
end

function _.isEmpty(obj)
	if _.isString(obj) then return #obj==0 end
	if _.isObject(obj) then return next(obj)==nil end
	return true
end

function _.isString(value)
  return type(value) == 'string'
end

function _.isFunction(obj)
   return type(obj) == 'function'
end

function _.isNil(obj)
	return obj==nil
end

function _.isFinite(value)
	if not _.isNumber(value) then return false end
	return value > -huge and value < huge
end

function _.isNumber(value)
	return type(value) == 'number'
end

function _.isNaN(value)
  return _.isNumber(value) and value~=value
end

function _.isBoolean(value)
  return type(value) == 'boolean'
end

local function import()
  local fn = _.functions()
  local env = getfenv()
  _.each(fn,function(i,fName)
    env[fName] = _[fName]
  end)
end

local _mt = {import = import, mixin = import}
_mt.__index = _mt
return setmetatable (_, _mt)