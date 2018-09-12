require 'luacov'
local M = require 'moses'

describe('Utility functions specs', function()

  describe('noop', function()
  
    it('the no-operation function',function()
			assert.is_nil(M.noop())
			assert.is_nil(M.noop(nil))
			assert.is_nil(M.noop(false))
			assert.is_nil(M.noop({}))
			assert.is_nil(M.noop(function() end))
			assert.is_nil(M.noop(M.noop))
    end)
    
  end)
	
  describe('identity', function()
  
    it('returns the received value',function()
      assert.equal(M.identity(1),1)
      local v = {x = 0}      
      assert.equal(M.identity(v),v)
      assert.is_not.equals(v,{x = 0})
    end)
    
  end)
	
  describe('call', function()
  
    it('calls f(...) and returns the results',function()
      assert.equal(M.call(math.pow, 2, 3), 8)
      assert.equal(M.call(string.len, 'hello' ), 5)
      assert.equal(M.call(table.concat, {1,2,3,4,5}, ',', 2, 4),"2,3,4")
    end)
    
  end)	
  
  describe('applySpec', function()
  
    it('returns a spec function which produces objects',function()
      local stats = M.applySpec({
        min = function(...) return math.min(...) end,
        max = function(...) return math.max(...) end,
      })

			for i = 1, 10 do
        local mn, mx = math.random(1,10), math.random(11,20)
        local t = M.range(mn, mx)
        table.sort(t)
        local unpack = unpack or table.unpack
        local r = stats(unpack(t))
        assert.equal(r.min, t[1])
        assert.equal(r.max, t[#t])
      end
    end)
    
  end)
  
  describe('thread', function()
  
    it('threads a value through functions',function()
      local function inc(x) return x + 1 end
      local function double(x) return 2 * x end
      local function square(x) return x * x end
      assert.equal(M.thread(2, inc, double, square), 36)
      assert.equal(M.thread(3, double, inc, square), 49)
      assert.equal(M.thread(4, square, double, inc), 33)
      assert.equal(M.thread(5, square, inc, double), 52)
    end)
    
    it('accepts funcs taking more than one arg',function()
      local function inc(x) return x + 1 end
      local function add(x, y) return x + y end
      local function pow(x, y) return x ^ y end
      assert.equal(M.thread(2, inc, {add, 3}, {pow, 2}), 36)
      assert.equal(M.thread(2, {add, 4}, inc, {pow, 2}), 49)
    end)
    
  end)
  
  describe('threadRight', function()
  
    it('threads a value through functions',function()
      local function inc(x) return x + 1 end
      local function double(x) return 2 * x end
      local function square(x) return x * x end
      assert.equal(M.threadRight(2, inc, double, square), 36)
      assert.equal(M.threadRight(3, double, inc, square), 49)
      assert.equal(M.threadRight(4, square, double, inc), 33)
      assert.equal(M.threadRight(5, square, inc, double), 52)
    end)
    
    it('accepts funcs taking more than one arg',function()
      local function inc(x) return x + 1 end
      local function add(x, y) return x + y end
      local function pow(x, y) return x ^ y end
      assert.equal(M.threadRight(2, inc, {add, 3}, {pow, 2}), 64)
      assert.equal(M.threadRight(2, {add, 4}, inc, {pow, 2}), 128)
    end)
    
  end)  
  
	describe('dispatch', function()
	
		it('produces a dispatch function',function()
      local f = M.dispatch(
        function() return nil end,
        function (v) return v+1 end, 
        function (v) return 2*v end
      )
      assert.equal(f(5),6)
      assert.equal(f(7),8)
		end)
	
	end) 
  
	describe('memoize', function()

	local fib_time, fib_value, mfib_time, mfib_value
	local fib, mfib
	
		it('memoizes an expensive function by caching its results',function()
        local function fib(n) return n < 2 and n or fib(n-1)+fib(n-2) end
        local mfib = M.memoize(fib)    
        assert.equal(fib(10), mfib(10))
        assert.equal(fib(15), mfib(15))
        assert.equal(fib(8), mfib(8))
        assert.equal(fib(13), mfib(13))
		end)
	
	end) 
  
  describe('unfold', function()
  
    it('builds a list from a seed value using a iterator',function()
      local function iter(seed) 
        if seed < 100 then return seed, seed * 2 end
      end
      assert.is_true(M.isEqual(M.unfold(iter,1),{1,2,4,8,16,32,64}))
      assert.is_true(M.isEqual(M.unfold(iter,5),{5, 10,20,40,80}))
      assert.is_true(M.isEqual(M.unfold(iter,10),{10,20,40,80}))
    end)
    
  end)  

  describe('once', function()
  
    it('returns a version of a function that runs once',function()
      local sq = M.once(function(a) return a*a end)
      assert.equal(sq(2),4)
    end)
    
    it('successive calls will keep yielding the original answer',function()
      local sq = M.once(function(a) return a*a end)
      for i = 1,10 do
        assert.equal(sq(i),1)
      end
    end)    
    
  end)
	
  describe('before', function()
  
    it('returns a version of a function that runs no more than count-th calls',function()
      local function say(something) return something end
			local speak3times = M.before(say, 3)
      assert.equal(speak3times('a'), 'a')
      assert.equal(speak3times('b'), 'b')
      assert.equal(speak3times('c'), 'c')
      assert.equal(speak3times('d'), 'c')
      assert.equal(speak3times('e'), 'c')
      assert.equal(speak3times('f'), 'c')
    end)
    
  end)	
	
   
  describe('after', function()
  
    it('returns a function that will respond on its count-th call',function()
      local function a(r) return (r) end
      a = M.after(a,5)
      for i = 1,10 do
        if i < 5 then 
          assert.is_nil(a(i))
        else 
          assert.equal(a(i),i)
        end
      end
    end)
    
  end) 
  
  describe('compose', function()
    
    it('can compose commutative functions',function()
      local greet = function(name) return "hi: " .. name end
      local exclaim = function(sentence) return sentence .. "!" end
      assert.equal(M.compose(greet,exclaim)('moe'),'hi: moe!')
      assert.equal(M.compose(exclaim,greet)('moe'),'hi: moe!')
    end)
    
    it('composes mutiple functions',function()
      local function f(x) return x^2 end
      local function g(x) return x+1 end
      local function h(x) return x/2 end
      local compositae = M.compose(f,g,h)
      assert.equal(compositae(10),36)
      assert.equal(compositae(20),121)
    end)   

    it('compose non commutative functions in reverse order',function()
      local function f(s) return (s or '')..'f' end
      local function g(s) return (s or '')..'g' end
      local function h(s) return (s or '')..'h' end
      assert.equal(M.compose(f,g,h)(),'hgf')
      assert.equal(M.compose(h,g,f)(),'fgh')
      assert.equal(M.compose(f,h,g)(),'ghf')
      assert.equal(M.compose(g,h,f)(),'fhg')
    end) 		
    
  end) 

  describe('pipe', function()
    
    it('pipes a value through a series of functions',function()
      local function f(x) return x^2 end
      local function g(x) return x+1 end
      local function h(x) return x/2 end
      assert.equal(M.pipe(10,f,g,h),36)
      assert.equal(M.pipe(20,f,g,h),121)  
    end) 
    
  end)

  describe('complement', function()
    
    it('returns a function which returns the logical complement of a given function',function()
      assert.is_false(M.complement(function() return true end)())
      assert.is_true(M.complement(function() return false end)())
      assert.is_true(M.complement(function() return nil end)())
      assert.is_false(M.complement(function() return 1 end)())
    end) 
    
  end)
  
  describe('juxtapose', function()
    
    it('calls a sequence of functions with the same set of args',function()
      local function f(x) return x^2 end
      local function g(x) return x+1 end
      local function h(x) return x/2 end
      local rf, rg, rh = M.juxtapose(10, f, g, h)
      assert.equal(rf, 100)
      assert.equal(rg, 11)
      assert.equal(rh, 5)
    end) 
    
  end)
  
  describe('wrap', function()
  
    it('wraps a function and passes args',function()
      local greet = function(name) return "hi: " .. name end
      local backwards = M.wrap(greet, function(f,arg)
          return f(arg) ..'\nhi: ' .. arg:reverse()
        end) 
      assert.equal(backwards('john'),'hi: john\nhi: nhoj')
    end)
    
  end)
  
  describe('times', function()
  
    it('calls a given function n times',function()
      local f = ('Lua programming'):gmatch('.')
      local r = M.times(f, 3)
      assert.is_true(M.isEqual(r,{'L','u','a'}))
      
      local count = 0
      local function counter() count = count+1 end
      M.times(counter, 10)
      assert.equal(count,10)
    end)
    
  end)  
  
  describe('bind', function()
  
    it('binds a value to the first arg of a function',function()
      local sqrt2 = M.bind(math.sqrt,2)
      assert.equal(sqrt2(),math.sqrt(2))
    end)
    
  end) 

  describe('bind2', function()
  
    it('binds a value to the second arg of a function',function()
      local last2 = M.bind2(M.last,2)
      local r = last2({1,2,3,4,5,6})
      assert.is_true(M.isEqual(r, {5,6}))
    end)
    
  end)

  describe('bindn', function()
  
    it('binds n values to as the n-first args of a function',function()
      local function out(...)
        return table.concat {...}
      end
      out = M.bindn(out,'OutPut',':',' ')
      assert.equal(out(1,2,3),'OutPut: 123')
      assert.equal(out('a','b','c','d'),'OutPut: abcd')
    end)
    
  end)
  
  describe('bindall', function()
  
    it('binds methods to object',function()
			local window = {
				setPos = function(w,x,y) w.x, w.y = x, y end, 
				setName = function(w,name) w.name = name end,
				getName = function(w) return w.name end,
			}
			window = M.bindall(window, 'setPos', 'setName', 'getName')
			window.setPos(10,15)
			window.setName('fooApp')
			
			assert.equal(window.x, 10)
			assert.equal(window.y, 15)
			assert.equal(window.name, 'fooApp')
			assert.equal(window.getName(), 'fooApp')
    end)
    
  end)

  describe('cond', function()
  
    it('return a function which runs a set of predicates',function()
      local multipleOf = M.cond({
        {function(v) return v%2==0 end, function(v) return v..' is multiple of 2' end},
        {function(v) return v%3==0 end, function(v) return v..' is multiple of 3' end},
        {function(v) return v%5==0 end, function(v) return v..' is multiple of 5' end},
        {function() return true end, function(v) return 'could not find an answer for '..v end}
      })
      for i = 15, 20 do
        assert.equal(multipleOf(i), 
          i%2 == 0 and i..' is multiple of 2' or 
          i%3 == 0 and i..' is multiple of 3' or 
          'could not find an answer for '..i)
      end
    end)
    
  end)
	
  describe('both', function()
  
    it('returns a truthy func when all funcs returns true',function()
      local f = M.both(
        function(x) return x > 0 end,
        function(x) return x < 10 end,
        function(x) return x % 2 == 0 end
      )
      assert.is_true(f(2))
      assert.is_true(f(8))
      assert.is_false(f(9))
    end)
    
  end)
  
  describe('either', function()
  
    it('returns a truthy func when at least one of its funcs returns true',function()
      local f = M.either(
        function(x) return x > 0 end,
        function(x) return x % 2 == 0 end
      )
      assert.is_true(f(0))
      assert.is_false(f(-3))
    end)
    
  end)
  
  describe('neither', function()
  
    it('returns a truthy func when neither of its funcs returns true',function()
      local f = M.neither(
        function(x) return x > 10 end,
        function(x) return x % 2 == 0 end
      )
      assert.is_false(f(12))
      assert.is_false(f(8))
      assert.is_true(f(7))
    end)
    
  end)
  
  describe('uniqueId', function()
  
    it('returns an unique (for the current session) integer Id',function()
      local ids = {}
      for i = 1,100 do
        local newId = M.uniqueId()
        assert.is_false(M.include(ids,newId))
        M.push(ids,newId)
      end     
    end)
    
    it('accepts a string template to format the returned id',function()
      local ids = {}
      for i = 1,100 do
        local newId = M.uniqueId('ID:%s')
        assert.equal(newId,'ID:'..newId:sub(4))
        assert.is_false(M.include(ids,newId))
        M.push(ids,newId)
      end        
    end)
    
    it('accepts a function as argument to format the returned id',function()
      local ids = {}
      local formatter = function(ID) return '$'..ID..'$' end
      for i = 1,100 do
        local newId = M.uniqueId(formatter)
        assert.is_true(newId:match('^%$%d+%$$') ~= nil)
        assert.is_false(M.include(ids,newId))
        M.push(ids,newId)
      end        
    end)
    
  end)  
  
	describe('iterator', function()

		it('creates an iterator which continuously applies f on an input',function()
			local next_even = M.iterator(function(x) return x + 2 end, 0)
			assert.equal(next_even(), 2)
			assert.equal(next_even(), 4)
			assert.equal(next_even(), 6)
			assert.equal(next_even(), 8)
			assert.equal(next_even(),10)
		end)
    
		it('can be set to run up to a maximum number of calls',function()
			local next_even = M.iterator(function(x) return x + 2 end, 0, 3)
			assert.equal(next_even(), 2)
			assert.equal(next_even(), 4)
			assert.equal(next_even(), 6)
			assert.is_nil(next_even())
		end)    
		
	end)
  
	describe('skip', function()

		it('consumes the first n values of an iterator',function()
      local w = "hello"
      local char = string.gmatch(w,'.')
      local iter = M.skip(char, 3)
      assert.equal(iter(), 'l')
      assert.equal(iter(), 'o')
		end)
    
		it('consumes the first n values of an iterator',function()
      local w = "lua"
      local char = string.gmatch(w,'.')
      local iter = M.skip(char)
      assert.equal(iter(), 'u')
      assert.equal(iter(), 'a')
		end)    
		
	end)
	
	describe('tabulate', function()

		it('iterates a given iterator and returns its values in an array',function()
			local letters = M.tabulate(('Lua'):gmatch('.'))
			assert.is_true(M.isEqual(letters,{'L','u','a'}))
			
			local numbers = M.tabulate(pairs(M.range(1,10)))
			assert.is_true(M.isEqual(numbers,M.range(1,10)))			
		end)
		
	end)
  
	describe('iterlen', function()

		it('returns the iterator length',function()
      local text = 'letters'
      local chars = string.gmatch(text, '.')
      assert.equal(M.iterlen(chars),7)
		end)
    
		it('it consumes the iterator',function()
      local text = 'lua'
      local chars = string.gmatch(text, '.')
      assert.equal(M.iterlen(chars),3)
      assert.is_nil(chars())
		end)    
		
	end)  
  
	describe('castArray', function()

		it('converts value to an array',function()
      assert.is_true(M.isEqual(M.castArray(1),{1}))
      assert.is_true(M.isEqual(M.castArray(print),{print}))
      assert.is_true(M.isEqual(M.castArray(true),{true}))
		end)
		
		it('leaves given value untouched if it is an array',function()
      local t1 = {1,2}
      local t2 = {nil, true, false}
      assert.is_true(M.isEqual(M.castArray(t1),t1))
      assert.is_true(M.isEqual(M.castArray(t2),t2))
		end)
    
	end)  
	
	describe('flip', function()

		it('creates a function which runs f with arguments flipped',function()
			local function f(...) return table.concat({...}) end
			local flipped = M.flip(f)
			assert.equal(flipped('a','b','c'),'cba')
		end)
		
	end)

	describe('nthArg', function()

		it('creates a function which returns the nth arg',function()
      local f2 = M.nthArg(2)
      local f3 = M.nthArg(3)
      local f4 = M.nthArg(4)
			assert.equal(f2(4,8,5,4,6),8)
			assert.equal(f3(4,8,5,4,6),5)
			assert.equal(f4(4,8,5,4,6),4)
		end)
		
		it('if n is negative, will count from the end',function()
      local f2 = M.nthArg(-2)
      local f3 = M.nthArg(-3)
      local f4 = M.nthArg(-4)
			assert.equal(f2(4,8,5,4,6),4)
			assert.equal(f3(4,8,5,4,6),5)
			assert.equal(f4(4,8,5,4,6),8)
		end)
    
	end) 
 
	describe('unary', function()

		it('creates a function which accepts only one arg',function()
      local f = M.unary(function(...) return ... end)
      assert.equal(f(1),1)
      assert.equal(f(1,2),1)
      assert.equal(f(1,2,3),1)
		end)
    
	end)
  
	describe('ary', function()

		it('creates a function which accepts up to n args',function()
      local f = M.ary(function(...) return ... end, 2)
      assert.is_true(M.isEqual({f(1,2)},{1,2}))
      assert.is_true(M.isEqual({f(1,2,3)},{1,2}))
      assert.is_true(M.isEqual({f(1,2,3,4)},{1,2}))
		end)
    
	end)  
  
	describe('noarg', function()

		it('returns a function with an arity of 0',function()
      local f = M.noarg(function (x) return x or 'default' end)
      assert.equal(f(1), 'default')
      assert.equal(f(function() end, 3), 'default')
      assert.equal(f(nil), 'default')
		end)
    
	end) 
  
  describe('rearg', function()

		it('creates a function with args reordered',function()
      local f = M.rearg(function(...) return ... end, {3,2,1})
      assert.is_true(M.isEqual({f(1,2,3)},{3,2,1}))
      assert.is_true(M.isEqual({f(2,1,3)},{3,1,2}))
      assert.is_true(M.isEqual({f(3,2,1)},{1,2,3}))
		end)
    
	end)   
	
	describe('over', function()

		it('returns a function which applies a set of transforms to its args',function()
			local minmax = M.over(math.min, math.max)
			local maxmin = M.over(math.max, math.min)
			assert.is_true(M.isEqual(minmax(5,10,12,4,3),{3,12}))
			assert.is_true(M.isEqual(maxmin(5,10,12,4,3),{12,3}))	
		end)
		
	end)		
	
	describe('overEvery', function()
		
		local alleven, allpositive
		
    alleven = function(...) 
      for i, v in ipairs({...}) do if v%2~=0 then return false end end 
      return true 
    end

    allpositive = function(...)
      for i, v in ipairs({...}) do if v < 0 then return false end end
      return true 	
    end
		
		it('checks if all predicates passes truth with args. ',function()
			local allok = M.overEvery(alleven, allpositive)
			assert.is_false(allok(2,4,-1,8))
			assert.is_false(allok(10,3,2,6))
			assert.is_true(allok(8,4,6,10))
		end)
		
	end)

	describe('overSome', function()
		
		local alleven, allpositive
		
    alleven = function(...) 
      for i, v in ipairs({...}) do if v%2~=0 then return false end end 
      return true 
    end

    allpositive = function(...)
      for i, v in ipairs({...}) do if v < 0 then return false end end
      return true 	
    end
		
		it('checks if all predicates passes truth with args. ',function()
			local anyok = M.overSome(alleven, allpositive)
			assert.is_false(anyok(2,4,-1,8))
			assert.is_true(anyok(10,3,2,6))
			assert.is_false(anyok(-1,-5,-3))
		end)
		
	end)	
	
	describe('overArgs', function()

		it('Creates a function that invokes `f` with its arguments transformed',function()
			local function f(x, y) return {x, y} end
			local function triple(x) return x*3 end
			local function square(x) return x^2 end
			local new_f = M.overArgs(f, triple, square)
			assert.is_true(M.isEqual(new_f(1,2), {3,4}))
			assert.is_true(M.isEqual(new_f(10,10), {30,100}))			
		end)
		
		it('when supplied more args than transforms, remaining are left as-is',function()
			local function f(x, y, z, k) return {x, y, z, k} end
			local function triple(x) return x*3 end
			local function square(x) return x^2 end
			local new_f = M.overArgs(f, triple, square)
			assert.is_true(M.isEqual(new_f(1,2,3,4), {3,4,3,4}))
			assert.is_true(M.isEqual(new_f(10,10,10,10), {30,100,10,10}))			
		end)		
		
	end)	
	
  describe('converge', function()
  
    it('', function()
      local function pow2(x) return x*x end
      local function pow3(x) return x*x*x end
      local function sum(a,b) return a+b end
      local poly = M.converge(sum, pow2, pow3)
      assert.equal(poly(5), 150)
      assert.equal(poly(1), 2)
      assert.equal(poly(3), 36)
    end)
    
  end)
  
	describe('partial', function()

		it('applies partially f',function()
			local function diff(a, b) return a - b end
			local diffFrom20 = M.partial(diff, 20)
			assert.equal(diffFrom20(5), 15)
			assert.equal(diffFrom20(10), 10)
			assert.equal(diffFrom20(-5), 25)
		end)
		
		it('\'_\' can be used as a placeholder',function()
			local function diff(a, b) return a - b end
			local remove10 = M.partial(diff, '_',10)
			assert.equal(remove10(5), -5)
			assert.equal(remove10(10), 0)
			assert.equal(remove10(15), 5)
		end)
		
	end)
	
	describe('partialRight', function()

		it('applies partial but from the right',function()
			local function concat(a,b,c,d) return a..b..c..d end
			assert.equal(M.partialRight(concat,'a','b','c')('d'), 'dabc')
			assert.equal(M.partialRight(concat,'a','b')('c','d'), 'cdab')
			assert.equal(M.partialRight(concat,'a')('b','c','d'), 'bcda')
		end)
		
		it('\'_\' can be used as a placeholder',function()
			local function concat(a,b,c,d) return a..b..c..d end		
			assert.equal(M.partialRight(concat,'a','_','c')('d','b'), 'badc')
			assert.equal(M.partialRight(concat,'a','b','_')('c','d'), 'dabc')
			assert.equal(M.partialRight(concat,'_','a')('b','c','d'), 'cdba')
		end)
		
	end)	
	
	describe('curry', function()

		it('curries a function for a specific number of args',function()
			local function sumOf5args(a,b,c,d,e) return a+b+c+d+e end
			local curried_sumOf5args = M.curry(sumOf5args, 5)
			assert.equal(curried_sumOf5args(1)(2)(3)(4)(5),15)
			assert.equal(curried_sumOf5args(8)(-2)(4)(-10)(1),1)
		end)
		
		it('n_args defaults to 2 when not supplied',function()
			local function prod(x,y) return x*y end
			local curried_prod = M.curry(prod)
			assert.equal(curried_prod(2)(3), (M.curry(prod,2))(2)(3))
			assert.equal(curried_prod(-2)(6), (M.curry(prod,2))(-2)(6))
		end)

		it('n_args can be equal to 1',function()
			local curried_identity = M.curry(M.identity,1)
			assert.equal(curried_identity('value'), 'value')
			assert.equal(curried_identity(1), 1)
			assert.equal(curried_identity(true), true)
			assert.equal(curried_identity(false), false)
		end)
		
		it('giving more args than n_args will raise an error',function()
			local function add(a,b) return a+b end
			local curried_add = M.curry(add, 2)
			assert.error(function() curried_add(1)(2)(3) end)
			assert.error(function() curried_add(4)(5)(6)(7)(8) end)
		end)		
		
		it('When given less than n_args, it will wait for missing args',function()
			local function add(a,b,c) return a+b+c end
			local curried_add = M.curry(add, 3)
			local c1 = curried_add(1)
			local c2 = c1(2)
			local c3 = c2(3)
			assert.equal(type(c1), 'function')		
			assert.equal(type(c2), 'function')
			assert.equal(c3, 6)
		end)
		
	end)
	
	describe('time', function()
	
		it('returns the execution time of a function and its results', function()
			local function f(...) return ... end
			
			local duration, r = M.time(f, 'a')
			assert.equal(type(duration), 'number')
			assert.equal(r, 'a')
			
			local duration, a, b, c = M.time(f, 1, 2, 3)
			assert.equal(type(duration), 'number')
			assert.is_true(a == 1 and b == 2 and c == 3)	
		end)
	
	end)
	
end)