--------------------------------------------------------------------------
-- Set of utility functions for objects
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

--- Returns a list of properties name packed into an object
-- @param obj an object
-- @return an array
-- @usage <pre class='example'> 
-- local vector = {x = 0, y = 5} <br/>
-- _.keys(vector) --> {'x','y'}
-- </pre>
function _.keys(obj) end

--- Returns a list of properties values packed into an object
-- @param obj an object
-- @return an array
-- @usage <pre class='example'> 
-- local vector = {x = 0, y = 5} <br/>
-- _.values(vector) --> {0,5}
-- </pre>
function _.values(obj) end

--- Returns a sorted list of method names (function properties) in an object
-- @param obj an object. Defaults to Moses library functions if not given
-- @return an array
-- @usage <pre class='example'> 
-- _.functions() --> {'after','all','any','clone','collect','compact','compose','contains','detect','detectLast',...}
-- </pre>
-- @see _.methods
function _.functions(obj) end

--- Returns a sorted list of method names (function properties) in an object. Alias for <tt>_.functions</tt>
-- @param obj an object. Defaults to Moses library functions if not given
-- @return an array
-- @usage <pre class='example'> 
-- _.methods() --> {'after','all','any','clone','collect','compact','compose','contains','detect','detectLast',...}
-- </pre>
-- @see _.functions
function _.methods(obj) end

--- Clones an object. This function features recursion.
-- @param obj an object
-- @return an object
-- @usage <pre class='example'> 
-- local t = {1, 2, {3}} <br/>
-- local t_clone = _.clone(t) <br/>
-- t[3][1] = 'banana' <br/>
-- t_clone[3][1] --> 3
-- </pre>
function _.clone(obj) end

--- Tests equality between two given objects. Uses Lua's native <strong>==</strong> operator. Features recursion.
-- @param objA an object
-- @param objB another object
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isEqual({1,2,{3,{4,5}}},{1,2,{3,{4,5}}}) --> true
-- </pre>
function _.isEqual(objA,objB) end

--- Invokes an object's method with custom arguments
-- @param obj an object
-- @param property a method name to be called, passed as a string
-- @param ... a list of extra arguments to be passed to the property being called
-- @return the expected result from the call <tt>obj:property(...)</tt>
-- @usage <pre class='example'> 
-- local vector = {x = 0, y = 0} <br/>
-- function vector:move(dx,dy) <br/>
-- self.x,self.y = self.x+dx,self.y+dy <br/>
-- end <br/>
-- _.result(vector,'move',5,10) --> vector { x = 5, y = 10 }
-- </pre>
function _.result(obj,property,...) end

--- Transforms a table and makes it look like a given template
-- @param obj an object
-- @param template a given template
-- @return a table</tt>
-- @usage <pre class='example'>
-- local templateVector = {x = 0, y = 0} <br/>
-- local particle = {velocity = 10, mass = 1} <br/>
-- _.template(particle,templateVector) --> {velocity = 10, mass = 1, x = 0, y = 0}
-- </pre>
function _.template(obj,template) end