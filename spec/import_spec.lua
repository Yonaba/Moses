require 'luacov'
local M = require 'moses'

describe('Import specs', function()
  
  it('imports all library function to a given context', function()
    local funcs = M.functions()
    local context = M.import({})
    assert.is_true(M.all(funcs, function(n) return M.has(context, n) end))
  end)

  it('passing "noConflict" will preserve already existing keys', function()
    local funcs = M.functions()
    local context = M.import({each = 1, all = 2}, true)
    assert.is_true(M.all(funcs, function(n) return M.has(context, n) end))
    assert.equal(context.each, 1)
    assert.equal(context.all, 2)
  end)
  
end)