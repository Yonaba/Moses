--------------------------------------------------------------------------
-- Set of utility functions for arrays
-- @author Roland Yonaba
-- @release $Id: Moses.lua,v1.0 08/02/2012 Roland_Yonaba$
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

--- Pushes values at the end of an array
-- @param array the given array
-- @param ... a list of values to be pushed at the end of the array
-- @return the array
-- @usage <pre class='example'> 
-- local t = {} <br/>
-- _.push(t,1,2,3,4,5) --> {1,2,3,4,5} 
-- </pre>
-- @see _.append
function _.push(array,...) end

--- Pushes values at the end of an array. Alias for <tt>_.push</tt>
-- @param array the given array
-- @param ... a list of values to be pushed at the end of the array
-- @return the array
-- @usage <pre class='example'> 
-- local t = {} <br/>
-- _.append(t,1,2,3,4,5) --> {1,2,3,4,5} 
-- </pre>
-- @see _.push
function _.append(array,...) end

--- Pops (removes and returns) the value at the top of an array
-- @param array the given array
-- @return the top-most value
-- @usage <pre class='example'> 
-- local t = {0,2,7,10} <br/>
-- repeat  <br/>
-- val = _.pop(t) <br/>
-- until not val
-- </pre>
function _.pop(array) end

-- Pops (removes and returns) the value at the end of an array
-- @param array the given array
-- @return the bottom-most value
-- @usage <pre class='example'> 
-- local t = {0,2,7,10} <br/>
-- repeat <br/>
-- val = _.unshift(t) <br/>
-- until not val
-- </pre>
function _.unshift(array) end

--- Removes values between start and finish indices in a given array
-- @param array the array
-- @param start an index. Defaults to 1 if not given
-- @param finish an index. Defaults to the array size if not given
-- @return an array
-- @usage <pre class='example'> 
-- local t = {1,2,3,4,5,6,7,8,9,10} <br/>
-- _.removeRange(t,3,5) --> {1,2,6,7,8,9,10}
-- </pre>
-- @see _.rmRange
function _.removeRange(array,start,finish) end

--- Removes values between start and finish indices in a given array. Alias for <tt>_.removeRange</tt>
-- @param array the array
-- @param start an index. Defaults to 1 if not given
-- @param finish an index. Defaults to the array size if not given
-- @return an array
-- @usage <pre class='example'> 
-- local t = {1,2,3,4,5,6,7,8,9,10} <br/>
-- _.rmRange(t,3,5) --> {1,2,6,7,8,9,10}
-- </pre>
-- @see _.removeRange
function _.rmRange(array,start,finish) end

--- Returns the portion of an array between left and right indexes
-- @param array the given array
-- @param left the left bound index. Defaults to 1 if not given.
-- @param right the right bound index. Defaults to to array size if not given.
-- @return an array of values bounded by given indexes
-- @usage <pre class='example'> 
-- local t = {2,7,10,'banana','yellow','string', 23,12} <br/>
-- _.slice(t) --> {2,7,10,'banana','yellow','string', 23,12} <br/>
-- _.slice(t,3) --> {10,'banana','yellow','string', 23,12} <br/>
-- _.slice(t,4,5) --> {'banana','yellow'}
-- </pre>
function _.slice(array,left,right) end

--- Returns the first n elements of an array
-- @param array the given array
-- @param n the first n elements to be returned. Defaults to 1 if not given.
-- @return an array of values
-- @usage <pre class='example'> 
-- local t = {2,7,10,'banana','yellow','string', 23,12} <br/>
-- _.first(t) --> {2} <br/>
-- _.first(t,4) --> {2,7,10,'banana'} <br/>
-- </pre>
-- @see _.head
function _.first(array,n) end

--- Returns the first n elements of an array. Alias for <tt>_.first.</tt>
-- @param array the given array
-- @param n the first n elements to be returned. Defaults to 1 if not given.
-- @return an array of values
-- @usage <pre class='example'> 
-- local t = {2,7,10,'banana','yellow','string', 23,12} <br/>
-- _.head(t) --> {2} <br/>
-- _.head(t,4) --> {2,7,10,'banana'} <br/>
-- </pre>
-- @see _.first
function _.head(array,n) end

