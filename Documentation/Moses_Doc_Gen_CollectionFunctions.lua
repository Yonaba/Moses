--------------------------------------------------------------------------
-- Set of utility functions for collections
-- @author Roland Yonaba
-- @release $Id: Moses.lua,v 0.1 07/24/2012 Roland_Yonaba$
--------------------------------------------------------------------------

--Copyright (c) 2012 Roland Yonaba
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

--- Iterates over a table, returning at each iteration key-value pairs
-- @param _t a table
-- @return key
-- @return value stored at key position in the table
-- @usage <pre class='example'> 
-- for i,v in _.iterate({1,2,3,4,5}) do print(i,v) end
-- </pre>
function _.iterate(_t) end

--- Runs func(key,value,...) passing each key-value pairs from the table as arguments.
-- @param list a table
-- @param func a function prototyped as <tt> function(key,value,...) </tt>
-- @param ... a list of extra arguments to be passed to function <tt>func</tt>
-- @return list the original table
-- @usage <pre class='example'> 
-- _.each({1,2,3,4,5},print)
-- </pre>
-- @see _.forEach
function _.each(list,func,...) end

--- Runs func(key,value,...) passing each key-value pairs from the table as arguments. Alias for <tt>_.each</tt>
-- @param list a table
-- @param func a function prototyped as <tt> function(key,value,...) </tt>
-- @param ... a list of extra arguments to be passed to function <tt>func</tt>
-- @return list the original table
-- @usage <pre class='example'> 
-- _.forEach({1,2,3,4,5},print)
-- </pre>
-- @see _.each
function _.forEach(list,func,...) end

--- Returns a table where each value is the result of mapping a given transformation function
-- @param list a table
-- @param func a function prototyped as <tt> function(key,value,...) </tt>
-- @param ... a list of extra arguments to be passed to function <tt>func</tt>
-- @return a table
-- @usage <pre class='example'> 
-- _.map({1,3,5}, function (key,value) return value^2 end) --> {1,9,25}
-- </pre>
-- @see _.collect
function _.map(list,func,...) end

--- Returns a table where each value is the result of mapping a given transformation function. Alias for <tt>_.map</tt>
-- @param list a table
-- @param func a function prototyped as <tt> function(key,value,...) </tt>
-- @param ... a list of extra arguments to be passed to function <tt>func</tt>
-- @return a table
-- @usage <pre class='example'> 
-- _.collect({1,3,5}, function (key,value) return value^2 end) --> {1,9,25}
-- </pre>
-- @see _.map
function _.collect(list,func,...) end

--- Returns an array with values in reversing order
-- @param array_list a table
-- @return a table
-- @usage <pre class='example'> 
-- _.reverse({1,2,3,4}) --> {4,3,2,1}
-- </pre>
function _.reverse(array_list) end

--- Reduces a list of values to a single value, processing from left to right, given an initial state of reduction. The function used for reduction must return a new state at each step.
-- @param list a table of values
-- @param memo a state of reduction
-- @param func a transformation function used for reduction, should be prototyped as <tt> func(memo,value,...) </tt>
-- @param ... a list of extra arguments to be passed to function <tt>func</tt>
-- @return a value
-- @usage <pre class='example'> 
-- local t = {1,2,3,4,5} <br/>
-- _.reduce(t, 1, function(state,value) return state*value end) --> 120
-- </pre>
-- @see _.inject
-- @see _.foldl
function _.reduce(list,memo,func,...) end

--- Reduces a list of values to a single value, processing from left to right, given an initial state of reduction. The function used for reduction must return a new state at each step. Alias for <tt>_.reduce</tt>
-- @param list a table of values
-- @param memo a state of reduction
-- @param func a transformation function used for reduction, should be prototyped as <tt>func(memo,value,...)</tt>
-- @param ... a list of extra arguments to be passed to function <tt>func</tt>
-- @return a value
-- @usage <pre class='example'> 
-- local t = {1,2,3,4,5} <br/>
-- _.inject(t, 1, function(state,value) return state*value end) --> 120
-- </pre>
-- @see _.reduce
-- @see _.foldl
function _.inject(list,memo,func,...) end

--- Reduces a list of values to a single value, processing from left to right, given an initial state of reduction. The function used for reduction must return a new state at each step. Alias for <tt>_.reduce</tt>
-- @param list a table of values
-- @param memo a state of reduction
-- @param func a transformation function used for reduction, should be prototyped as <tt> func(memo,value,...)</tt>
-- @param ... a list of extra arguments to be passed to function <tt>func</tt>
-- @return a value
-- @usage <pre class='example'> 
-- local t = {1,2,3,4,5} <br/>
-- _.foldl(t, 1, function(state,value) return state*value end) --> 120
-- </pre>
-- @see _.reduce
-- @see _.inject
function _.foldl(list,memo,func,...) end

