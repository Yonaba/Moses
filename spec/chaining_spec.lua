require 'luacov'
local M = require 'moses'

describe('Chaining specs', function()

   describe('chain', function()
  
    it('Chains a value',function()
      local v = M.chain({1,2,3,4})
        :filter(function(k) return k%2~=0 end)
        :max()
        :value()
      assert.equal(v, 3)
    end)
    
    it('M(value) is the same as M.chain(value)', function()
      local v = M({1,2,3,4})
        :filter(function(k) return k%2~=0 end)
        :max()
        :value()
      assert.equal(v, 3)    
    end)
    
  end) 
  
   describe('value', function()
  
    it('Unwraps a chained object',function()
      local t = {1,2,3}
      assert.equal(M.chain(t):value(), t)
      assert.equal(M(t):value(), t)
    end)
    
  end)   

end)