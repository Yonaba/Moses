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
local rawget = rawget
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

--- Similar to `pairs` iterator. Calls function `f` on each key-value of a given collection. <br/><em>Aliased as `forEach`</em>.
-- @name each
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(key,value,...)`
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `f`
function _.each(list, f, ...)
  if not _.isTable(list) then return end
  for index,value in pairs(list) do
    f(index,value,...)
  end
end

--- Similar to `ipairs` iterator. Calls function `f` only on values indexed with an integer key in a given collection.
-- The array can be sparse, or map-like. Iteration will be performed from the lower integer key to the highest one.
-- <br/><em>Aliased as `forEachi`</em>.
-- @name eachi
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(key,value,...)`
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `f`
function _.eachi(list, f, ...)
  if not _.isTable(list) then return end
	local lkeys = _.sort(_.select(_.keys(list), function(k,v)
		return _.isInteger(v)
	end))
	for k, key in ipairs(lkeys) do
		f(key, list[key],...)
	end
end

--- Counts the number of occurences of a given value in a list. Uses @{isEqual} to compare objects.
-- @name count
-- @tparam table list a collection
-- @tparam[opt] value value a value to be searched in the list. If not given, defaults to @{size}.
-- @see countf
-- @see size
function _.count(list, value)
	if _.isNil(value) then return _.size(list) end
	local count = 0
	_.each(list, function(k,v)
		if _.isEqual(v, value) then count = count + 1 end
	end)
	return count
end

--- Same as @{count}, but uses an iterator. Provide a count for the number of values passing the test `f(key,value,...)`
-- @name countf
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(key,value,...)`
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `f`
-- @see countf
function _.countf(list, f, ...)
	return _.count(_.map(list, f, ...), true)
end

--- Iterator to cycle through the contents of a list or a collection. Loops on each key-pairs of a given
-- list repeatedly `n` times or forever (if `n` is omitted). In case `n` is lower or equal to 0, does nothing.
-- <br/><em>Aliased as `loop`</em>.
-- @name cycle
-- @tparam table list a collection
-- @tparam number n a number of loops
-- @treturn function an iterator function returning a key-value pair from the passed-in list.
function _.cycle(list, n)
	if n<=0 then return end
	local k, fk
	local i = 0
	while true do
		return function()
			k = k and next(list,k) or next(list)
			fk = not fk and k or fk
			if n then
				i = (k==fk) and i+1 or i
				if i > n then
					return
				end
			end
			return k, list[k]
		end
	end
end

--- Maps function `f` on each key-value of a given collection. Collects
-- and returns the outputs.<br/><em>Aliased as `collect`</em>.
-- @name map
-- @tparam table list a collection
-- @tparam function f  an iterator function, prototyped as `f(key,value,...)`
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `f`
-- @treturn table a table of results
function _.map(list, f, ...)
  local _list = {}
  for index,value in pairs(list) do
    _list[index] = f(index,value,...)
  end
  return _list
end

--- Reduces an entire collection. Folds from left to right to a single value,
-- with respect to a given iterator and an initial state.
-- The given function takes a state and a value, and returns a new state.
-- <br/><em>Aliased as `inject`, `foldl`</em>.
-- @name reduce
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(state,value)`
-- @tparam[opt] state state an initial state of reduction. Defaults to the first value in the list.
-- @treturn state state a final state of reduction
function _.reduce(list,f,state)
  for _,value in pairs(list) do
    state = not state and value or f(state,value)
  end
  return state
end

--- Reduces an entire collection. Folds from right to left to a single value,
-- with respect to a given iterator and an initial state.
-- The given function takes a state and a value, and returns a new state.
-- <br/><em>Aliased as `injectr`, `foldr`</em>.
-- @name reduceRight
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(state,value)`
-- @tparam[opt] state state an initial state of reduction. Defaults to the last value in the list.
-- @treturn state state a final state of reduction
function _.reduceRight(list,f,state)
  return _.reduce(_.reverse(list),f,state)
end

--- Reduces a collection while saving intermediate states.
-- Folds the collection from left to right to a single value,
-- with respect to a given iterator and an initial state.
-- The given function takes a state and a value, and returns a new state.
-- The function returns an array of intermediate states.
-- <br/><em>Aliased as `mapr`</em>
-- @name mapReduce
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(state,value)`
-- @tparam[opt] state state an initial state of reduction. Defaults to the last value in the list.
-- @treturn table an array of states
function _.mapReduce(list,f,state)
  local t = {}
  for i,value in pairs(list) do
    t[i] = not state and value or f(state,value)
    state = t[i]
  end
  return t