--- Returns all array values except the last n elements.
-- @param array the given array
-- @param n the last n values to be ignored. Defaults to <em>array size minus 1</em> if not given.
-- @return an array of values
-- @usage <pre class='example'> 
-- local t = {0,2,7,10} <br/>
-- _.initial(t) --> {0,2,7} <br/>
-- _.initial(t,1) --> {0,2,7} <br/>
-- _.initial(t,2) --> {0,2} <br/>
-- _.initial(t,#t) --> {}
-- </pre>
function _.initial(array,n) end

--- Returns the last n elements of an array
-- @param array the given array
-- @param n the last n values to be returned. Defaults to 2 if not given.
-- @return an array of values
-- @usage <pre class='example'>
-- local t = {0,2,7,10}  <br/>
-- _.last(t) --> {2,7,10}  <br/>
-- _.last(t,2) --> {7,10}
-- </pre>
function _.last(array,n) end

--- Returns an array excluding all elements before index position
-- @param array the given array
-- @param index the initial index where to start. Defaults to 1 if not given.
-- @return an array of values
-- @usage <pre class='example'>
-- _.rest({0,2,7,10},3) --> {7,10}
-- </pre>
-- @see _.tail
function _.rest(array,index) end

--- Returns an array excluding all elements before index position. Alias for <tt>_.head</tt>
-- @param array the given array
-- @param index the initial index where to start. Defaults to 1 if not given.
-- @return an array of values
-- @usage <pre class='example'>
-- _.tail({0,2,7,10},3) --> {7,10}
-- </pre>
-- @see _.rest
function _.tail(array,index) end

--- Returns an array where all false or nil values were removed
-- @param array the given array
-- @return an array of values
-- @usage <pre class='example'>
-- _.compact({true, false, 5, 'a'}) --> {true, 5, 'a'}
-- </pre>
function _.compact(array) end

--- Flattens a nested array. The nesting can be to an infinite depth.
-- @param array the given array
-- @param shallow if true, flattening will be performed at the first level.
-- @return an array of values
-- @usage <pre class='example'>
-- _.flatten({1, 2, 3, {4}, {{5}},{{{6}}}}) --> {1,2,3,4,5,6}
-- </pre>
function _.flatten(array, shallow) end

--- Returns an array made of values from a given array not present in others arrays
-- @param array the given array
-- @param ... a list of arrays (they can contain any depth nested values)
-- @return an array of values
-- @usage <pre class='example'>
-- _.difference({10,20,30,40,50,60},{10,70}, {30,15,{40}}) --> {20, 50, 60}
-- </pre>
function _.difference(array,...) end

--- Returns duplicate-free version of a given array
-- @param array the given array
-- @param isSorted if the when array is already sorted, setting this to true will let the function use a much faster algorithm
-- @param iter a transformation function that can be mapped on each values of the array before processing. Should be prototyped as <tt>func(key,value,...)</tt>
-- @param ... a list of arguments to be passed to the transformation function <tt>func</tt>
-- @return an array of values
-- @usage <pre class='example'>
-- _.uniq({1,2,'a','b','a','c',2,3}) --> {1,2,'a','b','c',3}<br/>
-- _.uniq({1,2,2,2,3,5,5,8,9,9,10},true) --> {1,2,3,5,8,9,10}
-- </pre>
-- @see _.unique
function _.uniq(array,isSorted,iter,...) end

--- Returns duplicate-free version of a given array
-- @param array the given array
-- @param isSorted if the when array is already sorted, setting this to true will let the function use a much faster algorithm
-- @param iter a transformation function that can be mapped on each values of the array before processing. Should be prototyped as <tt>func(key,value,...)</tt>
-- @param ... a list of arguments to be passed to the transformation function <tt>func</tt>
-- @return an array of values
-- @usage <pre class='example'>
-- _.unique({1,2,'a','b','a','c',2,3}) --> {1,2,'a','b','c',3}<br/>
-- _.unique({1,2,2,2,3,5,5,8,9,9,10},true) --> {1,2,3,5,8,9,10}
-- </pre>
-- @see _.uniq
function _.unique(array,isSorted,iter,...) end

--- Returns an array made of values from a given array not present in a list of single values.
-- @param array the given array
-- @param ... a list of single values
-- @return an array of values
-- @usage <pre class='example'>
-- _.without({10,20,30,40,50,60},10,70,30,15,40) --> {20,50,60}
-- </pre>
function _.without(array,...) end

--- Returns the union of all given arrays
-- @param ... a list of arrays (they can contain any depth nested values)
-- @return an array of values
-- _.union({1,2},{3,{4}},{{5},{{6}}})--> {1,2,3,4,5,6}
-- </pre>
function _.union(...) end

--- Returns the intersection of all given arrays (each value of the result being present in all arrays)
-- @param array the given array
-- @param ... a list of arrays
-- @return an array of values
-- @usage <pre class='example'>
-- _.intersection({4,3,2},{10,3,8,3,7,4},{3,8,4,1}) --> {4,3}
-- </pre>
function _.intersection(array,...) end

--- Merges values from each of the given arrays with the values at the corresponding index.
-- @param ... a list of arrays
-- @return an array
-- @usage <pre class='example'>
-- names = {'Bob','Alice','James'} <br/>
-- ages = {22, 23, 24} <br/>
-- _.zip(names, ages) --> { {'Bob',22}, {'Alice',23}, {'James',24} }
-- </pre>
function _.zip(...) end

--- Returns an array of integers varying between start and stop values, regards to a given step
-- @param ... Up to three parameters can be given. If <em>one</em> value was given, will range from 0 to that value, stepping 1. If <em>two</em> values were given, will range from value 1 to value 2, stepping 1. If <em>three</em> values were given, will range from value 1 to value 2, stepping value 3 each time.
-- @return an array of integers
-- @usage <pre class='example'>
-- _.range(1,10) --> {1,2,3,4,5,6,7,8,9,10}  <br/>
-- _.range(5,-15,-3)  --> {5,2,-1,-4,-7,-10,-13}  <br/>
-- _.range(5)  --> {0,1,2,3,4,5}
-- </pre>
function _.range(...) end

--- Inverts an array, permuting keys with corresponding values.
-- @param array an array 
-- @return an array 
-- @usage <pre class='example'>
-- local t = {'a','b','c','d'} <br/>
-- _.invert(t) --> {a = 1, b = 2, c = 3, d = 4} 
-- </pre>
function _.invert(...) end
