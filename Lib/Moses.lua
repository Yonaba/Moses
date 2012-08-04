--------------------------------------------------------------------------
-- Moses Library
-- Release Id: Moses.lua,v1.1 08/04/2012
--------------------------------------------------------------------------

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

--------------------------------------------------------------------------
-- Internalization
--------------------------------------------------------------------------

local next, type, unpack, select = next, type, unpack, select
local setmetatable, getmetatable = setmetatable, getmetatable
local t_insert, t_sort, t_remove = table.insert, table.sort, table.remove
local randomseed, random = math.randomseed, math.random
local floor, max, min = math.floor, math.max, math.min
local getfenv = getfenv
local unpack = unpack
local _ = {}

-- Private Helpers
local function f_max(a,b) return a>b end
local function f_min(a,b) return a<b end
local function clamp(var,a,b) return (var<a) and a or (var>b and b or var) end
randomseed(random())

--------------------------------------------------------------------------
-- Collection Functions
--------------------------------------------------------------------------

-- Iterates over a table, return key-value pairs
function _.iterate(_t)
	local i
	return function()
		i,v = next(_t,i)
		return i,v
	end
end

-- Runs func(key,value,...) with each key-value pair in a table
function _.each(list,func,...)
	for index,value in _.iterate(list) do func(index,value,...)	end
	return list
end
_.forEach = _.each

-- Returns a table where each value is the result of func(key,value,...)
function _.map(list,func,...)
	local _list = {}
	for index,value in _.iterate(list) do _list[index] = func(index,value,...)	end
	return _list
end
_.collect = _.map

-- Returns an array with value in reversing order
function _.reverse(array_list)
	local _list = {}
	for i = #array_list,1,-1 do _list[#_list+1] = array_list[i]	end
	return _list
end

-- Reduces an entire list from left to right to a single value, given an initial state of reduction.
-- The given function must return the new state after each step
function _.reduce(list,memo,func,...)
	for _,value in _.iterate(list) do memo = func(memo,value,...) end
	return memo
end
_.inject = _.reduce
_.foldl = _.reduce

-- Reduces an entire list from right to left to a single value, given an initial state of reduction.
-- The given function must return the new state after each step
function _.reduceRight(list,memo,func,...) return _.reduce(_.reverse(list),memo,func,...) end
_.foldr = _.reduceright

-- Tests if a list contains a value matching a given pattern
function _.include(list,criteria)
	local _criteria = type(criteria)=='function' and criteria or (function(v) return v==criteria end)
	for index,value in _.iterate(list) do
		if _criteria(value) then return true,index end
	end
	return nil,nil
end

-- Tests if a list contains a value matching a given pattern
function _.includeLast(list,criteria)
	local _list = _.reverse(list)
	local found,key = _.include(_list,criteria)
	if found then return true,#list-key+1 end
	return nil,nil
end

-- Returns the key of the first occurrence matching a given pattern in a list.
function _.detect(list,criteria) return select(2,_.include(list,criteria)) end

-- Returns the key of the last occurrence matching a given pattern in a list.
function _.detectLast(list,criteria) return select(2,_.includeLast(list,criteria)) end

-- Extracts a list of values matching a given criteria from a given list
function _.select(list,func,...)
	local _criteria = _.map(list,func,...)
	local _list = {}
	for index,value in _.iterate(_criteria) do
		if value then t_insert(_list,list[index]) end
	end
	return _list
end
_.filter = _.select

-- Rejects from a given list values matching a given criteria
function _.reject(list,func,...)
	local _criteria = _.map(list,func,...)
	local _list = {}
	for index,value in _.iterate(_criteria) do
		if not value then t_insert(_list,list[index]) end
	end
	return _list
end

