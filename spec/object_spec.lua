--require 'luacov'
local M = require 'moses'

context('Object functions specs', function()

  context('keys', function()
  
    test('collects a given object attributes',function()
      assert_true(M.isEqual(M.keys({1,2,3}),{1,2,3}))
      assert_true(M.isEqual(M.keys({4,5,6}),{1,2,3}))
      assert_true(M.same(M.keys({x = 1, y = 2, 3}),{'x','y',1}))
    end)
    
  end)
  
  context('values', function()
  
    test('collects an given object values',function()
      assert_true(M.isEqual(M.values({1,2,3}),{1,2,3}))
      assert_true(M.isEqual(M.values({4,5,6}),{4,5,6}))
      assert_true(M.same(M.values({x = 1, y = 2, 3}),{1,2,3}))
    end)
   
  end)
  
  context('path', function()
  
    test('return the value at a given path in object',function()
      local entity = {
        pos = {x = 1},
        engine = {
          left = {status = 'active'},
          right = {damage = 10}
        },
        boost = false
      }
      assert_equal(M.path(entity, 'pos','x'), 1)
      assert_equal(M.path(entity, 'engine','left','status'), 'active')
      assert_equal(M.path(entity, 'engine','right','damage'), 10)
      assert_equal(M.path(entity, 'boost'), false)
      assert_nil(M.path(entity, 'x'))
    end)
   
  end)   
	
  context('kvpairs', function()
  
    test('converts key-values pairs in object to array-list of k,v pairs',function()
			local obj = M.kvpairs({x = 1, y = 2, z = 3})
			table.sort(obj, function(a,b) return a[1] < b[1] end)
			assert_true(M.isEqual(obj[1],{'x',1}))
			assert_true(M.isEqual(obj[2],{'y',2}))
			assert_true(M.isEqual(obj[3],{'z',3}))
    end)
   
  end)  	
	
  context('toObj', function()
  
    test('converts an array-list of {k,v} pairs to an object',function()
			local obj = M.toObj({{'x',1},{'y',2},{'z',3}})
			assert_equal(obj.x,1)
			assert_equal(obj.y,2)
			assert_equal(obj.z,3)
    end)
   
  end)  	
  
  context('property', function()
  
    test('Returns a function that will return the key property of any passed-in object.',function()
			assert_equal(M.property('sin')(math), math.sin)
			assert_equal(M.property('find')(string), string.find)
			assert_equal(M.property('insert')(table), table.insert)
			assert_equal(M.property('yield')(coroutine), coroutine.yield)
    end)
   
  end)  	
  
  context('propertyOf', function()
  
    test('Returns a function which will return the value of an object property.',function()
			assert_equal(M.propertyOf(math)('cos'), math.cos)
			assert_equal(M.propertyOf(string)('char'), string.char)
			assert_equal(M.propertyOf(table)('remove'), table.remove)	
			assert_equal(M.propertyOf(M)('propertyOf'), M.propertyOf)	
    end)
   
  end)  	
  
	
  context('toBoolean', function()
  
    test('converts a value to a boolean',function()
      assert_true(type(M.toBoolean(true)) == 'boolean')
      assert_true(type(M.toBoolean(1)) == 'boolean')
      assert_true(type(M.toBoolean(false)) == 'boolean')
      assert_true(type(M.toBoolean(nil)) == 'boolean')
      assert_true(type(M.toBoolean({})) == 'boolean')
      assert_true(type(M.toBoolean(1/0)) == 'boolean')
      
      assert_true(M.toBoolean(true))
      assert_true(M.toBoolean(1))
      assert_false(M.toBoolean(false))
      assert_false(M.toBoolean(nil))
      assert_true(M.toBoolean({}))
      assert_true(M.toBoolean(1/0))      
    end)
  
  end)  
  
  context('extend', function()
  
    test('extends a destination objects with key-values a source object',function()
      assert_true(M.isEqual(M.extend({},{a = 'b'}),{a = 'b'}))
    end)
    
    test('source properties overrides destination properties',function()
      assert_true(M.isEqual(M.extend({a = 'a'},{a = 'b'}),{a = 'b'}))
    end)   

    test('leaves source object untouched',function()
      local source = {i = 'i'}
      assert_true(M.isEqual(M.extend({a = 'a'},source),{a = 'a',i = 'i'}))
      assert_true(M.isEqual(source,{i = 'i'}))
    end)

    test('can extend destination from multiple sources',function()
      local sourceA = {a = 'a'}; local sourceBC = {b = 'b', c = 'c'} 
      assert_true(M.isEqual(M.extend({},sourceA, sourceBC),{a = 'a', b = 'b', c = 'c'}))
    end) 

    test('extending from multiple source, latter properties overrides',function()
      local sourceA = {a = 'a'}; local sourceBC = {b = 'b', a = 'c'} 
      assert_true(M.isEqual(M.extend({},sourceA, sourceBC),{a = 'c', b = 'b'}))
    end)     
    
    test('will not copy nil values',function()
      local sourceA = {a = nil}; local sourceBC = {b = 'b', c = nil} 
      assert_true(M.isEqual(M.extend({},sourceA, sourceBC),{b = 'b'}))
    end)    
  end)
  
  context('functions', function()

    test('collects function names within an object',function()
      local x = {}
      function x.a() return end; function x.b() return end    
      assert_true(M.isEqual(M.functions(x),{'a','b'}))
    end)
    
    test('collects metatable functions if "recurseMt" arg is supplied',function()
      local x = {} ; x.__index = x
      function x.a() return end; function x.b() return end
      local xx = setmetatable({},x)
      function xx.c() return end
      assert_true(M.same(M.functions(xx),{'c'}))
      assert_true(M.same(M.functions(xx,true),{'a','b','c'}))
    end)

    test('when given no obj as argument, returns all library functions',function()
      local functions = M.functions()
      M.each(functions, function(v)
        assert_true(M.isFunction(M[v]))
      end)
    end)
    
  end)  
  
  context('clone', function()
  
    test('clones the attributes of an object',function()
      local vector = {x = 0, y = 0}
      assert_true(M.isEqual(M.clone(vector),vector))
    end)
    
    test('By default, cloning is deep (clones nested tables)',function()
      local particle = {position = {x = 0,y=0},mass = 1}
      local particle_clone = M.clone (particle)
      assert_true(M.isEqual(particle_clone,particle))
      particle_clone.position.x = 3
      assert_false(M.isEqual(particle_clone,particle))
    end)
 
    test('Unless "shallow" arg is provided',function()
      local particle = {position = {x = 0,y=0},mass = 1}
      local particle_clone = M.clone (particle,true)
      assert_true(M.isEqual(particle_clone,particle))
      particle_clone.position.x = 3
      assert_true(M.isEqual(particle_clone,particle))
    end) 
    
    test('Non objects are simply returned',function()
      assert_equal(M.clone(1),1)
      assert_equal(M.clone(false),false)
      assert_equal(M.clone(true),true)
      assert_equal(M.clone(nil),nil)
      assert_equal(M.clone('hello'),'hello')
      assert_equal(M.clone(print),print)
    end)     
    
  end)
  
  context('tap', function()
    
    test('tap-into a method chain', function()
      local t = {}
      local catchMax = function(k) t[#t+1] = M.max(k) end
      local catchMin = function(k) t[#t+1] = M.min(k) end
      
      M.chain({1,2,3})
        :map(function(j) return j*2 end)
        :tap(catchMax)
        :map(function(k) return k^2 end)
        :tap(catchMin)
        :value()
        
      assert_equal(t[1],6)
      assert_equal(t[2],4)
    end)
  
  end)

  context('has', function()
  
    test('checks if an object has an attribute',function()
      assert_true(M.has(M,'has'))
      assert_true(M.has(table,'concat'))
      assert_true(M.has(string,'format'))
      assert_true(M.has(os,'time'))
      assert_true(M.has(math,'random'))
    end)
    
  end) 
  
  context('pick', function()
  
    test('collect specified properties',function()
      local object = {a = 1, b = 2, c = 3}
      assert_true(M.isEqual(M.pick(object,'a','c'),{a = 1, c = 3}))
    end)
    
    test('given args can be nested as well',function()
      local object = {a = 1, b = 2, c = 3}
      assert_true(M.isEqual(M.pick(object,{{'b','a'}},'c'),{a = 1,b = 2, c = 3}))
    end)

    test('will ignore properties the object do not have',function()
      local object = {a = 1, b = 2, c = 3}
      assert_true(M.isEqual(M.pick(object,{{'k'}},'c'),{c = 3}))
    end) 

    test('returns an empty table when given no properties to pick',function()
      local object = {a = 1, b = 2, c = 3}
      assert_true(M.isEqual(M.pick(object),{}))
    end)  

    test('should also pick attributes having falsy values',function()
      local object = {a = false, b = false, c = true}
      assert_true(M.isEqual(M.pick(object,'a','b'),{a = false,b = false}))
    end)  
    
  end)  
  
  context('omit', function()
  
    test('collect all properties leaving those given as args',function()
      local object = {a = 1, b = 2, c = 3}
      assert_true(M.isEqual(M.omit(object,'a','c'),{b=2}))
    end)
    
    test('given args can be nested as well',function()
      local object = {a = 1, b = 2, c = 3}
      assert_true(M.isEqual(M.omit(object,{{'b'}},'c'),{a = 1}))
    end)

    test('will ignore properties the object do not have',function()
      local object = {a = 1, b = 2, c = 3}
      assert_true(M.isEqual(M.omit(object,{{'k'}},'c'),{a = 1, b=2}))
    end) 

    test('returns the original object clone when given no properties to omit',function()
      local object = {a = 1, b = 2, c = 3}
      assert_true(M.isEqual(M.omit(object),{a = 1, b = 2, c = 3}))
    end)
    
  end)
  
  context('template', function()
  
    test('applies a template on an object',function()
      assert_true(M.isEqual(M.template({},{a = 1, b = 2, c = 3}),{a = 1, b = 2, c = 3}))
    end)
    
    test('does not override existing properies',function()
      assert_true(M.isEqual(M.template({a = 10, b = 10},{a = 1, b = 2, c = 3}),{a = 10, b = 10, c = 3}))
    end)

    test('returns the object when given no template arg',function()
      assert_true(M.isEqual(M.template({a = 10, b = 10}),{a = 10, b = 10}))
    end)
    
  end) 

  context('isEqual', function()
  
    test('compares values',function()
      assert_true(M.isEqual(1,1))
      assert_true(M.isEqual(1.0,1))
      assert_false(M.isEqual(1,2))
      assert_false(M.isEqual(2,2.0001))
    end)
    
    test('compares objects by reference and components',function()
      local oldprint = print
      assert_true(M.isEqual(print,oldprint))
      
      local t = {}
      local v = t
      assert_true(M.isEqual(t,v))
      assert_true(M.isEqual({},{}))
      
      assert_false(M.isEqual('a','b'))
      
      assert_false(M.isEqual(true, false))
      assert_false(M.isEqual(nil, false))
      assert_false(M.isEqual(true, nil))       
    
    end)

    test('compares nested properties',function()
      assert_true(M.isEqual({x = 0,{x1 = 0,{x2 =0}}}, {x = 0,{x1 = 0,{x2 =0}}}))
      assert_false(M.isEqual({x = 0,{x1 = 0,{x2 =0}}}, {x = 0,{x1 = 0,{x2 =1}}}))
    end)

    test('can compare tables on the basis of their metatable',function()
      local a, b = {x = 1, y = 2}, {x = 2, y = 1}
      setmetatable(a,{__eq = function(a,b) return (a.x and b.x and a.y and b.y)~=nil end})
      assert_false(M.isEqual(a, b))
      assert_true(M.isEqual(a, b, true))
    end)
  
    
  end)

  context('result', function()
  
    test('calls an object method, passing it as a first arg the object itself',function()
     assert_equal(M.result('a','len'),1)
     assert_equal(M.result('hello','reverse'),'olleh')
     assert_equal(M.result({'a','b','c'},table.concat),'abc')
    end)
    
    test('handles extra-args to be passed to the so-called method',function()
     assert_equal(M.result('Hello','match','%u'),'H')
     assert_equal(M.result({'a','b','c'},table.concat,' '),'a b c')
    end)    
    
    test('returns the property itself if not callable',function()
     assert_equal(M.result({size = 0},'size'),0)
    end)
     
  end)

  context('isTable', function()
  
    test('returns "true" if arg is table or array',function()
      assert_true(M.isTable({}))
      assert_true(M.isTable({1,2}))
      assert_true(M.isTable({x = 1, 2}))
      assert_true(M.isTable(string))
      assert_true(M.isTable(table))
      assert_true(M.isTable(math))
      
    end)
    
    test('returns "false" otherwise',function()
      assert_false(M.isTable(1))
      assert_false(M.isTable(''))
      assert_false(M.isTable(function() end))
      assert_false(M.isTable(print))
      assert_false(M.isTable(false))
      assert_false(M.isTable(nil))
      assert_false(M.isTable(true))      
    end)
    
  end) 

  context('isCallable', function()
  
    test('returns "true" if arg is callable',function()
      assert_true(M.isCallable(print))
      assert_true(M.isCallable(function() end))
      assert_true(M.isCallable(string.gmatch))
      assert_true(M.isCallable(setmetatable({},{__index = string}).upper))      
      assert_true(M.isCallable(setmetatable({},{__call = function() return end})))      
    end)
    
    test('returns "false" otherwise',function()
      assert_false(M.isCallable(1))
      assert_false(M.isCallable(''))
      assert_false(M.isCallable({}))
      assert_false(M.isCallable(false))
      assert_false(M.isCallable(nil))
      assert_false(M.isCallable(true))      
    end)
    
  end) 

  context('isArray', function()
  
    test('returns "true" if arg is an array',function()
      assert_true(M.isArray({}))
      assert_true(M.isArray({1,2,3}))
      assert_true(M.isArray({'a','b','c',{}}))
      assert_true(M.isArray({false,true}))
      assert_true(M.isArray({1,nil}))
    end)
   
    test('returns "false" otherwise',function()
      assert_false(M.isArray(1))
      assert_false(M.isArray(''))
      assert_false(M.isArray(false))
      assert_false(M.isArray(nil))
      assert_false(M.isArray(true))      
      assert_false(M.isArray(print))
      assert_false(M.isArray({a = 1, x = 1}))
      assert_false(M.isArray({a = 1, 1, 2,3}))
      assert_false(M.isArray({1,nil,2}))
      assert_false(M.isArray({1,nil,3,k=4}))
      assert_false(M.isArray({a=1}))
    end)   
   
    test('returns false on "sparse arrays"',function()
      assert_false(M.isArray({[1] = true, [10] = false}))
   end)   
  
  end)
  
  context('isIterable', function()
  
    test('checks if the given object is iterable with pairs',function()
      assert_true(M.isIterable({}))
      assert_false(M.isIterable(function() end))
      assert_false(M.isIterable(false))
      assert_false(M.isIterable(1))
    end)
    
  end)  
     
  context('isEmpty', function()
  
    test('returns "true" if arg is an empty array',function()
      assert_true(M.isEmpty({}))      
    end)
    
    test('returns "false" otherwise',function()
      assert_false(M.isEmpty({1,2,3}))
      assert_false(M.isEmpty({'a','b','c',{}}))
      assert_false(M.isEmpty({nil,false,true}))
    end)

    test('booleans, nil and functions are considered empty',function()
      assert_true(M.isEmpty(print))
      assert_true(M.isEmpty(nil))
      assert_true(M.isEmpty(false))
      assert_true(M.isEmpty(true))
    end)
    
    test('handles strings',function()
      assert_true(M.isEmpty(''))
      assert_false(M.isEmpty('a'))
      assert_false(M.isEmpty('bcd'))
      assert_false(M.isEmpty(' '))
    end)  
    
  end) 

  context('isString', function()
  
    test('returns "true" if arg is a string',function()
      assert_true(M.isString(''))
      assert_true(M.isString('a'))
      assert_true(M.isString(' '))
      assert_true(M.isString(type(nil)))
    end)
    
    test('returns "false" otherwise',function()
      assert_false(M.isString(false))
      assert_false(M.isString(print))
      assert_false(M.isString(nil))
      assert_false(M.isString(true))
      assert_false(M.isString({}))
    end)
    
  end)

  context('isFunction', function()
  
    test('returns "true" if arg is a function',function()
      assert_true(M.isFunction(print))
      assert_true(M.isFunction(string.match))
      assert_true(M.isFunction(function() end))
    end)

    test('returns "false" otherwise',function()
      assert_false(M.isFunction({}))
      assert_false(M.isFunction(nil))
      assert_false(M.isFunction(false))
      assert_false(M.isFunction(true))
      assert_false(M.isFunction('a'))
    end)    
    
  end)
  
  context('isNil', function()
  
    test('returns "true" if arg is nil',function()
      assert_true(M.isNil(nil))
      assert_true(M.isNil())
      assert_true(M.isNil(a))
    end)
    
    test('returns "false" otherwise',function()
      assert_false(M.isNil(false))
      assert_false(M.isNil(true))
      assert_false(M.isNil(table))
      assert_false(M.isNil(function() end))
      assert_false(M.isNil('a'))
    end)     
    
  end) 

  context('isNumber', function()
  
    test('returns "true" if arg is a number',function()
      assert_true(M.isNumber(1))
      assert_true(M.isNumber(0.5))
      assert_true(M.isNumber(math.pi))
      assert_true(M.isNumber(1/0))
      assert_true(M.isNumber(math.huge))
      assert_true(M.isNumber(0/0))
    end)
    
    test('returns "false" otherwise',function()
      assert_false(M.isNumber(print))
      assert_false(M.isNumber(nil))
      assert_false(M.isNumber(true))
      assert_false(M.isNumber(false))
      assert_false(M.isNumber({1}))
      assert_false(M.isNumber('1'))
    end)    
    
  end)

  context('isNaN', function()
  
    test('returns "true" if arg is NaN',function()
      assert_true(M.isNaN(0/0))  
    end)
    
    test('returns "false" for not NaN values',function()
      assert_false(M.isNaN(1/0))  
      assert_false(M.isNaN(math.huge))
      assert_false(M.isNaN(math.pi))
      assert_false(M.isNaN(1))
      assert_false(M.isNaN(''))
      assert_false(M.isNaN('0'))
      assert_false(M.isNaN({}))
      assert_false(M.isNaN(nil))
      assert_false(M.isNaN(false))
      assert_false(M.isNaN(true))
    end)    
    
  end) 
  
  context('isFinite', function()
  
    test('returns "true" if arg is a finite number',function()
      assert_true(M.isFinite(1))
      assert_true(M.isFinite(0))
      assert_true(M.isFinite(math.pi))
      assert_true(M.isFinite(99e99))
    end)
    
    test('returns "false" otherwise',function()
      assert_false(M.isFinite(math.huge))
      assert_false(M.isFinite(1/0))
      assert_false(M.isFinite(0/0))
    end) 

    test('returns "false" for non-numbers',function()
      assert_false(M.isFinite(''))
      assert_false(M.isFinite(function() end))
      assert_false(M.isFinite({}))
    end)    
    
  end)

  context('isBoolean', function()
 
    test('returns "true" if arg is a boolean or a thruthy statement',function()
      assert_true(M.isBoolean(true))
      assert_true(M.isBoolean(false))
      assert_true(M.isBoolean(1==1))
      assert_true(M.isBoolean(print==tostring))     
    end)
    
    test('returns "false" otherwise',function()
      assert_false(M.isBoolean(''))
      assert_false(M.isBoolean(nil))
      assert_false(M.isBoolean({}))
      assert_false(M.isBoolean(function() end))

      assert_false(M.isBoolean(0))
      assert_false(M.isBoolean('1'))
    end)    
    
  end)
  
  context('isInteger', function()
  
    test('returns "true" if arg is a integer, "false" otherwise',function()
      assert_true(M.isInteger(1))
      assert_true(M.isInteger(0))
      assert_false(M.isInteger(math.pi))
      assert_true(M.isInteger(1/0))
      assert_true(M.isInteger(math.huge))
      assert_false(M.isInteger(0/0))
    end)  
    
  end)
  
end)