--- Reduces a list of values from right to left to a single value, given an initial state of reduction. The given function must return a new state of reduction after each step
-- @param list a table of values
-- @param memo a state of reduction
-- @param func a transformation function used for reduction, should be prototyped as <tt>func(memo,value,...)</tt>
-- @param ... a list of extra arguments to be passed to function <tt>func</tt>
-- @return a value
-- @usage <pre class='example'> 
-- local t = {1,2,3,4,5} <br/>
-- _.reduceRight(t, 500, function(state,value) return state/value end) --> 4.1667
-- </pre>
-- @see _.foldr
function _.reduceRight(list,memo,func,...) end

--- Reduces a list of values from right to left to a single value, given an initial state of reduction. The given function must return a new state of reduction after each step. Alias for <tt>_.reduceRight</tt>
-- @param list a table of values
-- @param memo a state of reduction
-- @param func a transformation function used for reduction, should be prototyped <tt>func(memo,value,...)</tt>
-- @param ... a list of extra arguments to be passed to function <tt>func</tt>
-- @return a value
-- @usage <pre class='example'> 
-- local t = {1,2,3,4,5} <br/>
-- _.foldr(t, 500, function(state,value) return state/value end) --> 4.1667
-- </pre>
-- @see _.reduceRight
function _.foldr(list,memo,func,...) end

--- Checks if a list contains a value matching a given pattern
-- @param list a table of values
-- @param criteria a value or a matching pattern function prototyped as <tt>func(value)</tt>
-- @return a boolean
-- @return the key where value was found
-- @usage <pre class='example'> 
-- local t = {1,2,3,4,5} <br/>
-- _.include(t, 4) --> true,4 <br/>
-- _.include(t, function(value) return value%3==0 end) --> true,3 <br/>
-- _.include(t, function(value) return value>5 end) --> nil,nil
-- </pre>
-- @see _.contains
function _.include(list,criteria) end

--- Checks if a list contains a value matching a given pattern.Alias for <tt>_.include</tt>
-- @param list a table of values
-- @param criteria a value or a matching pattern function prototyped as <tt>func(value)</tt>
-- @return a boolean
-- @return the key where value was found
-- @usage <pre class='example'> 
-- local t = {1,2,3,4,5} <br/>
-- _.contains(t, 4) --> true,4 <br/>
-- _.contains(t, function(value) return value%3==0 end) --> true,3 <br/>
-- _.contains(t, function(value) return value>5 end) --> nil,nil
-- </pre>
-- @see _.include
function _.contains(list,criteria) end

--- Tests if a list contains, seeking from right to left, any value matching a given pattern
-- @param list a table of values
-- @param criteria a value or a matching pattern function prototyped as <tt>func(value)</tt>
-- @return a boolean
-- @return the key where value was found
-- @usage <pre class='example'> 
-- local t = {1,2,3,4,5,6,4} <br/>
-- _.includeLast(t, 4) --> true,7 <br/>
-- _.includeLast(t, function(value) return value%3==0 end) --> true,6 <br/>
-- _.includeLast(t, function(value) return value>3 end) --> true,7
-- </pre>
function _.includeLast(list,criteria) end

--- Returns the key of the first occurrence matching a given pattern in a list.
-- @param list a table of values
-- @param criteria a value or a matching pattern function prototyped as <tt>func(value)</tt>
-- @return the key of the matching value found
-- @usage <pre class='example'> 
-- local t = {5,3,8,2,0} <br/>
-- _.detect(t, 4) --> nil <br/>
-- _.detect(t, function(value) return value%3==0 end) --> 2
-- </pre>
function _.detect(list,criteria) end

--- Returns the key of the last occurrence matching a given pattern in a list.
-- @param list a table of values
-- @param criteria a value or a matching pattern function prototyped as <tt>func(value)</tt>
-- @return the key of the matching value found
-- @usage <pre class='example'> 
-- local t = {5,3,8,2,0} <br/>
-- _.detectLast(t, 4) --> 4 <br/>
-- _.detectLast(t, function(value) return value%3==0 end) --> 5
-- </pre>
function _.detectLast(list,criteria) end

--- Extracts values from a list truthfully matching a given criteria
-- @param list a table of values
-- @param func a matching pattern function. Should be prototyped as <tt> func(index,value,...) </tt>
-- @return an array of values
-- @usage <pre class='example'> 
-- local t = {'Hello','Lua','Programming'} <br/>
-- _.select(t, function(i,v) return v:len() > 3 end) --> {'Hello','Programming'}
-- </pre>
-- @see _.filter
function _.select(list,func,...) end

