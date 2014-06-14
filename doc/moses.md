# Moses: an utility-belt library for Lua

__Moses__ is a Lua utility library which provides support for functional programming. 
It complements built-in Lua functions, making easier operations on arrays, lists, collections, objects, and a lot more.<br/>
__Moses__ was deeply inspired by [Underscore.js](http://documentcloud.github.com/underscore/). 

## Requiring Moses

```lua
-- Minimal code
local _ = require ("moses")
````

In case a variable named `MOSES_ALIASES` set to `true` was found in the global environment, library functions aliases will also be available.

```lua
local _ = require ("moses")
print(_.each)
print(_.forEach)

-- => function: 00309410
-- => nil
````

```lua
_G.MOSES_ALIASES = true -- Setting this global on purpose
local _ = require ("moses")
print(_.each)
print(_.forEach)

-- => function: 00309410
-- => function: 00309410
````

## Collection functions samples

### each

Prints a flat array contents:

```lua
_.each({1,2,3},print)

-- => 1 1
-- => 2 2
-- => 3 3
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

### eachi

Iterates only on integer keys in a sparse array or map-like table:

```lua
_.eachi({1,2,3},print)

-- => 1 1
-- => 2 2
-- => 3 3
````

```lua
local t = {a = 1, b = 2, [0] = 1, [-1] = 6, 3, x = 4, 5}
_.eachi(t,function(i,v)
	print(i,v)
end)

-- => -1 6
-- => 0	1
-- => 1	3
-- => 2	5
````

### count

Counts the occurences of value in a given list

```lua
print(_.count({1,1,2,3,3,3,2,4,3,2},1))
print(_.count({1,1,2,3,3,3,2,4,3,2},2))
print(_.count({1,1,2,3,3,3,2,4,3,2},3))
print(_.count({false, false, true},false))
print(_.count({false, false, true},true))

-- => 2
-- => 2
-- => 4
-- => 2
-- => 1
````

Returns the size of the list in case value is not provided.

```lua
print(_.count({1,1,2,3,3}))

-- => 5
````

### countf

Count the occurences of values passing an iterator test

```lua
print(_.countf({1,2,3,4,5,6}, function(i,v)
	return v%2==0
end))

-- => 3

print(_.countf({print, pairs, os, assert, ipairs}, function(i,v)
	return type(v)=='function'
end))	

-- => 4
````

### cycle

Returns an iterator function which loops on each key-pairs of a given collection and restarts looping again `n` times.
If `n` is not provided, loops forever.

```lua
local t = {'a,'b','c'}
for k,v in _.cycle(t, 2) do
	print(k,v)
end

-- => 1 'a'
-- => 2 'b'
-- => 3 'c'
-- => 1 'a'
-- => 2 'b'
-- => 3 'c'
````

Supports array-like tables and map-like tables:

```lua
local t = {x = 1, y = 2, z = 3}
for k,v in _.cycle(t) do
	print(k,v)
end

-- => y	2
-- => x	1
-- => z	3
-- => y	2
-- => x	1
-- => z	3
-- => ...
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

### contains

Returns true if the passed-in value was found in a given list

```lua
print(_.contains({6,8,10,16},8))

-- => true

print(_.contains({nil,true,0,true,true},false))

-- => false
````

It can lookup for objects, and accepts iterator functions aswell:

```lua
print(_.contains({6,{18,{2,6}},10,{18,{2,{3}}},29},{18,{2,6}}))

-- => true

print(_.contains({'a','B','c'}, function(array_value)
	return (array_value:upper() == array_value)
end))

-- => true
````	

### findWhere

Looks through a list and returns the first value that matches all of the key-value pairs listed in properties. 

```lua
local a = {a = 1, b = 2, c = 3}
local b = {a = 2, b = 3, d = 4}
local c = {a = 3, b = 4, e = 5}
print(_.findWhere({a, b, c}, {a = 3, b = 4}) == c)

-- => true
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

### shuffle

Shuffles a collection:

```lua
local list = _.shuffle {1,2,3,4,5,6}
_.each(list,print)

-- => 1 3
-- => 2 2
-- => 3 6
-- => 4 4
-- => 5 1
-- => 6 5
````

### same

Tests whether all objects in each of the passed-in tables exists in both:

```lua
local a = {'a','b','c','d'}      
local b = {'b','a','d','c'}
print(_.same(a,b))

-- => true

b[#b+1] = 'e'
print(_.same(a,b))

-- => false
````

### sort

Sorts a collection:

```lua
local chars = _.sort({'b','a','d','c'})
_.each(chars,print)

-- => 1 'a'
-- => 2 'b'
-- => 3 'c'
-- => 4 'd'
````

Handles custom comparison functions:

```lua
local chars = _.sort({'b','a','d','c'}, function(a,b) 
  return a:byte() > b:byte() 
end)

-- => 1 'd'
-- => 2 'c'
-- => 3 'b'
-- => 4 'a'
````

#### toArray

Folds all passed-in args in an array:

```lua
local array = _.toArray(1,2,8,'d','a',0)
_.each(array,print)

-- => 1 1
-- => 2 2
-- => 3 8
-- => 4 'd'
-- => 5 'a'
-- => 6 0
````

### groupBy

Groups values in a collection according to how they behave with respect to a given predicate:

```lua
local set = _.groupBy({0,1,2,3,4,5,6},function(i,value) 
  return value%2==0 and 'even' or 'odd'
end)
_.each(set, function(k,v)
  print('Subset',k)
  _.each(v,print)
end)

-- => Subset odd
-- => 1	1
-- => 2	3
-- => 3	5
-- => Subset even
-- => 1	0
-- => 2	2
-- => 3	4
-- => 4	6

local set = _.groupBy({0,'a',true, false,nil,b,0.5},function(i,value) 
  return type(value) 
end)
_.each(set, function(k,v)
  print('Subset',k)
  _.each(v,print)
end)

-- => Subset number
-- => 1	0
-- => 2	0.5
-- => Subset string
-- => 1	a
-- => Subset boolean
-- => 1	true
-- => 2	false		
````

### countBy

Splits a collection in subsets and provide the count for each subset:

```lua
local set = _.countBy({0,1,2,3,4,5,6},function(i,value) 
  return value%2==0 and 'even' or 'odd'
end)
_.each(set,print)

-- => odd 3
-- => even 4
````

### size

Provide the count for the very number of items in a collection:

```lua
print(_.size {1,2,3})
print(_.size {one = 1, two = 2})

-- => 3
-- => 2
````

Counts the number of its arguments:

```lua
print(_.size(1,2,3))
print(_.size('a','b',{}, function() end))

-- => 3
-- => 4
````

### containsKeys

Checks whether a table has all the keys existing in another table:

```lua
print(_.contains({1,2,3,4},{1,2,3}))
print(_.contains({1,2,'d','b'},{1,2,3,5}))
print(_.contains({x = 1, y = 2, z = 3},{x = 1, y = 2}))

-- => true
-- => true
-- => true
````

### sameKeys

Checks whether both tables features the same keys:

```lua
print(_.sameKeys({1,2,3,4},{1,2,3}))
print(_.sameKeys({1,2,'d','b'},{1,2,3,5}))
print(_.sameKeys({x = 1, y = 2, z = 3},{x = 1, y = 2}))

-- => false
-- => true
-- => false
````

## Array functions

### reverse

Reverses an array:

```lua
local array = _.reverse({1,2,3,'d'})
_.each(array,print)

-- => 1 'd'
-- => 2 3
-- => 3 2
-- => 4 1
````

### selectWhile

Collects values as long as they pass a given test. Breaks on the first falsy test:

```lua
local selected = _.selectWhile({2,4,5,8}, function(i,v)
  return v%2==0
end)
_.each(selected,print)

-- => 1 2
-- => 2 4
````

### dropWhile

Trims out values as long as they pass a given test. Breaks on the first truthy test:

```lua
local selected = _.dropWhile({2,4,5,8}, function(i,v)
  return v%2==0
end)
_.each(selected,print)

-- => 1 5
-- => 2 8
````

### sortedIndex

Returns the index at which a value should be inserted to preserve order:

```lua
local index = _.sortedIndex({1,2,3},4)
print(index)

-- => 4
````

Handles custom comparison functions:

```lua
local comp = function(a,b) return a<b end
local index = _.sortedIndex({-5,0,4,4},3,comp)
print(index)
	  
-- => 3
````

### indexOf

Returns the index of a value in an array:

```lua
local index = _.indexOf({1,2,3},2),
print(index)

-- => 2
````

### lastIndexOf

Returns the index of the last occurence of a given value in an array:

```lua
local index = _.lastIndexOf({1,2,2,3},2),
print(index)

-- => 3
````

### add

Adds given values at the top of an array:

```lua
local array = {1}
_.add(array,1,2,3,4)
_.each(array,print)

-- => 1 4
-- => 2 3
-- => 3 2
-- => 4 1
-- => 5 1
````

### push

Adds given values at the end of an array:

```lua
local array = {1}
_.push(array,1,2,3,4)
_.each(array,print)

-- => 1 1
-- => 2 1
-- => 3 2
-- => 4 3
-- => 5 4
````

### pop

Removes and returns the first value in an array:

```lua
local array = {1,2,3}
print(_.pop(array))

-- => 1

_.each(array,print)

-- => 1 2
-- => 2 3
````

### unshift

Removes and returns the last value in an array:

```lua
local array = {1,2,3}
print(_.unshift(array))

-- => 3

_.each(array,print)

-- => 1 1
-- => 2 2
````

### removeRange

Trims out all values index within a range:

```lua
local array = {1,2,3,4,5,6,7,8,9}
array = _.removeRange(array, 3,8)
_.each(array,print)

-- => 1 1
-- => 2 2
-- => 3 9
````

### chunk

Iterates over an array chunking together. Values are chunked on the basis of the return
value of `f(key,value,...)`. Consecutive elements which return the same value are chunked together.

```lua
local t = {1,1,2,3,3,4}
local v = _.chunk(t, function(k,v) return v%2==0 end)
_.each(v,function(k,v)
	print('table',k)
	_.each(v,print)
end)

-- => table	1
-- => 1	1
-- => 2	1
-- => table	2
-- => 1	2
-- => table	3
-- => 1 3
-- => 2	3
-- => table	4
-- => 1	4
````

### slice

Slices and returns a part of an array:

```lua
local array = {1,2,3,4,5,6,7,8,9}
array = _.slice(array, 3,6)
_.each(array,print)

-- => 1 3
-- => 2 4
-- => 3 5
-- => 4 6
````

### first

Returns the first N elements in an array:

```lua
local array = {1,2,3,4,5,6,7,8,9}
array = _.first(array,3)
_.each(array,print)

-- => 1 1
-- => 2 2
-- => 3 3
````

### initial

Excludes the last N elements in an array:

```lua
local array = {1,2,3,4,5,6,7,8,9}
array = _.initial(array,5)
_.each(array,print)

-- => 1 1
-- => 2 2
-- => 3 3
-- => 4 4
````

### last

Returns the last N elements in an array:

```lua
local array = {1,2,3,4,5,6,7,8,9}
array = _.last(array,3)
_.each(array,print)

-- => 1 7
-- => 2 8
-- => 3 9
````

### rest

Trims out all values indexed before <tt>index</tt>:

```lua
local array = {1,2,3,4,5,6,7,8,9}
array = _.rest(array,6)
_.each(array,print)

-- => 1 6
-- => 2 7
-- => 3 8
-- => 4 9
````

### compact

Trims out all falsy values:

```lua
local array = _.compact {a,'aa',false,'bb',true}
_.each(array,print)

-- => 1 aa
-- => 2 bb
-- => 3 true
````

### flatten

Flattens a nested array:

```lua
local array = _.flatten({1,{2,3},{4,5,{6,7}}})
_.each(array,print)

-- => 1 1
-- => 2 2
-- => 3 3
-- => 4 4
-- => 5 5
-- => 6 6
-- => 7 7
````

### difference

Returns values in the given array not present in a second array.

```lua
local array = {1,2,'a',4,5}
array = _.difference(array,{1,'a'})
_.each(array,print)

-- => 1 2
-- => 2 4
-- => 3 5
````

### symmetric_difference

Returns values in the first array not present in the second and also values in the second array not present in the first one:

```lua
local array = {1,2,3}
local array2 = {1,4,5}
_.each(_.symmetric_difference(array, array2),print)

-- => 1 2
-- => 2 3
-- => 3 4
-- => 4 5
````

### uniq

Produces duplicate-free arrays:

```lua
local array = _.uniq({1,1,2,2,3,3,4,4,4,5}
_.each(array,print)

-- => 1 1
-- => 2 2
-- => 3 3
-- => 4 4
-- => 5 5
````

### union

Produces a duplicate-free union of all passed-in arrays:

```lua
local A = {'a'}
local B = {'a',1,2,3}
local C = {2,10}
local array = _.union(A,B,C)
_.each(array,print)

-- => 1 'a'
-- => 2 1
-- => 3 2
-- => 4 3
-- => 5 10
````

### intersection

Returns the intersection (common-part) of all passed-in arrays:

```lua
local A = {'a'}
local B = {'a',1,2,3}
local C = {2,10,1,'a'}
local array = _.intersection(A,B,C)
_.each(array,print)

-- => 1 a
-- => 2 2
-- => 3 1
````

### zip

Zips values from different arrays, on the basis on their common keys:

```lua
local names = {'Bob','Alice','James'}
local ages = {22, 23}
local array = _.zip(names,ages)
_.each(array,function(k,v)
  print('subset',k)
  _.each(v,print)
end)

-- => subset 1
-- => 1	Bob
-- => 2	22
-- => subset 2
-- => 1	Alice
-- => 2	23
-- => subset 3
-- => 1	James
````

### append

Appends two arrays:

```lua
local array = _.append({1,2,3},{'a','b'})
_.each(array,print)

-- => 1 1
-- => 2 2
-- => 2	3
-- => 4 a
-- => 5 b
````

### range

Generates arithmetic progressions:

```lua
_.each(_.range(1,4),print)

-- => 1 1
-- => 2 2
-- => 2	3
-- => 4 4

_.each(_.range(3),print)

-- => 1 0
-- => 2 1
-- => 2	2
-- => 4 3

_.each(_.range(0,2,0.7),print)

-- => 1 0
-- => 2 0.7
-- => 3 1.4
````

### invert

Switches <tt>key-value</tt> pairs:

```lua
_.each(_.invert {'a','b','c'},print)

-- => a 1
-- => b 2
-- => c	3
````

### concat

Concatenates a given array values:

```lua
print(_.concat({'a',1,0,1,'b'}))

-- => a101b
````

## Utility functions

### identity

Returns the value passed. <br/>
This function is used internally as a default iterator.

```lua
print(_.identity(1))
print(_.identity(false))
print(_.identity('hello!'))

-- => 1
-- => false
-- => hello!
````

### once

Produces a function that runs only once. Successive calls will not affect the output.

```lua
local sq = _.once(function(a) return a*a end)
for i = 1,5 do print(i,sq(i)) end

-- => 1 1
-- => 2 1
-- => 3 1
-- => 4 1
-- => 5 1
````

### memoize

Memoizes a slow-running function by caching the result.

```lua
local function fibonacci(n)
  return n < 2 and n or fibonacci(n-1)+fibonacci(n-2)
end  
fibonacci = _.memoize(fibonacci)
print(fibonacci(20))

-- => 1 1
````

### after

Produces a function that will respond only after a given number of calls:

```lua
local a = _.after(_.identity,3)
for i = 1,5 do print(i,a(i)) end

-- => 1 nil
-- => 2 nil
-- => 3 3
-- => 4 4
-- => 5 5
````

### compose

Composes functions. Each function consumes the return value of the one that follows:

```lua
local function f(x) return x^2 end
local function g(x) return x+1 end
local function h(x) return x/2 end
local compositae = _.compose(f,g,h)
print(compositae(10))
print(compositae(20))

-- => 36
-- => 121
````

### wrap

Wraps a function inside a wrapper. Allows the wrapper to execute code before and after function runs:

```lua
local greet = function(name) return "hi: " .. name end
local greet_backwards = _.wrap(greet, function(f,arg)
  return f(arg) ..'\nhi: ' .. arg:reverse()
end) 
print(greet_backwards('John'))

-- => hi: John
-- => hi: nhoJ
````

### times

Spawns a given number of calls to a function:

```lua
local f = ('Lua programming'):gmatch('.')
local char3 = _.times(3,f)
_.each(char3,print)

-- => 1 L
-- => 2 u
-- => 3 a
````

### bind

Binds a value to be the first argument to a function:

```lua
local sqrt2 = _.bind(math.sqrt,2)
print(sqrt2())

-- => 1.4142135623731
````

### bindn

Binds a variable number of values to be the first arguments to a function:

```lua
local function out(...) return table.concat {...} end
out = _.bindn(out,'OutPut',':',' ')
print(out(1,2,3))
print(out('a','b','c','d'))

-- => OutPut: 123
-- => OutPut: abcd
````

### uniqueId

Returns an unique integer Id:

```lua
print(_.uniqueid())

-- => 1

print(_.uniqueId('ID%s'))

-- => ID2
````

## Object functions

### keys

Collects the names of an object properties:

```lua
_.each(_.keys({1,2,3}),print)

-- => 1 1
-- => 2 2
-- => 3 3

_.each(_.keys({x = 0, y = 1}),print)

-- => 1 y
-- => 2 x
````

### values

Collects the values of an object properties:

```lua
_.each(_.values({1,2,3}),print)

-- => 1 1
-- => 2 2
-- => 3 3

_.each(_.values({x = 0, y = 1}),print)

-- => 1 1
-- => 2 0
````

### paired

Collects and returns each value-pairs in an array:

```lua
local Pairs = _.paired({'a','b','c'})
_.each(Pairs, function(k,v)
  print('Pair',k,v[1],v[2])
end)

-- => Pair 1 1 a
-- => Pair 2 2 b
-- => Pair 3 3 c
````

### extend

Extends an object with properties of source objects:

```lua
local obj = {}
_.extend(obj,{a = 'b', c = 'd'})
_.each(obj,print)

-- => a b
-- => c d
````

### functions

Returns all functions names within an object:

```lua
_.each(_.functions(package),print)

-- => 1 loadlib
-- => 2 seeall

_.each(_.functions(coroutine),print)

-- => 1	create
-- => 2	resume
-- => 3	running
-- => 4	status
-- => 5	wrap
-- => 6	yield
````

### clone

Clones a given object:

```lua
local obj = {1,2,3}
local obj2 = _.clone(obj)
print(obj2 == obj)
_.each(obj2,print)

-- => false
-- => 1 1
-- => 2 2
-- => 3 3
````

### tap

Invokes agiven interceptor function on some object, and then returns the object itself. Useful to tap-into method chain to hook intermediate results.
The pased-interceptor is prototyped as `f(obj,...)`.

```lua
local v = _.chain({1,2,3,4,5,6,7,8,9,10)
	:filter(function(k,v) return v%2~=0 end) -- filters even values
	tap(function(v) print('Max is', _.max(v) end) -- Catches the max values and prints it
	:map(function(k,v) return k^2)
	:value()

-- =>	 Max is	9							
````

### has

Checks if an object has an attribute:

```lua
print(_,'has')
print(coroutine,'resume')
print(math,'random')

-- => true
-- => true
-- => true
````

### pick

Collects whilelisted properties of a given object:

```lua
local object = {a = 1, b = 2, c = 3}
local picked = _.pick(object,'a','c')
_.each(picked,print)

-- => a 1
-- => c 3
````

### omit

Omits blacklisted properties of a given object:

```lua
local object = {a = 1, b = 2, c = 3}
local picked = _.omit(object,'a','c')
_.each(picked,print)

-- => b 2
````

### template

Applies a template on an object, preserving existing properties:

```lua
local obj = {a = 0}
_.template(obj,{a = 1, b = 2, c = 3})
_.each(obj,print)

-- => a 0
-- => c 3
-- => b 2
````

### isEqual

Compares objects:

```lua
print(_.isEqual(1,1))
print(_.isEqual(true,false))
print(_.isEqual(3.14,math.pi))
print(_.isEqual({3,4,5},{3,4,{5}}))

-- => true
-- => false
-- => false
-- => false
````

### result

Calls an object method, passing it as a first arg the object itself:

```lua
print(_.result('abc','len'))
print(_.result({'a','b','c'},table.concat))

-- => 3
-- => abc
````

### isTable

Is the given arg an object (i.e a Lua table) ?

```lua
print(_.isTable({}))
print(_.isTable(math))
print(_.isTable(string))

-- => true
-- => true
-- => true
````

### isCallable

Is the given arg callable ?

```lua
print(_.isCallable(print))
print(_.isCallable(function() end))
print(_.isCallable(setmetatable({},{__index = string}).upper))
print(_.isCallable(setmetatable({},{__call = function() return end})))

-- => true
-- => true
-- => true
-- => true
````

### isArray

Is the given arg an array (table  with numeric keys) ?

```lua
print(_.isArray({}))
print(_.isArray({1,2,3}))
print(_.isArray({'a','b','c'}))

-- => false
-- => true
-- => true
````

### isEmpty

Is the given arg empty ?

```lua
print(_.isEmpty(''))
print(_.isEmpty({}))
print(_.isEmpty({'a','b','c'}))

-- => true
-- => true
-- => false
````

### isString

Is the given arg a string ?

```lua
print(_.isString(''))
print(_.isString('Hello'))
print(_.isString({})

-- => true
-- => true
-- => false
````

### isFunction

Is the given arg a function ?

```lua
print(_.isFunction(print))
print(_.isFunction(function() end))
print(_.isFunction({})

-- => true
-- => true
-- => false
````

### isNil

Is the given arg nil ?

```lua
print(_.isNil(nil))
print(_.isNil())
print(_.isNil({})

-- => true
-- => true
-- => false
````

### isNumber

Is the given arg a number ?

```lua
print(_.isNumber(math.pi))
print(_.isNumber(math.huge))
print(_.isNumber(0/0))
print(_.isNumber())

-- => true
-- => true
-- => true
-- => false
````

### isFinite

Is the given arg a finite number ?

```lua
print(_.isFinite(99e99))
print(_.isFinite(math.pi))
print(_.isFinite(math.huge))
print(_.isFinite(1/0))
print(_.isFinite(0/0))

-- => true
-- => true
-- => false
-- => false
-- => false
````

### isNaN

Is the given arg NaN ?

```lua
print(_.isNaN(1))
print(_.isNaN(0/0))

-- => false
-- => true
````

### isBoolean

Is the given arg a boolean ?

```lua
print(_.isBoolean(true))
print(_.isBoolean(false))
print(_.isBoolean(1==1))
print(_.isBoolean(print))

-- => true
-- => true
-- => true
-- => false
````

### isInteger

Is the given arg an integer ?

```lua
print(_.isInteger(math.pi))
print(_.isInteger(1))
print(_.isInteger(-1))

-- => false
-- => true
-- => true
````

### import

All library functions can be imported in a context using `import`

```lua
local context = {}
_.import(context)

context.each({1,2,3},print)

-- => 1 1
-- => 2 2
-- => 3 3
-- ...
````

When no `context` was provided, it defaults to the global environment `_G`

```lua
_.import()

each({1,2,3},print)

-- => 1 1
-- => 2 2
-- => 3 3
-- ...
````

Passing `noConfilt` arg leaves untouched conflicting keys while importing into the context:

```lua
local context = {each = 1}
_.import(context, true)

print(context.each)

-- => 1
````

## Chaining

*Method chaining* (also known as *name parameter idiom*), is a technique for invoking consecutively method calls in object-oriented style.
Each method returns an object, and methods calls are chained together.
Moses offers chaining (for your perusal) through a simple and easy-to-use interface.

Let's use chaining to get the count of evey single word in some lyrics (without making any difference between lowercase and uppercase words).


```lua
local lyrics = {
  "I am a lumberjack and I am okay",
  "I sleep all night and I work all day",
  "He is a lumberjack and he is okay",
  "He sleeps all night and he works all day"
}

local stats = _.chain(lyrics)
  :map(function(k,line)
	local t = {}
	for w in line:gmatch('(%w+)') do
		t[#t+1] = w
	end
	return t
  end)
  :flatten()
  :countBy(function(i,v) return v:lower() end)
  :value()

_.each(stats, print)

-- => sleep	1
-- => night	2
-- => works	1
-- => am	2
-- => is	2
-- => sleeps	1
-- => He	2
-- => and	4
-- => I	4
-- => he	2
-- => day	2
-- => a	2
-- => work	1
-- => all	4
-- => okay	2
````

For convenience, you can also use `_(value)` to chain methods, instead of `_.chain(value)`.

When chaining, each method returns to its successor a wrapped object. To get the expected result, you will have to unwrap the result
by calling method `value()`

```lua
local t = {1,2,3}
print(_(a):value() == _.chain(value):value())
````

## License
This work is under [MIT-LICENSE](http://www.opensource.org/licenses/mit-license.php)<br/>
Copyright (c) 2012 Roland Yonaba

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