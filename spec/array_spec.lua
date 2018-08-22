require 'luacov'
local M = require 'moses'

context('Array functions specs', function()

  context('sample', function()
  
    test('samples n values from array', function()
			local array = M.range(1,20)
			local sample = M.sample(array, 5)
			assert_equal(#sample, 5)
			M.each(sample, function(__,v)
				assert_true(M.include(array, v))
			end)
    end)	
    
    test('when not given, n defaults to 1', function()
			local array = M.range(1,20)
			local sample = M.sample(array)
      assert_equal(#sample, 1)
			assert_true(M.include(array, sample[1]))
    end)
		
    test('if n == 0, returns an empty array', function()
			local array = M.range(1,5)
			local sample = M.sample(array, 0)
			assert_true(#sample == 0)
    end)
    
    test('if n < 0, throws an error', function()
			local array = M.range(1,5)
			assert_error(M.sample(array, -1))
    end)    
    
  end)
	
  context('sampleProb', function()
  
    test('returns a sample of an array values', function()
			local array = M.range(1,20)
			local sample = M.sampleProb(array, 0.2)
			M.each(sample, function(__,v)
				assert_true(M.include(array, v))
			end)
    end)	
    
  end)
	
  context('shuffle', function()
  
    test('shuffles values and objects in a collection', function()    
      local values = {'a','b','c','d'}       
      assert_true(M.same(M.shuffle (values),values))
    end)
    
    test('can accept a seed value to init randomization', function()    
      local values = {'a','b','c','d'}
      local seed = os.time()
      assert_true(M.same(M.shuffle(values,seed),values))
    end)   

    test('shuffled table has the same elements in a different order', function()    
      local values = {'a','b','c','d'}
      assert_true(M.same(M.shuffle(values),values))
      assert_true(M.same(M.shuffle(values),values))
    end)   
  
  end)
  
  context('toArray', function()
  
    test('converts a vararg list to an array', function()
      assert_true(M.isArray(M.toArray(1,2,3,4)))
      assert_true(M.isEqual(M.toArray(1,2,8,'d','a',0),{1,2,8,'d','a',0}))      
    end)

    test('preserves input order', function()
      local args = M.toArray(1,2,3,4,5)
      for i = 1, 5 do assert_equal(args[i], i) end
    end)
    
  end)

  context('find', function()
  
    test('looks for a value in a given array and returns its position', function()
      assert_equal(M.find({4,3,2,1},2), 3)
    end)

    test('uses M.isEqual to compare values', function()
      assert_equal(M.find({{4},{3},{2},{1}},{3}), 2)
    end)
    
    test('returns the index of the first occurence', function()
      assert_equal(M.find({4,4,3,3,2,2,1,1},2),5)
    end)

    test('can start the search at a specific position', function()
      assert_equal(M.find({4,4,3,3,2,1,2,1,1},2,6),7)
    end)
    
  end)

  context('reverse', function()
  
    test('reverse values and objects in a given array', function()
      assert_true(M.isEqual(M.reverse({1,2,3,'d'}),{'d',3,2,1}))
    end)
    
  end)
  
  context('fill', function()
  
    test('fills an array with a value', function()
			local array = M.range(1,5)
      assert_true(M.isEqual(M.fill(array,0),{0,0,0,0,0}))
    end)
		
    test('fills an array starting from an index', function()
			local array = M.range(1,5)
      assert_true(M.isEqual(M.fill(array,0,4),{1,2,3,0,0}))
    end)		
    
    test('fills an array replacing values inside a range', function()
			local array = M.range(1,5)
      assert_true(M.isEqual(M.fill(array,0,3,4),{1,2,0,0,5}))
    end)
		
    test('enlarges the array when the last index is greater than array size', function()
			local array = M.range(1,5)
      assert_true(M.isEqual(M.fill(array,0,3,8),{1,2,0,0,0,0,0,0}))
    end)
		
  end)
	
  context('zeros', function()
    
    test('returns an array of n zeros', function()
      assert_true(M.isEqual(M.zeros(5), {0,0,0,0,0}))
      assert_true(M.isEqual(M.zeros(2), {0,0}))
      assert_true(M.isEqual(M.zeros(1), {0}))
    end)
  
  end)
  
  context('ones', function()
    
    test('returns an array of n zeros', function()
      assert_true(M.isEqual(M.ones(5), {1,1,1,1,1}))
      assert_true(M.isEqual(M.ones(3), {1,1,1}))
      assert_true(M.isEqual(M.ones(1), {1}))
    end)
  
  end)  
  
  context('vector', function()
    
    test('returns an array of n times a given value', function()
      assert_true(M.isEqual(M.vector(false,4), {false, false, false, false}))
      local f = function() end
      assert_true(M.isEqual(M.vector(f,2), {f, f}))
    end)
  
  end)
  
  context('selectWhile', function()
  
    test('collect values from an array while they pass a thruth test', function()
      assert_true(M.isEqual(M.selectWhile({2,4,6,8}, function(v)return v%2==0 end),{2,4,6,8}))
    end)
    
    test('breaks as soon as one value do not pass the test', function()
      assert_true(M.isEqual(M.selectWhile({2,4,6,8,9,10,12}, function(v) return v%2==0 end),{2,4,6,8}))
    end)
    
  end)  
   
  context('dropWhile', function()
  
    test('rejects values from an array while they pass a thruth test', function()
      assert_true(M.isEqual(M.dropWhile({2,4,6,8}, function(v) return v%2==0 end),{}))
    end)
    
    test('breaks as soon as one value do not pass the test', function()
      assert_true(M.isEqual(M.dropWhile({2,4,6,8,9,10,12}, function(v) return v%2==0 end),{9,10,12}))
    end)
    
  end)  

  context('sortedIndex', function()
  
    test('returns the index at which a value should be inserted to preserve order', function()
      local comp = function(a,b) return a<b end
      assert_equal(M.sortedIndex({1,2,3},4,comp),4)
    end)
    
    test('the given array will be sorted before if boolean arg "sort" is given', function()
      local comp = function(a,b) return a<b end
      assert_equal(M.sortedIndex({0,10,3,-5},4,comp,true),4)
    end)   
    
    test('when no comparison function is given, uses "<" operator', function()
      assert_equal(M.sortedIndex({'a','d','e','z'},'b'),2)
    end)
    
  end)
  
  context('indexOf', function()
  
    test('returns the index of a value in an array', function()
      assert_equal(M.indexOf({1,2,3},2),2)
    end)
    
    test('returns nil when value was not found', function()
      assert_nil(M.indexOf({'a','b','c','d'},'e'))
    end)  
    
    test('will always return the index of the first occurence', function()
      assert_equal(M.indexOf({'a','d','d','z'},'d'),2)
    end)
    
  end)

  context('lastIndexOf', function()
  
    test('returns the index of the last occurence of a value in an array', function()
      assert_equal(M.lastIndexOf({1,2,3},2),2)
      assert_equal(M.lastIndexOf({'a','d','d','z'},'d'),3)
    end)
    
    test('returns nil when value was not found', function()
      assert_nil(M.lastIndexOf({'a','b','c','d'},'e'))
    end)  
    
  end)
	
  context('findIndex', function()
  
    test('returns the first index at which a predicate passes a truth test', function()
      assert_equal(M.findIndex({1,2,3,4,5},function(__,v) return v%2==0 end),2)
    end)
    
    test('returns nil when nothing was found', function()
      assert_nil(M.findIndex({1,2,3,4,5},function(_,v) return v>5 end))
    end)  
    
  end)	
	
  context('findLastIndex', function()
  
    test('returns the last index at which a predicate passes a truth test', function()
      assert_equal(M.findLastIndex({1,2,3,4,5},function(_,v) return v%2==0 end),4)
    end)
    
    test('returns nil when nothing was found', function()
      assert_nil(M.findLastIndex({1,2,3,4,5},function(_,v) return v>5 end))
    end)  
    
  end)
	
  context('addTop', function()
  
    test('adds values at the top of an array', function()
      assert_true(M.isEqual(M.addTop({},1,2,3),{3,2,1}))
      assert_true(M.isEqual(M.addTop({},'a',true,3),{3,true,'a'}))
    end)

    test('preserves the existing elements', function()
      assert_true(M.isEqual(M.addTop({1,2},1,2,3),{3,2,1,1,2}))
      assert_true(M.isEqual(M.addTop({'i','j'},'a',true,3),{3,true,'a','i','j'}))
    end)    
    
  end)

  context('prepend', function()
  
    test('adds values at the top of an array, preserving order', function()
      assert_true(M.isEqual(M.prepend({},1,2,3),{1,2,3}))
      assert_true(M.isEqual(M.prepend({},'a',true,3),{'a',true,3}))
    end)

    test('preserves the existing elements', function()
      assert_true(M.isEqual(M.prepend({1,2},1,2,3),{1,2,3,1,2}))
      assert_true(M.isEqual(M.prepend({'i','j'},'a',true,3),{'a',true,3,'i','j'}))
    end)    
    
  end)
  
  context('push', function()
  
    test('appends values at the end of an array', function()
      assert_true(M.isEqual(M.push({},1,2,3),{1,2,3}))
      assert_true(M.isEqual(M.push({},'a',true,3),{'a',true,3}))
    end) 

    test('preserves the existing elements', function()
      assert_true(M.isEqual(M.push({1,2},1,2,3),{1,2,1,2,3}))
      assert_true(M.isEqual(M.push({'i','j'},'a',true,3),{'i','j','a',true,3}))
    end)      
    
  end)  

  context('shift', function()
  
    test('returns the value at the top of a given array', function()
        assert_equal(M.shift {1,7,9} ,1)
    end) 

    test('also removes this value from the given array', function()
      local array = {1,7,9}
      assert_equal(M.shift(array),1)
      assert_true(M.isEqual(array,{7,9}))
    end)  
    
  end)  
  
  context('unshift', function()
  
    test('returns the value at the end of a given array', function()
        assert_equal(M.unshift {1,7,9} ,9)
    end) 

    test('also removes this value from the given array', function()
      local array = {1,7,9}
      assert_equal(M.unshift(array),9)
      assert_true(M.isEqual(array,{1,7}))
    end) 
    
  end)

  context('pull', function()
  
    test('removes all listed values in a given array', function()
      assert_true(M.same(M.pull({1,4,3,1,2,3},1),{4,3,2,3}))
      assert_true(M.same(M.pull({1,4,3,1,2,3},1,3),{4,2}))
    end)
    
  end)
  
  context('removeRange', function()
  
    test('removes all values within "start" and "finish" indexes', function()
        assert_true(M.isEqual(M.removeRange({1,2,3,4,5,6},2,4),{1,5,6}))
    end) 
    
    test('arg "finish" defaults to the end of the array when not given ', function()
        assert_true(M.isEqual(M.removeRange({1,2,3,4,5,6},3),{1,2}))
    end)    
    
    test('arg "start" defaults to the initial index when not given ', function()
        assert_true(M.isEqual(M.removeRange({1,2,3,4,5,6}),{}))
    end)

    test('throws an error when "finish" < "start"', function()
        assert_error(function()M.removeRange({1,2,3,4,5,6},4,2) end)
    end)     
    
  end)

  context('chunk', function()
    
    test('chunks in blocks consecutive values returning the same value from a given function', function()
      local t = {1,2,2,3,3,4,4}
      local v = M.chunk(t, function(v) return v%2==0 end)
      assert_equal(#v, 4)
      assert_true(M.isEqual(v[1], {1}))
      assert_true(M.isEqual(v[2], {2,2}))
      assert_true(M.isEqual(v[3], {3,3}))
      assert_true(M.isEqual(v[4], {4,4}))             
    end)  
    
  end)
  
  context('slice',function()
  
    test('slices a portion of an array',function()
      assert_true(M.isEqual(M.slice({'a','b','c','d','e'},2,3),{'b','c'}))
    end)
    
    test('arg "right" bound defaults to the array length when not given',function()
      assert_true(M.isEqual(M.slice({'a','b','c','d','e'},3),{'c','d','e'}))
    end)

    test('arg "left" bound defaults to the initial index when not given',function()
      assert_true(M.isEqual(M.slice({'a','b','c','d','e'}),{'a','b','c','d','e'}))
    end)     
  
  end)
  
  context('first',function() 
  
    test('returns the n-first elements', function()
      assert_true(M.isEqual(M.first({5,8,12,20},2),{5,8}))
    end)
  
    test('arg "n" defaults 1 when not given', function()
      assert_true(M.isEqual(M.first({5,8,12,20}),{5}))
    end)    
    
  end)  
  
  context('initial',function()  
 
    test('exludes the last N elements', function()
      assert_true(M.isEqual(M.initial({5,8,12,20},3),{5}))
      assert_true(M.isEqual(M.initial({5,8,12,20},4),{}))
    end)
  
    test('returns all values but the last one if arg "n" was not given', function()
      assert_true(M.isEqual(M.initial({5,8,12,20}),{5,8,12}))
    end)
    
    test('passing "n" greather than the array size returns an empty', function()
      assert_true(M.isEqual(M.initial({5,8,12,20},5),{}))
    end)  

    test('returns the whole array when "n" equals 0', function()
      assert_true(M.isEqual(M.initial({5,8,12,20},0),{5,8,12,20}))
    end)    
      
  end) 

  context('last',function()
 
    test('returns the last N elements', function()
      assert_true(M.isEqual(M.last({5,8,12,20},3),{8,12,20}))
      assert_true(M.isEqual(M.last({5,8,12,20},1),{20}))
      assert_true(M.isEqual(M.last({5,8,12,20},2),{12,20}))
      assert_true(M.isEqual(M.last({5,8,12,20},4),{5,8,12,20}))
    end)
  
    test('returns all values but the first one if arg "n" was not given', function()
      assert_true(M.isEqual(M.last({5,8,12,20}),{8,12,20}))
    end)
    
    test('if arg "n" is lower than the array size, returns all values', function()
      assert_true(M.isEqual(M.last({5,8,12,20},5),{5,8,12,20}))
    end) 
  
  end) 

  context('rest',function()
  
    test('excludes all values before a given index', function()
      assert_true(M.isEqual(M.rest({5,8,12,20},2),{8,12,20}))
      assert_true(M.isEqual(M.rest({5,8,12,20},1),{5,8,12,20}))
      assert_true(M.isEqual(M.rest({5,8,12,20},4),{20}))
    end) 

    test('returns an empty array when arg "index" > #array', function()
      assert_true(M.isEqual(M.rest({5,8,12,20},5),{}))
    end) 

    test('returns all values if arg "index" <= 0', function()
      assert_true(M.isEqual(M.rest({5,8,12,20},0),{5,8,12,20}))
      assert_true(M.isEqual(M.rest({5,8,12,20},-1),{5,8,12,20}))
    end)     
  
  end)  

  context('nth', function()

    test('returns the value at "index"', function()
      assert_equal(3, M.nth({1,2,3,4,5,6}, 3))
    end)
    
  end)
  
  context('compact',function() 
  
    test('trims out all falsy values from an array', function()
      assert_true(M.isEqual(M.compact({a,'a',false,'b',true}),{'a','b',true}))
    end) 
    
  end)
  
  context('flatten',function()  
 
    test('flattens nested arrays', function()
      assert_true(M.isEqual(M.flatten({1,{2,3},{4,5,{6,7}}}),{1,2,3,4,5,6,7}))
    end) 
    
    test('when given arg "shallow", flatten only first level', function()
      assert_true(M.isEqual(M.flatten({1,{2,3},{4,5,{6,7}}},true),{1,2,3,4,5,{6,7}}))
    end)     
    
  end)

  context('difference',function() 
  
    test('returns values in the first array not present in the second array', function()
      local array = {1,2,'a',4,5}
      assert_true(M.isEqual(M.difference(array,{1,'a'}),{2,4,5}))
      assert_true(M.isEqual(M.difference(array,{5}),{1,2,'a',4}))
    end)   
    
    test('ignores values in the second array not found in the first array', function()
      local array = {1,2,'a',4,5}
      assert_true(M.isEqual(M.difference(array,{1,'a','b','c'}),{2,4,5}))
    end)
    
    test('leaves array untouched when given no extra-args', function()
      assert_true(M.isEqual(M.difference({1,2,'a',4,5}),{1,2,'a',4,5}))
    end)
    
  end)
  
  context('union',function()  
  
    test('returns the duplicate-free union of all passed-in arrays', function()   
      local a = {"a"}; local b = {1,2,3}; local c = {2,10}
      assert_true(M.isEqual(M.union(a,b,c),{'a',1,2,3,10}))
    end) 
    
    test('accepts nested arrays as well', function()   
      local a = {"a",{"b","c"}}; local b = {1,{2},3}; local c = {2,10}
      assert_true(M.isEqual(M.union(a,b,c),{'a','b','c',1,2,3,10}))
    end)     
    
  end)  
  
  context('intersection',function() 
  
    test('returns the intersection of all passed-in arrays', function()   
      local a = {1,3}; local b = {4,2,3}; local c = {2,3,10}
      assert_true(M.isEqual(M.intersection(a,b,c),{3}))
    end) 

    test('fails with nested arrays', function()   
      local a = {1,{3}}; local b = {4,2,3}; local c = {2,3,10}
      assert_true(M.isEqual(M.intersection(a,b,c),{}))
    end)  
    
  end)
  
  context('symmetricDifference',function() 
  
    test('returns the symmetric difference from two arrays', function()   
      local a = {1,3}; local b = {4,2,3}; local c = {2,3,10}
      assert_true(M.same(M.symmetricDifference(a, b), {1,4,2}))
      assert_true(M.same(M.symmetricDifference(a, c), {1,2,10}))
      assert_true(M.same(M.symmetricDifference(b, c), {4,10}))
    end)
    
  end)
   
  context('unique',function()  
    
    test('returns a duplicate-free array',function()
      assert_true(M.isEqual(M.unique({1,1,2,2,3,3,4,4,4,5}),{1,2,3,4,5}))
    end)
    
  end)
  
  context('isunique',function()  
    
    test('Checks if a given array is duplicate-free',function()
      assert_true(M.isunique({1,2,3,4,5}))
      assert_false(M.isunique({1,2,3,4,4}))
    end)
    
  end)
  
  context('zip',function()  
    test('zips together values from different arrays sharing the same index', function()   
      local names = {'Bob','Alice','James'}; local ages = {22, 23}
      assert_true(M.isEqual(M.zip(names,ages),{{'Bob',22},{'Alice',23},{'James'}}))
    end)     
  end)  
  
  context('zipWith',function()  
    test('zips together values from different arrays sharing the same index using a function', function()   
      local names = {'Bob','Alice','James'}; local ages = {22, 23, 25}
      local function introduce(name, age) return 'My name is '..name..' and I am '..age..' years old.' end
      local t = M.zipWith(introduce,names,ages)
      assert_equal(t[1],'My name is Bob and I am 22 years old.')
      assert_equal(t[2],'My name is Alice and I am 23 years old.')
      assert_equal(t[3],'My name is James and I am 25 years old.')
    end)     
  end) 
  
  context('append',function()  
    
    test('appends two arrays together', function()
      assert_true(M.isEqual(M.append({1,2,3},{'a','b'}),{1,2,3,'a','b'}))
    end)    
  
  end)  
  
  context('interleave',function()  
    
    test('interleaves values from passed-in arrays', function()
      assert_true(M.isEqual(M.interleave({1,2,3},{'a','b','c'}),{1,'a',2,'b',3,'c'}))
      assert_true(M.isEqual(M.interleave({1},{'a','b','c'}),{1,'a','b','c'}))
    end)    
  
  end)  
   
  context('interpose',function()  
    
    test('interposes a value in-between values from a passed-in array', function()
      assert_true(M.isEqual(M.interpose({1,2,3},'a'),{1,'a',2,'a',3}))
      assert_true(M.isEqual(M.interpose({5,5,5,5}, false),{5,false,5,false,5,false,5}))
    end)

    test('leaves the array untouched if containing a single element', function()
      assert_true(M.isEqual(M.interpose({1},'a'),{1}))
    end)
  
  end)
  
  context('range',function()  
  
    test('generate an arithmetic progression', function()
      assert_true(M.isEqual(M.range(1,5,1),{1,2,3,4,5}))
      assert_true(M.isEqual(M.range(-2,5,1),{-2,-1,0,1,2,3,4,5}))
      assert_true(M.isEqual(M.range(1,5,2),{1,3,5}))      
    end) 

    test('arg "step" default to 1 or -1 when no given', function()
      assert_true(M.isEqual(M.range(1,5),{1,2,3,4,5}))
      assert_true(M.isEqual(M.range(5,1),{5,4,3,2,1}))
    end)

    test('handles real values as well', function()
      assert_true(M.isEqual(M.range(3.2,5,0.5),{3.2,3.7,4.2,4.7}))
    end) 

    test('when only one arg is passed, counts from 1', function()
      assert_true(M.isEqual(M.range(3),{1,2,3}))
      assert_true(M.isEqual(M.range(-3),{-1,-2,-3}))
    end)     
    
  end)  
  
  context('rep',function()  
  
    test('generates a list of n repetitions of a value', function()
      assert_true(M.isEqual(M.rep('a',4),{'a','a','a','a'})) 
      assert_true(M.isEqual(M.rep(false,3),{false, false, false})) 
    end)   
    
  end)

  context('powerset',function()  
  
    test('generates the powerset of a given array', function()
      assert_true(M.isEqual(M.powerset({1,2,3}),{{1},{2},{3},{1,2},{2,3},{1,2,3}}))
      assert_true(M.isEqual(M.powerset({1,2,3,4}),{{1},{2},{3},{4},{1,2},{2,3},{3,4},{1,2,3},{2,3,4},{1,2,3,4}}))
    end)   
    
  end)  
  
  context('partition',function()  
  
    test('iterates on partitions of a given array', function()
      local array = M.range(1,10)
      local split5 = {M.range(1,5), M.range(6,10)}
      local split3 = {M.range(1,3), M.range(4,6), M.range(7,9), {10}}
      local i = 0
      for p in M.partition(array,5) do
        i = i + 1
        assert_true(M.isEqual(p, split5[i]))
      end
      i = 0
      for p in M.partition(array,3) do
        i = i + 1
        assert_true(M.isEqual(p, split3[i]))
      end      
    end)   
    
    test('if a 3rd argument pad is supplied, will adjust the last partition', function()
      local array = M.range(1,10)
      local split4 = {{1,2,3,4},{5,6,7,8},{9,10,0,0}}
      local i = 0
      for p in M.partition(array,4,0) do
        i = i + 1
        assert_true(M.isEqual(p, split4[i]))
      end     
    end)
		
  end)
	
  context('overlapping',function()  
  
    test('returns overlapping subsequences', function()
      local array = M.range(1,10)
			local sliding2 = {{1,2},{2,3},{3,4},{4,5},{5,6},{6,7},{7,8},{8,9},{9,10}}
			local sliding3 = {{1,2,3},{3,4,5},{5,6,7},{7,8,9},{9,10}}
			local sliding5 = {{1,2,3,4,5},{5,6,7,8,9},{9,10}}
      local i = 0
      for p in M.overlapping(array,2) do
        i = i + 1
        assert_true(M.isEqual(p, sliding2[i]))
      end
      i = 0
      for p in M.overlapping(array,3) do
        i = i + 1
        assert_true(M.isEqual(p, sliding3[i]))
      end
      i = 0
      for p in M.overlapping(array,5) do
        i = i + 1
        assert_true(M.isEqual(p, sliding5[i]))
      end  			
    end)
		
    test('if a 3rd argument pad is supplied, will adjust the last subsequence', function()
      local array = M.range(1,10)
			local sliding3 = {{1,2,3},{3,4,5},{5,6,7},{7,8,9},{9,10,0}}
			local sliding5 = {{1,2,3,4,5},{5,6,7,8,9},{9,10,0,0,0}}
      local i = 0
      for p in M.overlapping(array,3,0) do
        i = i + 1
        assert_true(M.isEqual(p, sliding3[i]))
      end
      i = 0
      for p in M.overlapping(array,5,0) do
        i = i + 1
        assert_true(M.isEqual(p, sliding5[i]))
      end  			
    end)   		
    
  end)

  context('aperture', function()
  
    test('returns sliding partitions of a given array', function()
      local array = M.range(1,5)
      local slides2 = {{1,2},{2,3},{3,4},{4,5}}
      local slides3 = {{1,2,3},{2,3,4},{3,4,5}}
      local slides4 = {{1,2,3,4},{2,3,4,5}}
      local slides5 = {{1,2,3,4,5}}
      
      local i = 0
      for p in M.aperture(array, 2) do
        i = i + 1
        assert_true(M.isEqual(p, slides2[i]))
      end
      
      i = 0
      for p in M.aperture(array, 3) do
        i = i + 1
        assert_true(M.isEqual(p, slides3[i]))
      end
      
      i = 0
      for p in M.aperture(array, 4) do
        i = i + 1
        assert_true(M.isEqual(p, slides4[i]))
      end

      i = 0
      for p in M.aperture(array, 5) do
        i = i + 1
        assert_true(M.isEqual(p, slides5[i]))
      end       
    end)
    
  end)
  
  context('pairwise', function()
  
    test('returns sliding partitions of a given array', function()
      local array = M.range(1,5)
      local pw = {{1,2},{2,3},{3,4},{4,5}}
      
      local i = 0
      for p in M.pairwise(array) do
        i = i + 1
        assert_true(M.isEqual(p, pw[i]))
      end
    end)
    
  end)  
 
  context('permutation',function()  
  
    test('iterates on permutations of a given array', function()
      local array = {'a','b', 'c'}
      local perm = {'abc','acb', 'bac', 'bca', 'cab', 'cba'}
      for p in M.permutation(array) do
        local strp = M.concat(p)
        M.pull(perm, strp)
      end
      assert_true(#perm == 0)
    end)   
    
  end)  
 
  context('invert',function()
  
    test('switches key-values pairs', function()
      assert_true(M.isEqual(M.invert({1,2,3}),{1,2,3}))
      assert_true(M.isEqual(M.invert({'a','b','c'}),{a = 1,b = 2,c = 3}))
    end)     
    
  end) 

  context('concat',function()  
    
    test('concatenates an array contents', function()
      assert_equal(M.concat({1,2,3,4}),'1234')
      assert_equal(M.concat({'a',1,0,1,'b'}),'a101b')
    end) 

    test('handles boolean values', function()
      assert_equal(M.concat({1,true,3,false}),'1true3false')
    end) 

    test('when arg "sep" is given, uses "sep" as a separator', function()
      assert_equal(M.concat({1,3,false,'A'},' '),'1 3 false A')
      assert_equal(M.concat({1,3,false,'A'},', '),'1, 3, false, A')
    end) 

    test('when args "i" and/or "j" are given, concats values within "i" and "j" indexes', function()
      assert_equal(M.concat({1,3,false,'A'},' ',2,3),'3 false')
      assert_equal(M.concat({1,3,false,'A'},', ',2,3),'3, false')
      assert_equal(M.concat({1,3,false,'A','K'},' ',2),'3 false A K')
    end)  
  
  end) 
  
  context('xprod',function()
  
    test('returns all possible pairs', function()
      local r = M.xprod({1,2,3},{'a','b'})
      assert_true(M.isEqual(r[1],{1,'a'}))
      assert_true(M.isEqual(r[2],{1,'b'}))
      assert_true(M.isEqual(r[3],{2,'a'}))
      assert_true(M.isEqual(r[4],{2,'b'}))
      assert_true(M.isEqual(r[5],{3,'a'}))
      assert_true(M.isEqual(r[6],{3,'b'}))
    end)     
    
  end)
  
  context('sum',function()
  
    test('returns the sum of array values', function()
      assert_equal(M.sum {1,2,3,4,5}, 15)
      assert_equal(M.sum {1,2,3,4}, 10)
      assert_equal(M.sum {1,2,3}, 6)
    end)     
    
  end)

  context('product',function()
  
    test('returns the product of array values', function()
      assert_equal(M.product {1,2,3,4,5}, 120)
      assert_equal(M.product {1,2,3,4}, 24)
      assert_equal(M.product {1,2,3}, 6)
    end)     
    
  end)

  context('mean',function()
  
    test('returns the mean of array values', function()
      assert_equal(M.mean {1,2,3,4,5}, 3)
      assert_equal(M.mean {1,2,3,4}, 2.5)
    end)     
    
  end)

  context('meadian',function()
  
    test('returns the median of array values', function()
      assert_equal(M.median {1,2,3,4,5}, 3)
      assert_equal(M.median {1,2,3,4}, 2.5)
    end)     
    
  end)  
  
end)