_G._ = require 'moses'

context('Array functions specs', function()

  context('reverse', function()
  
    test('reverse values and objects in a given array', function()
      assert_true(_.isEqual(_.reverse({1,2,3,'d'}),{'d',3,2,1}))
    end)
    
  end)
  
  context('selectWhile', function()
  
    test('collect values from an array while they pass a thruth test', function()
      assert_true(_.isEqual(_.selectWhile({2,4,6,8}, function(i,v)
          return v%2==0
        end),{2,4,6,8}))
    end)
    
    test('breaks as soon as one value do not pass the test', function()
      assert_true(_.isEqual(_.selectWhile({2,4,6,8,9,10,12}, function(i,v)
          return v%2==0
        end),{2,4,6,8}))
    end)
    
     test('is aliased as "takeWhile"', function()
      assert_equal(_.selectWhile,_.takeWhile)
    end)   
    
  end)  
   
  context('dropWhile', function()
  
    test('rejects values from an array while they pass a thruth test', function()
      assert_true(_.isEqual(_.dropWhile({2,4,6,8}, function(i,v)
          return v%2==0
        end),{}))
    end)
    
    test('breaks as soon as one value do not pass the test', function()
      assert_true(_.isEqual(_.dropWhile({2,4,6,8,9,10,12}, function(i,v)
          return v%2==0
        end),{9,10,12}))
    end)
    
    test('is aliased as "rejectWhile"', function()
      assert_equal(_.dropWhile,_.rejectWhile)
    end)    
    
  end)  

  context('sortedIndex', function()
  
    test('returns the index at which a value should be inserted to preserve order', function()
      local comp = function(a,b) return a<b end
      assert_equal(_.sortedIndex({1,2,3},4,comp),4)
    end)
    
    test('the given array will be sorted before if boolean arg "sort" is given', function()
      local comp = function(a,b) return a<b end
      assert_equal(_.sortedIndex({0,10,3,-5},4,comp,true),4)
    end)   
    
    test('when no comparison function is given, uses "<" operator', function()
      assert_equal(_.sortedIndex({'a','d','e','z'},'b'),2)
    end)
    
  end)
  
  context('sortedIndex', function()
  
    test('returns the index at which a value should be inserted to preserve order', function()
      local comp = function(a,b) return a<b end
      assert_equal(_.sortedIndex({1,2,3},4,comp),4)
    end)
    
    test('the given array will be sorted before if boolean arg "sort" is given', function()
      local comp = function(a,b) return a<b end
      assert_equal(_.sortedIndex({0,10,3,-5},4,comp,true),4)
    end)   
    
    test('when no comparison function is given, uses "<" operator', function()
      assert_equal(_.sortedIndex({'a','d','e','z'},'b'),2)
    end)
    
  end)
  
  context('indexOf', function()
  
    test('returns the index of a value in an array', function()
      assert_equal(_.indexOf({1,2,3},2),2)
    end)
    
    test('returns nil when value was not found', function()
      assert_nil(_.indexOf({'a','b','c','d'},'e'))
    end)  
    
    test('will always return the index of the first occurence', function()
      assert_equal(_.indexOf({'a','d','d','z'},'d'),2)
    end)
    
  end)

  context('lastIndexOf', function()
  
    test('returns the index of the last occurence of a value in an array', function()
      assert_equal(_.lastIndexOf({1,2,3},2),2)
      assert_equal(_.lastIndexOf({'a','d','d','z'},'d'),3)
    end)
    
    test('returns nil when value was not found', function()
      assert_nil(_.lastIndexOf({'a','b','c','d'},'e'))
    end)  
    
  end)

  context('add', function()
  
    test('adds values at the top of an array', function()
      assert_true(_.isEqual(_.add({},1,2,3),{3,2,1}))
      assert_true(_.isEqual(_.add({},'a',true,3),{3,true,'a'}))
    end)

    test('preserves the existing elements', function()
      assert_true(_.isEqual(_.add({1,2},1,2,3),{3,2,1,1,2}))
      assert_true(_.isEqual(_.add({'i','j'},'a',true,3),{3,true,'a','i','j'}))
    end)    
    
  end)

  context('push', function()
  
    test('appends values at the end of an array', function()
      assert_true(_.isEqual(_.push({},1,2,3),{1,2,3}))
      assert_true(_.isEqual(_.push({},'a',true,3),{'a',true,3}))
    end) 

    test('preserves the existing elements', function()
      assert_true(_.isEqual(_.push({1,2},1,2,3),{1,2,1,2,3}))
      assert_true(_.isEqual(_.push({'i','j'},'a',true,3),{'i','j','a',true,3}))
    end)      
    
  end)  

  context('pop', function()
  
    test('returns the value at the top of a given array', function()
        assert_equal(_.pop {1,7,9} ,1)
    end) 

    test('also removes this value from the given array', function()
      local array = {1,7,9}
      assert_equal(_.pop(array),1)
      assert_true(_.isEqual(array,{7,9}))
    end)
    
    test('is aliased as "shift"', function()
      assert_equal(_.pop,_.shift)
    end)     
    
  end)  
  
  context('unshift', function()
  
    test('returns the value at the end of a given array', function()
        assert_equal(_.unshift {1,7,9} ,9)
    end) 

    test('also removes this value from the given array', function()
      local array = {1,7,9}
      assert_equal(_.unshift(array),9)
      assert_true(_.isEqual(array,{1,7}))
    end) 
    
  end)

  context('removeRange', function()
  
    test('removes all values within "start" and "finish" indexes', function()
        assert_true(_.isEqual(_.removeRange({1,2,3,4,5,6},2,4),{1,5,6}))
    end) 
    
    test('arg "finish" defaults to the end of the array when not given ', function()
        assert_true(_.isEqual(_.removeRange({1,2,3,4,5,6},3),{1,2}))
    end)    
    
    test('arg "start" defaults to the initial index when not given ', function()
        assert_true(_.isEqual(_.removeRange({1,2,3,4,5,6}),{}))
    end)
    
    test('args "start" and "finish" are be clamped to the array bound ', function()
        assert_true(_.isEqual(_.removeRange({1,2,3,4,5,6},0,100),{}))
    end) 

    test('leaves the array untouched when "finish" < "start"', function()
        assert_true(_.isEqual(_.removeRange({1,2,3,4,5,6},4,2),{1,2,3,4,5,6}))
    end) 

    test('is aliased as "rmRange"', function()
        assert_equal(_.removeRange,_.rmRange)
    end)      
    
  end)

  context('slice',function()
  
    test('slices a portion of an array',function()
      assert_true(_.isEqual(_.slice({'a','b','c','d','e'},2,3),{'b','c'}))
    end)
    
    test('arg "right" bound defaults to the array length when not given',function()
      assert_true(_.isEqual(_.slice({'a','b','c','d','e'},3),{'c','d','e'}))
    end)

    test('arg "left" bound defaults to the initial index when not given',function()
      assert_true(_.isEqual(_.slice({'a','b','c','d','e'}),{'a','b','c','d','e'}))
    end)     
  
  end)
  
  context('first',function() 
  
    test('returns the n-first elements', function()
      assert_true(_.isEqual(_.first({5,8,12,20},2),{5,8}))
    end)
  
    test('arg "n" defaults 1 when not given', function()
      assert_true(_.isEqual(_.first({5,8,12,20}),{5}))
    end)
    
    test('is aliased as "head"', function()
      assert_equal(_.first,_.head)
    end) 

    test('is aliased as "take"', function()
      assert_equal(_.first,_.take)
    end)     
    
  end)  
  
  context('initial',function()  
 
    test('exludes the last N elements', function()
      assert_true(_.isEqual(_.initial({5,8,12,20},3),{5}))
      assert_true(_.isEqual(_.initial({5,8,12,20},4),{}))
    end)
  
    test('returns all values but the last one if arg "n" was not given', function()
      assert_true(_.isEqual(_.initial({5,8,12,20}),{5,8,12}))
    end)
    
    test('passing "n" greather than the array size returns an empty', function()
      assert_true(_.isEqual(_.initial({5,8,12,20},5),{}))
    end)  

    test('returns the whole array when "n" equals 0', function()
      assert_true(_.isEqual(_.initial({5,8,12,20},0),{5,8,12,20}))
    end) 

    test('returns "nil" when arg "n" < 0', function()
      assert_nil(_.initial({5,8,12,20},-1))
    end)     
      
  end) 

  context('last',function()
 
    test('returns the last N elements', function()
      assert_true(_.isEqual(_.last({5,8,12,20},3),{8,12,20}))
      assert_true(_.isEqual(_.last({5,8,12,20},1),{20}))
      assert_true(_.isEqual(_.last({5,8,12,20},2),{12,20}))
      assert_true(_.isEqual(_.last({5,8,12,20},4),{5,8,12,20}))
    end)
  
    test('returns all values but the first one if arg "n" was not given', function()
      assert_true(_.isEqual(_.last({5,8,12,20}),{8,12,20}))
    end)
    
    test('if arg "n" is lower than the array size, returns all values', function()
      assert_true(_.isEqual(_.last({5,8,12,20},5),{5,8,12,20}))
    end)

    test('returns "nil" when arg "n" <= 0', function()
      assert_nil(_.last({5,8,12,20},0))
      assert_nil(_.last({5,8,12,20},-1))
    end)  
  
  end) 

  context('rest',function()
  
    test('excludes all values before a given index', function()
      assert_true(_.isEqual(_.rest({5,8,12,20},2),{8,12,20}))
      assert_true(_.isEqual(_.rest({5,8,12,20},1),{5,8,12,20}))
      assert_true(_.isEqual(_.rest({5,8,12,20},4),{20}))
    end) 

    test('returns an empty array when arg "index" > #array', function()
      assert_true(_.isEqual(_.rest({5,8,12,20},5),{}))
    end) 

    test('returns all values if arg "index" <= 0', function()
      assert_true(_.isEqual(_.rest({5,8,12,20},0),{5,8,12,20}))
      assert_true(_.isEqual(_.rest({5,8,12,20},-1),{5,8,12,20}))
    end) 

    test('is aliased as "tail"', function()
      assert_equal(_.rest,_.tail)
    end)     
  
  end)  
  
  context('compact',function() 
  
    test('trims out all falsy values from an array', function()
      assert_true(_.isEqual(_.compact({a,'a',false,'b',true}),{'a','b',true}))
    end) 
    
  end)
  
  context('flatten',function()  
 
    test('flattens nested arrays', function()
      assert_true(_.isEqual(_.flatten({1,{2,3},{4,5,{6,7}}}),{1,2,3,4,5,6,7}))
    end) 
    
    test('when given arg "shallow", will do nothing', function()
      assert_true(_.isEqual(_.flatten({1,{2,3},{4,5,{6,7}}},true),{1,{2,3},{4,5,{6,7}}}))
    end)     
    
  end)

  context('difference',function() 
  
    test('returns values in array not present in passed args', function()
      local array = {1,2,'a',4,5}
      assert_true(_.isEqual(_.difference(array,1,'a'),{2,4,5}))
      assert_true(_.isEqual(_.difference(array,5),{1,2,'a',4}))
    end)   
    
    test('ignores passed args not found in array', function()
      local array = {1,2,'a',4,5}
      assert_true(_.isEqual(_.difference(array,1,'a','b','c'),{2,4,5}))
    end)
    
    test('leaves array untouched when given no extra-args', function()
      assert_true(_.isEqual(_.difference({1,2,'a',4,5}),{1,2,'a',4,5}))
    end) 

    test('is aliased as "without"', function()
      assert_equal(_.difference,_.without)
    end)    
    
  end)

  context('uniq',function()  
    
    test('returns a duplicate-free array',function()
      assert_true(_.isEqual(_.uniq({1,1,2,2,3,3,4,4,4,5}),{1,2,3,4,5}))
    end)
    
    test('runs faster if the given array is sorted, and passing "isSorted"', function()   
      assert_true(_.isEqual(_.uniq({1,1,2,2,3,3,4,4,4,5},true),{1,2,3,4,5}))
    end)    
    
    test('can take an iterator to extract targetted attribute values"', function()
      local logs = {
        {name = 'Gray', timestamp = 000},{name = 'Jade', timestamp = 133},
        {name = 'Dave', timestamp = 005},{name = 'Katy', timestamp = 020},
        {name = 'Gere', timestamp = 090},{name = 'Paul', timestamp = 888},
        {name = 'Gray', timestamp = 030},{name = 'Gere', timestamp = 091},
        {name = 'Gray', timestamp = 004},{name = 'Jade', timestamp = 177}}
        
      assert_true(_.isEqual(_.uniq(logs,false,function(i,people)
        return people.name
      end),{'Gray','Jade','Dave','Katy','Gere','Paul'}))
    end)    
    
    test('is aliased as "unique"', function()
      assert_equal(_.uniq,_.unique)
    end) 
    
  end)
  
  context('union',function()  
  
    test('returns the duplicate-free union of all passed-in arrays', function()   
      local a = {"a"}; local b = {1,2,3}; local c = {2,10}
      assert_true(_.isEqual(_.union(a,b,c),{'a',1,2,3,10}))
    end) 
    
    test('accepts nested arrays as well', function()   
      local a = {"a",{"b","c"}}; local b = {1,{2},3}; local c = {2,10}
      assert_true(_.isEqual(_.union(a,b,c),{'a','b','c',1,2,3,10}))
    end)     
    
  end)  
  
  context('intersection',function() 
  
    test('returns the intersection of all passed-in arrays', function()   
      local a = {1,3}; local b = {4,2,3}; local c = {2,3,10}
      assert_true(_.isEqual(_.intersection(a,b,c),{3}))
    end) 

    test('fails with nested arrays', function()   
      local a = {1,{3}}; local b = {4,2,3}; local c = {2,3,10}
      assert_true(_.isEqual(_.intersection(a,b,c),{}))
    end)  
    
  end)
  
  context('zip',function()  
    test('zips together values from different arrays sharing the same index', function()   
      local names = {'Bob','Alice','James'}; local ages = {22, 23}
      assert_true(_.isEqual(_.zip(names,ages),{{'Bob',22},{'Alice',23},{'James'}}))
    end)     
  end)  
  
  context('append',function()  
    test('appends two arrays together', function()
      assert_true(_.isEqual(_.append({1,2,3},{'a','b'}),{1,2,3,'a','b'}))
    end)    
  end)  
  
  context('range',function()  
  
    test('generate an arithmetic progression', function()
      assert_true(_.isEqual(_.range(1,5,1),{1,2,3,4,5}))
      assert_true(_.isEqual(_.range(-2,5,1),{-2,-1,0,1,2,3,4,5}))
      assert_true(_.isEqual(_.range(1,5,2),{1,3,5}))      
    end) 

    test('arg "step" default to 1 when no given', function()
      assert_true(_.isEqual(_.range(1,5),{1,2,3,4,5}))
    end) 

    test('when a limit cannot be reached via "step", returns an empty array', function()
      assert_true(_.isEqual(_.range(1,5,0),{}))
      assert_true(_.isEqual(_.range(1,5,-1),{}))
    end)

    test('handles real values as well', function()
      assert_true(_.isEqual(_.range(3.2,5,0.5),{3.2,3.7,4.2,4.7}))
    end) 

    test('when only one arg is passed, counts from 0', function()
      assert_true(_.isEqual(_.range(3),{0,1,2,3}))
    end)   

    test('is aliased as "count"', function()
      assert_equal(_.range,_.count)
    end)     
    
  end)  
  
  context('invert',function()
  
    test('switches key-values pairs', function()
      assert_true(_.isEqual(_.invert({1,2,3}),{1,2,3}))
      assert_true(_.isEqual(_.invert({'a','b','c'}),{a = 1,b = 2,c = 3}))
    end)    
    
    test('is aliased as "mirror"', function()
      assert_equal(_.invert,_.mirror)
    end)     
    
  end) 

  context('concat',function()  
    
    test('concatenates an array contents', function()
      assert_equal(_.concat({1,2,3,4}),'1234')
      assert_equal(_.concat({'a',1,0,1,'b'}),'a101b')
    end) 

    test('handles boolean values', function()
      assert_equal(_.concat({1,true,3,false}),'1true3false')
    end) 

    test('when arg "sep" is given, uses "sep" as a separator', function()
      assert_equal(_.concat({1,3,false,'A'},' '),'1 3 false A')
      assert_equal(_.concat({1,3,false,'A'},', '),'1, 3, false, A')
    end) 

    test('when args "i" and/or "j" are given, concats values within "i" and "j" indexes', function()
      assert_equal(_.concat({1,3,false,'A'},' ',2,3),'3 false')
      assert_equal(_.concat({1,3,false,'A'},', ',2,3),'3, false')
      assert_equal(_.concat({1,3,false,'A','K'},' ',2),'3 false A K')
    end)

    test('is aliased as "join"', function()
      assert_equal(_.concat,_.join)
    end)      
  
  end)  
  
end)