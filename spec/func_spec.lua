--require 'luacov'
local M = require 'moses'

context('Utility functions specs', function()

  context('noop', function()
  
    test('the no-operation function',function()
			assert_nil(M.noop())
			assert_nil(M.noop(nil))
			assert_nil(M.noop(false))
			assert_nil(M.noop({}))
			assert_nil(M.noop(function() end))
			assert_nil(M.noop(M.noop))
    end)
    
  end)
	
  context('identity', function()
  
    test('returns the received value',function()
      assert_equal(M.identity(1),1)
      local v = {x = 0}      
      assert_equal(M.identity(v),v)
      assert_not_equal(v,{x = 0})
    end)
    
  end)
	
  context('constant', function()
  
    test('creates a constant function',function()
			local gravity = M.constant(9.81)
			assert_equal(gravity(),9.81)
			assert_equal(gravity(10), 9.81)
			assert_equal(gravity(nil), 9.81)
    end)
    
  end)	
  
  context('applySpec', function()
  
    test('returns a spec function which produces objects',function()
      local stats = M.applySpec({
        min = function(...) return math.min(...) end,
        max = function(...) return math.max(...) end,
      })

			for i = 1, 10 do
        local mn, mx = math.random(1,10), math.random(11,20)
        local t = M.range(mn, mx)
        table.sort(t)
        local r = stats(unpack(t))
        assert_equal(r.min, t[1])
        assert_equal(r.max, t[#t])
      end
    end)
    
  end)
  
	context('memoize', function()

	local fib_time, fib_value, mfib_time, mfib_value
	local fib, mfib
	
		test('memoizes an expensive function by caching its results',function()
        local function fib(n) return n < 2 and n or fib(n-1)+fib(n-2) end
        local mfib = M.memoize(fib)    
        assert_equal(fib(10), mfib(10))
        assert_equal(fib(15), mfib(15))
        assert_equal(fib(8), mfib(8))
        assert_equal(fib(13), mfib(13))
		end)
	
		test('can take a hash function to compute an unique output for multiple args',function()
			local function hash(a,b) return (a^13+b^19) end
			local function fact(a) return a <= 1 and 1 or a*fact(a-1) end
			local diffFact = function(a,b) return fact(a)-fact(b) end
			local mdiffFact = M.memoize(function(a,b) return fact(a)-fact(b) end,hash)
			local times, rep = 100, 10
			
			for j = 1,times do 
				for ai = 1,rep do
					for aj = 1,rep do
            assert_equal(diffFact(ai,aj), mdiffFact(ai,aj))
          end
				end
			end
		end)
	
	end) 
  
  context('unfold', function()
  
    test('builds a list from a seed value using a iterator',function()
      local function iter(seed) 
        if seed < 100 then return seed, seed * 2 end
      end
      assert_true(M.isEqual(M.unfold(iter,1),{1,2,4,8,16,32,64}))
      assert_true(M.isEqual(M.unfold(iter,5),{5, 10,20,40,80}))
      assert_true(M.isEqual(M.unfold(iter,10),{10,20,40,80}))
    end)
    
  end)  

  context('once', function()
  
    test('returns a version of a function that runs once',function()
      local sq = M.once(function(a) return a*a end)
      assert_equal(sq(2),4)
    end)
    
    test('successive calls will keep yielding the original answer',function()
      local sq = M.once(function(a) return a*a end)
      for i = 1,10 do
        assert_equal(sq(i),1)
      end
    end)    
    
  end)
	
  context('before', function()
  
    test('returns a version of a function that runs no more than count-th calls',function()
      local function say(something) return something end
			local speak3times = M.before(say, 3)
      assert_equal(speak3times('a'), 'a')
      assert_equal(speak3times('b'), 'b')
      assert_equal(speak3times('c'), 'c')
      assert_equal(speak3times('d'), 'c')
      assert_equal(speak3times('e'), 'c')
      assert_equal(speak3times('f'), 'c')
    end)
    
  end)	
	
   
  context('after', function()
  
    test('returns a function that will respond on its count-th call',function()
      local function a(r) return (r) end
      a = M.after(a,5)
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
      assert_equal(M.compose(greet,exclaim)('moe'),'hi: moe!')
      assert_equal(M.compose(exclaim,greet)('moe'),'hi: moe!')
    end)
    
    test('composes mutiple functions',function()
      local function f(x) return x^2 end
      local function g(x) return x+1 end
      local function h(x) return x/2 end
      local compositae = M.compose(f,g,h)
      assert_equal(compositae(10),36)
      assert_equal(compositae(20),121)
    end)   

    test('compose non commutative functions in reverse order',function()
      local function f(s) return (s or '')..'f' end
      local function g(s) return (s or '')..'g' end
      local function h(s) return (s or '')..'h' end
      assert_equal(M.compose(f,g,h)(),'hgf')
      assert_equal(M.compose(h,g,f)(),'fgh')
      assert_equal(M.compose(f,h,g)(),'ghf')
      assert_equal(M.compose(g,h,f)(),'fhg')
    end) 		
    
  end) 

  context('pipe', function()
    
    test('pipes a value through a series of functions',function()
      local function f(x) return x^2 end
      local function g(x) return x+1 end
      local function h(x) return x/2 end
      assert_equal(M.pipe(10,f,g,h),36)
      assert_equal(M.pipe(20,f,g,h),121)  
    end) 
    
  end)

  context('complement', function()
    
    test('returns a function which returns the logical complement of a given function',function()
      assert_false(M.complement(function() return true end)())
      assert_true(M.complement(function() return false end)())
      assert_true(M.complement(function() return nil end)())
      assert_false(M.complement(function() return 1 end)())
    end) 
    
  end)
  
  context('juxtapose', function()
    
    test('calls a sequence of functions with the same set of args',function()
      local function f(x) return x^2 end
      local function g(x) return x+1 end
      local function h(x) return x/2 end
      local rf, rg, rh = M.juxtapose(10, f, g, h)
      assert_equal(rf, 100)
      assert_equal(rg, 11)
      assert_equal(rh, 5)
    end) 
    
  end)
  
  context('wrap', function()
  
    test('wraps a function and passes args',function()
      local greet = function(name) return "hi: " .. name end
      local backwards = M.wrap(greet, function(f,arg)
          return f(arg) ..'\nhi: ' .. arg:reverse()
        end) 
      assert_equal(backwards('john'),'hi: john\nhi: nhoj')
    end)
    
  end)
  
  context('times', function()
  
    test('calls a given function n times',function()
      local f = ('Lua programming'):gmatch('.')
      local r = M.times(f, 3)
      assert_true(M.isEqual(r,{'L','u','a'}))
      
      local count = 0
      local function counter() count = count+1 end
      M.times(counter, 10)
      assert_equal(count,10)
    end)
    
  end)  
  
  context('bind', function()
  
    test('binds a value to the first arg of a function',function()
      local sqrt2 = M.bind(math.sqrt,2)
      assert_equal(sqrt2(),math.sqrt(2))
    end)
    
  end) 

  context('bind2', function()
  
    test('binds a value to the second arg of a function',function()
      local last2 = M.bind2(M.last,2)
      local r = last2({1,2,3,4,5,6})
      assert_true(M.isEqual(r, {5,6}))
    end)
    
  end)

  context('bindn', function()
  
    test('binds n values to as the n-first args of a function',function()
      local function out(...)
        return table.concat {...}
      end
      out = M.bindn(out,'OutPut',':',' ')
      assert_equal(out(1,2,3),'OutPut: 123')
      assert_equal(out('a','b','c','d'),'OutPut: abcd')
    end)
    
  end)
  
  context('bindall', function()
  
    test('binds methods to object',function()
			local window = {
				setPos = function(w,x,y) w.x, w.y = x, y end, 
				setName = function(w,name) w.name = name end,
				getName = function(w) return w.name end,
			}
			window = M.bindall(window, 'setPos', 'setName', 'getName')
			window.setPos(10,15)
			window.setName('fooApp')
			
			assert_equal(window.x, 10)
			assert_equal(window.y, 15)
			assert_equal(window.name, 'fooApp')
			assert_equal(window.getName(), 'fooApp')
    end)
    
  end)

  context('cond', function()
  
    test('return a function which runs a set of predicates',function()
      local multipleOf = M.cond({
        {function(v) return v%2==0 end, function(v) return v..' is multiple of 2' end},
        {function(v) return v%3==0 end, function(v) return v..' is multiple of 3' end},
        {function(v) return v%5==0 end, function(v) return v..' is multiple of 5' end},
        {function() return true end, function(v) return 'could not find an answer for '..v end}
      })
      for i = 15, 20 do
        assert_equal(multipleOf(i), 
          i%2 == 0 and i..' is multiple of 2' or 
          i%3 == 0 and i..' is multiple of 3' or 
          'could not find an answer for '..i)
      end
    end)
    
  end)
	
  context('uniqueId', function()
  
    test('returns an unique (for the current session) integer Id',function()
      local ids = {}
      for i = 1,100 do
        local newId = M.uniqueId()
        assert_false(M.include(ids,newId))
        M.push(ids,newId)
      end     
    end)
    
    test('accepts a string template to format the returned id',function()
      local ids = {}
      for i = 1,100 do
        local newId = M.uniqueId('ID:%s')
        assert_equal(newId,'ID:'..newId:sub(4))
        assert_false(M.include(ids,newId))
        M.push(ids,newId)
      end        
    end)
    
    test('accepts a function as argument to format the returned id',function()
      local ids = {}
      local formatter = function(ID) return '$'..ID..'$' end
      for i = 1,100 do
        local newId = M.uniqueId(formatter)
        assert_not_nil(newId:match('^%$%d+%$$'))
        assert_false(M.include(ids,newId))
        M.push(ids,newId)
      end        
    end)
    
  end)  
  
	context('iterator', function()

		test('creates an iterator which continuously applies f on an input',function()
			local next_even = M.iterator(function(x) return x + 2 end, 0)
			assert_equal(next_even(), 2)
			assert_equal(next_even(), 4)
			assert_equal(next_even(), 6)
			assert_equal(next_even(), 8)
			assert_equal(next_even(),10)
		end)
    
		test('can be set to run up to a maximum number of calls',function()
			local next_even = M.iterator(function(x) return x + 2 end, 0, 3)
			assert_equal(next_even(), 2)
			assert_equal(next_even(), 4)
			assert_equal(next_even(), 6)
			assert_nil(next_even())
		end)    
		
	end)
	
	context('array', function()

		test('iterates a given iterator and returns its values in an array',function()
			local letters = M.array(('Lua'):gmatch('.'))
			assert_true(M.isEqual(letters,{'L','u','a'}))
			
			local numbers = M.array(pairs(M.range(1,10)))
			assert_true(M.isEqual(numbers,M.range(1,10)))			
		end)
		
	end)
  
	context('castArray', function()

		test('converts value to an array',function()
      assert_true(M.isEqual(M.castArray(1),{1}))
      assert_true(M.isEqual(M.castArray(print),{print}))
      assert_true(M.isEqual(M.castArray(true),{true}))
		end)
		
		test('leaves given value untouched if it is an array',function()
      local t1 = {1,2}
      local t2 = {nil, true, false}
      assert_true(M.isEqual(M.castArray(t1),t1))
      assert_true(M.isEqual(M.castArray(t2),t2))
		end)
    
	end)  
	
	context('flip', function()

		test('creates a function which runs f with arguments flipped',function()
			local function f(...) return table.concat({...}) end
			local flipped = M.flip(f)
			assert_equal(flipped('a','b','c'),'cba')
		end)
		
	end)

	context('nthArg', function()

		test('creates a function which returns the nth arg',function()
      local f2 = M.nthArg(2)
      local f3 = M.nthArg(3)
      local f4 = M.nthArg(4)
			assert_equal(f2(4,8,5,4,6),8)
			assert_equal(f3(4,8,5,4,6),5)
			assert_equal(f4(4,8,5,4,6),4)
		end)
		
		test('if n is negative, will count from the end',function()
      local f2 = M.nthArg(-2)
      local f3 = M.nthArg(-3)
      local f4 = M.nthArg(-4)
			assert_equal(f2(4,8,5,4,6),4)
			assert_equal(f3(4,8,5,4,6),5)
			assert_equal(f4(4,8,5,4,6),8)
		end)
    
	end) 
 
	context('unary', function()

		test('creates a function which accepts only one arg',function()
      local f = M.unary(function(...) return ... end)
      assert_equal(f(1),1)
      assert_equal(f(1,2),1)
      assert_equal(f(1,2,3),1)
		end)
    
	end)
  
	context('ary', function()

		test('creates a function which accepts up to n args',function()
      local f = M.ary(function(...) return ... end, 2)
      assert_true(M.isEqual({f(1,2)},{1,2}))
      assert_true(M.isEqual({f(1,2,3)},{1,2}))
      assert_true(M.isEqual({f(1,2,3,4)},{1,2}))
		end)
    
	end)  
  
	context('rearg', function()

		test('creates a function with args reordered',function()
      local f = M.rearg(function(...) return ... end, {3,2,1})
      assert_true(M.isEqual({f(1,2,3)},{3,2,1}))
      assert_true(M.isEqual({f(2,1,3)},{3,1,2}))
      assert_true(M.isEqual({f(3,2,1)},{1,2,3}))
		end)
    
	end)   
	
	context('over', function()

		test('returns a function which applies a set of transforms to its args',function()
			local minmax = M.over(math.min, math.max)
			local maxmin = M.over(math.max, math.min)
			assert_true(M.isEqual(minmax(5,10,12,4,3),{3,12}))
			assert_true(M.isEqual(maxmin(5,10,12,4,3),{12,3}))	
		end)
		
	end)		
	
	context('overEvery', function()
		
		local alleven, allpositive
		
		before(function()
			alleven = function(...) 
				for i, v in ipairs({...}) do if v%2~=0 then return false end end 
				return true 
			end

			allpositive = function(...)
				for i, v in ipairs({...}) do if v < 0 then return false end end
				return true 	
			end		
		end)
		
		test('checks if all predicates passes truth with args. ',function()
			local allok = M.overEvery(alleven, allpositive)
			assert_false(allok(2,4,-1,8))
			assert_false(allok(10,3,2,6))
			assert_true(allok(8,4,6,10))
		end)
		
	end)

	context('overSome', function()
		
		local alleven, allpositive
		
		before(function()
			alleven = function(...) 
				for i, v in ipairs({...}) do if v%2~=0 then return false end end 
				return true 
			end

			allpositive = function(...)
				for i, v in ipairs({...}) do if v < 0 then return false end end
				return true 	
			end		
		end)
		
		test('checks if all predicates passes truth with args. ',function()
			local anyok = M.overSome(alleven, allpositive)
			assert_false(anyok(2,4,-1,8))
			assert_true(anyok(10,3,2,6))
			assert_false(anyok(-1,-5,-3))
		end)
		
	end)	
	
	context('overArgs', function()

		test('Creates a function that invokes `f` with its arguments transformed',function()
			local function f(x, y) return {x, y} end
			local function triple(x) return x*3 end
			local function square(x) return x^2 end
			local new_f = M.overArgs(f, triple, square)
			assert_true(M.isEqual(new_f(1,2), {3,4}))
			assert_true(M.isEqual(new_f(10,10), {30,100}))			
		end)
		
		test('when supplied more args than transforms, remaining are left as-is',function()
			local function f(x, y, z, k) return {x, y, z, k} end
			local function triple(x) return x*3 end
			local function square(x) return x^2 end
			local new_f = M.overArgs(f, triple, square)
			assert_true(M.isEqual(new_f(1,2,3,4), {3,4,3,4}))
			assert_true(M.isEqual(new_f(10,10,10,10), {30,100,10,10}))			
		end)		
		
	end)	
	
  context('converge', function()
  
    test('', function()
      local function pow2(x) return x*x end
      local function pow3(x) return x*x*x end
      local function sum(a,b) return a+b end
      local poly = M.converge(sum, pow2, pow3)
      assert_equal(poly(5), 150)
      assert_equal(poly(1), 2)
      assert_equal(poly(3), 36)
    end)
    
  end)
  
	context('partial', function()

		test('applies partially f',function()
			local function diff(a, b) return a - b end
			local diffFrom20 = M.partial(diff, 20)
			assert_equal(diffFrom20(5), 15)
			assert_equal(diffFrom20(10), 10)
			assert_equal(diffFrom20(-5), 25)
		end)
		
		test('\'_\' can be used as a placeholder',function()
			local function diff(a, b) return a - b end
			local remove10 = M.partial(diff, '_',10)
			assert_equal(remove10(5), -5)
			assert_equal(remove10(10), 0)
			assert_equal(remove10(15), 5)
		end)
		
	end)
	
	context('partialRight', function()

		test('applies partial but from the right',function()
			local function concat(a,b,c,d) return a..b..c..d end
			assert_equal(M.partialRight(concat,'a','b','c')('d'), 'dabc')
			assert_equal(M.partialRight(concat,'a','b')('c','d'), 'cdab')
			assert_equal(M.partialRight(concat,'a')('b','c','d'), 'bcda')
		end)
		
		test('\'_\' can be used as a placeholder',function()
			local function concat(a,b,c,d) return a..b..c..d end		
			assert_equal(M.partialRight(concat,'a','_','c')('d','b'), 'badc')
			assert_equal(M.partialRight(concat,'a','b','_')('c','d'), 'dabc')
			assert_equal(M.partialRight(concat,'_','a')('b','c','d'), 'cdba')
		end)
		
	end)	
	
	context('curry', function()

		test('curries a function for a specific number of args',function()
			local function sumOf5args(a,b,c,d,e) return a+b+c+d+e end
			local curried_sumOf5args = M.curry(sumOf5args, 5)
			assert_equal(curried_sumOf5args(1)(2)(3)(4)(5),15)
			assert_equal(curried_sumOf5args(8)(-2)(4)(-10)(1),1)
		end)
		
		test('n_args defaults to 2 when not supplied',function()
			local function prod(x,y) return x*y end
			local curried_prod = M.curry(prod)
			assert_equal(curried_prod(2)(3), (M.curry(prod,2))(2)(3))
			assert_equal(curried_prod(-2)(6), (M.curry(prod,2))(-2)(6))
		end)

		test('n_args can be equal to 1',function()
			local curried_identity = M.curry(M.identity,1)
			assert_equal(curried_identity('value'), 'value')
			assert_equal(curried_identity(1), 1)
			assert_equal(curried_identity(true), true)
			assert_equal(curried_identity(false), false)
		end)
		
		test('giving more args than n_args will raise an error',function()
			local function add(a,b) return a+b end
			local curried_add = M.curry(add, 2)
			assert_error(function() curried_add(1)(2)(3) end)
			assert_error(function() curried_add(4)(5)(6)(7)(8) end)
		end)		
		
		test('When given less than n_args, it will wait for missing args',function()
			local function add(a,b,c) return a+b+c end
			local curried_add = M.curry(add, 3)
			local c1 = curried_add(1)
			local c2 = c1(2)
			local c3 = c2(3)
			assert_type(c1, 'function')		
			assert_type(c2, 'function')
			assert_equal(c3, 6)
		end)
		
	end)
	
	context('time', function()
	
		test('returns the execution time of a function and its results', function()
			local function f(...) return ... end
			
			local duration, r = M.time(f, 'a')
			assert_type(duration, 'number')
			assert_equal(r, 'a')
			
			local duration, a, b, c = M.time(f, 1, 2, 3)
			assert_type(duration, 'number')
			assert_true(a == 1 and b == 2 and c == 3)	
		end)
	
	end)
	
end)