--- Extracts a list of values truthfully matching a given criteria from a given list. Alias for <tt>_.select</tt>
-- @param list a table of values
-- @param func a matching pattern function. Should be prototyped as <tt> func(index,value,...) </tt>
-- @return an array of values
-- @usage <pre class='example'> 
-- local t = {'Hello','Lua','Programming'} <br/>
-- _.filter(t, function(i,v) return v:len() > 3 end) --> {'Hello','Programming'}
-- </pre>
-- @see _.select
function _.filter(list,func,...) end

--- Wipes from a given list values passing thruthfully a given criteria. This function is the opposite of <tt>_.select</tt>
-- @param list a table of values
-- @param func a matching pattern function. Should be prototyped as <tt> func(index,value,...) </tt>
-- @return an array of values
-- @usage <pre class='example'> 
-- local t = {'Hello','Lua','Programming'} <br/>
-- _.filter(t, function(i,v) return v:len() > 3 end) --> {'Hello','Programming'}
-- </pre>
-- @see _.select
function _.reject(list,func,...) end

--- Checks if all values in a list matches a given criteria
-- @param list a table of values
-- @param criteria a matching pattern function. Should be prototyped as <tt> func(index,value) </tt>
-- @return a boolean
-- @usage <pre class='example'> 
-- local t = {'Hello','Lua','Programming'} <br/>
-- _.all(t, function(i,v) return type(v)=='string' end) --> true
-- </pre>
-- @see _.every
function _.all(list,criteria) end

--- Checks if all values in a list matches a given criteria. Alias for <tt>_.all</tt>
-- @param list a table of values
-- @param criteria a matching pattern function. Should be prototyped as <tt> func(index,value) </tt>
-- @return a boolean
-- @usage <pre class='example'> 
-- local t = {'Hello','Lua','Programming'} <br/>
-- _.every(t, function(i,v) return type(v)=='string' end) --> true
-- </pre>
-- @see _.all
function _.every(list,criteria) end

--- Checks if at least one value in a given list matches a given criteria
-- @param list a table of values
-- @param criteria a matching pattern function. Should be prototyped as <tt> func(index,value) </tt>
-- @return a boolean
-- @usage <pre class='example'> 
-- local t = {'Hello','Lua','Programming', 4} <br/>
-- _.any(t, function(i,v) return type(v) ~= 'string' end) --> true
-- </pre>
-- @see _.some
function _.any(list,criteria) end

--- Checks if at least one value in a given list matches a given criteria. Alias for <tt>_.any</tt>
-- @param list a table of values
-- @param criteria a matching pattern function. Should be prototyped as <tt> func(index,value) </tt>
-- @return a boolean
-- @usage <pre class='example'> 
-- local t = {'Hello','Lua','Programming', 4} <br/>
-- _.some(t, function(i,v) return type(v) ~= 'string' end) --> true
-- </pre>
-- @see _.any
function _.some(list,criteria) end

--- Calls a method over each element in a collection of objects
-- @param method a method name passed as a string
-- @param list a collection of objects
-- @param ... a list of extra arguments to be passed to the invoked method.
-- @return the expected result of the call <tt> list[i]:method(...) </tt>
-- @usage <pre class='example'> 
-- -- A simple Window class <br/>
-- local Window = {width = 0, height = 0} <br/>
-- Window.__index = Window <br/>
-- --A constructor for window class <br/>
-- function Window:new() <br/>
--   return setmetatable({},self) <br/>
-- end <br/>
-- --A method for window class <br/>
-- function Window:resize(x,y) <br/>
--   self.x,self.y = x,y <br/>
-- end <br/>
-- --Creating a collection of window objects <br/>
-- local wins = {} <br/>
-- for i = 1,10 do wins[i] = Window:new() end <br/>
-- _.invoke('resize',wins,50,30) <br/>
-- end
-- </pre>
function _.invoke(method,list,...) end

--- Extracts a list made of a specific property values from a collection of object
-- @param list a collection of objects
-- @param key the key used for values extraction
-- @return an array of values
-- @usage <pre class='example'> 
-- local peoples = { <br/>
-- {name = 'John', age = 23}, <br/>
-- {name = 'Peter', age = 17}, <br/>
-- {name = 'Steve', age = 15}, <br/>
-- {age = 33},} <br/>
-- _.pluck(peoples,'name') --> {'John','Peter','Steve'} <br/>
-- _.pluck(peoples,'age') --> {23, 17,15,33}
-- </pre>
function _.pluck(list,key) end

