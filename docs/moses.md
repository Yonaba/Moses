
# Moses: an utility-belt library for Lua

__Moses__ is a Lua utility library which provides support for functional programming. 
It extends built-in Lua functions, making easier operations on arrays, lists, collections, objects, and a lot more.<br/>
__Moses__ was deeply inspired by [Underscore.js](http://documentcloud.github.com/underscore/). 

## Requiring Moses

```lua
-- Minimal code
local _ = require ("moses")
````

## Collection functions samples

### each

Prints a flat array contents:

```lua
_.each({1,2,3},print)

-- => 1 1
-- => 1 2
-- => 1 3
````

Iterates over non numeric keys:

```lua
_.each({one = 1, two = 2, three = 3},print)

-- => one 1
-- => two 2
-- => three 3
````

Can reference an outer table or the passed-in table:

```lua
t = {'a','b','c'}
_.each(t,function(i,v)
  t[i] = v:rep(2)
  print(t[i])
end)

-- => 1 aa
-- => 2 bb
-- => 3 cc
````


### map

Executes a function on each key-value pairs:

```lua
local v = _.map({1,2,3},function(i,v) 
  return v+10 
end))
_.each(v,print)

-- => 1 11
-- => 2 12
-- => 3 13
````

```lua
local v = _.map({a = 1, b = 2},function(k,v) 
  return k..v 
end
_.each(v,print)

-- => a a1	
-- => b b2
````

### reduce

Sums all values:

```lua
local r = _.reduce({1,2,3,4},function(memo,v)
  return memo+v 
end)
print(r)

-- => 10
````

Concatenates all values:

```lua	
local r = _.reduce({'a','b','c','d'},function(memo,v) 
  return memo..v 
end)
print(r)	

-- => abcd
````

### reduceRight

Reduces from right to left:

```lua
local initial_state = 256
local r = _.reduceRight({1,2,4,16},function(memo,v) 
  return memo/v 
end,initial_state)
print(r)

-- => 2
````

### mapReduce

Reduces while saving intermediate states:

```lua
local v = _.mapReduce({'a','b','c'},function(memo,v) 
  return memo..v 
end)
_.each(v,print)

-- => 1 a	
-- => 2 ab
-- => 3 abc
````

### mapReduceRight

Reduces from right to left, while saving intermediate states:

```lua
local v = _.mapReduceRight({'a','b','c'},function(memo,v) 
  return memo..v 
end)
_.each(v,print)
	
-- => 1 "c"
-- => 2 "cb"
-- => 3 "cba"
````

### include

Looks for a value in a collection:

```lua
print(_.include({6,8,10,16,29},16))
_.include({6,8,10,16,29},1)

-- => true
-- => false

local complex_table = {18,{2,{3}}}
local collection = {6,{18,{2,6}},10,{18,{2,{3}}},29}
print(_.include(collection, complex_table)

-- => true
````

Handles iterator functions:

```lua
local functions isUpper(v)
  return v:upper()==v
end
print(_.include({'a','B','c'},isUpper))

-- => true
````

### detect

Returns a value key in a collection:

```lua
print(_.detect({6,8,10,16},8))
print(_.detect({nil,true,0,true,true},false))

-- => 2
-- => nil

local complex_table = {18,{2,6}}
local collection = {6,{18,{2,6}},10,{18,{2,{3}}},29}
print(_.detect(collection, complex_table)

-- => 2
````

Handles iterator functions:

```lua
local functions isUpper(v)
  return v:upper()==v
end
print(_.detect({'a','B','c'},isUpper))

-- => 2
````

### select

Collect values passing a truth test:

```lua
local even = _.select({1,2,3,4,5,6,7}, function(key,value) 
  return (value%2==0)
end)
_.each(even, print)		

-- => 1 2
-- => 2 4
-- => 3 6

local odd = _.select({1,2,3,4,5,6,7}, function(key,value) 
  return (value%2~=0)
end)
_.each(odd, print)	

-- => 1 1
-- => 2 3
-- => 3 5
-- => 4 7
````

### reject

Trims out values failing a truth test:

```lua
local odd = _.reject({1,2,3,4,5,6,7}, function(key,value) 
  return (value%2==0)
end)
_.each(odd, print)		

-- => 1 1
-- => 2 3
-- => 3 5
-- => 4 7

local even = _.reject({1,2,3,4,5,6,7}, function(key,value) 
  return (value%2~=0)
end)

-- => 1 2
-- => 2 4
-- => 3 6
````

### all

Returns whether all elements pass a truth test:

```lua
print(_.all({2,4,6}, function(key,value) 
          return (value%2==0)
        end))

-- => true
````

### invoke

Invokes a given function on each object in a collection:

```lua
local results = _.invoke({'a','bea','cdhza'},string.len)
_.each(results, print)

-- => 1 1
-- => 1 3
-- => 1 5
````

Can reference the method of the same name in each object:

```lua
local a = {}
function a:call() return 'a' end
local b, c, d = {}, {}, {}
b.call, c.call, d.call = a.call, a.call, a.call

local results = _.invoke({a,b,c,d},'call')
_.each(results, print)

-- => 1 a
-- => 2 a
-- => 3 a
-- => 4 a
````

### pluck

Fetches values that a specific property takes in a collection of objects:

```lua
local peoples = {
  {name = 'John', age = 23},{name = 'Peter', age = 17},
  {name = 'Steve', age = 15},{age = 33}}

local ages = _.pluck(peoples,'age')
_.each(ages,print)
 
-- => 1 23
-- => 2 17
-- => 3 15
-- => 4 33

local names = _.pluck(peoples,'name')
_.each(names,print)
 
-- => 1 John
-- => 2 Peter
-- => 3 Steve
````

### max

Returns the maximum in a collection:

```lua
print(_.max {1,2,3})
print(_.max {'a','b','c'})

-- => 3
-- => 'c'
````

Can handle an iterator function to extract a specific property:

```lua
local peoples = {
  {name = 'John', age = 23},{name = 'Peter', age = 17},
  {name = 'Steve', age = 15},{age = 33}}
print(_.max(peoples,function(people) return people.age end))

-- => 33
````

### min

Returns the minimum in a collection:

```lua
print(_.min {1,2,3})
print(_.min {'a','b','c'})

-- => 1
-- => 'a'
````

Can handle an iterator function to extract a specific property:

```lua
local peoples = {
  {name = 'John', age = 23},{name = 'Peter', age = 17},
  {name = 'Steve', age = 15},{age = 33}}
print(_.min(peoples,function(people) return people.age end))

-- => 15
````

## Array functions

## Utility functions

## Object functions