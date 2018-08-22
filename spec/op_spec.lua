require 'luacov'
local M = require 'moses'

context('Operators specs', function()
  
  context('Arithmetic operators', function()
  
    test('add returns a + b', function()
      assert_equal(M.operator.add(1,2), 3)
      assert_equal(M.operator.add(0,0), 0)
      assert_equal(M.operator.add(0,-5), -5)
    end)

    test('sub returns a - b', function()
      assert_equal(M.operator.sub(1,2), -1)
      assert_equal(M.operator.sub(0,0), 0)
      assert_equal(M.operator.sub(0,-5), 5)
    end)
    
    test('mul returns a * b', function()
      assert_equal(M.operator.mul(1,2), 2)
      assert_equal(M.operator.mul(0,0), 0)
      assert_equal(M.operator.mul(0,-5), 0)
    end)  
    
    test('div returns a / b', function()
      assert_equal(M.operator.div(1,2), 0.5)
      assert_equal(M.operator.div(5,5), 1)
      assert_equal(M.operator.div(8,-2), -4)
    end)
    
    test('mod returns a % b', function()
      assert_equal(M.operator.mod(6,3), 0)
      assert_equal(M.operator.mod(5,2), 1)
    end)

    test('exp returns a ^ b', function()
      assert_equal(M.operator.exp(3,3), 27)
      assert_equal(M.operator.exp(5,2), 25)
    end)
    
    test('unm returns -a', function()
      assert_equal(M.operator.unm(3), -3)
      assert_equal(M.operator.unm(-5), 5)
    end)
    
    test('floordiv returns a//b', function()
      assert_equal(M.operator.floordiv(5,2), 2)
    end)
    
    test('intdiv performs integer division', function()
      assert_equal(M.operator.intdiv(5,2), 2)
      assert_equal(M.operator.intdiv(-5,2), -2)
    end)
    
  end)
  
  context('Relational operators', function()
  
    test('eq returns a == b', function()
      assert_equal(M.operator.eq(5,5), true)
      assert_equal(M.operator.eq(5,4.99), false)
    end)
    
    test('neq returns a ~= b', function()
      assert_equal(M.operator.neq(5,5), false)
      assert_equal(M.operator.neq(5,4.99), true)
    end)    
    
    test('lt returns a < b', function()
      assert_equal(M.operator.lt(5,5), false)
      assert_equal(M.operator.lt(4.99,5), true)
    end)
    
    test('gt returns a > b', function()
      assert_equal(M.operator.gt(5,5), false)
      assert_equal(M.operator.gt(5,4.99), true)
    end)    
    
    test('le returns a <= b', function()
      assert_equal(M.operator.le(5,5), true)
      assert_equal(M.operator.le(4.99,5), true)
      assert_equal(M.operator.le(5,4.99), false)
    end)
    
    test('ge returns a >= b', function()
      assert_equal(M.operator.ge(5,5), true)
      assert_equal(M.operator.ge(4.99,5), false)
      assert_equal(M.operator.ge(5,4.99), true)
    end)
    
  end)
  
  context('Logical operators', function()
  
    test('land returns a and b', function()
      assert_equal(M.operator.land(true, true),true)
      assert_equal(M.operator.land(true, false),false)
      assert_equal(M.operator.land(false, true),false)
      assert_equal(M.operator.land(false, false),false)
      assert_equal(M.operator.land(true, nil),nil)
      assert_equal(M.operator.land(false, nil),false)
    end)
    
    test('lor returns a or b', function()
      assert_equal(M.operator.lor(true, true),true)
      assert_equal(M.operator.lor(true, false),true)
      assert_equal(M.operator.lor(false, true),true)
      assert_equal(M.operator.lor(false, false),false)
      assert_equal(M.operator.lor(true, nil),true)
      assert_equal(M.operator.lor(false, nil),nil)
    end)

     test('lnot returns not a', function()
      assert_equal(M.operator.lnot(true),false)
      assert_equal(M.operator.lnot(false),true)
      assert_equal(M.operator.lnot(nil),true)
    end)   
    
  end)
  
  context('Length operator', function()
  
    test('length returns #a', function()
      assert_equal(M.operator.length({}),0)
      assert_equal(M.operator.length({2}),1)
      assert_equal(M.operator.length({3,5,3}),3)
      assert_equal(M.operator.length('hello'),5)
    end) 
    
  end)
  
  context('Concatenation operator', function()
  
    test('concat returns a..b', function()
      assert_equal(M.operator.concat('a','b'),'ab')
      assert_equal(M.operator.concat('1','2'),'12')
    end) 
    
  end)  
  
  context('Aliases', function()
  
    test('op is an alias to operator', function()
      assert_equal(M.operator, M.op)
    end) 
    
    test('pow is an alias to exp', function()
      assert_equal(M.operator.exp, M.operator.pow)
    end)   
    
    test('neg is an alias to unm', function()
      assert_equal(M.operator.neg, M.operator.unm)
    end)
    
    test('len is alias to length', function()
      assert_equal(M.operator.length,M.operator.len)
    end)
  
  end)
  
end)