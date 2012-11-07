--------------------------------------------------------------------------
-- Moses Library
-- Release Id: Moses.lua,v1.3.0 08/20/2012
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- Internalization
--------------------------------------------------------------------------

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

-- Private Helpers
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

-- A bit of randomness
randomseed(os.time())

-- Internal increment for unique Id's generation
local unique_id_counter = -1

--------------------------------------------------------------------------
-- Collection Functions (Arrays and Objects)
--------------------------------------------------------------------------

-- Calls func(key,value,...) on each key-value pair in a table
function _.each(list,func,...)
  for index,value in pairs(list) do
    func(index,value,...)
  end
  return list
end
_.forEach = _.each

-- Returns a table where each value is the result of func(key,value,...)
function _.map(list,func,...)
  local _list = {}
  for index,value in pairs(list) do
    _list[index] = func(index,value,...)
  end
  return _list
end
_.collect = _.map

-- Reduces an entire list from left to right to a single value,
-- with respect to a given initial state of reduction.
-- The given function must return a new state after each step
function _.reduce(list,func,memo)
  for _,value in pairs(list) do
    memo = not memo and value or func(memo,value)
  end
  return memo
end
_.inject = _.reduce
_.foldl = _.reduce

-- Reduces an entire list from right to left to a single value,
-- given an initial state of reduction.
-- The given function must return the new state after each step
function _.reduceRight(list,func,memo)
  return _.reduce(_.reverse(list),func,memo)
end
_.injectr = _.reduceRight
_.foldr = _.reduceRight

-- Reduces an entire list from left to right,
-- storing each intermediate state of reduction along
function _.mapReduce(list,func,memo)
  local t = {}
  for i,value in pairs(list) do
    t[i] = not memo and value or func(memo,value)
    memo = t[i]
  end
  return t
end
_.mapr = _.mapReduce

-- Reduces an entire list from right to left,
-- storing each intermediate state of reduction along
function _.mapReduceRight(list,func,memo)
  return _.mapReduce(_.reverse(list),func,memo)
end
_.maprr = _.mapReduceRight

-- Does list contains an item ?
function _.include(list,item)
  local _iter = _.isFunction(item) and item or _.isEqual
  for _,value in pairs(list) do
    if _iter(value,item) then return true end
  end
  return false
end
_.any = _.include
_.some = _.include

-- Returns the key of an item in a list
function _.detect(list,item)
  local _iter = _.isFunction(item) and item or _.isEqual
  for key,arg in pairs(list) do
    if _iter(arg,item) then return key end
  end
end
_.find = _.detect
_.where = _.detect

