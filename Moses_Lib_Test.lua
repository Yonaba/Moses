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

-- Load dependancies in the global environnement,
-- To be accessed by variables created with loadstring
_ = require 'Lib.Moses'

-- Internalization
local t_insert = table.insert
local loadstring = loadstring

-------------------------------------------------
-- Helpers for tests runnings

local snippets = {}
local topics = {}

-- Adds a new snippet
local function addSnippet(topic,snippet)
	t_insert(topics,topic)
	t_insert(snippets,snippet)
end

-- Resets snippets list
local function reset()
	snippets = {}
	topics = {}
end

-- Run all tests
local function run()
	_.each(snippets, function(i,snippet)
			print(i..'. Function name : '..topics[i])
			print('\nExample : \n\n'..snippet)
			print('\n--- Output : --- \n')
			loadstring(snippet)()
			print('\n')
		end)
end


-------------------------------------------------
-- Library defined-functions

print(' ==== Collection Functions ==== \n')


addSnippet('_.iterate (table)',
[[local t = {1, 2, x = 3, z = 4}
for i,v in _.iterate (t) do
   print(i,v)
end]])

addSnippet('_.each (list,func, ...)',
[[local t = {1, 2, 3, 4}
_.each(t, print)
_.each(t, function (key,value) print (value^2) end)
]])

addSnippet('_.map(list,func,...)',
[[local t = {1, 2, 3, 4}
t = _.map(t, function (key,value) return value^2 end)
_.each(t, print)
]])

addSnippet('_.reverse(array_list)',
[[local t = {1, 2, 3, 4}
t = _.reverse(t)
_.each(t, print)
]])

addSnippet('_.reduce(list,memo,func,...)',
[[local t = {1,2,3,4,5}
print(_.reduce(t, 1, function(state,value) return state*value end))
]])

addSnippet('_.reduceRight(list,memo,func,...)',
[[local t = {1,2,3,4,5}
print(_.reduceRight(t, 500, function(state,value) return state/value end))
]])

addSnippet('_.include(list,criteria)',
[[local t = {1,2,3,4,5}
print(_.include(t, 4))
print(_.include(t, function(value) return value%3==0 end))
print(_.include(t, function(value) return value>5 end))
]])

addSnippet('_.includeLast(list,criteria)',
[[local t = {1,2,3,4,5}
print(_.includeLast(t, 4))
print(_.includeLast(t, function(value) return value%3==0 end))
print(_.includeLast(t, function(value) return value>5 end))
]])

addSnippet('_.detect(list,criteria)',
[[local t = {5,3,8,2,0}
print(_.detect(t, 4))
print(_.detect(t, function(value) return value%3==0 end))
]])


addSnippet('_.detectLast(list,criteria)',
[[local t = {5,3,8,2,6}
print(_.detectLast(t, 2))
print(_.detectLast(t, function(value) return value%3==0 end))
]])

addSnippet('_.select(list,func,...)',
[[local t = {'Hello','Lua','Programming'}
local s = _.select(t, function(i,v) return v:len() > 3 end)
_.each(s,print)
]])

addSnippet('_.reject(list,func,...)',
[[local t = {'Hello','Lua','Programming'}
local s = _.reject(t, function(i,v) return v:len() <= 3 end)
_.each(s,print)
]])

addSnippet('_.all(list,criteria)',
[[local t = {'Hello','Lua','Programming'}
print(_.all(t, function(i,v) return type(v)=='string' end))
]])

addSnippet('_.any(list,criteria)',
[[local t = {'Hello','Lua','Programming', 4}
print(_.any(t, function(i,v) return type(v) ~= 'string' end))
]])

addSnippet('_.invoke(method,list,...)',
[[local Window = {width = 0, height = 0}
Window.__index = Window
function Window:new()
   return setmetatable({},self)
end

function Window:resize(x,y)
   self.x,self.y = x,y
end

local wins = {}
for i = 1,10 do wins[i] = Window:new() end
_.invoke('resize',wins,50,30)
_.each(wins,function(i,win) print(i,win.x,win.y) end)
]])

addSnippet('_.pluck(list,key)',
[[local peoples = {
{name = 'John', age = 23},
{name = 'Peter', age = 17},
{name = 'Steve', age = 15},
{age = 33},
}
local names = _.pluck(peoples,'name')
local ages = _.pluck(peoples,'age')
_.each(names,print)
_.each(ages,print)
]])


addSnippet('_.max(list,extractCriterion)',
[[local peoples = {
{name = 'John', age = 23},
{name = 'Peter', age = 17},
{name = 'Steve', age = 15},
{age = 33},
}
local oldest = _.max(_.pluck(peoples,'age'))
print(oldest)
oldest = _.max(peoples,function(v) return v.age end)
print(oldest)
]])

