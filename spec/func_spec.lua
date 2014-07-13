require 'luacov'
local _ = require 'moses'

context('Utility functions specs', function()

  context('identity', function()
  
    test('returns the received value',function()
      assert_equal(_.identity(1),1)
      local v = {x = 0}      
      assert_equal(_.identity(v),v)
      assert_not_equal(v,{x = 0})
    end)
    
  end)
  
  context('once', function()
  
    test('returns a version of a function that runs once',function()
      local sq = _.once(function(a) return a*a end)
      assert_equal(sq(2),4)
    end)
    
    test('successive calls will keep yielding the original answer',function()
      local sq = _.once(function(a) return a*a end)
      for i = 1,10 do
        assert_equal(sq(i),1)
      end
    end)    
    
  end)
  
  context('memoize', function()
  
    local fib_time, fib_value, mfib_time, mfib_value
    local fib, mfib
    
    before(function()
      local function fib(n)
        return n < 2 and n or fib(n-1)+fib(n-2)
      end      
      local times = 10
      local mfib = _.memoize(fib)
      fib_time = os.clock()
        for i = 1, times do fib_value = (fib_value or 0)+fib(20) end
      fib_time = (os.clock()-fib_time)*1000
      
      mfib_time = os.clock()
        for i = 1, times do mfib_value = (mfib_value or 0)+mfib(20) end
      mfib_time = (os.clock()-mfib_time  )*1000    
    end)
    
    test('memoizes an expensive function by caching its results',function()
      assert_true(mfib_time<=fib_time)
    end)
    
    test('can take a hash function to compute an unique output for multiple args',function()
    
      local function hash(a,b) return (a^13+b^19) end
      local function fact(a) return a <= 1 and 1 or a*fact(a-1) end
      local diffFact = function(a,b) return fact(a)-fact(b) end
      local mdiffFact = _.memoize(function(a,b) return fact(a)-fact(b) end,hash)
      local times, rep = 100, 10
      
      local time = os.clock()
      for j = 1,times do 
        for ai = 1,rep do
          for aj = 1,rep do diffFact(ai,aj) end
        end
      end
      time = (os.clock()-time)*1000

      local mtime = os.clock()
      for j = 1,times do 
        for ai = 1,rep do
          for aj = 1,rep do mdiffFact(ai,aj) end
        end
      end
      mtime = (os.clock()-mtime)*1000

      assert_true(mtime<=time)

    end)
    
  end)  
  
  context('after', function()
  
    test('returns a function that will respond on its count-th call',function()
      local function a(r) return (r) end
      a = _.after(a,5)
      for i = 1,10 do
        if i < 5 then 
          assert_nil(a(i))
        else 
          assert_equal(a(i),i)
        end
      end
    end)
    
  end) 
  
  context('compose', function()
    
    test('can compose commutative functions',function()
      local greet = function(name) return "hi: " .. name end
      local exclaim = function(sentence) return sentence .. "!" end
      assert_equal(_.compose(greet,exclaim)('moe'),'hi: moe!')
      assert_equal(_.compose(exclaim,greet)('moe'),'hi: moe!')
    end)
    
    test('composes mutiple functions',function()
      local function f(x) return x^2 end
      local function g(x) return x+1 end
      local function h(x) return x/2 end
      local compositae = _.compose(f,g,h)
      assert_equal(compositae(10),36)
      assert_equal(compositae(20),121)
    end)    
    
  end) 

  context('pipe', function()
    
    test('pipes a value through a series of functions',function()
      local function f(x) return x^2 end
      local function g(x) return x+1 end
      local function h(x) return x/2 end
      assert_equal(_.pipe(10,f,g,h),36)
      assert_equal(_.pipe(20,f,g,h),121)  
    end) 
    
  end)

  context('complement', function()
    
    test('returns a function which returns the logical complement of a given function',function()
      assert_false(_.complement(function() return true end)())
      assert_true(_.complement(function() return false end)())
      assert_true(_.complement(function() return nil end)())
      assert_false(_.complement(function() return 1 end)())
    end) 
    
  end)
  
  context('juxtapose', function()
    
    test('calls a sequence of functions with the same set of args',function()
      local function f(x) return x^2 end
      local function g(x) return x+1 end
      local function h(x) return x/2 end
      local rf, rg, rh = _.juxtapose(10, f, g, h)
      assert_equal(rf, 100)
      assert_equal(rg, 11)
      assert_equal(rh, 5)
    end) 
    
  end)
  
  context('wrap', function()
  
    test('wraps a function and passes args',function()
      local greet = function(name) return "hi: " .. name end
      local backwards = _.wrap(greet, function(f,arg)
          return f(arg) ..'\nhi: ' .. arg:reverse()
        end) 
      assert_equal(backwards('john'),'hi: john\nhi: nhoj')
    end)
    
  end)
  
  context('times', function()
  
    test('calls a given function n times',function()
      local f = ('Lua programming'):gmatch('.')
      local r = _.times(3,f)
      assert_true(_.isEqual(r,{'L','u','a'}))
      
      local count = 0
      local function counter() count = count+1 end
      _.times(10,counter)
      assert_equal(count,10)
    end)
    
  end)  
  
  context('bind', function()
  
    test('binds a value to the first arg of a function',function()
      local sqrt2 = _.bind(math.sqrt,2)
      assert_equal(sqrt2(),math.sqrt(2))
    end)
    
  end) 

  context('bindn', function()
  
    test('binds n values to as the n-first args of a function',function()
      local function out(...)
        return table.concat {...}
      end
      out = _.bindn(out,'OutPut',':',' ')
      assert_equal(out(1,2,3),'OutPut: 123')
      assert_equal(out('a','b','c','d'),'OutPut: abcd')
    end)
    
  end)
  
  context('uniqueId', function()
  
    test('returns an unique (for the current session) integer Id',function()
      local ids = {}
      for i = 1,100 do
        local newId = _.uniqueId()
        assert_false(_.include(ids,newId))
        _.push(ids,newId)
      end     
    end)
    
    test('accepts a string template to format the returned id',function()
      local ids = {}
      for i = 1,100 do
        local newId = _.uniqueId('ID:%s')
        assert_equal(newId,'ID:'..newId:sub(4))
        assert_false(_.include(ids,newId))
        _.push(ids,newId)
      end        
    end)
    
    test('accepts a function as argument to format the returned id',function()
      local ids = {}
      local formatter = function(ID) return '$'..ID..'$' end
      for i = 1,100 do
        local newId = _.uniqueId(formatter)
        assert_not_nil(newId:match('^%$%d+%$$'))
        assert_false(_.include(ids,newId))
        _.push(ids,newId)
      end        
    end)
    
  end)  
  
end)