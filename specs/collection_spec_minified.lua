_G._ = require 'moses_min'

context('Collection functions specs', function()

  context('each', function()
  
    test('provides values and iteration count ', function()
      local t = {1,2,3}
      local inc = 0
      _.each(t,function(i,v)
        inc = inc+1
        assert_equal(i,inc)
        assert_equal(t[i],v)
      end)
    end)  
  
    test('can reference the given table', function()
      local t = {1,2,3}
      _.each(t,function(i,v,mul)
        t[i] = v*mul
      end,5)
      assert_true(_.isEqual(t,{5,10,15}))
    end)
    
    test('iterates over non-numeric keys and objects', function()
      local t = {one = 1, two = 2, three = 3}
      local copy = {}
      _.each(t,function(i,v) copy[i] = v end)
      assert_true(_.isEqual(t,copy))
    end)    
 
    test('is aliased as "forEach"', function()
      assert_equal(_.each,_.forEach)
    end) 
    
  end)  
  
  context('map', function()
  
    test('applies an iterator function over each key-value pair ', function()
      assert_true(_.isEqual(_.map({1,2,3},function(i,v) 
          return v+10 
        end),{11,12,13}))
    end)

    test('iterates over non-numeric keys and objects', function()
      assert_true(_.isEqual(_.map({a = 1, b = 2},function(k,v) 
          return k..v 
        end),{a = 'a1',b = 'b2'}))
    end)
    
    test('is aliased as "collect"', function()
      assert_equal(_.map,_.collect)
    end)    
  
  end)
  
  context('reduce', function()
  
    test('folds a collection (left to right) from an initial state', function()
      assert_equal(_.reduce({1,2,3,4},function(memo,v) return memo+v end,0),10)
    end)
    
    test('initial state defaults to the first value when not given', function()
      assert_equal(_.reduce({'a','b','c'},function(memo,v) return memo..v end),'abc')
    end)    

    test('is aliased as "inject"', function()
      assert_equal(_.reduce,_.inject)
    end) 

    test('is aliased as "foldl"', function()
      assert_equal(_.reduce,_.foldl)
    end)      
  
  end)
  
  context('reduceRight', function()
  
    test('folds a collection (right to left) from an initial state', function()
      assert_equal(_.reduceRight({1,2,4,16},function(memo,v) return memo/v end,256),2)
    end)
    
    test('initial state defaults to the first value when not given', function()
      assert_equal(_.reduceRight({'a','b','c'},function(memo,v) return memo..v end),'cba')
    end)    

    test('is aliased as "injectr"', function()
      assert_equal(_.reduceRight,_.injectr)
    end) 

    test('is aliased as "foldr"', function()
      assert_equal(_.reduceRight,_.foldr)
    end)      
  
  end)

  context('mapReduce', function()
  
    test('folds a collection (left to right) saving intermediate states', function()
      assert_true(_.isEqual(_.mapReduce({1,2,4,16},function(memo,v) 
          return memo*v 
        end,0),{0,0,0,0}))
    end)
    
    test('initial state defaults to the first value when not given', function()
      assert_true(_.isEqual(_.mapReduce({'a','b','c'},function(memo,v) 
          return memo..v 
        end),{'a','ab','abc'}))
    end)    

    test('is aliased as "mapr"', function()
      assert_equal(_.mapReduce,_.mapr)
    end)      
  
  end)

  context('mapReduceRight', function()
  
    test('folds a collection (right to left) saving intermediate states', function()
      assert_true(_.isEqual(_.mapReduceRight({1,2,4,16},function(memo,v) 
          return memo/v 
        end,256),{16,4,2,2}))
    end)
    
    test('initial state defaults to the first value when not given', function()
      assert_true(_.isEqual(_.mapReduceRight({'a','b','c'},function(memo,v) 
          return memo..v 
        end),{'c','cb','cba'}))
    end)    

    test('is aliased as "maprr"', function()
      assert_equal(_.mapReduceRight,_.maprr)
    end)      
  
  end)  

  context('include', function()
  
    test('looks for a value in a collection, returns true when found', function()
      assert_true(_.include({6,8,10,16,29},16))
    end)
    
    test('returns false when value was not found', function()
      assert_false(_.include({6,8,10,16,29},1))
    end)
    
    test('can lookup for a object', function()
      assert_true(_.include({6,{18,{2,6}},10,{18,{2,{3}}},29},{18,{2,{3}}}))
    end)    
    
    test('given an iterator, return the first value passing a truth test', function()
      assert_true(_.include({'a','B','c'}, function(array_value)
        return (array_value:upper() == array_value)
      end))
    end)    

    test('is aliased as "any"', function()
      assert_equal(_.include,_.any)
    end)      

    test('is aliased as "some"', function()
      assert_equal(_.include,_.some)
    end)     
  
  end)  
    
  context('detect', function()
  
    test('looks for the first occurence of value, returns the key where it was found', function()
      assert_equal(_.detect({6,8,10,16},8),2)
    end)
    
    test('returns nil when value was not found', function()
      assert_nil(_.detect({nil,true,0,true,true},false))
    end)
    
    test('can lookup for a object', function()
      assert_equal(_.detect({6,{18,{2,6}},10,{18,{2,{3}}},29},{18,{2,6}}),2)
    end)    
    
    test('given an iterator, return the key of the first value passing a truth test', function()
      assert_equal(_.detect({'a','B','c'}, function(array_value)
        return (array_value:upper() == array_value)
      end),2)
    end)    

    test('is aliased as "where"', function()
      assert_equal(_.detect,_.where)
    end)      

    test('is aliased as "find"', function()
      assert_equal(_.detect,_.find)
    end)     
  
  end) 
  
  context('select', function()
  
    test('collects all values passing a truth test with an iterator', function()
      assert_true(_.isEqual(_.select({1,2,3,4,5,6,7}, function(key,value) 
          return (value%2==0)
        end),{2,4,6}))
        
      assert_true(_.isEqual(_.select({1,2,3,4,5,6,7}, function(key,value) 
          return (value%2~=0)
        end),{1,3,5,7}))        
    end)

    test('is aliased as "filter"', function()
      assert_equal(_.select,_.filter)
    end)      
    
  end) 
   
  context('reject', function()
  
    test('collects all values failing a truth test with an iterator', function()
      assert_true(_.isEqual(_.reject({1,2,3,4,5,6,7}, function(key,value) 
          return (value%2==0)
        end),{1,3,5,7}))
        
      assert_true(_.isEqual(_.reject({1,2,3,4,5,6,7}, function(key,value) 
          return (value%2~=0)
        end),{2,4,6}))        
    end)

    test('is aliased as "discard"', function()
      assert_equal(_.reject,_.discard)
    end)      
    
  end) 
    
  context('all', function()
  
    test('returns whether all elements matches a truth test', function()
      assert_true(_.all({2,4,6}, function(key,value) 
          return (value%2==0)
        end))
        
      assert_false(_.all({false,true,false}, function(key,value) 
          return value == false
        end))        
    end)
   
    test('is aliased as "every"', function()
      assert_equal(_.all,_.every)
    end)      
    
  end) 
 
  context('invoke', function()
  
    test('calls an iterator over each object, passing it as a first arg', function()
      assert_true(_.isEqual(_.invoke({'a','bea','cdhza'},string.len),
        {1,3,5}))

      assert_true(_.isEqual(_.invoke({{2,3,2},{13,8,10},{0,-5}},_.sort),
        {{2,2,3},{8,10,13},{-5,0}}))         
    end)
   
    test('given a string, calls the matching object property the same way', function()
      local a = {}; function a:call() return self end
      local b, c, d = {}, {}, {}
      b.call, c.call, d.call = a.call, a.call, a.call
      assert_true(_.isEqual(_.invoke({a,b,c,d},'call'),
        {a,b,c,d}))        
    end)      
    
  end) 

  context('pluck', function()
  
    test('fetches a property value in a collection of objects', function()
    
      local peoples = {
        {name = 'John', age = 23},{name = 'Peter', age = 17},
        {name = 'Steve', age = 15},{age = 33}}
        
      assert_true(_.isEqual(_.pluck(peoples,'age'),
        {23,17,15,33}))
      assert_true(_.isEqual(_.pluck(peoples,'name'),
        {'John','Peter','Steve'}))
        
    end)
   
  end) 
   
  context('max', function()
  
    test('returns the maximum targetted property value in a collection of objects', function()    
      local peoples = {
        {name = 'John', age = 23},{name = 'Peter', age = 17},
        {name = 'Steve', age = 15},{age = 33}}        
      assert_equal(_.max(_.pluck(peoples,'age')),33)
      assert_equal(_.max(peoples,function(people) return people.age end),33)        
    end)
    
    test('directly compares items when given no iterator', function()
        assert_equal(_.max({'a','b','c'}),'c')        
    end)    
   
  end) 

  context('min', function()
  
    test('returns the maximum targetted property value in a collection of objects', function()    
      local peoples = {
        {name = 'John', age = 23},{name = 'Peter', age = 17},
        {name = 'Steve', age = 15},{age = 33}}        
      assert_equal(_.min(_.pluck(peoples,'age')),15)
      assert_equal(_.min(peoples,function(people) return people.age end),15)        
    end)
    
    test('directly compares items when given no iterator', function()
        assert_equal(_.min({'a','b','c'}),'a')        
    end)    
  
  end)
  
  context('shuffle', function()
  
    test('shuffles values and objects in a collection', function()    
      local values = {'a','b','c','d'}       
      assert_true(_.same(_.shuffle (values),values))
    end)
    
    test('can accept a seed value to init randomization', function()    
      local values = {'a','b','c','d'}
      local seed = os.time()
      assert_true(_.same(_.shuffle(values,seed),values))
    end)   

    test('shuffled table has the same elements in a different order', function()    
      local values = {'a','b','c','d'}
      assert_true(_.same(_.shuffle(values),values))
      assert_true(_.same(_.shuffle(values),values))
    end)   
  
  end)   

  context('same', function()
  
    test('returns whether all objects from both given tables exists in each other', function()    
      local a = {'a','b','c','d'}      
      local b = {'b','a','d','c'}      
      assert_true(_.same(a,b))
      b[#b+1] = 'e'
      assert_false(_.same(a,b))
    end)  
  
  end)   
   
  context('sort', function()
  
    test('sorts a collection with respect to a given comparison function', function()            
      assert_true(_.isEqual(_.sort({'b','a','d','c'}, function(a,b) 
          return a:byte() < b:byte() 
        end),{'a','b','c','d'}))
    end)

    test('uses "<" operator when no comparison function is given', function()            
      assert_true(_.isEqual(_.sort({'b','a','d','c'}),{'a','b','c','d'}))
    end)     
  
  end)   

  context('toArray', function()
  
    test('folds a list of args into a array', function()            
      assert_true(_.isEqual(_.toArray(1,2,8,'d','a',0),{1,2,8,'d','a',0}))
    end)
    
  end)   
  
  context('groupBy', function()
  
    test('splits a collection into subsets of items behaving the same', function()

      assert_true(_.isEqual(_.groupBy({0,1,2,3,4,5,6},function(i,value) 
          return value%2==0 and 'even' or 'odd'
        end),{even = {0,2,4,6},odd = {1,3,5}}))
        
      assert_true(_.isEqual(_.groupBy({0,'a',true, false,nil,b,0.5},function(i,value) 
          return type(value) 
        end),{number = {0,0.5},string = {'a'},boolean = {true,false}}))
        
      assert_true(_.isEqual(_.groupBy({'one','two','three','four','five'},function(i,value) 
          return value:len()
        end),{[3] = {'one','two'},[4] = {'four','five'},[5] = {'three'}}))
        
    end)     
  
  end)   

  context('countBy', function()
  
    test('splits a collection in subsets and counts items inside', function()

      assert_true(_.isEqual(_.countBy({0,1,2,3,4,5,6},function(i,value) 
          return value%2==0 and 'even' or 'odd'
        end),{even = 4,odd = 3}))
        
      assert_true(_.isEqual(_.countBy({0,'a',true, false,nil,b,0.5},function(i,value) 
          return type(value) 
        end),{number = 2,string = 1,boolean = 2}))
        
      assert_true(_.isEqual(_.countBy({'one','two','three','four','five'},function(i,value) 
          return value:len()
        end),{[3] = 2,[4] = 2,[5] = 1}))
        
    end)     
  
  end)   

  context('size', function()
  
    test('counts the very number of objects in a collection', function()      
      assert_equal(_.size {1,2,3},3)        
    end)
    
    test('counts nested tables elements as a unique value', function()      
      assert_equal(_.size {1,2,3,{4,5}},4)        
    end)

    test('leaves nil values', function()      
      assert_equal(_.size {1,2,3,nil,8},4)        
    end)
    
    test('counts objects', function()      
      assert_equal(_.size {one = 1,2,b = 3, [{}] = 'nil', 'c', [function() end] = 'foo'},6)   
    end)
    
    test('returns the size of the first arg when it is a table', function()      
      assert_equal(_.size ({1,2},3,4,5),2)   
    end)    

    test('counts the number of args when the first one is not a table', function()      
      assert_equal(_.size (1,3,4,5),4)
    end)  
 
    test('handles nil', function()      
      assert_equal(_.size(),0)
      assert_equal(_.size(nil),0)
    end)
  
  end)   

  context('containsKeys', function()
  
    test('returns whether a table has all the keys from a given list', function()      
      assert_true(_.containsKeys({1,2,3},{1,2,3}))
      assert_true(_.containsKeys({x = 1, y = 2},{x = 1,y =2}))
    end)
    
    test('does not compare values', function()      
      assert_true(_.containsKeys({1,2,3},{4,5,6}))
      assert_true(_.containsKeys({x = 1, y = 2},{x = 4,y = -1}))
    end)

    test('is not commutative', function()      
      assert_true(_.containsKeys({1,2,3,4},{4,5,6}))      
      assert_true(_.containsKeys({x = 1, y = 2,z = 5},{x = 4,y = -1}))
      assert_false(_.containsKeys({1,2,3},{4,5,6,7}))
      assert_false(_.containsKeys({x = 1, y = 2},{x = 4,y = -1,z = 0}))
    end)
    
  end) 

  context('sameKeys', function()
  
    test('returns whether both tables features the same keys', function()      
      assert_true(_.sameKeys({1,2,3},{1,2,3}))
      assert_true(_.sameKeys({x = 1, y = 2},{x = 1,y =2}))
    end)
    
    test('does not compare values', function()      
      assert_true(_.sameKeys({1,2,3},{4,5,6}))
      assert_true(_.sameKeys({x = 1, y = 2},{x = 4,y = -1}))
    end)

    test('is commutative', function()      
      assert_true(_.sameKeys({1,2,3,4},{4,5,6}))      
      assert_true(_.sameKeys({x = 1, y = 2,z = 5},{x = 4,y = -1}))
      assert_true(_.sameKeys({1,2,3},{4,5,6,7}))
      assert_true(_.sameKeys({x = 1, y = 2},{x = 4,y = -1,z = 0}))
    end)
    
  end) 
   
end)