end

--- Reduces a collection while saving intermediate states. It proceeds in reverse order,
-- folding the collection from right to left to a single value,
-- with respect to a given iterator and an initial state.
-- The given function takes a state and a value, and returns a new state.
-- The function returns an array of intermediate states.
-- <br/><em>Aliased as `maprr`</em>
-- @name mapReduceRight
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(state,value)`
-- @tparam[opt] state state an initial state of reduction. Defaults to the last value in the list.
-- @treturn table an array of states
function _.mapReduceRight(list,f,state)
  return _.mapReduce(_.reverse(list),f,state)
end

--- Looks for an object in a collection. <br/><em>Aliased as `any`, `some`</em>
-- @name include
-- @tparam table list a collection
-- @tparam object item a value to be searched
-- @treturn boolean a boolean : __true__ when found, __false__ otherwise
function _.include(list,item)
  local _iter = _.isFunction(item) and item or _.isEqual
  for _,value in pairs(list) do
    if _iter(value,item) then return true end
  end
  return false
end

--- Looks for an object index in a collection. <br/><em>Aliased as `find`, `some`</em>
-- @name detect
-- @tparam table list a collection
-- @tparam object item a value to be searched
-- @treturn key the object key or __nil__
function _.detect(list,item)
  local _iter = _.isFunction(item) and item or _.isEqual
  for key,arg in pairs(list) do
    if _iter(arg,item) then return key end
  end
end

--- Returns true if item is present in the list, false otherwise.
-- @name contains
-- @tparam table list a collection
-- @tparam object item a value to be searched
-- @treturn boolean true if present, otherwise false
function _.contains(list, item)
	return _.detect(list, item) and true or false
end

--- Returns an array of values. Those are values from list containing all key-value pairs listed in `props`.
-- @function where
-- @tparam table list a collection
-- @tparam props a set of properties
-- @treturn table an array of values containing all of the properties found in `props`.
function _.where(list, props)
	local found = {}
	if _.isEmpty(props) then return {} end
	return _.select(list, function(k,v)
		for key in pairs(props) do
			if props[key] ~= v[key] then return false end
		end
		return true
	end)
end

--- Returns a value. This value should be the first value found in an array containing all key-value pairs listed in `props`.
-- @function findWhere
-- @tparam table list a collection
-- @tparam props a set of properties
-- @treturn item a value from the passed-in list
function _.findWhere(list, props)
	local index = _.detect(list, function(v)
		for key in pairs(props) do
			if props[key] ~= v[key] then return false end
		end
		return true
	end)
	return index and list[index]
end


--- Selects and extracts objects passing an iterator test.
-- <br/><em>Aliased as `filter`</em>
-- @name select
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(key,value,...)`
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `f`
-- @treturn table the selected objects
function _.select(list,f,...)
  local _mapped = _.map(list,f,...)
  local _list = {}
  for index,value in pairs(_mapped) do
    if value then _list[#_list+1] = list[index] end
  end
  return _list
end

--- Clones a collection, rejecting objects passing an iterator test.
-- <br/><em>Aliased as `discard`</em>
-- @name reject
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(key,value,...)`
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `f`
-- @treturn table the remaining objects
function _.reject(list,f,...)
  local _mapped = _.map(list,f,...)
  local _list = {}
  for index,value in pairs (_mapped) do
    if not value then _list[#_list+1] = list[index] end
  end
  return _list
end

--- Tests if all objects in a collection passes an iterator test. <br/><em>Aliased as `every`</em>
-- @name all
-- @tparam table list a collection
-- @tparam function f an iterator function, prototyped as `f(key,value,...)`
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `f`
-- @treturn boolean __true__ or __false__
function _.all(list,f,...)
  return ((#_.select(_.map(list,f,...), isTrue)) == (#list))
end

--- Invokes a method on each object in a collection.
-- @name invoke
-- @tparam table list a collection
-- @tparam function method a function, prototyped as `f(object,...)`
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `method`
-- @treturn table an array of results
function _.invoke(list,method,...)
  local args = {...}
  return _.map(list, function(__,v)
        if _.isTable(v) then
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
-- @tparam[opt] function iter an iterator function, prototyped as `iter(value,...)`, defaults to @{identity}
-- @tparam[optchain] var_arg ... Optional extra-args to be passed to function `iter`
-- @treturn value the maximum property value found
function _.max(list,iter,...)
  return extract(list,f_max,iter,...)
end

--- Returns the minimum value in a collection. If an iterator is passed, it will
-- be used to extract the property value by which all objects will be ranked.
-- @name min
-- @tparam table list a collection
-- @tparam[opt] function iter an iterator function, prototyped as `iter(value,...)`, defaults to @{identity}
-- @tparam[optchain] var_arg ... Optional extra-args to be passed to function `iter`
-- @treturn value the minimum property value found
function _.min(list, iter,...)
  return extract(list,f_min, iter,...)
end

--- Returns a shuffled copy of a given collection. If a seed is provided, it will
-- be used to init the random number generator.
-- @name shuffle
-- @tparam table list a collection
-- @tparam[opt] number seed a seed
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
-- @tparam[opt] function comp a comparison function prototyped as `comp(a,b)`, defaults to <tt><</tt> operator.
-- @treturn table the given list, sorted.
function _.sort(list,comp)
  t_sort(list,comp)
  return list
end

--- Converts a list of __var_args__ to a collection.
-- @name toArray
-- @tparam[opt] var_arg ... Optional variable number of arguments
-- @treturn table an array of all passed-in args
function _.toArray(...)
  return {...}
end

--- Splits a collection into subsets. Each subset feature objects grouped by the result of passing it through an iterator.
-- If iterator is a string instead of a function, groups by the property named by iterator on each of the values.
-- @name groupBy
-- @tparam table list a collection
-- @tparam function iter an iterator function, prototyped as `iter(key,value,...)`
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `iter`
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
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `iter`
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
-- @tparam[opt] var_arg ... Optional variable number of arguments
-- @treturn number a size
function _.size(...)
  local args = {...}
  local arg1 = args[1]
  if _.isNil(arg1) then
    return 0
  elseif _.isTable(arg1) then
    return count(args[1])
  else
    return count(args)
  end
end

--- Checks if all the keys of `other` object exists in a `list`. It does not
-- compares values. The test is not commutative, i.e `list` may contains keys
-- not existing in `other`.
-- @name containsKeys
-- @tparam table list a collection
-- @tparam table other a collection
-- @treturn boolean __true__ or __false__
function _.containsKeys(list,other)
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
-- <br/><em>Aliased as `takeWhile`</em>
-- @name selectWhile
-- @tparam table array an array
-- @tparam function f an iterator function prototyped as `f(key,value,...)`
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `f`
-- @treturn table a new table containing the first truthy values collected
function _.selectWhile(array,f,...)
  local t = {}
  for i,v in ipairs(array) do
    if f(i,v,...) then t[i] = v else break end
  end
  return t
end

--- Collects values from a given array. The passed-in array should not be sparse.
-- This function collects values as soon as they do not satisfy a given predicate.
-- Therefore it returns on the first true test.
-- <br/><em>Aliased as `rejectWhile`</em>
-- @name dropWhile
-- @tparam table array an array
-- @tparam function f an iterator function prototyped as `f(key,value,...)`
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `f`
-- @treturn table a new table containing the first falsy values collected
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


--- Returns the index at which a value should be inserted. This returned index is determined so that it maintains the sort.
-- If a comparison function is passed, it will be used to determine the sort ranking of each
-- value, including the passed-in value.
-- @name sortedIndex
-- @tparam table array an array
-- @tparam value the value to be inserted
-- @tparam[opt] function comp an comparison function prototyped as `f(a,b)`, defaults to <tt><</tt> operator
-- @tparam[optchain] boolean sort whether or not to sort the passed-in array
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
-- <br/><em>Aliased as `shift`</em>
-- @name pop
-- @tparam table array an array
-- @treturn value the popped value
function _.pop(array)
  local retValue = array[1]
  t_remove(array,1)
  return retValue
end

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
-- <br/><em>Aliased as `rmRange`</em>
-- @name removeRange
-- @tparam table array an array
-- @tparam[opt] index start the lower bound index, defaults to the first index in the array.
-- @tparam[optchain] index finish the upper bound index, defaults to the array length.
-- @treturn table the passed-in array
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

--- Iterates over an array chunking together. Values are chunked on the basis of the return
-- value of `f(key,value,...)`. Consecutive elements which return the same value are chunked together.
-- Leaves the first argument untouched if it is not an array.
-- @name chunk
-- @tparam table array an array 
-- @tparam function f an iterator function prototyped as `f(key,value,...)`
-- @tparam[opt] var_arg ... Optional extra-args to be passed to function `f`
-- @treturn table a table of chunks (arrays).
function _.chunk(array, f,...)
	if not _.isArray(array) then return array end
	local ch, ck, prev = {}, 0
	local mask = _.map(array, f,...)
	_.each(mask, function(k,v)
		prev = (prev==nil) and v or prev
		ck = ((v~=prev) and (ck+1) or ck)
		if not ch[ck] then
			ch[ck] = {array[k]}
		else
			ch[ck][#ch[ck]+1] = array[k]
		end
		prev = v
	end)
	return ch
end

--- Slices values indexed within `[start,finish]` range.
-- @name slice
-- @tparam table array an array
-- @tparam[opt] index start the lower bound index, defaults to the first index in the array.
-- @tparam[optchain] index finish the upper bound index, defaults to the array length.
-- @treturn table a new array
function _.slice(array,start,finish)
  return _.select(array, function(index)
      return (index >= (start or next(array)) and index <= (finish or #array))
    end)
end

--- Returns the first N values in an array. <br/><em>Aliased as `head`, `take`</em>
-- @name first
-- @tparam table array an array
-- @tparam[opt] number n the number of values to be collected, defaults to 1.
-- @treturn table a new array
function _.first(array,n)
  local n = n or 1
  return _.slice(array,1, min(n,#array))
end

--- Returns all values in an array excluding the last N values.
-- @name initial
-- @tparam table array an array
-- @tparam[opt] number n the number of values to be left, defaults to the array length.
-- @treturn table a new array
function _.initial(array,n)
  if n and n < 0 then return end
  return _.slice(array,1, n and #array-(min(n,#array)) or #array-1)
end

--- Returns the last N values in an array.
-- @name last
-- @tparam table array an array
-- @tparam[opt] number n the number of values to be collected, defaults to the array length.
-- @treturn table a new array
function _.last(array,n)
  if n and n <= 0 then return end
  return _.slice(array,n and #array-min(n-1,#array-1) or 2,#array)
end

--- Trims all values before index. <br/><em>Aliased as `tail`</em>
-- @name rest
-- @tparam table array an array
-- @tparam[opt] index index an index, defaults to 1
-- @treturn table a new array
function _.rest(array,index)
  if index and index > #array then return {} end
  return _.slice(array,index and max(1,min(index,#array)) or 1,#array)
end

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
-- @tparam[opt] boolean shallow specifies the flattening depth
-- @treturn table a new array, flattened
function _.flatten(array, shallow)
  local shallow = shallow or false
  local new_flattened
  local _flat = {}
  for key,value in pairs(array) do
    if _.isTable(value) and not shallow then
      new_flattened = _.flatten (value)
      _.each(new_flattened, function(_,item) _flat[#_flat+1] = item end)
    else _flat[#_flat+1] = value
    end
  end
  return _flat
end

--- Returns values from an array not present in all passed-in args. <br/><em>Aliased as `without` and `diff`</em>
-- @name difference
-- @tparam table array an array
-- @tparam table another array
-- @treturn table a new array
function _.difference(array,array2)
	if not array2 then return _.clone(array) end
  return _.select(array,function(i,value)
      return not _.include(array2,value)
    end)
end

--- Performs a symmetric difference. Returns values from `array` not present in `array2` __and also__ values
-- from `array2` not present in `array`.<br/><em>Aliased as `symdiff`</em>
-- @name symmetric_difference
-- @tparam table array an array
-- @tparam table array2 another array
-- @treturn table a new array
function _.symmetric_difference(array, array2)
	return _.difference(
		_.union(array, array2),
		_.intersection(array,array2)
	)
end

--- Produces a duplicate-free version of a given array. Passing `isSorted` will
-- provide a much faster version, but will produce the desired result if the array
-- is properly sorted. If `iter` is passed, it will be used to compute new values based on
-- a transformation.
-- <br/><em>Aliased as `unique`</em>
-- @name uniq
-- @tparam table array an array
-- @tparam[opt] boolean isSorted whether or not the passed-in array is already sorted, defaults to `false`
-- @tparam[optchain] function iter an iterator function prototyped as `iter(key,value,...)`
-- @tparam[optchain] var_arg ... Optional extra-args to be passed to `iter` function
-- @treturn table a new array
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

--- Merges values of each of the passed-in arrays in subsets.
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
-- <br/><em>Aliased as `count`</em>
-- @name range
-- @tparam var_arg ... a variable list of numbers
-- @treturn table a new array of numbers
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

--- Inverts `key-value` pairs. Keys becomes values, while values becomes keys.
-- <br/><em>Aliased as `mirror`</em>
-- @name invert
-- @tparam table array a given array
-- @treturn table a new array
function _.invert(array)
  local _ret = {}
  _.each(array,function(i,v) _ret[v] = i end)
  return _ret
end

--- Concatenates values in a given array. Handles booleans as well. If `sep` string is
-- passed, it will be used as a separator. Optional `i` and `j` will only concatenate
-- values within `[i,j]` range. <br/><em>Aliased as `join`</em>
-- @name concat
-- @tparam table array a given array
-- @tparam[opt] string sep a separator string, defaults to `''`.
-- @tparam[optchain] number i the starting index, defaults to 1.
-- @tparam[optchain] number j the final index, defaults to the array length.
-- @treturn string a string
function _.concat(array,sep,i,j)
  local _array = _.map(array,function(i,v)
		return tostring(v)
	end)
	return t_concat(_array,sep,i,j)

end

-- ========= Utility functions

--- Returns the passed-in value. Used internally as a default iterator.
-- @name identity
-- @tparam arg value a value
-- @treturn arg the passed-in value
function _.identity(value)
  return value
end

--- Returns a version of `f` that runs only once. Successive calls will make `f`
-- keep yielding the same answer, no matter what the passed-in arguments are. Can be used to
-- init variables as well.
-- @name once
-- @tparam function f a function
-- @treturn function a new function
function _.once(f)
  local _internal = 0
  local _args = {}
  return function(...)
      _internal = _internal+1
      if _internal<=1 then _args = {...} end
      return f(unpack(_args))
    end
end

--- Memoizes a given function by caching the computed result.
-- Useful for speeding up slow-running functions. If function `hash` is passed,
-- it will be used to compute unique keys from args passed to `hash` for results caching.
-- <br/><em>Aliased as `cache`</em>
-- @name memoize
-- @tparam function f a function
-- @tparam[opt] function hash a hash function, defaults to @{identity}
-- @treturn function a new function
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

--- Returns a version of `f` that runs on the `count-th` call.
-- Useful when dealing with asynchronous tasks.
-- @name after
-- @tparam function f a function
-- @tparam number count the number of calls before `f` answers
-- @treturn function a new function
function _.after(f,count)
  local _limit,_internal = count, 0
  return function(...)
      _internal = _internal+1
      if _internal >= _limit then return f(...) end
    end
end

--- Composes functions. Each passed-in function consumes the return value of the function that follows.
-- In math terms, composing the functions `f`, `g`, and `h` produces `f(g(h(...)))`.
-- @name compose
-- @tparam var_arg ... a variable number of functions
-- @treturn function a new function
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

--- Wraps `f` inside of the `wrapper` function. It passes `f` as the first argument to `wrapper`.
-- This allows the wrapper to execute code before and after `f` runs,
-- adjust the arguments, and execute it conditionally.
-- @name wrap
-- @tparam function f a function to be wrapped, prototyped as `f(...)`
-- @tparam function wrapper a wrapper function, prototyped as `wrapper(f,...)`
-- @treturn function a new function
function _.wrap(f,wrapper)
	return function (...)
      return  wrapper(f,...)
    end
end

--- Runs `iter` function `n` times.
-- Collects the results of each run and returns them in an array.
-- @name times
-- @tparam number n the number of times `iter` should be called
-- @tparam function iter an iterator function, prototyped as `iter(i,...)`
-- @tparam var_arg ... extra-args to be passed to `iter` function
-- @treturn table an array of results
function _.times(n,iter,...)
  local results = {}
  for i = 1,n do
    results[i] = iter(i,...)
  end
  return results
end

--- Binds `v` to be the first argument to function `f`. As a result,
-- calling `f(...)` will result to `f(v,...)`.
-- @name bind
-- @tparam function f a function
-- @tparam arg v an argument
-- @treturn function a function, prototyped as `f(v,...)`
function _.bind(f,v)
  return function (...)
      return f(v,...)
    end
end

--- Binds `...` to be the N-first arguments to function `f`. As a result,
-- calling `f(a1,a2,...,aN)` will result to `f(...,a1,a2,...,aN)`.
-- @name bindn
-- @tparam function f a function
-- @tparam var_arg ... a variable numer of arguments
-- @treturn function a function, prototyped as `f(v,...)`
function _.bindn(f,...)
  local iArg = {...}
  return function (...)
      return f(unpack(_.append(iArg,{...})))
    end
end

--- Generates a unique Id (unique for the current session). If given a sring `template`
-- will use this template for output formatting. Otherwise, if `template` is a function,
-- will compute an output running `template(id,...)`.
-- <br/><em>Aliased as `uId`</em>.
-- @name uniqueId
-- @tparam[opt] string|function template either a string or a function
-- @tparam[optchain] var_arg ... a variable numer of arguments to be passed to `template`, in case it is a function.
-- @treturn id a formatted Id
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

-- ========= Object functions

--- Returns the names of the object properties.
-- @name keys
-- @tparam table obj an object
-- @treturn table an array
function _.keys(obj)
  local _oKeys = {}
  _.each(obj,function(key) _oKeys[#_oKeys+1]=key end)
  return _oKeys
end

--- Returns the values of the object properties.
-- @name values
-- @tparam table obj an object
-- @treturn table an array
function _.values(obj)
  local _oValues = {}
  _.each(obj,function(_,value) _oValues[#_oValues+1]=value end)
  return _oValues
end

--- Returns an array of key-values pairs
-- @name paired
-- @tparam table obj an object
-- @treturn table an array
function _.paired(obj)
  local paired = {}
  _.each(obj,function(k,v)
		paired[#paired+1] = {k,v}
	end)
	return paired
end

--- Extends an object properties. It copies all of the properties of extra passed-in objects
-- over to the destination object, and returns the destination object.
-- The last object in `...` will override properties of the same name in the previous one
-- @name extend
-- @tparam table destObj a destination object
-- @tparam var_arg ... a variable number of array arguments
-- @treturn table the destination object extended
function _.extend(destObj,...)
	local sources = {...}
	_.each(sources,function(__,source)
		if _.isTable(source) then
			_.each(source,function(key,value)
				destObj[key] = value
			end)
		end
	end)
	return destObj
end

--- Returns a sorted list of all methods names found in an object. If the given object
-- has a metatable implementing an `__index` field pointing to another table, will also recurse on this
-- table.
-- <br/><em>Aliased as `methods`</em>.
-- @name functions
-- @tparam table obj an object
-- @treturn table an array of methods names
function _.functions(obj)
  if not obj then
		return _.sort(_.push(_.keys(_),'chain', 'value', 'import'))
	end
  local _methods = {}
  _.each(obj,function(key,value)
    if _.isFunction(value) then
			_methods[#_methods+1]=key
		end
  end)
	local mt = getmetatable(obj)
	if mt and mt.__index then
		local mt_methods = _.functions(mt.__index)
		_.each(mt_methods, function(k,fn)
			_methods[#_methods+1] = fn
		end)
	end
   return _.sort(_methods)
end

--- Clones a given object properties. If `shallow` is passed
-- will also clone nested array properties.
-- @name clone
-- @tparam table obj an object
-- @tparam[opt] boolean shallow whether or not nested array-properties should be cloned, defaults to false.
-- @treturn table a clone of the passed-in object
function _.clone(obj,shallow)
	if not _.isTable(obj) then return obj end
  local _obj = {}
  _.each(obj,function(i,v)
    if _.isTable(v) then
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

--- Invokes interceptor with the object, and then returns object.
-- The primary purpose of this method is to "tap into" a method chain, in order to perform operations on intermediate results within the chain.
-- @name tap
-- @tparam table obj an object
-- @tparam function f an interceptor function, should be prototyped as `f(obj,...)`
-- @tparam[opt] vararg ... Extra-args to be passed to interceptor function
-- @treturn table the passed-in object
function _.tap(obj, f,...)
	f(obj,...)
	return obj
end

--- Checks if a given object implements a property.
-- @name has
-- @tparam table obj an object
-- @tparam key key a key property to be checked
-- @treturn boolean __true__ or __false__
function _.has(obj, key)
  return obj[key]~=nil
end

--- Return a filtered copy of the object. The returned object will only have
-- the whitelisted properties. <br/><em>Aliased as `choose`</em>.
-- @name pick
-- @tparam table obj an object
-- @tparam var_arg ... a variable number of string keys
-- @treturn table the filtered object
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

--- Return a filtered copy of the object. The returned object will not have
-- the blacklisted properties. <br/><em>Aliased as `drop`</em>.
-- @name omit
-- @tparam table obj an object
-- @tparam var_arg ... a variable number of string keys
-- @treturn table the filtered object
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

--- Fills nil properties in an object with the given `template` object. Pre-existing
-- properties will be preserved. <br/><em>Aliased as `defaults`</em>.
-- @name template
-- @tparam table obj an object
-- @tparam table template a template object
-- @treturn table the passed-in object filled
function _.template(obj,template)
  _.each(template,function(i,v)
	if not obj[i] then
		obj[i] = v
	end
  end)
  return obj
end

--- Performs an equality test between two objects.
-- Can compare strings, functions (by reference), nil, booleans. Compares tables by reference or by component-values.
-- Comparing objects, if `useMt` is passed, the equality operator `==` will be used if one of
-- the given objects has a metatable implementing `mt.__eq`
-- @name isEqual
-- @tparam table objA an object
-- @tparam table objB another object
-- @tparam[opt] boolean useMt whether or not `mt.__eq` should be used, defaults to false.
-- @treturn boolean __true__ or __false__
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

--- Invokes an object method. It passes the object itself as the first argument. if `method` is not
-- callable, will return `obj[method]`.
-- @name result
-- @tparam table obj an object
-- @tparam string method a string key to index in object `obj`.
-- @tparam[opt] var_arg ... Optional extra-args to be passed to `method`
-- @treturn value the returned value of `method(obj,...)` call
function _.result(obj,method,...)
  if obj[method] then
    if _.isCallable(obj[method]) then
      return obj[method](obj,...)
    else return obj[method]
    end
  end
  if _.isCallable(method) then
    return method(obj,...)
  end
end

--- Checks if the given arg is an object (i.e a Lua table).
-- @name isTable
-- @tparam object t a value to be tested
-- @treturn boolean __true__ or __false__
function _.isTable(t)
  return type(t) == 'table'
end

--- Checks if the given arg is an callable. Assumes `obj` is callable if
-- it is either a function or a table having a metatable implementing `__call` metamethod.
-- @name isCallable
-- @tparam object obj an object
-- @treturn boolean __true__ or __false__
function _.isCallable(obj)
  return (_.isFunction(obj) or
		 (_.isTable(obj) and getmetatable(obj)
					         and getmetatable(obj).__call~=nil) or false)
end

--- Checks if the given arg is an array. Assumes `obj` is an array
-- if is a table with integer numbers starting at 1.
-- @name isArray
-- @tparam object obj an object
-- @treturn boolean __true__ or __false__
function _.isArray(obj)
	if not _.isTable(obj) then return false end
	return count(obj) == #obj
end

--- Checks if the given is empty. If `obj` is a @{string}, will return __true__
-- if `#obj==0`. Otherwise, if `obj` is a table, will return whether or not this table
-- is empty.
-- @name isEmpty
-- @tparam object obj an object
-- @treturn boolean __true__ or __false__
function _.isEmpty(obj)
	if _.isString(obj) then return #obj==0 end
	if _.isTable(obj) then return next(obj)==nil end
	return true
end

--- Checks if the given arg is a @{string}.
-- @name isString
-- @tparam object obj an object
-- @treturn boolean __true__ or __false__
function _.isString(obj)
  return type(obj) == 'string'
end

--- Checks if the given arg is a function.
-- @name isFunction
-- @tparam object obj an object
-- @treturn boolean __true__ or __false__
function _.isFunction(obj)
   return type(obj) == 'function'
end

--- Checks if the given arg is nil.
-- @name isNil
-- @tparam object obj an object
-- @treturn boolean __true__ or __false__
function _.isNil(obj)
	return obj==nil
end

--- Checks if the given arg is a finite number.
-- @name isFinite
-- @tparam object obj a number
-- @treturn boolean __true__ or __false__
function _.isFinite(obj)
	if not _.isNumber(obj) then return false end
	return obj > -huge and obj < huge
end

--- Checks if the given arg is a number.
-- @name isNumber
-- @tparam object obj a number
-- @treturn boolean __true__ or __false__
function _.isNumber(obj)
	return type(obj) == 'number'
end

--- Checks if the given arg is NaN (see [Not-A-Number](http://en.wikipedia.org/wiki/NaN)).
-- @name isNaN
-- @tparam object obj a number
-- @treturn boolean __true__ or __false__
function _.isNaN(obj)
  return _.isNumber(obj) and obj~=obj
end

--- Checks if the given arg is a boolean.
-- @name isBoolean
-- @tparam object obj a boolean
-- @treturn boolean __true__ or __false__
function _.isBoolean(obj)
  return type(obj) == 'boolean'
end

--- Checks if the given arg is an integer.
-- @name isInteger
-- @tparam object obj a number
-- @treturn boolean __true__ or __false__
function _.isInteger(obj)
	return _.isNumber(obj) and floor(obj)==obj
end

-- ========= Chaining

do

	-- Wrapper to Moses
	local f = {}

	-- Will be returned upon requiring, indexes into the wrapper
	local __ = {}
	__.__index = f

	-- Wraps a value into an instance, and returns the wrapped object
	local function new(value)
		local i = {_value = value, _wrapped = true}
		return setmetatable(i, __)
	end

	setmetatable(__,{
		__call  = function(self,v) return new(v) end, -- Calls returns to instantiation
		__index = function(t,key,...) return f[key] end  -- Redirects to the wrapper
	})

	--- Returns a wrapped object. Calling library functions as methods on this object
	-- will continue to return wrapped objects until @{obj:value} is used. Can be aliased as `_(value)`.
	-- @class function
	-- @name chain
	-- @tparam value value a value to be wrapped
	-- @treturn object a wrapped object
	function __.chain(value)
		return new(value)
	end

	--- Extracts the value of a wrapped object. Must be called on an chained object (see @{chain}).
	-- @class function
	-- @name obj:value
	-- @treturn value the value previously wrapped
	function __:value()
		return self._value
	end

	-- Register chaining methods into the wrapper
	f.chain, f.value = __.chain, __.value

	-- Enables aliases in case MOSES_ALIASES was set to true in the global env
	if rawget(_G, 'MOSES_ALIASES') then
		_.forEach = _.each
		_.forEachi = _.eachi
		_.loop = _.cycle
		_.collect = _.map
		_.inject = _.reduce
		_.foldl = _.reduce
		_.injectr = _.reduceRight
		_.foldr = _.reduceRight
		_.mapr = _.mapReduce
		_.maprr = _.mapReduceRight
		_.any = _.include
		_.some = _.include
		_.find = _.detect
		_.filter = _.select
		_.discard = _.reject
		_.every = _.all
		_.takeWhile = _.selectWhile
		_.rejectWhile = _.dropWhile
		_.shift = _.pop
		_.rmRange = _.removeRange
		_.chop = _.removeRange
		_.head = _.first
		_.take = _.first
		_.tail = _.rest
		_.skip = _.last
		_.without = _.difference
		_.diff = _.difference
		_.symdiff = _.symmetric_difference
		_.unique = _.uniq
		_.mirror = _.invert
		_.join = _.concat
		_.cache = _.memoize
		_.uId = _.uniqueId
		_.methods = _.functions
		_.choose = _.pick
		_.drop = _.omit
		_.defaults = _.template
	end

	-- Register all functions into the wrapper
	for fname,fct in pairs(_) do
		f[fname] = function(v, ...)
			local wrapped = _.isTable(v) and v._wrapped or false
			if wrapped then
				local _arg = v._value
				local _rslt = fct(_arg,...)
				return new(_rslt)
			else
				return fct(v,...)
			end
		end
	end

	--- Imports all library functions into a context.
	-- @name import
	-- @tparam[opt] table context a context. Defaults to `_G` (global environment) when not given.
	-- @tparam[optchain] boolean noConflict Skips function import in case its key exists in the given context
	-- @treturn table the passed-in context
	f.import = function(context, noConflict)
		local fs = {}
		context = context or _G
		_.each(f, function(k,v)
			if noConflict then
				if not rawget(context, k) then fs[k] = v end
			else
				fs[k] = v
			end
		end)
		return _.extend(context or _G, fs)
	end

	return __
end