addSnippet('_.min(list,extractCriterion)',
[[local peoples = {
{name = 'John', age = 23},
{name = 'Peter', age = 17},
{name = 'Steve', age = 15},
{age = 33},
}
local oldest = _.min(_.pluck(peoples,'age'))
print(oldest)
oldest = _.min(peoples,function(v) return v.age end)
print(oldest)
]])

addSnippet('_.shuffle(list,seed)',
[[local t = {1,2,3,4,5,6,7,8,9,10}
print('Shuffles Without a seed')
_.each(_.shuffle(t),print)
print('Shuffles With a seed')
_.each(_.shuffle(t, os.time()),print)
]])


addSnippet('_.sort(list,comp)',
[[local t = {10,50.5,3,4,12,6,7.33,-2.5,9,10}
_.each(_.sort(t),print)
print('\n')
_.each(_.sort(t, function(a,b) return a>b end),print)
]])

addSnippet('_.sortedIndex(list,item,comp)',
[[local t = {5,7,9,13,15}
print(_.sortedIndex(t,8))
print(_.sortedIndex(t,8,function(a,b) return a>b end))
]])

addSnippet('_.to_array(...)',
[[local t = _.to_array(1,5,10,8,12,8)
_.each(t,print)
]])

addSnippet('_.iter_to_array(iter)',
[[local t = _.iter_to_array(('Programming In Lua'):gmatch('%w+'))
_.each(t,print)
]])

addSnippet('_.groupBy(list,criteria)',
[[local dic = {'a','ab','ac','b','ba','bc','c','ca','cb','abc','acb','bac','bca','cab','cba'}
local new_dic = _.groupBy(dic,function(i,v) return v:sub(1,1) end)
_.each(new_dic,function(i,v)
	print('key '..i)
	_.each(v,print)
end)]])

