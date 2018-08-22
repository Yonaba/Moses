require 'luacov'
local _ = require 'moses'

context('Import specs', function()
  
  test('imports all library function to a given context', function()
    local funcs = _.functions()
    local context = _.import({})
    assert_true(_.all(funcs, function(n) return _.has(context, n) end))
  end)

  test('passing "noConflict" will preserve already existing keys', function()
    local funcs = _.functions()
    local context = _.import({each = 1, all = 2}, true)
    assert_true(_.all(funcs, function(n) return _.has(context, n) end))
    assert_equal(context.each, 1)
    assert_equal(context.all, 2)
  end)
  
end)