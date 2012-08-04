--------------------------------------------------------------------------
-- Set of utility functions
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

--- Returns the key at which a given value is stored inside a table
-- @param t a table
-- @param v a value to find inside table <tt>t</tt>
-- @return a key value
-- @usage <pre class='example'> 
--local t = { 'a', 'b', 3, '4'} <br/>
-- _.findValue(t,4)) --> nil <br/>
-- _.findValue(t,'3')) --> nil <br/>
-- _.findValue(t,'b')) --> 2 <br/>
-- _.findValue(t,3)) --> 3
-- </pre>
function _.findValue(t,v) end

--- Returns a version of function f that can be run only once. Repeated calls will have no effects, countinuously yielding the original call result. Can be used for initializing tasks.
-- @param f a function
-- @return a function
-- @usage <pre class='example'> 
-- local function say(str) return (str) end <br/>
-- say = _.once(say) <br/>
-- say('hello!') --> 'hello!' <br/>
-- say('hi!') --> 'hello!' <br/>
-- say('howdy!') --> 'hello!'
-- </pre>
function _.once(f) end

--- Returns a memoized version of function f. Can be used to speed up slow-running functions. 
-- @param f a function
-- @param hash a function used to compute hash keys to store results if the original function uses more than one argument.
-- @return a function
-- @usage <pre class='example'> 
-- local function fibo(n) return n<2 and n or fibo(n-1) + fibo(n-2) end <br/>
-- fibo_memoized = _.memoize(fibo) <br/>
-- print(fibo(1000)) --> Takes a very long time! <br/>
-- print(fibo_memoized(1000)) --> A lot faster!
-- </pre>
function _.memoize(f,hash) end

--- Returns a version of function f that will run only after being called <em>count minus 1</em> times. Will answer at the count-th call. Useful when dealing with asynchronous tasks.
-- @param f a function
-- @return a function
-- @usage <pre class='example'> 
-- local function say(str) return (str) end <br/>
-- say = _.after(say,3) <br/>
-- say('hello!') --> nil <br/>
-- say('hi!')  --> nil <br/>
-- say('howdy!')  --> 'howdy!' <br/>
-- say('heya!')  --> 'heya!' <br/>
-- say('yeah!')  --> 'yeah!'
-- </pre>
function _.after(f,count) end

--- Returns the composition of given functions, where each function is feeded with the returned value of the following functions, in reverse order.
-- @param ... a list of functions
-- @return the result expected from the first function given in the list of arguments
-- @usage <pre class='example'> 
-- local function f(x) return x^2 end <br/>
-- local function g(x) return x+1 end <br/>
-- local function h(x) return x/2 end <br/>
-- local compositae = _.compose(f,g,h) <br/>
-- compositae(10) --> f(g(h(10))) --> 36 <br/>
-- compositae(20) --> f(g(h(20))) --> 121
-- </pre>
function _.compose(...) end

--- Wraps a function inside a provided wrapper, passing this function as a first argument to the wrapper
-- @param func a function
-- @param wrapper a wrapping function
-- @return a function
-- @usage <pre class='example'> 
-- local function introduce(name) return 'My name is '..name end <br/>
-- local jibjab = _.wrap(introduce, function(f,somebody,interlocutor) <br/>
--    return 'I am '..somebody..', and you ?\n'..f(interlocutor)..'\nOh, nice to meet you!' <br/>
-- end) <br/>
-- jibjab('Ronald','John') <br/>
-- => I am Ronald, and you ? <br/>
-- => My name is John <br/>
-- => Oh, nice to meet you! <br/>
-- </pre>
function _.wrap(func,wrapper) end

--- Curries a given function. The resulting function will always use the provided argument as its first argument each call.
-- @param f a function
-- @param args an argument
-- @return a function
-- @usage <pre class='example'> 
-- local function say(str) print(str) end <br/>
-- local _say = _.curry(say,1) <br/>
-- _say(2,3,4) --> 1
-- </pre>
function _.curry(f,args) end

--- Calls an iterator n times, passing it each call an integer value growing from 1 to n
-- @param n the number of calls
-- @param iterator an iterator or a function
-- @return the expected result of the call <tt>iterator(i)</tt> each call
-- @usage <pre class='example'> 
-- _.times(5,print) <br/>
-- ==> 1 <br/> 
-- ==> 2 <br/>
-- ==> 3 <br/>
-- ==> 4 <br/>
-- ==> 5 <br/>
-- </pre>
function _.times(n,iterator) end

--- Binds value <tt>v</tt> to the first argument of a given function
-- @param func a function
-- @param v a value to b the first argument of the given function
-- @return a function
-- @usage <pre class='example'> 
-- local sqrt2 = _.bind(math.sqrt,2) <br/>
-- sqrt2() --> 1.4142135623731
-- </pre>
function _.bind(func,v) end

--- Links Lua's native table library with Moses functions
-- @return nothing
-- @usage <pre class='example'> 
-- _.import() <br/>
-- local t = table.shuffle({1,2,3,4,5}) --> {4,3,5,1,2}<br/>
-- </pre>
function _.import() end