-- Tests if all values in a list matches a given criteria
function _.all(list,criteria)
	return ((#_.select(_.map(list,criteria), function(item) return item and true end))
			  == (#list))
end
_.every = _.all

-- Tests if at least one value in a given list matches a given criteria
function _.any(list,criteria) return _.detect(list,criteria) and true or false end
_.some = _.any

-- Calls a method over each element in a collection of objects
function _.invoke(method,list,...)
	for _,object in _.iterate(list) do object[method](object,...) end
end

-- Returns a list made of values of a specific property of each element from a  collection of objects.
function _.pluck(list,key)
	return _.reject( _.map(list,function(_,value) return value[key] end),
				     function(i) return not i end)
end

-- Extracts the maximum value, and its position from an array made of values of a specific property in a collection of objects
function _.max(list,extractCriterion)
	local _ans,_comp,_where
	_list = extractCriterion and {} or list
	if extractCriterion then
		for index,value in _.iterate(list) do _list[index] = extractCriterion(value) end
	end
	_comp = f_max
	_where,_ans = next(_list)
	for index,value in _.iterate(_list) do
		_ans = _comp(_ans,value) and _ans or value
		_where = _comp(_ans,value) and _where or index
	end
	return _ans,_where
end

-- Extracts the minimum value, and its position from an array made of values of a specific property in a collection of objects
function _.min(list, extractCriterion)
	local _ans,_comp,_where
	_list = extractCriterion and {} or list
	if extractCriterion then
		for index,value in _.iterate(list) do _list[index] = extractCriterion(value) end
	end
	_comp = f_min
	_where,_ans = next(_list)
	for index,value in _.iterate(_list) do
		_ans = _comp(_ans,value) and _ans or value
		_where = _comp(_ans,value) and _where or index
	end
	return _ans,_where
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

-- Sorts a list
function _.sort(list,comp)
	local _list = (type(list) == 'function' and _.iter_to_array(list) or list)
	t_sort(_list,comp)
	return _list
end

-- Returns the index at which a value should be inserted in a array regards to a given comparision method
function _.sortedIndex(list,item,comp)
	local _comp = comp or (function(a,b) return a<b end)
	local list = _.sort(list,_comp)
	for index,value in _.iterate(list) do
		if not _comp(value,item) then return index end
	end
	return #list+1
end

-- Converts a list of values to an array
function _.to_array(...) return {...} end

-- Converts returned values of a given iterator to an array
function _.iter_to_array(iter)
	local _array = {}
	for value in iter do _array[#_array+1] = value end
	return _array
end

-- Group values by criteria
function _.groupBy(list,criteria)
	local _list = {}
	local _criteria = type(criteria)=='function' and criteria or function(_,list) return list[criteria] end
	_.each(list, function(index,value)
					local _key = criteria(index,value)
					if _list[_key] then t_insert(_list[_key],value)
					else _list[_key] = {value}
					end
				end)
	return _list
end

-- Returns the size of a list (counts the number of items inside)
function _.size(list)
	local _i
	for __,__ in _.iterate(list) do _i = _i and _i+1 or 1	end
	return _i
end

-- Checks if all the keys of table 'other' are inside table t
function _.contains(t,other)
	for key in _.iterate(other) do
		if not t[key] then return false end
	end
	return true
end

-- Checks if tables have the same keys
function _.sameKeys(t1,t2)
	local _t1 = _.flatten(t1)
	local _t2 = _.flatten(t2)
	return _.contains(t1,t2) and _.contains(t2,t1)
end

--------------------------------------------------------------------------
-- Array functions
--------------------------------------------------------------------------

-- Pushes values at the end of an array
function _.push(array,...)
	_.each({...}, function(i,v) t_insert(array,v) end)
	return array
end
_.append = _.push

-- Pops the value at the top of an array
function _.pop(array)
	local retValue = array[1]
	t_remove(array,1)
	return retValue
end

-- Pops the value at the end of an array
function _.unshift(array)
	local retValue = array[#array]
	t_remove(array)
	return retValue
end

function _.removeRange(array,start,finish)
	local array = _.clone(array)
	local n = #array
	if n < 1 then return array end

	local start = start and clamp(start or 1,1,n)
	local finish = finish or clamp(finish or n,1,n)

	if finish < start then return end

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
function _.slice(array,left,right) return _.select(array, function(index,_) return (index >= (left or 1) and index <= (right or #array)) end) end

-- Returns the n-first elements of an array
function _.first(array,n)
	local n = n or 1
	return _.slice(array,1, min(n,#array))
end
_.head = _.first

-- Returns an array excluding the last n elements
function _.initial(array,n) return _.slice(array,1, n and #array-(min(n,#array)) or #array-1) end

-- Returns the last n elements of an array
function _.last(array,n) return _.slice(array,n and #array-min(n-1,#array-1) or 2,#array) end

-- Returns an array excluding elements before index position
function _.rest(array,index) return _.slice(array,index and max(1,min(index,#array)) or 1,#array) end
_.tail = _.rest

-- Returns an array where all falsy values were removed
function _.compact(array) return _.reject(array, function(i,value) return not value end) end

-- Flattens an array
function _.flatten(array, shallow)
	local shallow = shallow or false
	local new_flattened
	local _flat = {}
	for key,value in _.iterate(array) do
		if type(value) == 'table' and not shallow then
			new_flattened = _.flatten (value)
			_.each(new_flattened, function(_,item) t_insert(_flat,item) end)
		else _flat[#_flat+1] = value
		end
	end
	return _flat
end

-- Returns an array made of values not present in others arrays
function _.difference(array,...)
	local _flatten_args = _.flatten {...}
	return _.select(array,function(i,value) return not _.include(_flatten_args,value) end)
end

-- Returns duplicate-free version of a given array
function _.uniq(array,isSorted,iter,...)
	local init = iter and _.map(array,iter,...) or array
	local result = {}
	if not isSorted then
		for __,v in _.iterate(init) do
			if not _.findValue(result,v) then t_insert(result,v) end
		end
	return result
	end

	t_insert(result,init[1])
	for i = 2,#init do
		if init[i] ~= result[#result] then t_insert(result,init[i]) end
	end
	return result
end
_.unique = _.uniq

-- Returns an array made of values not present in the list of given values
function _.without(array,...) return _.difference(array,...) end

-- Returns the union of all given arrays
function _.union(...) return _.flatten {...} end

-- Returns the intersection of all given arrays (each value of the result being present in all arrays)
function _.intersection(array,...)
	local arg = {...}
	local _intersect = {}
	for i,arrayValue in _.iterate(array) do
		if _.all(arg,function(i,v) return _.detect(v,arrayValue) end) then t_insert(_intersect,arrayValue) end
	end
	return _intersect
end

-- Merges values of each of the given arrays with the values at the corresponding index.
function _.zip(...)
	local arg = {...}
	local _len = _.max(_.map(arg,function(i,v) return #v end))
	local _ans = {}
	for i = 1,_len do _ans[i] = _.pluck(arg,i) end
	return _ans
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

--------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------

-- Returns the index of value v in table t
function _.findValue(t,v)
	for k,_v in _.iterate(t) do
		if (_v==v) then return k end
	end
	return nil
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

-- Returns a version of function f that will be run only after being called count minus 1 times
function _.after(f,count)
	local _limit,_internal = count, 0
	return function(...)
		      _internal = _internal+1
			  if _internal >= _limit then return f(...) end
		   end
end

-- Returns the composition of functions, where each function is feeded with the returned value of the following functions in the list or arguments
function _.compose(...)
	local f = _.reverse {...}
	return function (...)
		      local _temp
		      for i,func in _.iterate(f) do _temp = _temp and func(_temp) or func(...) end
		      return _temp
	       end
end

-- Wraps a function inside a wrapper provided
function _.wrap(func,wrapper) return function (...) return  wrapper(func,...) end end

-- Curry functions
function _.curry(f,args) return function(...) f(args,...) end end

-- Calls an iterator n times
function _.times(n,iterator)
	for i = 1,n do iterator(i)	end
end

-- Binds a value to the first argument of a given function
function _.bind(func,v)
	return function (...) return func(v,...) end
end

-- Links all functions with Lua's built-in table library
function _.import()
	local fn = _.functions()
	_.each(fn,function(i,fName)
		if fName ~='import' then getfenv().table[fName] = _[fName] end
	end)
end

--------------------------------------------------------------------------
-- Object functions
--------------------------------------------------------------------------

-- Returns a list of keys in the given array
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

-- Returns an array of method names in an object
function _.functions(obj)
	if not obj then return _.sort(_.keys(_)) end
	local _methods = {}
	_.each(obj,function(key,value)
			      if type(value) == 'function' then _methods[#_methods+1]=key end
			   end)
	return _.sort(_methods)
end
_.methods = _.functions

-- Clones an object (recursively)
function _.clone(obj)
	local _obj = {}
	for i,v in _.iterate(obj) do
		if type(v) == 'table' then _obj[i] = _.clone(v)
		else _obj[i] = v
		end
	end
	return _obj
end

-- Applies a template over an object
function _.template(obj,template)
	local _obj = _.clone(obj)
	_.each(template,function(i,v) _obj[i] = v end)
	return _obj
end

-- Tests equality between two objects
function _.isEqual(objA,objB)
	if _.size(objA)~=_.size(objB) then return false end
	for i,v in _.iterate(objA) do
		if type(v)~='table' then
			if not (objB[i] and objB[i]==v) then return false end
		else
			if not _.isEqual(v,objB[i]) then return false end
		end
	end
	return true
end

-- Invokes an object's method with custom arguments
function _.result(obj,property,...)
	if obj[property] then return (type(obj[property])=='function' and obj[property](obj,...) or obj[property]) end
end

-- Returns bundled functions
return  _
