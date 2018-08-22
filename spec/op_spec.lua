require 'luacov'
local M = require 'moses'

describe('Operators specs', function()
  
  describe('Arithmetic operators', function()
  
    it('add returns a + b', function()
      assert.equal(M.operator.add(1,2), 3)
      assert.equal(M.operator.add(0,0), 0)
      assert.equal(M.operator.add(0,-5), -5)
    end)

    it('sub returns a - b', function()
      assert.equal(M.operator.sub(1,2), -1)
      assert.equal(M.operator.sub(0,0), 0)
      assert.equal(M.operator.sub(0,-5), 5)
    end)
    
    it('mul returns a * b', function()
      assert.equal(M.operator.mul(1,2), 2)
      assert.equal(M.operator.mul(0,0), 0)
      assert.equal(M.operator.mul(0,-5), 0)
    end)  
    
    it('div returns a / b', function()
      assert.equal(M.operator.div(1,2), 0.5)
      assert.equal(M.operator.div(5,5), 1)
      assert.equal(M.operator.div(8,-2), -4)
    end)
    
    it('mod returns a % b', function()
      assert.equal(M.operator.mod(6,3), 0)
      assert.equal(M.operator.mod(5,2), 1)
    end)

    it('exp returns a ^ b', function()
      assert.equal(M.operator.exp(3,3), 27)
      assert.equal(M.operator.exp(5,2), 25)
    end)
    
    it('unm returns -a', function()
      assert.equal(M.operator.unm(3), -3)
      assert.equal(M.operator.unm(-5), 5)
    end)
    
    it('floordiv returns a//b', function()
      assert.equal(M.operator.floordiv(5,2), 2)
    end)
    
    it('intdiv performs integer division', function()
      assert.equal(M.operator.intdiv(5,2), 2)
      assert.equal(M.operator.intdiv(-5,2), -2)
    end)
    
  end)
  
  describe('Relational operators', function()
  
    it('eq returns a == b', function()
      assert.equal(M.operator.eq(5,5), true)
      assert.equal(M.operator.eq(5,4.99), false)
    end)
    
    it('neq returns a ~= b', function()
      assert.equal(M.operator.neq(5,5), false)
      assert.equal(M.operator.neq(5,4.99), true)
    end)    
    
    it('lt returns a < b', function()
      assert.equal(M.operator.lt(5,5), false)
      assert.equal(M.operator.lt(4.99,5), true)
    end)
    
    it('gt returns a > b', function()
      assert.equal(M.operator.gt(5,5), false)
      assert.equal(M.operator.gt(5,4.99), true)
    end)    
    
    it('le returns a <= b', function()
      assert.equal(M.operator.le(5,5), true)
      assert.equal(M.operator.le(4.99,5), true)
      assert.equal(M.operator.le(5,4.99), false)
    end)
    
    it('ge returns a >= b', function()
      assert.equal(M.operator.ge(5,5), true)
      assert.equal(M.operator.ge(4.99,5), false)
      assert.equal(M.operator.ge(5,4.99), true)
    end)
    
  end)
  
  describe('Logical operators', function()
  
    it('land returns a and b', function()
      assert.equal(M.operator.land(true, true),true)
      assert.equal(M.operator.land(true, false),false)
      assert.equal(M.operator.land(false, true),false)
      assert.equal(M.operator.land(false, false),false)
      assert.equal(M.operator.land(true, nil),nil)
      assert.equal(M.operator.land(false, nil),false)
    end)
    
    it('lor returns a or b', function()
      assert.equal(M.operator.lor(true, true),true)
      assert.equal(M.operator.lor(true, false),true)
      assert.equal(M.operator.lor(false, true),true)
      assert.equal(M.operator.lor(false, false),false)
      assert.equal(M.operator.lor(true, nil),true)
      assert.equal(M.operator.lor(false, nil),nil)
    end)

     it('lnot returns not a', function()
      assert.equal(M.operator.lnot(true),false)
      assert.equal(M.operator.lnot(false),true)
      assert.equal(M.operator.lnot(nil),true)
    end)   
    
  end)
  
  describe('Length operator', function()
  
    it('length returns #a', function()
      assert.equal(M.operator.length({}),0)
      assert.equal(M.operator.length({2}),1)
      assert.equal(M.operator.length({3,5,3}),3)
      assert.equal(M.operator.length('hello'),5)
    end) 
    
  end)
  
  describe('Concatenation operator', function()
  
    it('concat returns a..b', function()
      assert.equal(M.operator.concat('a','b'),'ab')
      assert.equal(M.operator.concat('1','2'),'12')
    end) 
    
  end)  
  
  describe('Aliases', function()
  
    it('op is an alias to operator', function()
      assert.equal(M.operator, M.op)
    end) 
    
    it('pow is an alias to exp', function()
      assert.equal(M.operator.exp, M.operator.pow)
    end)   
    
    it('neg is an alias to unm', function()
      assert.equal(M.operator.neg, M.operator.unm)
    end)
    
    it('len is alias to length', function()
      assert.equal(M.operator.length,M.operator.len)
    end)
  
  end)
  
end)