require 'luacov'
local M = require 'moses'

describe('Object functions specs', function()

  describe('keys', function()
  
    it('collects a given object attributes',function()
      assert.is_true(M.isEqual(M.keys({1,2,3}),{1,2,3}))
      assert.is_true(M.isEqual(M.keys({4,5,6}),{1,2,3}))
      assert.is_true(M.same(M.keys({x = 1, y = 2, 3}),{'x','y',1}))
    end)
    
  end)
  
  describe('values', function()
  
    it('collects an given object values',function()
      assert.is_true(M.isEqual(M.values({1,2,3}),{1,2,3}))
      assert.is_true(M.isEqual(M.values({4,5,6}),{4,5,6}))
      assert.is_true(M.same(M.values({x = 1, y = 2, 3}),{1,2,3}))
    end)
   
  end)
  
  describe('path', function()
  
    it('return the value at a given path in object',function()
      local entity = {
        pos = {x = 1},
        engine = {
          left = {status = 'active'},
          right = {damage = 10}
        },
        boost = false
      }
      assert.equal(M.path(entity, 'pos','x'), 1)
      assert.equal(M.path(entity, 'engine','left','status'), 'active')
      assert.equal(M.path(entity, 'engine','right','damage'), 10)
      assert.equal(M.path(entity, 'boost'), false)
      assert.is_nil(M.path(entity, 'x'))
    end)
   
  end)   
	
  describe('spreadPath', function()
  
    it('spreads objects under property path',function()
      local obj = {a = 1, b = 2, c = {d = 3, e = 4, f = {g = 5}}}
      M.spreadPath(obj, 'c', 'f')
      assert.equal(obj.a, 1)
      assert.equal(obj.b, 2)
      assert.equal(obj.d, 3)
      assert.equal(obj.e, 4)
      assert.equal(obj.g, 5)
      assert.is_true(M.isEmpty(obj.c))
      assert.is_true(M.isEmpty(obj.c.f))
    end)
   
  end)
  
  describe('flattenPath', function()
  
    it('flattens objects under property path',function()
      local obj = {a = 1, b = 2, c = {d = 3, e = 4, f = {g = 5}}}
      M.flattenPath(obj, 'c', 'f') -- => {a = 1, b = 2, d = 3, e = 4, g = 5, c = {d = 3, e = 4, f = {g = 5}}}
      assert.equal(obj.a, 1)
      assert.equal(obj.b, 2)
      assert.equal(obj.d, 3)
      assert.equal(obj.e, 4)
      assert.equal(obj.g, 5)
      assert.equal(M.size(obj.c), 3)
      assert.equal(obj.c.d, 3)
      assert.equal(obj.c.e, 4)
      assert.equal(M.size(obj.c.f), 1)
      assert.equal(obj.c.f.g, 5)
    end)
   
  end)
  
  describe('kvpairs', function()
  
    it('converts key-values pairs in object to array-list of k,v pairs',function()
			local obj = M.kvpairs({x = 1, y = 2, z = 3})
			table.sort(obj, function(a,b) return a[1] < b[1] end)
			assert.is_true(M.isEqual(obj[1],{'x',1}))
			assert.is_true(M.isEqual(obj[2],{'y',2}))
			assert.is_true(M.isEqual(obj[3],{'z',3}))
    end)
   
  end)  	
	
  describe('toObj', function()
  
    it('converts an array-list of {k,v} pairs to an object',function()
			local obj = M.toObj({{'x',1},{'y',2},{'z',3}})
			assert.equal(obj.x,1)
			assert.equal(obj.y,2)
			assert.equal(obj.z,3)
    end)
   
  end)  	
  
  describe('invert',function()
  
    it('switches key-values pairs', function()
      assert.is_true(M.isEqual(M.invert({1,2,3}),{1,2,3}))
      assert.is_true(M.isEqual(M.invert({'a','b','c'}),{a = 1,b = 2,c = 3}))
      assert.is_true(M.isEqual(M.invert({x = 4, y = 2}),{[2]='y',[4]='x'}))
    end)     
    
  end) 
  
  describe('property', function()
  
    it('Returns a function that will return the key property of any passed-in object.',function()
			assert.equal(M.property('sin')(math), math.sin)
			assert.equal(M.property('find')(string), string.find)
			assert.equal(M.property('insert')(table), table.insert)
			assert.equal(M.property('yield')(coroutine), coroutine.yield)
    end)
   
  end)  	
  
  describe('propertyOf', function()
  
    it('Returns a function which will return the value of an object property.',function()
			assert.equal(M.propertyOf(math)('cos'), math.cos)
			assert.equal(M.propertyOf(string)('char'), string.char)
			assert.equal(M.propertyOf(table)('remove'), table.remove)	
			assert.equal(M.propertyOf(M)('propertyOf'), M.propertyOf)	
    end)
   
  end)  	
  
	
  describe('toBoolean', function()
  
    it('converts a value to a boolean',function()
      assert.is_true(type(M.toBoolean(true)) == 'boolean')
      assert.is_true(type(M.toBoolean(1)) == 'boolean')
      assert.is_true(type(M.toBoolean(false)) == 'boolean')
      assert.is_true(type(M.toBoolean(nil)) == 'boolean')
      assert.is_true(type(M.toBoolean({})) == 'boolean')
      assert.is_true(type(M.toBoolean(1/0)) == 'boolean')
      
      assert.is_true(M.toBoolean(true))
      assert.is_true(M.toBoolean(1))
      assert.is_false(M.toBoolean(false))
      assert.is_false(M.toBoolean(nil))
      assert.is_true(M.toBoolean({}))
      assert.is_true(M.toBoolean(1/0))      
    end)
  
  end)  
  
  describe('extend', function()
  
    it('extends a destination objects with key-values a source object',function()
      assert.is_true(M.isEqual(M.extend({},{a = 'b'}),{a = 'b'}))
    end)
    
    it('source properties overrides destination properties',function()
      assert.is_true(M.isEqual(M.extend({a = 'a'},{a = 'b'}),{a = 'b'}))
    end)   

    it('leaves source object untouched',function()
      local source = {i = 'i'}
      assert.is_true(M.isEqual(M.extend({a = 'a'},source),{a = 'a',i = 'i'}))
      assert.is_true(M.isEqual(source,{i = 'i'}))
    end)

    it('can extend destination from multiple sources',function()
      local sourceA = {a = 'a'}; local sourceBC = {b = 'b', c = 'c'} 
      assert.is_true(M.isEqual(M.extend({},sourceA, sourceBC),{a = 'a', b = 'b', c = 'c'}))
    end) 

    it('extending from multiple source, latter properties overrides',function()
      local sourceA = {a = 'a'}; local sourceBC = {b = 'b', a = 'c'} 
      assert.is_true(M.isEqual(M.extend({},sourceA, sourceBC),{a = 'c', b = 'b'}))
    end)     
    
    it('will not copy nil values',function()
      local sourceA = {a = nil}; local sourceBC = {b = 'b', c = nil} 
      assert.is_true(M.isEqual(M.extend({},sourceA, sourceBC),{b = 'b'}))
    end)    
  end)
  
  describe('functions', function()

    it('collects function names within an object',function()
      local x = {}
      function x.a() return end; function x.b() return end    
      assert.is_true(M.same(M.functions(x),{'a','b'}))
    end)
    
    it('collects metatable functions if "recurseMt" arg is supplied',function()
      local x = {} ; x.__index = x
      function x.a() return end; function x.b() return end
      local xx = setmetatable({},x)
      function xx.c() return end
      assert.is_true(M.same(M.functions(xx),{'c'}))
      assert.is_true(M.same(M.functions(xx,true),{'a','b','c'}))
    end)

    it('when given no obj as argument, returns all library functions',function()
      local functions = M.functions()
      M.each(functions, function(v)
        assert.is_true(M.isFunction(M[v]))
      end)
    end)
    
  end)  
  
  describe('clone', function()
  
    it('clones the attributes of an object',function()
      local vector = {x = 0, y = 0}
      assert.is_true(M.isEqual(M.clone(vector),vector))
    end)
    
    it('By default, cloning is deep (clones nested tables)',function()
      local particle = {position = {x = 0,y=0},mass = 1}
      local particle_clone = M.clone (particle)
      assert.is_true(M.isEqual(particle_clone,particle))
      particle_clone.position.x = 3
      assert.is_false(M.isEqual(particle_clone,particle))
    end)
 
    it('Unless "shallow" arg is provided',function()
      local particle = {position = {x = 0,y=0},mass = 1}
      local particle_clone = M.clone (particle,true)
      assert.is_true(M.isEqual(particle_clone,particle))
      particle_clone.position.x = 3
      assert.is_true(M.isEqual(particle_clone,particle))
    end) 
    
    it('Non objects are simply returned',function()
      assert.equal(M.clone(1),1)
      assert.equal(M.clone(false),false)
      assert.equal(M.clone(true),true)
      assert.equal(M.clone(nil),nil)
      assert.equal(M.clone('hello'),'hello')
      assert.equal(M.clone(print),print)
    end)     
    
  end)
  
  describe('tap', function()
    
    it('tap-into a method chain', function()
      local t = {}
      local catchMax = function(k) t[#t+1] = M.max(k) end
      local catchMin = function(k) t[#t+1] = M.min(k) end
      
      M.chain({1,2,3})
        :map(function(j) return j*2 end)
        :tap(catchMax)
        :map(function(k) return k^2 end)
        :tap(catchMin)
        :value()
        
      assert.equal(t[1],6)
      assert.equal(t[2],4)
    end)
  
  end)

  describe('has', function()
  
    it('checks if an object has an attribute',function()
      assert.is_true(M.has(M,'has'))
      assert.is_true(M.has(table,'concat'))
      assert.is_true(M.has(string,'format'))
      assert.is_true(M.has(os,'time'))
      assert.is_true(M.has(math,'random'))
    end)
    
  end) 
  
  describe('pick', function()
  
    it('collect specified properties',function()
      local object = {a = 1, b = 2, c = 3}
      assert.is_true(M.isEqual(M.pick(object,'a','c'),{a = 1, c = 3}))
    end)
    
    it('given args can be nested as well',function()
      local object = {a = 1, b = 2, c = 3}
      assert.is_true(M.isEqual(M.pick(object,{{'b','a'}},'c'),{a = 1,b = 2, c = 3}))
    end)

    it('will ignore properties the object do not have',function()
      local object = {a = 1, b = 2, c = 3}
      assert.is_true(M.isEqual(M.pick(object,{{'k'}},'c'),{c = 3}))
    end) 

    it('returns an empty table when given no properties to pick',function()
      local object = {a = 1, b = 2, c = 3}
      assert.is_true(M.isEqual(M.pick(object),{}))
    end)  

    it('should also pick attributes having falsy values',function()
      local object = {a = false, b = false, c = true}
      assert.is_true(M.isEqual(M.pick(object,'a','b'),{a = false,b = false}))
    end)  
    
  end)  
  
  describe('omit', function()
  
    it('collect all properties leaving those given as args',function()
      local object = {a = 1, b = 2, c = 3}
      assert.is_true(M.isEqual(M.omit(object,'a','c'),{b=2}))
    end)
    
    it('given args can be nested as well',function()
      local object = {a = 1, b = 2, c = 3}
      assert.is_true(M.isEqual(M.omit(object,{{'b'}},'c'),{a = 1}))
    end)

    it('will ignore properties the object do not have',function()
      local object = {a = 1, b = 2, c = 3}
      assert.is_true(M.isEqual(M.omit(object,{{'k'}},'c'),{a = 1, b=2}))
    end) 

    it('returns the original object clone when given no properties to omit',function()
      local object = {a = 1, b = 2, c = 3}
      assert.is_true(M.isEqual(M.omit(object),{a = 1, b = 2, c = 3}))
    end)
    
  end)
  
  describe('template', function()
  
    it('applies a template on an object',function()
      assert.is_true(M.isEqual(M.template({},{a = 1, b = 2, c = 3}),{a = 1, b = 2, c = 3}))
    end)
    
    it('does not override existing properies',function()
      assert.is_true(M.isEqual(M.template({a = 10, b = 10},{a = 1, b = 2, c = 3}),{a = 10, b = 10, c = 3}))
    end)

    it('returns the object when given no template arg',function()
      assert.is_true(M.isEqual(M.template({a = 10, b = 10}),{a = 10, b = 10}))
    end)
    
  end) 

  describe('isEqual', function()
  
    it('compares values',function()
      assert.is_true(M.isEqual(1,1))
      assert.is_true(M.isEqual(1.0,1))
      assert.is_false(M.isEqual(1,2))
      assert.is_false(M.isEqual(2,2.0001))
    end)
    
    it('compares objects by reference and components',function()
      local oldprint = print
      assert.is_true(M.isEqual(print,oldprint))
      
      local t = {}
      local v = t
      assert.is_true(M.isEqual(t,v))
      assert.is_true(M.isEqual({},{}))
      
      assert.is_false(M.isEqual('a','b'))
      
      assert.is_false(M.isEqual(true, false))
      assert.is_false(M.isEqual(nil, false))
      assert.is_false(M.isEqual(true, nil))       
    
    end)

    it('compares nested properties',function()
      assert.is_true(M.isEqual({x = 0,{x1 = 0,{x2 =0}}}, {x = 0,{x1 = 0,{x2 =0}}}))
      assert.is_false(M.isEqual({x = 0,{x1 = 0,{x2 =0}}}, {x = 0,{x1 = 0,{x2 =1}}}))
    end)

    it('can compare tables on the basis of their metatable',function()
      local a, b = {x = 1, y = 2}, {x = 2, y = 1}
      setmetatable(a,{__eq = function(a,b) return (a.x and b.x and a.y and b.y)~=nil end})
      assert.is_false(M.isEqual(a, b))
      assert.is_true(M.isEqual(a, b, true))
    end)
  
    
  end)

  describe('result', function()
  
    it('calls an object method, passing it as a first arg the object itself',function()
     assert.equal(M.result('a','len'),1)
     assert.equal(M.result('hello','reverse'),'olleh')
     assert.equal(M.result({'a','b','c'},table.concat),'abc')
    end)
    
    it('returns the property itself if not callable',function()
     assert.equal(M.result({size = 0},'size'),0)
    end)
     
  end)

  describe('isTable', function()
  
    it('returns "true" if arg is table or array',function()
      assert.is_true(M.isTable({}))
      assert.is_true(M.isTable({1,2}))
      assert.is_true(M.isTable({x = 1, 2}))
      assert.is_true(M.isTable(string))
      assert.is_true(M.isTable(table))
      assert.is_true(M.isTable(math))
      
    end)
    
    it('returns "false" otherwise',function()
      assert.is_false(M.isTable(1))
      assert.is_false(M.isTable(''))
      assert.is_false(M.isTable(function() end))
      assert.is_false(M.isTable(print))
      assert.is_false(M.isTable(false))
      assert.is_false(M.isTable(nil))
      assert.is_false(M.isTable(true))      
    end)
    
  end) 

  describe('isCallable', function()
  
    it('returns "true" if arg is callable',function()
      assert.is_true(M.isCallable(print))
      assert.is_true(M.isCallable(function() end))
      assert.is_true(M.isCallable(string.gmatch))
      assert.is_true(M.isCallable(setmetatable({},{__index = string}).upper))      
      assert.is_true(M.isCallable(setmetatable({},{__call = function() return end})))      
    end)
    
    it('returns "false" otherwise',function()
      assert.is_false(M.isCallable(1))
      assert.is_false(M.isCallable(''))
      assert.is_false(M.isCallable({}))
      assert.is_false(M.isCallable(false))
      assert.is_false(M.isCallable(nil))
      assert.is_false(M.isCallable(true))      
    end)
    
  end) 

  describe('isArray', function()
  
    it('returns "true" if arg is an array',function()
      assert.is_true(M.isArray({}))
      assert.is_true(M.isArray({1,2,3}))
      assert.is_true(M.isArray({'a','b','c',{}}))
      assert.is_true(M.isArray({false,true}))
      assert.is_true(M.isArray({1,nil}))
    end)
   
    it('returns "false" otherwise',function()
      assert.is_false(M.isArray(1))
      assert.is_false(M.isArray(''))
      assert.is_false(M.isArray(false))
      assert.is_false(M.isArray(nil))
      assert.is_false(M.isArray(true))      
      assert.is_false(M.isArray(print))
      assert.is_false(M.isArray({a = 1, x = 1}))
      assert.is_false(M.isArray({a = 1, 1, 2,3}))
      assert.is_false(M.isArray({1,nil,2}))
      assert.is_false(M.isArray({1,nil,3,k=4}))
      assert.is_false(M.isArray({a=1}))
    end)   
   
    it('returns false on "sparse arrays"',function()
      assert.is_false(M.isArray({[1] = true, [10] = false}))
   end)   
  
  end)
  
  describe('isIterable', function()
  
    it('checks if the given object is iterable with pairs',function()
      assert.is_true(M.isIterable({}))
      assert.is_true(M.isIterable({1,2,3}))
    end)
    
  end)  
     
  describe('type', function()
  
    it('returns the type of the passed-in object',function()
      assert.equal(M.type('string'),'string')
      assert.equal(M.type(table),'table')
      assert.equal(M.type(1), 'number')
      assert.equal(M.type(io.open('f','w')),'file')
    end)
    
  end) 
  
  describe('isEmpty', function()
  
    it('returns "true" if arg is an empty array',function()
      assert.is_true(M.isEmpty({}))      
    end)
    
    it('returns "false" otherwise',function()
      assert.is_false(M.isEmpty({1,2,3}))
      assert.is_false(M.isEmpty({'a','b','c',{}}))
      assert.is_false(M.isEmpty({nil,false,true}))
    end)

    it('booleans, nil and functions are considered empty',function()
      assert.is_true(M.isEmpty(print))
      assert.is_true(M.isEmpty(nil))
      assert.is_true(M.isEmpty(false))
      assert.is_true(M.isEmpty(true))
    end)
    
    it('handles strings',function()
      assert.is_true(M.isEmpty(''))
      assert.is_false(M.isEmpty('a'))
      assert.is_false(M.isEmpty('bcd'))
      assert.is_false(M.isEmpty(' '))
    end)  
    
  end) 

  describe('isString', function()
  
    it('returns "true" if arg is a string',function()
      assert.is_true(M.isString(''))
      assert.is_true(M.isString('a'))
      assert.is_true(M.isString(' '))
      assert.is_true(M.isString(type(nil)))
    end)
    
    it('returns "false" otherwise',function()
      assert.is_false(M.isString(false))
      assert.is_false(M.isString(print))
      assert.is_false(M.isString(nil))
      assert.is_false(M.isString(true))
      assert.is_false(M.isString({}))
    end)
    
  end)

  describe('isFunction', function()
  
    it('returns "true" if arg is a function',function()
      assert.is_true(M.isFunction(print))
      assert.is_true(M.isFunction(string.match))
      assert.is_true(M.isFunction(function() end))
    end)

    it('returns "false" otherwise',function()
      assert.is_false(M.isFunction({}))
      assert.is_false(M.isFunction(nil))
      assert.is_false(M.isFunction(false))
      assert.is_false(M.isFunction(true))
      assert.is_false(M.isFunction('a'))
    end)    
    
  end)
  
  describe('isNil', function()
  
    it('returns "true" if arg is nil',function()
      assert.is_true(M.isNil(nil))
      assert.is_true(M.isNil())
      assert.is_true(M.isNil(a))
    end)
    
    it('returns "false" otherwise',function()
      assert.is_false(M.isNil(false))
      assert.is_false(M.isNil(true))
      assert.is_false(M.isNil(table))
      assert.is_false(M.isNil(function() end))
      assert.is_false(M.isNil('a'))
    end)     
    
  end) 

  describe('isNumber', function()
  
    it('returns "true" if arg is a number',function()
      assert.is_true(M.isNumber(1))
      assert.is_true(M.isNumber(0.5))
      assert.is_true(M.isNumber(math.pi))
      assert.is_true(M.isNumber(1/0))
      assert.is_true(M.isNumber(math.huge))
      assert.is_true(M.isNumber(0/0))
    end)
    
    it('returns "false" otherwise',function()
      assert.is_false(M.isNumber(print))
      assert.is_false(M.isNumber(nil))
      assert.is_false(M.isNumber(true))
      assert.is_false(M.isNumber(false))
      assert.is_false(M.isNumber({1}))
      assert.is_false(M.isNumber('1'))
    end)    
    
  end)

  describe('isNaN', function()
  
    it('returns "true" if arg is NaN',function()
      assert.is_true(M.isNaN(0/0))  
    end)
    
    it('returns "false" for not NaN values',function()
      assert.is_false(M.isNaN(1/0))  
      assert.is_false(M.isNaN(math.huge))
      assert.is_false(M.isNaN(math.pi))
      assert.is_false(M.isNaN(1))
      assert.is_false(M.isNaN(''))
      assert.is_false(M.isNaN('0'))
      assert.is_false(M.isNaN({}))
      assert.is_false(M.isNaN(nil))
      assert.is_false(M.isNaN(false))
      assert.is_false(M.isNaN(true))
    end)    
    
  end) 
  
  describe('isFinite', function()
  
    it('returns "true" if arg is a finite number',function()
      assert.is_true(M.isFinite(1))
      assert.is_true(M.isFinite(0))
      assert.is_true(M.isFinite(math.pi))
      assert.is_true(M.isFinite(99e99))
    end)
    
    it('returns "false" otherwise',function()
      assert.is_false(M.isFinite(math.huge))
      assert.is_false(M.isFinite(1/0))
      assert.is_false(M.isFinite(0/0))
    end) 

    it('returns "false" for non-numbers',function()
      assert.is_false(M.isFinite(''))
      assert.is_false(M.isFinite(function() end))
      assert.is_false(M.isFinite({}))
    end)    
    
  end)

  describe('isBoolean', function()
 
    it('returns "true" if arg is a boolean or a thruthy statement',function()
      assert.is_true(M.isBoolean(true))
      assert.is_true(M.isBoolean(false))
      assert.is_true(M.isBoolean(1==1))
      assert.is_true(M.isBoolean(print==tostring))     
    end)
    
    it('returns "false" otherwise',function()
      assert.is_false(M.isBoolean(''))
      assert.is_false(M.isBoolean(nil))
      assert.is_false(M.isBoolean({}))
      assert.is_false(M.isBoolean(function() end))

      assert.is_false(M.isBoolean(0))
      assert.is_false(M.isBoolean('1'))
    end)    
    
  end)
  
  describe('isInteger', function()
  
    it('returns "true" if arg is a integer, "false" otherwise',function()
      assert.is_true(M.isInteger(1))
      assert.is_true(M.isInteger(0))
      assert.is_false(M.isInteger(math.pi))
      assert.is_true(M.isInteger(1/0))
      assert.is_true(M.isInteger(math.huge))
      assert.is_false(M.isInteger(0/0))
    end)  
    
  end)
  
end)