--- Returns the maximum value found in an array.
-- @param list a collection of objects
-- @param extractCriterion a selection function prototyped as <tt>func(value)</tt>
-- @return a value
-- @return the key where the value was found
-- @usage <pre class='example'> 
-- local peoples = { <br/> 
-- {name = 'John', age = 23}, <br/>
-- {name = 'Peter', age = 17}, <br/>
-- {name = 'Steve', age = 15}, <br/>
-- {age = 33},} <br/>
-- _.max(_.pluck(peoples,'age')) --> 33, 4 <br/>
-- _.max(peoples,function(v) return v.age end) --> 33, 4
-- </pre>
-- @see _.min
function _.max(list,extractCriterion) end

--- Returns the minimum value found in an array.
-- @param list a collection of objects
-- @param extractCriterion a selection function prototyped as <tt>func(value)</tt>
-- @return a value
-- @return the key where the value was found
-- @usage <pre class='example'> 
-- local peoples = { <br/>
-- {name = 'John', age = 23}, <br/>
-- {name = 'Peter', age = 17}, <br/>
-- {name = 'Steve', age = 15}, <br/>
-- {age = 33},} <br/>
-- _.min(_.pluck(peoples,'age')) --> 15, 3 <br/>
-- _.min(peoples,function(v) return v.age end) --> 15, 3
-- </pre>
-- @see _.max
function _.min(list,extractCriterion) end

--- Shuffles a list
-- @param list a collection of objects
-- @param seed a seed value for randomization
-- @return an array
-- @usage <pre class='example'> 
-- _.shuffle({1,2,3,4,5,6,7,8,9,10}) --> {4,7,9,2,3,1,5,8,6,10} <br/>
-- _.shuffle({1,2,3,4,5,6,7,8,9,10}, os.time()) --> {10,9,4,8,6,3,5,2,7,1}
-- </pre>
function _.shuffle(list,seed) end

--- Sorts a list. Delegates to Lua's native <tt>table.sort</tt>
-- @param list a collection of objects or an iterator
-- @param comp a comparison function used for sorting, prototyped as <tt>func(a,b) </tt>
-- @return an array
-- @usage <pre class='example'> 
-- _.sort({10,50.5,3,4,12,6,7.33,-2.5,9,10}) --> {-2.5,3,4,6,7.33,9,10,10,12,50.5}
-- </pre>
function _.sort(list,comp) end

--- Returns the index at which a value should be inserted in a array regards to a given comparision method. The given will be sorted internally before processing
-- @param list an array of values
-- @param item the vaue to be inserted
-- @param comp a comparison function used for sorting, prototyped as <tt>func(a,b) </tt>
-- @return an index
-- @usage <pre class='example'> 
-- _.sortedIndex({5,7,9,13,15},8) --> 3 <br/>
-- _.sortedIndex({5,7,9,13,15},8,function(a,b) return a>b end) --> 4
-- </pre>
function _.sortedIndex(list,item,comp) end

--- Converts a list of values to an array
-- @param ... a list of single values
-- @return an array
-- @usage <pre class='example'> 
--_.to_array(1,5,10,8,12,8) -- {1,5,10,8,12,8}
-- </pre>
function _.to_array(...) end

--- Builds an array made of all returned values from a given iterator
-- @param iter an iteration function
-- @return an array
-- @usage <pre class='example'> 
--_.iter_to_array(('Programming In Lua'):gmatch('%w+')) --> {'Programming','In','Lua'}
-- </pre>
function _.iter_to_array(iter) end

--- Splits a collection into an array of subsets grouped by the result of processing through a pattern matching function
-- @param list a list of values
-- @param criteria a function prototyped as <tt>func(value)</tt> or a string reffering to the property used for grouping values
-- @return an array
-- @usage <pre class='example'> 
-- dic = {'a','ab','ac','b','ba','bc','c','ca','cb','abc','acb','bac','bca','cab','cba'} <br/>
-- _.groupBy(dic,function(i,v) return v:sub(1,1) end) --> { a = {'a','ab','ac','abc','acb'}, b = {'b','ba','bc','bac','bca'}, c = {'c','ca','cb','cab','cba'}}
-- </pre>
function _.groupBy(list,criteria) end

--- Returns the size of a list, counting the number of items inside. Useful when the given list contains values stored at non-numeric keys
-- @param list a list of values
-- @return a value
-- @usage <pre class='example'>
-- _.size({1,2,3}) --> 3 <br/>
-- _.size({x = 1,2,3}) --> 3
-- </pre>
function _.size(list) end