addSnippet('_.size(list)',
[[local t = {1,2,3}
print(_.size(t), #t)
t = {x = 1,2,3}
print(_.size(t), #t)
]])

run()
reset()
print(' ==== Array Functions ==== \n')

addSnippet('_.push(array,...)',
[[local t = {}
_.push(t,1,2,3,4,5)
_.each(t,print)
]])

addSnippet('_.pop(array)',
[[local t = {0,2,7,10}
   local val
   repeat
   val = _.pop(t)
   print(val)
   until not val
]])

addSnippet('_.unshift(array)',
[[local t = {0,2,7,10}
   local val
   repeat
   val = _.unshift(t)
   print(val)
   until not val
]])

addSnippet('_.slice(array,left,right)',
[[local t = {2,7,10,'banana','yellow','string', 23,12}
print('slicing from index 1 until end')
_.each(_.slice(t),print)
print('slicing from index 3 until end')
_.each(_.slice(t,3),print)
print('slicing from index 4 until index 5')
_.each(_.slice(t,4,5),print)
]])

addSnippet('_.first(array,n)',
[[local t = {2,7,10,'banana','yellow','string', 23,12}
print('Getting the first value')
_.each(_.first(t),print)
print('Getting the 4-first values')
_.each(_.first(t,4),print)
]])

addSnippet('_.initial(array,n)',
[[local t = {0,2,7,10}
print('Getting the head of the array')
_.each(_.initial(t),print)
print('Exluding the last element of the array')
_.each(_.initial(t,1),print)
print('Exluding the 2-last elements of the array')
_.each(_.initial(t,2),print)
print('Exluding all the elements of the array')
_.each(_.initial(t,#t),print)
]])

addSnippet('_.last(array,n)',
[[local t = {0,2,7,10}
print('Getting the last values of the array')
_.each(_.last(t),print)
print('Getting the last 3 values of the array')
_.each(_.last(t,3),print)
]])

addSnippet('_.rest(array,index)',
[[local t = {0,2,7,10}
print('Getting values after index 3')
_.each(_.rest(t,3),print)
]])

addSnippet('_.compact(array)',
[[local t = {true, false, 5==5, 'a'~='a'}
_.each(_.compact(t),print)
]])


addSnippet('_.flatten(array, shallow)',
[[local t = {1, 2, 3, {4}, {{5}},{{{6}}}}
print('Flattens the entire array')
_.each(_.flatten(t),print)
print('Flattens at the first level')
_.each(_.flatten(t,true),print)
]])

addSnippet('_.difference(array,...)',
[[local t = {10,20,30,40,50,60}
_.each(_.difference(t,{10,70}, {30,15,{40}}),print)
]])

addSnippet('_.uniq(array,isSorted,iter,...)',
[[print('An array of random values')
local t = {1,2,'a','b','a','c',2,3}
_.each(_.unique(t),print)
print('An array of sorted values')
t = {1,2,2,2,3,5,5,8,9,9,10}
_.each(_.unique(t,true),print)
]])


addSnippet('_.without(array,...)',
[[local t = {10,20,30,40,50,60}
_.each(_.without(t,10,70,30,15,40),print)
]])

addSnippet('_.union(...)',
[[_.each(_.union({1,2},{3,{4}},{{5},{{6}}}),print)]])

addSnippet('_.intersection(array,...)',
[[local t1 = {4,3,2}
local t2 = {10,3,8,3,7,4}
local t3 = {3,8,4,1}
_.each(_.intersection(t1,t2,t3),print)
]])

addSnippet('_.zip(...)',
[[local names = {'Bob','Alice','James'}
local IDs = {100,200,300}
local ages = {22, 23, 24}
_.each(_.zip(names,IDs, ages),function(i,v)
   print('Key '..i)
   _.each(v,print)
   end)
]])

addSnippet('_.range(...)',
[[
print('Range from 1 to 10, default step 1')
_.each(_.range(1,10),print)
print('Range from 5 to -15,step -3')
_.each(_.range(5,-15,-3),print)
print('Range from 0 to 5,step 1')
_.each(_.range(5),print)
]])


run()
reset()
print(' ==== Functions ==== \n')

addSnippet('_.findValue(t,v)',
[[local t = { 'a', 'b', 3, '4'}
print(_.findValue(t,4))
print(_.findValue(t,'3'))
print(_.findValue(t,'b'))
print(_.findValue(t,3))
]])

addSnippet('_.once(f)',
[[local function say(str)
   print(str)
end

say = _.once(say)

say('hello!')
say('hi!')
say('howdy!')
]])

addSnippet('_.memoize(f,hash)',
[[
local function cosi(n)
   if n == 0 then return math.cos(0) end
   return math.cos(n) + cosi(n-1)
end
local st_time = os.time()
for i = 1,7500 do cosi(i) end
local end_time = os.time()
print(('original function took %d secs'):format(end_time-st_time))

cosi = _.memoize(cosi)
local st_time = os.time()
for i = 1,7500 do cosi(i) end
local end_time = os.time()
print(('Memoized function took %d secs'):format(end_time-st_time))
]])

addSnippet('_.after(f,count)',
[[local function say(str)
   print(str)
end

say = _.after(say,3)

say('hello!')
say('hi!')
say('howdy!')
say('heya!')
say('yeah!')
]])

addSnippet('_.compose(...)',
[[local function f(x) return x^2 end
local function g(x) return x+1 end
local function h(x) return x/2 end
local compositae = _.compose(f,g,h)
print(compositae(10))
print(compositae(20))
]])

addSnippet('_.wrap(func,wrapper)',
[[local function introduce(name) return 'My name is '..name end
local jibjab = _.wrap(introduce, function(f,somebody,interlocutor)
   return 'I am '..somebody..', and you ?\n'..f(interlocutor)..'\nOh, nice to meet you!'
end)
print(jibjab('Ronald','John'))
]])

addSnippet('_.times(n,iterator)',
[[_.times(5,print)]])

run()
reset()
print(' ==== Object Functions ==== \n')

addSnippet('_.keys(obj)',
[[local vector = {x = 0, y = 5}
_.each(_.keys(vector),print)
]])

addSnippet('_.values(obj)',
[[local vector = {x = 0, y = 5}
_.each(_.values(vector),print)
]])

addSnippet('_.functions(obj)',
[[print('Getting all library-defined functions')
_.each(_.functions(),print)
]])

addSnippet('_.clone(obj)',
[[local t = {1, 2, {3}}
local t_clone = _.clone(t)
t_clone[3][1] = 'banana'
print('Values of t')
_.each(_.flatten(t),print)
print('Values of t_clone')
_.each(_.flatten(t_clone),print)
]])

addSnippet('_.isEqual(objA,objB)',
[[print(_.isEqual({1,2,{3,{4,5}}},{1,2,{3,{4,5}}}))]])

addSnippet('_.result(obj,property,...)',
[[local vector = {x = 0, y = 0}
function vector:move(dx,dy) self.x,self.y = self.x+dx,self.y+dy end
_.result(vector,'move',5,10)
print('vector: x '..vector.x,'y '..vector.y)
]])

run()
reset()
print(' ==== End of tests ==== \n')

