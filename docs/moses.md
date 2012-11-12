# Moses: an utility-belt library for Lua

__Moses__ is a Lua utility library which provides support for functional programming. 
It extends built-in Lua functions, making easier operations on arrays, lists, collections, objects, and a lot more.<br/>
__Moses__ was deeply inspired by [Underscore.js](http://documentcloud.github.com/underscore/). 

## Requiring Moses

    -- Minimal code
    local _ = require ("moses")

## Collection functions samples

### each

    -- prints a flat array contents
    _.each({1,2,3},print)

> 1 1 <br/>
> 2 2 <br/>
> 3 3 <br/>
	
	-- iterates over non numeric keys
	_.each({one = 1, two = 2, three = 3},print)

	
> "one" 1 <br/>
> "two" 2 <br/>
> "three" 3 <br/>

	-- can reference an outer table or the passed-in table
    t = {'a','b','c'}
    _.each(t,function(i,v)
      t[i] = v:rep(2)
	  print(t[i])
    end)

> 1 "aa" <br/>
> 2 "bb" <br/>
> 3 "cc" <br/>

### map

    -- Executes a function on each key-value pairs
    local v = _.map({1,2,3},function(i,v) 
	  return v+10 
    end))
    _.each(v,print)
	
> 1 11 <br/>
> 2 12 <br/>
> 3 13 <br/>

    local v = _.map({a = 1, b = 2},function(k,v) 
      return k..v 
    end
    _.each(v,print)
	
> "a" "a1" <br/>
> "b" "b1" <br/>

### reduce

    -- Sums all values
    local r = _.reduce({1,2,3,4},function(memo,v) 
		return memo+v 
	end)
	print(r)
	
> 10
	
    -- Concatenates all values
    local r = _.reduce({'a','b','c','d'},function(memo,v) 
		return memo..v 
	end)
	print(r)	

> "abcd"

### reduceRight

    -- Reduces from right to left
	local initial_state = 256
    local r = _.reduceRight({1,2,4,16},function(memo,v) 
		return memo/v 
	end,initial_state)
	print(r)
	
> 2

### mapReduce

    -- reduces while saving intermediate states
    local v = _.mapReduce({'a','b','c'},function(memo,v) 
       return memo..v 
    end)
	_.each(v,print)
	
> 1 "a"	<br/>
> 2 "ab" <br/>
> 3 "abc" <br/>

### mapReduceRight

    -- reduces from right to left, while saving intermediate states
    local v = _.mapReduceRight({'a','b','c'},function(memo,v) 
       return memo..v 
    end)
	_.each(v,print)
	
> 1 "c"	<br/>
> 2 "cb" <br/>
> 3 "cba" <br/>

## Array functions

## Utility functions

## Object functions