require 'luacov'
local M = require 'moses'

describe('Array functions specs', function()

  describe('sample', function()
  
    it('samples n values from array', function()
			local array = M.range(1,20)
			local sample = M.sample(array, 5)
			assert.equal(#sample, 5)
			M.each(sample, function(__,v)
				assert.is_true(M.include(array, v))
			end)
    end)	
    
    it('when not given, n defaults to 1', function()
			local array = M.range(1,20)
			local sample = M.sample(array)
      assert.equal(#sample, 1)
			assert.is_true(M.include(array, sample[1]))
    end)
		
    it('if n == 0, returns an empty array', function()
			local array = M.range(1,5)
			local sample = M.sample(array, 0)
			assert.is_true(#sample == 0)
    end)
    
    it('if n < 0, returns an empty array', function()
			local array = M.range(1,5)
			assert.is_true(#M.sample(array, -1) == 0)
    end)    
    
  end)
	
  describe('sampleProb', function()
  
    it('returns a sample of an array values', function()
			local array = M.range(1,20)
			local sample = M.sampleProb(array, 0.2)
			M.each(sample, function(__,v)
				assert.is_true(M.include(array, v))
			end)
    end)	
    
  end)

  describe('nsorted', function()
  
    it('returns the top n-values from an array', function()
      local array = M.range(1,20)
      assert.is_true(M.isEqual(M.nsorted(array,5),{1,2,3,4,5}))

      local function comp(a,b) return a > b end
      assert.is_true(M.isEqual(M.nsorted(array,3,comp),{20,19,18}))
    end)	
    
  end)  
	
  describe('shuffle', function()
  
    it('shuffles values and objects in a collection', function()    
      local values = {'a','b','c','d'}       
      assert.is_true(M.same(M.shuffle (values),values))
    end)
    
    it('can accept a seed value to init randomization', function()    
      local values = {'a','b','c','d'}
      local seed = os.time()
      assert.is_true(M.same(M.shuffle(values,seed),values))
    end)   

    it('shuffled table has the same elements in a different order', function()    
      local values = {'a','b','c','d'}
      assert.is_true(M.same(M.shuffle(values),values))
      assert.is_true(M.same(M.shuffle(values),values))
    end)   
  
  end)
  
  describe('pack', function()
  
    it('converts a vararg list to an array', function()
      assert.is_true(M.isArray(M.pack(1,2,3,4)))
      assert.is_true(M.isEqual(M.pack(1,2,8,'d','a',0),{1,2,8,'d','a',0}))      
    end)

    it('preserves input order', function()
      local args = M.pack(1,2,3,4,5)
      for i = 1, 5 do assert.equal(args[i], i) end
    end)
    
  end)

  describe('find', function()
  
    it('looks for a value in a given array and returns its position', function()
      assert.equal(M.find({4,3,2,1},2), 3)
    end)

    it('uses M.isEqual to compare values', function()
      assert.equal(M.find({{4},{3},{2},{1}},{3}), 2)
    end)
    
    it('returns the index of the first occurence', function()
      assert.equal(M.find({4,4,3,3,2,2,1,1},2),5)
    end)

    it('can start the search at a specific position', function()
      assert.equal(M.find({4,4,3,3,2,1,2,1,1},2,6),7)
    end)
    
  end)

  describe('reverse', function()
  
    it('reverse values and objects in a given array', function()
      assert.is_true(M.isEqual(M.reverse({1,2,3,'d'}),{'d',3,2,1}))
    end)
    
  end)
  
  describe('fill', function()
  
    it('fills an array with a value', function()
			local array = M.range(1,5)
      assert.is_true(M.isEqual(M.fill(array,0),{0,0,0,0,0}))
    end)
		
    it('fills an array starting from an index', function()
			local array = M.range(1,5)
      assert.is_true(M.isEqual(M.fill(array,0,4),{1,2,3,0,0}))
    end)		
    
    it('fills an array replacing values inside a range', function()
			local array = M.range(1,5)
      assert.is_true(M.isEqual(M.fill(array,0,3,4),{1,2,0,0,5}))
    end)
		
    it('enlarges the array when the last index is greater than array size', function()
			local array = M.range(1,5)
      assert.is_true(M.isEqual(M.fill(array,0,3,8),{1,2,0,0,0,0,0,0}))
    end)
		
  end)
	
  describe('zeros', function()
    
    it('returns an array of n zeros', function()
      assert.is_true(M.isEqual(M.zeros(5), {0,0,0,0,0}))
      assert.is_true(M.isEqual(M.zeros(2), {0,0}))
      assert.is_true(M.isEqual(M.zeros(1), {0}))
    end)
  
  end)
  
  describe('ones', function()
    
    it('returns an array of n zeros', function()
      assert.is_true(M.isEqual(M.ones(5), {1,1,1,1,1}))
      assert.is_true(M.isEqual(M.ones(3), {1,1,1}))
      assert.is_true(M.isEqual(M.ones(1), {1}))
    end)
  
  end)  
  
  describe('vector', function()
    
    it('returns an array of n times a given value', function()
      assert.is_true(M.isEqual(M.vector(false,4), {false, false, false, false}))
      local f = function() end
      assert.is_true(M.isEqual(M.vector(f,2), {f, f}))
    end)
  
  end)
  
  describe('selectWhile', function()
  
    it('collect values from an array while they pass a thruth test', function()
      assert.is_true(M.isEqual(M.selectWhile({2,4,6,8}, function(v)return v%2==0 end),{2,4,6,8}))
    end)
    
    it('breaks as soon as one value do not pass the test', function()
      assert.is_true(M.isEqual(M.selectWhile({2,4,6,8,9,10,12}, function(v) return v%2==0 end),{2,4,6,8}))
    end)
    
  end)  
   
  describe('dropWhile', function()
  
    it('rejects values from an array while they pass a thruth test', function()
      assert.is_true(M.isEqual(M.dropWhile({2,4,6,8}, function(v) return v%2==0 end),{}))
    end)
    
    it('breaks as soon as one value do not pass the test', function()
      assert.is_true(M.isEqual(M.dropWhile({2,4,6,8,9,10,12}, function(v) return v%2==0 end),{9,10,12}))
    end)
    
  end)  

  describe('sortedIndex', function()
  
    it('returns the index at which a value should be inserted to preserve order', function()
      local comp = function(a,b) return a<b end
      assert.equal(M.sortedIndex({1,2,3},4,comp),4)
    end)
    
    it('the given array will be sorted before if boolean arg "sort" is given', function()
      local comp = function(a,b) return a<b end
      assert.equal(M.sortedIndex({0,10,3,-5},4,comp,true),4)
    end)   
    
    it('when no comparison function is given, uses "<" operator', function()
      assert.equal(M.sortedIndex({'a','d','e','z'},'b'),2)
    end)
    
  end)
  
  describe('indexOf', function()
  
    it('returns the index of a value in an array', function()
      assert.equal(M.indexOf({1,2,3},2),2)
    end)
    
    it('returns nil when value was not found', function()
      assert.is_nil(M.indexOf({'a','b','c','d'},'e'))
    end)  
    
    it('will always return the index of the first occurence', function()
      assert.equal(M.indexOf({'a','d','d','z'},'d'),2)
    end)
    
  end)

  describe('lastIndexOf', function()
  
    it('returns the index of the last occurence of a value in an array', function()
      assert.equal(M.lastIndexOf({1,2,3},2),2)
      assert.equal(M.lastIndexOf({'a','d','d','z'},'d'),3)
    end)
    
    it('returns nil when value was not found', function()
      assert.is_nil(M.lastIndexOf({'a','b','c','d'},'e'))
    end)  
    
  end)
	
  describe('findIndex', function()
  
    it('returns the first index at which a predicate passes a truth test', function()
      assert.equal(M.findIndex({1,2,3,4,5},function(__,v) return v%2==0 end),2)
    end)
    
    it('returns nil when nothing was found', function()
      assert.is_nil(M.findIndex({1,2,3,4,5},function(_,v) return v>5 end))
    end)  
    
  end)	
	
  describe('findLastIndex', function()
  
    it('returns the last index at which a predicate passes a truth test', function()
      assert.equal(M.findLastIndex({1,2,3,4,5},function(_,v) return v%2==0 end),4)
    end)
    
    it('returns nil when nothing was found', function()
      assert.is_nil(M.findLastIndex({1,2,3,4,5},function(_,v) return v>5 end))
    end)  
    
  end)
	
  describe('addTop', function()
  
    it('adds values at the top of an array', function()
      assert.is_true(M.isEqual(M.addTop({},1,2,3),{3,2,1}))
      assert.is_true(M.isEqual(M.addTop({},'a',true,3),{3,true,'a'}))
    end)

    it('preserves the existing elements', function()
      assert.is_true(M.isEqual(M.addTop({1,2},1,2,3),{3,2,1,1,2}))
      assert.is_true(M.isEqual(M.addTop({'i','j'},'a',true,3),{3,true,'a','i','j'}))
    end)    
    
  end)

  describe('prepend', function()
  
    it('adds values at the top of an array, preserving order', function()
      assert.is_true(M.isEqual(M.prepend({},1,2,3),{1,2,3}))
      assert.is_true(M.isEqual(M.prepend({},'a',true,3),{'a',true,3}))
    end)

    it('preserves the existing elements', function()
      assert.is_true(M.isEqual(M.prepend({1,2},1,2,3),{1,2,3,1,2}))
      assert.is_true(M.isEqual(M.prepend({'i','j'},'a',true,3),{'a',true,3,'i','j'}))
    end)    
    
  end)
  
  describe('push', function()
  
    it('appends values at the end of an array', function()
      assert.is_true(M.isEqual(M.push({},1,2,3),{1,2,3}))
      assert.is_true(M.isEqual(M.push({},'a',true,3),{'a',true,3}))
    end) 

    it('preserves the existing elements', function()
      assert.is_true(M.isEqual(M.push({1,2},1,2,3),{1,2,1,2,3}))
      assert.is_true(M.isEqual(M.push({'i','j'},'a',true,3),{'i','j','a',true,3}))
    end)      
    
  end)  

  describe('shift', function()
  
    it('returns the value at the top of a given array', function()
        assert.equal(M.shift {1,7,9} ,1)
    end) 

    it('also removes this value from the given array', function()
      local array = {1,7,9}
      assert.equal(M.shift(array),1)
      assert.is_true(M.isEqual(array,{7,9}))
    end)  
    
  end)  
  
  describe('unshift', function()
  
    it('returns the value at the end of a given array', function()
        assert.equal(M.unshift {1,7,9} ,9)
    end) 

    it('also removes this value from the given array', function()
      local array = {1,7,9}
      assert.equal(M.unshift(array),9)
      assert.is_true(M.isEqual(array,{1,7}))
    end) 
    
  end)

  describe('pull', function()
  
    it('removes all listed values in a given array', function()
      assert.is_true(M.same(M.pull({1,4,3,1,2,3},1),{4,3,2,3}))
      assert.is_true(M.same(M.pull({1,4,3,1,2,3},1,3),{4,2}))
    end)
    
  end)
  
  describe('removeRange', function()
  
    it('removes all values within "start" and "finish" indexes', function()
        assert.is_true(M.isEqual(M.removeRange({1,2,3,4,5,6},2,4),{1,5,6}))
    end) 
    
    it('arg "finish" defaults to the end of the array when not given ', function()
        assert.is_true(M.isEqual(M.removeRange({1,2,3,4,5,6},3),{1,2}))
    end)    
    
    it('arg "start" defaults to the initial index when not given ', function()
        assert.is_true(M.isEqual(M.removeRange({1,2,3,4,5,6}),{}))
    end)

    it('throws an error when "finish" < "start"', function()
        assert.error(function()M.removeRange({1,2,3,4,5,6},4,2) end)
    end)     
    
  end)

  describe('chunk', function()
    
    it('chunks in blocks consecutive values returning the same value from a given function', function()
      local t = {1,2,2,3,3,4,4}
      local v = M.chunk(t, function(v) return v%2==0 end)
      assert.equal(#v, 4)
      assert.is_true(M.isEqual(v[1], {1}))
      assert.is_true(M.isEqual(v[2], {2,2}))
      assert.is_true(M.isEqual(v[3], {3,3}))
      assert.is_true(M.isEqual(v[4], {4,4}))             
    end)  

    it('chunks in blocks consecutive values when using identity as function', function()
      local t = {1,1,2,2,3,3,4}
      local v = M.chunk(t, function(v) return v end)
      assert.is_nil(v[0])
      assert.equal(#v, 4)
      assert.is_true(M.isEqual(v[1], {1,1}))
      assert.is_true(M.isEqual(v[2], {2,2}))
      assert.is_true(M.isEqual(v[3], {3,3}))
      assert.is_true(M.isEqual(v[4], {4}))
    end)  
    
  end)
  
  describe('slice',function()
  
    it('slices a portion of an array',function()
      assert.is_true(M.isEqual(M.slice({'a','b','c','d','e'},2,3),{'b','c'}))
    end)
    
    it('arg "right" bound defaults to the array length when not given',function()
      assert.is_true(M.isEqual(M.slice({'a','b','c','d','e'},3),{'c','d','e'}))
    end)

    it('arg "left" bound defaults to the initial index when not given',function()
      assert.is_true(M.isEqual(M.slice({'a','b','c','d','e'}),{'a','b','c','d','e'}))
    end)     
  
  end)
  
  describe('first',function() 
  
    it('returns the n-first elements', function()
      assert.is_true(M.isEqual(M.first({5,8,12,20},2),{5,8}))
    end)
  
    it('arg "n" defaults 1 when not given', function()
      assert.is_true(M.isEqual(M.first({5,8,12,20}),{5}))
    end)    
    
  end)  
  
  describe('initial',function()  
 
    it('exludes the last N elements', function()
      assert.is_true(M.isEqual(M.initial({5,8,12,20},3),{5}))
      assert.is_true(M.isEqual(M.initial({5,8,12,20},4),{}))
    end)
  
    it('returns all values but the last one if arg "n" was not given', function()
      assert.is_true(M.isEqual(M.initial({5,8,12,20}),{5,8,12}))
    end)
    
    it('passing "n" greather than the array size returns an empty', function()
      assert.is_true(M.isEqual(M.initial({5,8,12,20},5),{}))
    end)  

    it('returns the whole array when "n" equals 0', function()
      assert.is_true(M.isEqual(M.initial({5,8,12,20},0),{5,8,12,20}))
    end)    
      
  end) 

  describe('last',function()
 
    it('returns the last N elements', function()
      assert.is_true(M.isEqual(M.last({5,8,12,20},3),{8,12,20}))
      assert.is_true(M.isEqual(M.last({5,8,12,20},1),{20}))
      assert.is_true(M.isEqual(M.last({5,8,12,20},2),{12,20}))
      assert.is_true(M.isEqual(M.last({5,8,12,20},4),{5,8,12,20}))
    end)
  
    it('returns all values but the first one if arg "n" was not given', function()
      assert.is_true(M.isEqual(M.last({5,8,12,20}),{8,12,20}))
    end)
    
    it('if arg "n" is lower than the array size, returns all values', function()
      assert.is_true(M.isEqual(M.last({5,8,12,20},5),{5,8,12,20}))
    end) 
  
  end) 

  describe('rest',function()
  
    it('excludes all values before a given index', function()
      assert.is_true(M.isEqual(M.rest({5,8,12,20},2),{8,12,20}))
      assert.is_true(M.isEqual(M.rest({5,8,12,20},1),{5,8,12,20}))
      assert.is_true(M.isEqual(M.rest({5,8,12,20},4),{20}))
    end) 

    it('returns an empty array when arg "index" > #array', function()
      assert.is_true(M.isEqual(M.rest({5,8,12,20},5),{}))
    end) 

    it('returns all values if arg "index" <= 0', function()
      assert.is_true(M.isEqual(M.rest({5,8,12,20},0),{5,8,12,20}))
      assert.is_true(M.isEqual(M.rest({5,8,12,20},-1),{5,8,12,20}))
    end)     
  
  end)  

  describe('nth', function()

    it('returns the value at "index"', function()
      assert.equal(3, M.nth({1,2,3,4,5,6}, 3))
    end)
    
  end)
  
  describe('compact',function() 
  
    it('trims out all falsy values from an array', function()
      assert.is_true(M.isEqual(M.compact({a,'a',false,'b',true}),{'a','b',true}))
    end) 
    
  end)
  
  describe('flatten',function()  
 
    it('flattens nested arrays', function()
      assert.is_true(M.isEqual(M.flatten({1,{2,3},{4,5,{6,7}}}),{1,2,3,4,5,6,7}))
    end) 
    
    it('when given arg "shallow", flatten only first level', function()
      assert.is_true(M.isEqual(M.flatten({1,{2,3},{4,5,{6,7}}},true),{1,2,3,4,5,{6,7}}))
    end)     
    
  end)

  describe('difference',function() 
  
    it('returns values in the first array not present in the second array', function()
      local array = {1,2,'a',4,5}
      assert.is_true(M.isEqual(M.difference(array,{1,'a'}),{2,4,5}))
      assert.is_true(M.isEqual(M.difference(array,{5}),{1,2,'a',4}))
    end)   
    
    it('ignores values in the second array not found in the first array', function()
      local array = {1,2,'a',4,5}
      assert.is_true(M.isEqual(M.difference(array,{1,'a','b','c'}),{2,4,5}))
    end)
    
    it('leaves array untouched when given no extra-args', function()
      assert.is_true(M.isEqual(M.difference({1,2,'a',4,5}),{1,2,'a',4,5}))
    end)
    
  end)
  
  describe('union',function()  
  
    it('returns the duplicate-free union of all passed-in arrays', function()   
      local a = {"a"}; local b = {1,2,3}; local c = {2,10}
      assert.is_true(M.isEqual(M.union(a,b,c),{'a',1,2,3,10}))
    end) 
    
    it('accepts nested arrays as well', function()   
      local a = {"a",{"b","c"}}; local b = {1,{2},3}; local c = {2,10}
      assert.is_true(M.isEqual(M.union(a,b,c),{'a','b','c',1,2,3,10}))
    end)     
    
  end)  
  
  describe('intersection',function() 
  
    it('returns the intersection of all passed-in arrays', function()   
      local a = {1,3}; local b = {4,2,3}; local c = {2,3,10}
      assert.is_true(M.isEqual(M.intersection(a,b,c),{3}))
    end) 

    it('fails with nested arrays', function()   
      local a = {1,{3}}; local b = {4,2,3}; local c = {2,3,10}
      assert.is_true(M.isEqual(M.intersection(a,b,c),{}))
    end)  
    
  end)
  
  describe('disjoint',function() 
  
    it('checks if all passed-in arrays are disjoint', function()   
      local A = {'a'}
      local B = {'a',1,3}
      local C = {3,10,2}

      assert.is_false(M.disjoint(A,B))
      assert.is_true(M.disjoint(A,C))
      assert.is_false(M.disjoint(B,C))
    end)
    
  end)
  
  describe('symmetricDifference',function() 
  
    it('returns the symmetric difference from two arrays', function()   
      local a = {1,3}; local b = {4,2,3}; local c = {2,3,10}
      assert.is_true(M.same(M.symmetricDifference(a, b), {1,4,2}))
      assert.is_true(M.same(M.symmetricDifference(a, c), {1,2,10}))
      assert.is_true(M.same(M.symmetricDifference(b, c), {4,10}))
    end)
    
  end)
   
  describe('unique',function()  
    
    it('returns a duplicate-free array',function()
      assert.is_true(M.isEqual(M.unique({1,1,2,2,3,3,4,4,4,5}),{1,2,3,4,5}))
    end)
    
  end)
  
  describe('isunique',function()  
    
    it('Checks if a given array is duplicate-free',function()
      assert.is_true(M.isunique({1,2,3,4,5}))
      assert.is_false(M.isunique({1,2,3,4,4}))
    end)
    
  end)
  
  describe('duplicates',function()  
    it('returns a list of all duplicates in array', function()   
      assert.is_true(M.isEqual(M.duplicates({1,2,3,3,8,8,3,2,4}),{2,3,8}))
      assert.is_true(M.isEqual(M.duplicates({true, false, true, 1, '5', '1', '5'}),{true, '5'}))
    end)     
  end)  
  
  describe('zip',function()  
    it('zips together values from different arrays sharing the same index', function()   
      local names = {'Bob','Alice','James'}; local ages = {22, 23}
      assert.is_true(M.isEqual(M.zip(names,ages),{{'Bob',22},{'Alice',23},{'James'}}))
      assert.is_true(M.isEqual(M.zip({false},{false}),{{false,false}}))
    end)     
  end)  
  
  describe('zipWith',function()  
    it('zips together values from different arrays sharing the same index using a function', function()   
      local names = {'Bob','Alice','James'}; local ages = {22, 23, 25}
      local function introduce(name, age) return 'My name is '..name..' and I am '..age..' years old.' end
      local t = M.zipWith(introduce,names,ages)
      assert.equal(t[1],'My name is Bob and I am 22 years old.')
      assert.equal(t[2],'My name is Alice and I am 23 years old.')
      assert.equal(t[3],'My name is James and I am 25 years old.')
    end)     
  end) 
  
  describe('append',function()  
    
    it('appends two arrays together', function()
      assert.is_true(M.isEqual(M.append({1,2,3},{'a','b'}),{1,2,3,'a','b'}))
    end)    
  
  end)  
  
  describe('interleave',function()  
    
    it('interleaves values from passed-in arrays', function()
      assert.is_true(M.isEqual(M.interleave({1,2,3},{'a','b','c'}),{1,'a',2,'b',3,'c'}))
      assert.is_true(M.isEqual(M.interleave({1},{'a','b','c'}),{1,'a','b','c'}))
    end)    
  
  end)  
   
  describe('interpose',function()  
    
    it('interposes a value in-between values from a passed-in array', function()
      assert.is_true(M.isEqual(M.interpose({1,2,3},'a'),{1,'a',2,'a',3}))
      assert.is_true(M.isEqual(M.interpose({5,5,5,5}, false),{5,false,5,false,5,false,5}))
    end)

    it('leaves the array untouched if containing a single element', function()
      assert.is_true(M.isEqual(M.interpose({1},'a'),{1}))
    end)
  
  end)
  
  describe('range',function()  
  
    it('generate an arithmetic progression', function()
      assert.is_true(M.isEqual(M.range(1,5,1),{1,2,3,4,5}))
      assert.is_true(M.isEqual(M.range(-2,5,1),{-2,-1,0,1,2,3,4,5}))
      assert.is_true(M.isEqual(M.range(1,5,2),{1,3,5}))      
    end) 

    it('arg "step" default to 1 or -1 when no given', function()
      assert.is_true(M.isEqual(M.range(1,5),{1,2,3,4,5}))
      assert.is_true(M.isEqual(M.range(5,1),{5,4,3,2,1}))
    end)

    it('handles real values as well', function()
      assert.is_true(M.isEqual(M.range(3.2,5,0.5),{3.2,3.7,4.2,4.7}))
    end) 

    it('when only one arg is passed, counts from 1', function()
      assert.is_true(M.isEqual(M.range(3),{1,2,3}))
      assert.is_true(M.isEqual(M.range(-3),{-1,-2,-3}))
    end)     
    
  end)  
  
  describe('rep',function()  
  
    it('generates a list of n repetitions of a value', function()
      assert.is_true(M.isEqual(M.rep('a',4),{'a','a','a','a'})) 
      assert.is_true(M.isEqual(M.rep(false,3),{false, false, false})) 
    end)   
    
  end)

  describe('powerset',function()  
  
    it('generates the powerset of a given array', function()
      assert.is_true(M.same(M.powerset({1,2,3}),{{},{1},{2},{3},{1,2},{2,3},{1,3},{1,2,3}}))
      assert.is_true(M.same(M.powerset({1,2,3,4}),{{},{1},{2},{3},{4},{1,2},{1,3},{1,4},{2,3},{2,4},{3,4},{1,2,3},{1,2,4},{1,3,4},{2,3,4},{1,2,3,4}}))
    end)   
    
  end)  
  
  describe('partition',function()  
  
    it('iterates on partitions of a given array', function()
      local array = M.range(1,10)
      local split5 = {M.range(1,5), M.range(6,10)}
      local split3 = {M.range(1,3), M.range(4,6), M.range(7,9), {10}}
      local i = 0
      for p in M.partition(array,5) do
        i = i + 1
        assert.is_true(M.isEqual(p, split5[i]))
      end
      i = 0
      for p in M.partition(array,3) do
        i = i + 1
        assert.is_true(M.isEqual(p, split3[i]))
      end      
    end)   
    
    it('if a 3rd argument pad is supplied, will adjust the last partition', function()
      local array = M.range(1,10)
      local split4 = {{1,2,3,4},{5,6,7,8},{9,10,0,0}}
      local i = 0
      for p in M.partition(array,4,0) do
        i = i + 1
        assert.is_true(M.isEqual(p, split4[i]))
      end     
    end)
		
  end)
	
  describe('overlapping',function()  
  
    it('returns overlapping subsequences', function()
      local array = M.range(1,10)
			local sliding2 = {{1,2},{2,3},{3,4},{4,5},{5,6},{6,7},{7,8},{8,9},{9,10}}
			local sliding3 = {{1,2,3},{3,4,5},{5,6,7},{7,8,9},{9,10}}
			local sliding5 = {{1,2,3,4,5},{5,6,7,8,9},{9,10}}
      local i = 0
      for p in M.overlapping(array,2) do
        i = i + 1
        assert.is_true(M.isEqual(p, sliding2[i]))
      end
      i = 0
      for p in M.overlapping(array,3) do
        i = i + 1
        assert.is_true(M.isEqual(p, sliding3[i]))
      end
      i = 0
      for p in M.overlapping(array,5) do
        i = i + 1
        assert.is_true(M.isEqual(p, sliding5[i]))
      end  			
    end)
		
    it('if a 3rd argument pad is supplied, will adjust the last subsequence', function()
      local array = M.range(1,10)
			local sliding3 = {{1,2,3},{3,4,5},{5,6,7},{7,8,9},{9,10,0}}
			local sliding5 = {{1,2,3,4,5},{5,6,7,8,9},{9,10,0,0,0}}
      local i = 0
      for p in M.overlapping(array,3,0) do
        i = i + 1
        assert.is_true(M.isEqual(p, sliding3[i]))
      end
      i = 0
      for p in M.overlapping(array,5,0) do
        i = i + 1
        assert.is_true(M.isEqual(p, sliding5[i]))
      end  			
    end)   		
    
  end)

  describe('aperture', function()
  
    it('returns sliding partitions of a given array', function()
      local array = M.range(1,5)
      local slides2 = {{1,2},{2,3},{3,4},{4,5}}
      local slides3 = {{1,2,3},{2,3,4},{3,4,5}}
      local slides4 = {{1,2,3,4},{2,3,4,5}}
      local slides5 = {{1,2,3,4,5}}
      
      local i = 0
      for p in M.aperture(array, 2) do
        i = i + 1
        assert.is_true(M.isEqual(p, slides2[i]))
      end
      
      i = 0
      for p in M.aperture(array, 3) do
        i = i + 1
        assert.is_true(M.isEqual(p, slides3[i]))
      end
      
      i = 0
      for p in M.aperture(array, 4) do
        i = i + 1
        assert.is_true(M.isEqual(p, slides4[i]))
      end

      i = 0
      for p in M.aperture(array, 5) do
        i = i + 1
        assert.is_true(M.isEqual(p, slides5[i]))
      end       
    end)
    
  end)
  
  describe('pairwise', function()
  
    it('returns sliding partitions of a given array', function()
      local array = M.range(1,5)
      local pw = {{1,2},{2,3},{3,4},{4,5}}
      
      local i = 0
      for p in M.pairwise(array) do
        i = i + 1
        assert.is_true(M.isEqual(p, pw[i]))
      end
    end)
    
  end)  
 
  describe('permutation',function()  
  
    it('iterates on permutations of a given array', function()
      local array = {'a','b', 'c'}
      local perm = {'abc','acb', 'bac', 'bca', 'cab', 'cba'}
      for p in M.permutation(array) do
        local strp = M.concat(p)
        M.pull(perm, strp)
      end
      assert.is_true(#perm == 0)
    end)   
    
  end)

  describe('concat',function()  
    
    it('concatenates an array contents', function()
      assert.equal(M.concat({1,2,3,4}),'1234')
      assert.equal(M.concat({'a',1,0,1,'b'}),'a101b')
    end) 

    it('handles boolean values', function()
      assert.equal(M.concat({1,true,3,false}),'1true3false')
    end) 

    it('when arg "sep" is given, uses "sep" as a separator', function()
      assert.equal(M.concat({1,3,false,'A'},' '),'1 3 false A')
      assert.equal(M.concat({1,3,false,'A'},', '),'1, 3, false, A')
    end) 

    it('when args "i" and/or "j" are given, concats values within "i" and "j" indexes', function()
      assert.equal(M.concat({1,3,false,'A'},' ',2,3),'3 false')
      assert.equal(M.concat({1,3,false,'A'},', ',2,3),'3, false')
      assert.equal(M.concat({1,3,false,'A','K'},' ',2),'3 false A K')
    end)  
  
  end) 
  
  describe('xprod',function()
  
    it('returns all possible pairs', function()
      local r = M.xprod({1,2,3},{'a','b'})
      assert.is_true(M.isEqual(r[1],{1,'a'}))
      assert.is_true(M.isEqual(r[2],{1,'b'}))
      assert.is_true(M.isEqual(r[3],{2,'a'}))
      assert.is_true(M.isEqual(r[4],{2,'b'}))
      assert.is_true(M.isEqual(r[5],{3,'a'}))
      assert.is_true(M.isEqual(r[6],{3,'b'}))
    end)     
    
  end)
  
  describe('xpairs',function()
  
    it('create pairs by prepending value to array values', function()
      local r = M.xpairs(1,{1,2,3})
      assert.is_true(M.isEqual(r[1],{1,1}))
      assert.is_true(M.isEqual(r[2],{1,2}))
      assert.is_true(M.isEqual(r[3],{1,3}))
    end)     
    
  end)
  
  describe('xpairsRight',function()
  
    it('create pairs by appending value to array values', function()
      local r = M.xpairsRight(1,{1,2,3})
      assert.is_true(M.isEqual(r[1],{1,1}))
      assert.is_true(M.isEqual(r[2],{2,1}))
      assert.is_true(M.isEqual(r[3],{3,1}))
    end)     
    
  end)
  
  describe('sum',function()
  
    it('returns the sum of array values', function()
      assert.equal(M.sum {1,2,3,4,5}, 15)
      assert.equal(M.sum {1,2,3,4}, 10)
      assert.equal(M.sum {1,2,3}, 6)
    end)     
    
  end)

  describe('product',function()
  
    it('returns the product of array values', function()
      assert.equal(M.product {1,2,3,4,5}, 120)
      assert.equal(M.product {1,2,3,4}, 24)
      assert.equal(M.product {1,2,3}, 6)
    end)     
    
  end)

  describe('mean',function()
  
    it('returns the mean of array values', function()
      assert.equal(M.mean {1,2,3,4,5}, 3)
      assert.equal(M.mean {1,2,3,4}, 2.5)
    end)     
    
  end)

  describe('meadian',function()
  
    it('returns the median of array values', function()
      assert.equal(M.median {1,2,3,4,5}, 3)
      assert.equal(M.median {1,2,3,4}, 2.5)
    end)     
    
  end)  
  
end)