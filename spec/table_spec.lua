require 'luacov'
local M = require 'moses'

describe('Table functions specs', function()

  describe('clear', function()
	
		it('', function()
			local t = M.clear({'a', true, 'hello'})
			assert.is_true(M.isEqual(t,{}))
			assert.is_nil(next(t))
		end)
	
	end)
	
	describe('each', function()

		it('provides values and iteration count ', function()
		  local t = {4,2,1}
		  local inc = 0
		  M.each(t,function(v, i)
			inc = inc+1
			assert.equal(i,inc)
			assert.equal(t[i],v)
		  end)
		end)  
	  
		it('can reference the given table', function()
		  local t = {1,2,3}
      local mul = 5
		  M.each(t,function(v,i)
			t[i] = v*mul
		  end)
		  assert.is_true(M.isEqual(t,{5,10,15}))
		end)
		
		it('iterates over non-numeric keys and objects', function()
		  local t = {one = 1, two = 2, three = 3}
		  local copy = {}
		  M.each(t,function(v,i) copy[i] = v end)
		  assert.is_true(M.isEqual(t,copy))
		end)

	end)  

  describe('eachi', function()
  
    it('provides values and iteration count for integer keys only, in a sorted way', function()
      local t = {4,2,1}
      local inc = 0
      M.eachi(t,function(v,i)
        inc = inc+1
        assert.equal(i,inc)
        assert.equal(t[i],v)
      end)
    end)  

    it('ignores non-integer keys', function()
      local t = {a = 1, b = 2, [0] = 1, [-1] = 6, 3, x = 4, 5}
      local rk = {-1, 0, 1, 2}
      local rv = {6, 1, 3, 5}
      local inc = 0
      M.eachi(t,function(v,i)
        inc = inc+1
        assert.equal(i,rk[inc])
        assert.equal(v,rv[inc])
      end)
    end)  
    
  end)  
 
  describe('at', function()
  
    it('returns an array of values at numeric keys', function()
      local t = {4,5,6}
      local values = M.at(t,1,2,3)
      assert.is_true(M.isEqual(values, t))
      
      local t = {a = 4, bb = true, ccc = false}
      local values = M.at(t,'a', 'ccc')
      assert.is_true(M.isEqual(values, {4, false}))       
    end)
    
  end)
  
  describe('adjust', function()
  
    it('adjusts a given value in a table using a function', function()
      local double = function(v) return v * 2 end
      local t = {1,2,3}
      assert.is_true(M.isEqual(M.adjust(t,1,double),{2,2,3}))
      assert.is_true(M.isEqual(M.adjust(t,2,double),{1,4,3}))
      assert.is_true(M.isEqual(M.adjust(t,3,double),{1,2,6}))
    end)
    
    it('adjusts a given value in a table using a value', function()
      local t = {1,2,3}
      assert.is_true(M.isEqual(M.adjust(t,1,5),{5,2,3}))
      assert.is_true(M.isEqual(M.adjust(t,2,-2),{1,-2,3}))
    end)
    
    it('throws an error if key is not found in table', function()
      local double = function(v) return v * 2 end
      local t = {x = 1}
      assert.error(function() M.adjust(t,'y', 2) end)
    end)    
    
  end)  
  
  describe('count', function()
    
    it('count the occurences of value in a list', function()
      assert.equal(M.count({1,1,2,3,3,3,2,4,3,2},1),2)
      assert.equal(M.count({1,1,2,3,3,3,2,4,3,2},2),3)
      assert.equal(M.count({1,1,2,3,3,3,2,4,3,2},3),4)
      assert.equal(M.count({1,1,2,3,3,3,2,4,3,2},4),1)
      assert.equal(M.count({1,1,2,3,3,3,2,4,3,2},5),0)
      assert.equal(M.count({false, false, true},false),2)
      assert.equal(M.count({false, false, true},true),1)
      assert.equal(M.count({{1,1},{1,1},{1,1},{2,2}},{1,1}),3)
      assert.equal(M.count({{1,1},{1,1},{1,1},{2,2}},{2,2}),1)    
    end)
    
    it('defaults to size when value is not given', function()
      assert.equal(M.count({1,1,2,3,3,3,2,4,3,2}),M.size({1,1,2,3,3,3,2,4,3,2}))
      assert.equal(M.count({false, false, true}),M.size({false, false, true}))  
    end)
  end)
  
  describe('countf', function()
    it('count the occurences of values passing an iterator test in a list', function()
      assert.equal(M.countf({1,2,3,4,5,6}, function(v) return v%2==0 end),3)
      assert.equal(M.countf({print, pairs, ipairs}, function(v) return type(v)=='function' end),3)
    end)
  end)
  
  describe('allEq', function()
  
    it('checks if all values are equal', function()
      assert.is_true(M.allEqual({1,1,1,1,1}, comp))
      assert.is_false(M.allEqual({1,1,2,1,1}, comp))

      local t1 = {1, 2, {3}}
      local t2 = {1, 2, {3}}
      assert.is_true(M.allEqual({t1, t2}))
    end)
    
    it('can use a custom comp function to compare values', function()
      local t1 = {x = 1, y = 0}
      local t2 = {x = 1, y = 0}
      local t3 = {x = 1, y = 2}
      local t4 = {x = 1, y = 2}
      local function compx(a, b) return a.x == b.x end
      local function compy(a, b) return a.y == b.y end

      assert.is_true(M.allEqual({t1, t2}, compx))
      assert.is_true(M.allEqual({t1, t2}, compy))
      assert.is_true(M.allEqual({t3, t4}, compx))
      assert.is_true(M.allEqual({t3, t4}, compy))
      assert.is_true(M.allEqual({t1, t2, t3, t4}, compx))
      assert.is_false(M.allEqual({t1, t2, t3, t4}, compy))
    end)
    
  end)
  
  describe('cycle', function()
    
    it('loops n times on a list', function()
      local times = 3
      local t = {1,2,3,4,5}
      local kv = {}
      for v,k in M.cycle(t,times) do
        assert.equal(t[k],v)
        kv[#kv+1] = v
      end
      for k,v in ipairs(kv) do
        assert.equal(M.count(kv,v),times)
      end
    end)
    
    it('support array-like and map-like tables', function()
      local times = 10
      local t = {x = 1, z = 2}
      local keys = {}
      local values = {}
      for v,k in M.cycle(t,times) do
        assert.equal(t[k],v)
        keys[#keys+1] = k
        values[#values+1] = v
      end
      for k,v in ipairs(keys) do
        assert.equal(M.count(keys,v),times)
      end
      for k,v in ipairs(values) do
        assert.equal(M.count(values,v),times)
      end      
    end)
    
    it('n defaults to 1, if not supplied', function()
      local t = {1,2,3,4,5}
      for v,k in M.cycle(t) do
        t[k] = v + 1
      end
      M.each(t, function(v, k)
        assert.equal(v, k + 1)
      end)
    end)   
    
    it('if n is negative or equal to 0, it does nothing', function()
      local t = {1,2,3,4,5}
      for v,k in M.cycle(t, 0) do
        t[k] = v + 1
      end
      for v,k in M.cycle(t, -2) do
        t[k] = v + 1
      end      
      M.each(t, function(v, k)
        assert.equal(v, k)
      end)
    end)     
  end)
  
  describe('map', function()
  
    it('applies an iterator function over each key-value pair ', function()
      assert.is_true(M.isEqual(M.map({1,2,3},function(v) 
          return v+10 
        end),{11,12,13}))
    end)

    it('iterates over non-numeric keys and objects', function()
      assert.is_true(M.isEqual(M.map({a = 1, b = 2},function(v,k) 
          return k..v 
        end),{a = 'a1',b = 'b2'}))
    end)

    it('maps key-value pairs to key-value pairs', function()
      assert.is_true(M.isEqual(M.map({a = 1, b = 2}, function(v, k)
          return k .. k, v + 10
        end), {aa = 11, bb = 12}))
    end)
    
  end)
  
  describe('mapi', function()
  
    it('applies an iterator function over each key-value pair ', function()
      assert.is_true(M.isEqual(M.mapi({1,2,3},function(v) 
          return v+10 
        end),{11,12,13}))
    end)

    it('iterates only on array values', function()
      assert.is_true(M.isEqual(M.mapi({a = 1, 2, 3, 4},function(v,k) 
          return k..v 
        end),{'12','23','34'}))
    end)
    
  end)
  
  describe('reduce', function()
  
    it('folds a collection (left to right) from an initial state', function()
      assert.equal(M.reduce({1,2,3,4},function(memo,v) return memo+v end,0),10)
    end)
    
    it('initial state defaults to the first value when not given', function()
      assert.equal(M.reduce({'a','b','c'},function(memo,v) return memo..v end),'abc')
    end)    
  
    it('supports arrays of booleans', function()
      assert.equal(M.reduce({true, false, true, true},function(memo,v) return memo and v end), false)
      assert.equal(M.reduce({true, true, true},function(memo,v) return memo and v end), true)
      assert.equal(M.reduce({false, false, false},function(memo,v) return memo and v end), false)
      assert.equal(M.reduce({false, false, true},function(memo,v) return memo or v end), true)
    end)
    
  end)
  
  describe('best', function()
    
    it('select the best candidate in a table', function()
      local words = {'Lua', 'Programming', 'Language'}      
      assert.equal(M.best(words, function(a,b) return #a > #b end), 'Programming')
      assert.equal(M.best(words, function(a,b) return #a < #b end), 'Lua')
    end)
    
  end)
	
  describe('reduceBy', function()
  
    it('folds a collection (left to right) for specific values', function()
			local function even(v) return v%2==0 end
			local function odd(v) return v%2~=0 end
      assert.equal(M.reduceBy({1,2,3,4},function(memo,v) return memo+v end,even,0), 6)
      assert.equal(M.reduceBy({1,2,3,4},function(memo,v) return memo+v end,odd,0), 4)
    end)
   
  end)	
  
  describe('reduceRight', function()
  
    it('folds a collection (right to left) from an initial state', function()
      assert.equal(M.reduceRight({1,2,4,16},function(memo,v) return memo/v end,256),2)
    end)
    
    it('initial state defaults to the first value when not given', function()
      assert.equal(M.reduceRight({'a','b','c'},function(memo,v) return memo..v end),'cba')
    end)
    
  end)

  describe('mapReduce', function()
  
    it('folds a collection (left to right) saving intermediate states', function()
      assert.is_true(M.isEqual(M.mapReduce({1,2,4,16},function(memo,v) 
          return memo*v 
        end,0),{0,0,0,0}))
    end)
    
    it('initial state defaults to the first value when not given', function()
      assert.is_true(M.isEqual(M.mapReduce({'a','b','c'},function(memo,v) 
          return memo..v 
        end),{'a','ab','abc'}))
    end)  
  
  end)

  describe('mapReduceRight', function()
  
    it('folds a collection (right to left) saving intermediate states', function()
      assert.is_true(M.isEqual(M.mapReduceRight({1,2,4,16},function(memo,v) 
          return memo/v 
        end,256),{16,4,2,2}))
    end)
    
    it('initial state defaults to the first value when not given', function()
      assert.is_true(M.isEqual(M.mapReduceRight({'a','b','c'},function(memo,v) 
          return memo..v 
        end),{'c','cb','cba'}))
    end)
    
  end)  

  describe('include', function()
  
    it('looks for a value in a collection, returns true when found', function()
      assert.is_true(M.include({6,8,10,16,29},16))
    end)
    
    it('returns false when value was not found', function()
      assert.is_false(M.include({6,8,10,16,29},1))
    end)
    
    it('can lookup for a object', function()
      assert.is_true(M.include({6,{18,{2,6}},10,{18,{2,{3}}},29},{18,{2,{3}}}))
    end)    
    
    it('given an iterator, return the first value passing a truth test', function()
      assert.is_true(M.include({'a','B','c'}, function(array_value)
        return (array_value:upper() == array_value)
      end))
    end) 
    
  end)  
    
  describe('detect', function()
  
    it('looks for the first occurence of value, returns the key where it was found', function()
      assert.equal(M.detect({6,8,10,16},8),2)
    end)
    
    it('returns nil when value was not found', function()
      assert.is_nil(M.detect({nil,true,0,true,true},false))
    end)
    
    it('can lookup for a object', function()
      assert.equal(M.detect({6,{18,{2,6}},10,{18,{2,{3}}},29},{18,{2,6}}),2)
    end)    
    
    it('given an iterator, return the key of the first value passing a truth test', function()
      assert.equal(M.detect({'a','B','c'}, function(array_value)
        return (array_value:upper() == array_value)
      end),2)
    end)   
  
  end) 
 
	describe('where', function()
	
    it('Returns all values in a list having all of a given set of properties', function()
      local set = {
				{a = 1, b = 2},
				{a = 2, b = 2},
				{a = 2, b = 4},
				{a = 3, b = 4}
			}
      assert.is_true(M.isEqual(M.where(set, {a = 2}), {set[2],set[3]}))
      assert.is_true(M.isEqual(M.where(set, {b = 4}), {set[3],set[4]}))
      assert.is_true(M.isEqual(M.where(set, {a = 2, b = 2}), {set[2]}))
    end)
    
    it('returns nil when value was not found', function()
      local set = {
				{a = 1, b = 2},
				{a = 2, b = 2},
			}
      assert.is_nil(M.where(set, {a = 3}))
      assert.is_nil(M.where(set, {b = 1}))
    end) 	
	
	end)
	
  describe('findWhere', function()
  
    it('Returns the first value in a list having all of a given set of properties', function()
      local a = {a = 1, b = 2}
      local b = {a = 2, b = 3}
      local c = {a = 3, b = 4}
      assert.equal(M.findWhere({a, b, c}, {a = 3, b = 4}), c)
    end)
    
    it('returns nil when value was not found', function()
      local a = {a = 1, b = 2}
      local b = {a = 2, b = 3}
      local c = {a = 3, b = 4}
      assert.is_nil(M.findWhere({a, b, c}, {a = 3, b = 0}))
    end) 
  
  end) 
   
  describe('select', function()
  
    it('collects all values passing a truth test with an iterator', function()
      assert.is_true(M.isEqual(M.select({7,6,5,4,3,2,1}, function(value) 
          return (value%2==0)
        end),{6,4,2}))
        
      assert.is_true(M.isEqual(M.select({7,6,5,4,3,2,1}, function(value) 
          return (value%2~=0)
        end),{7,5,3,1}))        
    end)
    
  end) 
   
  describe('reject', function()
  
    it('collects all values failing a truth test with an iterator', function()
      assert.is_true(M.isEqual(M.reject({7,6,5,4,3,2,1}, function(value) 
          return (value%2==0)
        end),{7,5,3,1}))
        
      assert.is_true(M.isEqual(M.reject({7,6,5,4,3,2,1}, function(value) 
          return (value%2~=0)
        end),{6,4,2}))        
    end)
    
  end) 
    
  describe('all', function()
  
    it('returns whether all elements matches a truth test', function()
      assert.is_true(M.all({2,4,6}, function(value) 
          return (value%2==0)
        end))
        
      assert.is_false(M.all({false,true,false}, function(value) 
          return value == false
        end))        
    end) 
    
  end) 
 
  describe('invoke', function()
  
    it('calls an iterator over each object, passing it as a first arg', function()
      assert.is_true(M.isEqual(M.invoke({'a','bea','cdhza'},string.len),
        {1,3,5}))

      assert.is_true(M.isEqual(M.invoke({{2,3,2},{13,8,10},{0,-5}},M.ary(M.sort,1)),
        {{2,2,3},{8,10,13},{-5,0}}))
        
      assert.is_true(M.isEqual(M.invoke({{x = 1, y = 2},{x = 3, y=4}},'x'), {1,3}))
    end)
   
    it('given a string, calls the matching object property the same way', function()
      local a = {}; function a:call() return self end
      local b, c, d = {}, {}, {}
      b.call, c.call, d.call = a.call, a.call, a.call
      assert.is_true(M.isEqual(M.invoke({a,b,c,d},'call'),
        {a,b,c,d}))        
    end)      
    
  end) 

  describe('pluck', function()
  
    it('fetches a property value in a collection of objects', function()
    
      local peoples = {
        {name = 'John', age = 23},{name = 'Peter', age = 17},
        {name = 'Steve', age = 15},{age = 33}}
        
      assert.is_true(M.isEqual(M.pluck(peoples,'age'),
        {23,17,15,33}))
      assert.is_true(M.isEqual(M.pluck(peoples,'name'),
        {'John','Peter','Steve'}))
        
    end)
   
  end) 
   
  describe('max', function()
  
    it('returns the maximum targetted property value in a collection of objects', function()    
      local peoples = {
        {name = 'John', age = 23},{name = 'Peter', age = 17},
        {name = 'Steve', age = 15},{age = 33}}        
      assert.equal(M.max(M.pluck(peoples,'age')),33)
      assert.equal(M.max(peoples,function(people) return people.age end),33)        
    end)
    
    it('directly compares items when given no iterator', function()
        assert.equal(M.max({'a','b','c'}),'c')        
    end)    
   
  end) 

  describe('min', function()
  
    it('returns the maximum targetted property value in a collection of objects', function()    
      local peoples = {
        {name = 'John', age = 23},{name = 'Peter', age = 17},
        {name = 'Steve', age = 15},{age = 33}}        
      assert.equal(M.min(M.pluck(peoples,'age')),15)
      assert.equal(M.min(peoples,function(people) return people.age end),15)        
    end)
    
    it('directly compares items when given no iterator', function()
        assert.equal(M.min({'a','b','c'}),'a')        
    end)    
  
  end)   

  describe('same', function()
  
    it('returns whether all objects from both given tables exists in each other', function()    
      local a = {'a','b','c','d'}      
      local b = {'b','a','d','c'}      
      assert.is_true(M.same(a,b))
      b[#b+1] = 'e'
      assert.is_false(M.same(a,b))
    end)  
  
  end)   
   
  describe('sort', function()
  
    it('sorts a collection with respect to a given comparison function', function()            
      assert.is_true(M.isEqual(M.sort({'b','a','d','c'}, function(a,b) 
          return a:byte() < b:byte() 
        end),{'a','b','c','d'}))
    end)

    it('uses "<" operator when no comparison function is given', function()            
      assert.is_true(M.isEqual(M.sort({'b','a','d','c'}),{'a','b','c','d'}))
    end)     
  
  end)
  
  describe('sortedk', function()
  
    it('iterates on sorted keys', function()            
      local tbl = {}; tbl[3] = 5 ; tbl[2] = 6; tbl[5] = 8; tbl[4] = 10; tbl[1] = 12
      local ok_tbl = {12, 6, 5, 10, 8}
      local sorted = {}
      for k, v in M.sortedk(tbl) do sorted[k] = v end
      for k in ipairs(sorted) do
        assert.equal(sorted[k], ok_tbl[k])
      end
    end)
    
    it('can take a comparison function', function()            
      local tbl = {}; tbl[3] = 5 ; tbl[2] = 6; tbl[5] = 8; tbl[4] = 10; tbl[1] = 12
      local ok_tbl = {8, 10, 5, 6, 12}
      local sorted = {}
      for k, v in M.sortedk(tbl, function(a, b) return a > b end) do 
        sorted[#sorted +1] = {k, v} 
      end
      for k, pr in ipairs(sorted) do
        assert.equal(pr[2], ok_tbl[k])
      end
    end)    

  end)
  
  describe('sortedv', function()
  
    it('iterates on sorted values', function()            
      local tbl = {}; tbl[3] = 5 ; tbl[2] = 6; tbl[5] = 8; tbl[4] = 10; tbl[1] = 12
      local ok_tbl = {5, 6, 8, 10, 12}
      local sorted = {}
      for k, v in M.sortedv(tbl) do sorted[#sorted + 1] = {k, v} end
      for k, pr in ipairs(sorted) do
        assert.equal(pr[2], ok_tbl[k])
      end
    end)
    
    it('can take a comparison function', function()            
      local tbl = {}; tbl[3] = 5 ; tbl[2] = 6; tbl[5] = 8; tbl[4] = 10; tbl[1] = 12
      local ok_tbl = {12, 10, 8, 6, 5}
      local sorted = {}
      for k, v in M.sortedv(tbl, function(a, b) return a > b end) do 
        sorted[#sorted +1] = {k, v} 
      end
      for k, pr in ipairs(sorted) do
        assert.equal(pr[2], ok_tbl[k])
      end
    end)   

  end)   

	describe('sortBy', function()
	
		it('sort values on the result of a transform function', function()
			assert.is_true(M.isEqual(M.sortBy({1,2,3,4,5}, math.sin), {5,4,3,1,2}))
		end)
		
		it('the transform function defaults to M.identity', function()
			assert.is_true(M.isEqual(M.sortBy({1,2,3,4,5}), {1,2,3,4,5}))
		end)

		it('transform function can be a string name property', function()
			local unsorted = {{item = 1, value = 10},{item = 2, value = 5},{item = 3, value = 8}}
			local sorted = {{item = 2, value = 5},{item = 3, value = 8},{item = 1, value = 10}}
			assert.is_true(M.isEqual(M.sortBy(unsorted, 'value'), sorted))
		end)
		
		it('can use a custom comparison function', function()
			local unsorted = {{item = 1, value = 10},{item = 2, value = 5},{item = 3, value = 8}}
			local sorted = {{item = 1, value = 10},{item = 3, value = 8},{item = 2, value = 5}}
			local function comp(a,b) return a > b end
			assert.is_true(M.isEqual(M.sortBy(unsorted, 'value', comp), sorted))
		end)		
	
	end)
  
  describe('groupBy', function()
  
    it('splits a collection into subsets of items behaving the same', function()

      assert.is_true(M.isEqual(M.groupBy({0,1,2,3,4,5,6},function(value) 
          return value%2==0 and 'even' or 'odd'
        end),{even = {0,2,4,6},odd = {1,3,5}}))
      assert.is_true(M.isEqual(M.groupBy({0,'a',true, false,nil,b,0.5},type),{number = {0,0.5},string = {'a'},boolean = {true,false}}))
      assert.is_true(M.isEqual(M.groupBy({'one','two','three','four','five'},string.len),{[3] = {'one','two'},[4] = {'four','five'},[5] = {'three'}}))
        
    end)
  
  end)   

  describe('countBy', function()
  
    it('splits a collection in subsets and counts items inside', function()

      assert.is_true(M.isEqual(M.countBy({0,1,2,3,4,5,6},function(value) 
          return value%2==0 and 'even' or 'odd'
        end),{even = 4,odd = 3}))
        
      assert.is_true(M.isEqual(M.countBy({0,'a',true, false,nil,b,0.5},type),{number = 2,string = 1,boolean = 2}))
        
      assert.is_true(M.isEqual(M.countBy({'one','two','three','four','five'},string.len),{[3] = 2,[4] = 2,[5] = 1}))
        
    end)     
  
  end)   

  describe('size', function()
  
    it('counts the very number of objects in a collection', function()      
      assert.equal(M.size {1,2,3},3)        
    end)
    
    it('counts nested tables elements as an unique value', function()      
      assert.equal(M.size {1,2,3,{4,5}},4)        
    end)

    it('leaves nil values', function()      
      assert.equal(M.size {1,2,3,nil,8},4)        
    end)
    
    it('counts objects', function()      
      assert.equal(M.size {one = 1,2,b = 3, [{}] = 'nil', 'c', [function() end] = 'foo'},6)   
    end)
    
    it('returns the size of the first arg when it is a table', function()      
      assert.equal(M.size ({1,2},3,4,5),2)   
    end)    

    it('counts the number of non-nil args when the first one is not a table', function()      
      assert.equal(M.size (1,3,4,5),4)
      assert.equal(M.size (nil,1,3,4,5),4)
      assert.equal(M.size (nil,1,3,4,nil,5),4)
    end)  
 
    it('handles nil', function()      
      assert.equal(M.size(),0)
      assert.equal(M.size(nil),0)
    end)

		
  end)   

  describe('containsKeys', function()
  
    it('returns whether a table has all the keys from a given list', function()      
      assert.is_true(M.containsKeys({1,2,3},{1,2,3}))
      assert.is_true(M.containsKeys({x = 1, y = 2},{x = 1,y =2}))
    end)
    
    it('does not compare values', function()      
      assert.is_true(M.containsKeys({1,2,3},{4,5,6}))
      assert.is_true(M.containsKeys({x = 1, y = 2},{x = 4,y = -1}))
    end)

    it('is not commutative', function()      
      assert.is_true(M.containsKeys({1,2,3,4},{4,5,6}))      
      assert.is_true(M.containsKeys({x = 1, y = 2,z = 5},{x = 4,y = -1}))
      assert.is_false(M.containsKeys({1,2,3},{4,5,6,7}))
      assert.is_false(M.containsKeys({x = 1, y = 2},{x = 4,y = -1,z = 0}))
    end)
    
  end) 

  describe('sameKeys', function()
  
    it('returns whether both tables features the same keys', function()      
      assert.is_true(M.sameKeys({1,2,3},{1,2,3}))
      assert.is_true(M.sameKeys({x = 1, y = 2},{x = 1,y =2}))
    end)
    
    it('does not compare values', function()      
      assert.is_true(M.sameKeys({1,2,3},{4,5,6}))
      assert.is_true(M.sameKeys({x = 1, y = 2},{x = 4,y = -1}))
    end)

    it('is commutative', function()      
      assert.is_false(M.sameKeys({1,2,3,4},{4,5,6}))      
      assert.is_false(M.sameKeys({x = 1, y = 2,z = 5},{x = 4,y = -1}))
      assert.is_false(M.sameKeys({1,2,3},{4,5,6,7}))
      assert.is_false(M.sameKeys({x = 1, y = 2},{x = 4,y = -1,z = 0}))
    end)
    
  end) 
   
end)