-- Extracts a list of values passing a given test
function _.select(list,func,...)
  local _mapped = _.map(list,func,...)
  local _list = {}
  for index,value in pairs(_mapped) do
    if value then _list[#_list+1] = list[index] end
  end
  return _list
end
_.filter = _.select

-- Rejects from a given list all values passing a given test
function _.reject(list,func,...)
  local _mapped = _.map(list,func,...)
  local _list = {}
  for index,value in pairs (_mapped) do
    if not value then _list[#_list+1] = list[index] end
  end
  return _list
end
_.discard = _.reject

-- Tests if all values in a list pass a given test
function _.all(list,iter)
  return ((#_.select(_.map(list,iter), isTrue)) == (#list))
end
_.every = _.all

-- Calls a method over each element in a collection of
-- objects and returns their results in an array
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

-- Returns a array of values of a targetted property in a  collection of objects.
function _.pluck(list,property)
  return _.reject(_.map(list,function(__,value)
      return value[property]
    end),
  iNot)
end

-- Extracts the maximum value in a collection of objects
function _.max(list,extractCriterion,...)
  return extract(list,f_max,extractCriterion,...)
end

-- Extracts the minimum value in a collection of objects
function _.min(list, extractCriterion,...)
  return extract(list,f_min, extractCriterion,...)
end


-- Shuffles a list
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

-- Returns whether all values from both collections exists in each other
function _.same(a,b)
  return _.all(a, function (i,v)
			return _.include(b,v)
		end)
	and _.all(b, function (i,v)
			return _.include(a,v)
		end)
end

-- Sorts a list
function _.sort(list,comp)
  t_sort(list,comp)
  return list
end

-- Converts a list of values to an array
function _.toArray(...) return {...} end

-- Groups values with restect to a given criterion
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

-- Splits values into subsets with respect to a given
-- iterator and returns the number of element in each subset.
function _.countBy(list,iter)
	local stats = {}
	_.each(list,function(i,v)
			local key = iter(i,v)
			stats[key] = (stats[key] or 0) +1
		end)
	return stats
end

-- Returns the size of a list (counts the very number of items inside)
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

-- Checks if all the keys of table 'other' are inside table t
function _.contains(t,other)
  for key in pairs(other) do
    if not t[key] then return false end
  end
  return true
end

-- Checks if two lists have the same keys
function _.sameKeys(listA,listB)
  _.each(listA,function(key)
      if not listB[key] then return false end
     end)
  _.each(listB,function(key)
      if not listA[key] then return false end
     end)
  return true
end

--------------------------------------------------------------------------
-- Array functions
--------------------------------------------------------------------------

-- Reverses values in a given array
function _.reverse(array)
  local _array = {}
  for i = #array,1,-1 do
    _array[#_array+1] = array[i]
  end
  return _array
end

-- Collects values from a given array as long as they pass a given test
function _.selectWhile(array,func,...)
  local t = {}
  for i,v in ipairs(array) do
    if func(i,v,...) then t[i] = v else break end
  end
  return t
end
_.takeWhile = _.selectWhile

-- Rejects values from a given array as long as they pass a given test
function _.dropWhile(array, func,...)
  local _i
  for i,v in ipairs(array) do
    if not func(i,v,...) then
      _i = i
      break
    end
  end
  if _.isNil(_i) then return {} end
  return _.rest(array,_i)
end
_.rejectWhile = _.dropWhile

-- Returns the index at which a value should be inserted in a array
-- with respect to a given comparison function
function _.sortedIndex(array,value,comp,sort)
  local _comp = comp or f_min
  if sort then array = _.sort(array,_comp) end
  for i = 1,#array do
    if not _comp(array[i],value) then return i end
  end
  return #array+1
end

-- Returns the key at which a value is mapped in an array
function _.indexOf(array, value)
  for k = 1,#array do
    if array[k] == value then return k end
  end
end

-- Returns the key of the last occurence of an item array
function _.lastIndexOf(array,value)
  local key = _.indexOf(_.reverse(array),value)
  if key then return #array-key+1 end
end

-- Add values at the top of an array
function _.add(array,...)
  _.each({...},function(i,v) t_insert(array,1,v) end)
  return array
end

-- Pushes values at the end of an array
function _.push(array,...)
  _.each({...}, function(i,v) array[#array+1] = v end)
  return array
end

-- Pops the value at the top of an array
function _.pop(array)
  local retValue = array[1]
  t_remove(array,1)
  return retValue
end
_.shift = _.pop

-- Pops the value at the end of an array
function _.unshift(array)
  local retValue = array[#array]
  t_remove(array)
  return retValue
end

-- Remove values mapped at all keys within a given range
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
_.rmRange = _.removeRange

-- Returns the portion of an array between left and right indexes
function _.slice(array,left,right)
  return _.select(array, function(index)
      return (index >= (left or next(array)) and index <= (right or #array))
    end)
end

-- Returns the n-first elements of an array
function _.first(array,n)
  local n = n or 1
  return _.slice(array,1, min(n,#array))
end
_.head = _.first
_.take = _.first

-- Returns an array excluding the last n elements
function _.initial(array,n)
  if n and n < 0 then return end
  return _.slice(array,1, n and #array-(min(n,#array)) or #array-1)
end

-- Returns the last n elements of an array
function _.last(array,n)
  if n and n <= 0 then return end
  return _.slice(array,n and #array-min(n-1,#array-1) or 2,#array)
end

-- Returns an array excluding elements before index position
function _.rest(array,index)
  if index and index > #array then return {} end
  return _.slice(array,index and max(1,min(index,#array)) or 1,#array)
end
_.tail = _.rest

-- Returns an array where all falsy values were removed
function _.compact(array)
  return _.reject(array, function (_,value)
		return not value
	end)
end

-- Flattens an array
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

-- Returns an array made of values not present in others arrays
function _.difference(array,...)
  local values = _.toArray(...)
  return _.select(array,function(i,value)
      return not _.include(values,value)
    end)
end
_.without = _.difference

-- Returns duplicate-free version of a given array
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
_.unique = _.uniq

-- Returns the union of all given arrays
function _.union(...)
  return _.flatten {...}
end

-- Returns the intersection of all given arrays
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

-- Merges values of each of the given arrays with the values at the corresponding index.
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

-- Appends two arrays altogether
function _.append(list,other)
  local t = {}
  for i,v in ipairs(list) do t[i] = v end
  for i,v in ipairs(other) do t[#t+1] = v end
  return t
end

-- Returns an array of integers between start/stop values, regards to a given step
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

-- Returns a table where keys and values were inverted
function _.invert(array)
  local _ret = {}
  _.each(array,function(i,v) _ret[v] = i end)
  return _ret
end
_.mirror = _.invert

-- Concats values inside an array
function _.concat(array,sep)
  local buf = ''
  _.each(array,function(i,v)
    buf = buf .. tostring(v) .. (sep or '')
  end)
  return buf
end
_.join = _.concat
_.attach = _.concat
_.tie = _.concat

--------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------

-- Returns the value passed as arg
function _.identity(value)
  return value
end

-- Returns a version of function f that can be run only once
function _.once(f)
  local _internal = 0
  local _args = {}
  return function(...)
      _internal = _internal+1
      if _internal<=1 then _args = {...} end
      return f(unpack(_args))
    end
end

-- Returns a memoized version of function f
function _.memoize(f,hash)
  local _cache = setmetatable({},{__mode = 'kv'})
  local _hasher = hash or function(v) return v end
  return function (...)
      local _hashKey = _hasher(...)
      local _result = _cache[_hashKey]
      if not _result then _cache[_hashKey] = f(...) end
      return _cache[_hashKey]
    end
end

-- Returns a version of function f that will be run
-- only after being called count minus 1 times
function _.after(f,count)
  local _limit,_internal = count, 0
  return function(...)
      _internal = _internal+1
      if _internal >= _limit then return f(...) end
    end
end

-- Returns the composition of functions, where each function is feeded
-- with the returned value of the following functions in the list or arguments
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

-- Wraps a function inside a wrapper provided
function _.wrap(func,wrapper)
	return function (...)
      return  wrapper(func,...)
    end
end

-- Curryies functions
function _.curry(f,args)
  return function(...) f(args,...) end
end

-- Calls an iterator n times
function _.times(n,iter,...)
  local results = {}
  for i = 1,n do
    results[i] = iter(i,...)
  end
  return results
end

-- Binds a value to the first argument of a given function
function _.bind(func,v)
  return function (...)
      return func(v,...)
    end
end

-- Binds n values to a given given function
function _.bindn(func,...)
  local iArg = {...}
  return function (...)
      return func(unpack(_.append(iArg,{...})))
    end
end

-- Generates (incrementally) and unique ID
function _.uniqueId(template)
	unique_id_counter = unique_id_counter + 1
	if template and type(template) == 'string' then
		return template:format(unique_id_counter)
	else
    return unique_id_counter
	end
end
_.uId = _.uniqueId

--------------------------------------------------------------------------
-- Object functions
--------------------------------------------------------------------------

-- Returns a list of keys in the given object
function _.keys(obj)
  local _oKeys = {}
  _.each(obj,function(key,_) _oKeys[#_oKeys+1]=key end)
  return _oKeys
end

-- Returns a list of values in the given array
function _.values(obj)
  local _oValues = {}
  _.each(obj,function(_,value) _oValues[#_oValues+1]=value end)
  return _oValues
end

-- Returns an array of all keys-pairs within an object
function _.pairs(obj)
  local paired= {}
  _.each(obj,function(k,v)
		paired[#paired+1] = {k,v}
	end)
	return paired
end

-- Extends destination object with all source objects properties
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

-- Returns an object which inherits from  a given object
function _.implements(obj)
	if _.isObject(obj) then
		obj.__index = obj
		return setmetatable({},obj)
	end
end
_.extends = _.implements

-- Checks if an object inherits from a superObj
function _.inherit(obj,superObj)
	return getmetatable(obj) == superObj
end

-- Returns an array-list of method names in an object
function _.functions(obj)
  if not obj then return _.sort(_.keys(_)) end
  local _methods = {}
  _.each(obj,function(key,value)
      if _.isFunction(value) then _methods[#_methods+1]=key end
    end)
  return _.sort(_methods)
end
_.methods = _.functions

-- Clones an object (recursively)
function _.clone(obj,shallow)
  local _obj = {}
  for i,v in pairs(obj) do
    if _.isObject(v) then
      if shallow then _obj[i] = _.clone(v)
      else _obj[i] = v
      end
    else _obj[i] = v
    end
  end
  return _obj
end

-- Checks if a given object has a property
function _.has(obj, key)
  return obj[key]~=nil
end

-- Picks specified properties and their matching values in a object
function _.pick(obj, ...)
	local prop = {...}
	local _picked = {}
	_.each(prop,function(_,v)
			if obj[v] then
				_picked[v] = obj[v]
			end
		end)
	return _picked
end
_.choose = _.pick

-- Clones an object while denying specified properties and their matching values
function _.omit(obj,...)
	local prop = {...}
	local _picked = {...}
	_.each(obj,function(k,v)
			if not _.include(prop,k) then
				_picked[k] = v
			end
		end)
	return _picked
end
_.drop = _.omit

-- Applies a template over an object
function _.template(obj,template)
  local _obj = _.clone(obj)
  _.each(template,function(i,v) _obj[i] = v end)
  return _obj
end
_.defaults = _.template

-- Raw equality test
function _.isEqual(objA,objB,useMt)
	local typeObjA = type(objA)
	local typeObjB = type(objB)
  if typeObjA~=typeObjB then return false end
  if typeObjA~='table' then return (objA==objB) end

  local mt = getmetatable(objA)
  if useMt and mt and mt.__eq then return objA==objB end

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

-- Invokes an object's method with custom arguments
function _.result(obj,property,...)
  if obj[property] then
    if _.isCallable(object[property]) then
      return obj[property](obj,...)
    else return obj[property]
    end
  end
end

-- Tests if arg is an object
function _.isObject(obj)
  return type(obj) == 'table'
end

-- Tests if an object is callable
function _.isCallable(obj)
  return (_.isFunction(obj) or
		 (_.isObject(obj) and getmetatable(obj)
					         and getmetatable(obj).__call))
end

-- Is array an array ?
function _.isArray(obj)
	if not _.isObject(obj) then return false end
	return _.all(_.keys(obj),function(i,v)
			return _.isNumber(v)
		end)
end

-- Is Obj empty ?
function _.isEmpty(obj)
	return not obj and true
			or (not _.isObject(obj) and true
				or ((next(obj))==nil))
end

-- Is obj a string
function _.isString(value)
  return type(value) == 'string'
end

-- Is obj a function
function _.isFunction(obj)
   return type(obj) == 'function'
end

-- Is value nil ?
function _.isNil(obj)
	return obj==nil
end

-- Is value a finite number ?
function _.isFinite(value)
	return _.isNumber(value) and value > -huge and value < huge
end

-- Is value a number
function _.isNumber(value)
	return type(value) == 'number'
end

-- Tests is value is NaN
function _.isNaN(value)
  return _.isNumber(value) and value~=value
end

-- Is value a boolean
function _.isBoolean(value)
  return tonumber(value) == 'boolean'
end

--------------------------------------------------------------------------
-- Exporting public interface
--------------------------------------------------------------------------

-- Links all functions with Lua's built-in table library
local function import()
  local fn = _.functions()
  _.each(fn,function(i,fName)
    (getfenv()).table[fName] = _[fName]
  end)
end

local _mt = {import = import, mixin = import}
_mt.__index = _mt
return setmetatable (_, _mt)

-- Copyright (c) 2012 Roland Yonaba
--[[
Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]
