#Version history#

##1.5.0 (04/04/17)

* Improved `_.select` (cd9237c710c485d87a0bdb46e3d4eaae6f45b37c)
* Fixed `_.compose` (452d519a4f66038eb13e403fdb6ba58b868cfa88)
* Made `_.contains` as an alias to `_.include` (5622dac6ee2760d99654a4b575ef5dc9c3fdac11)
* Improved `_.all` (8df3f7c6f6d0d4e395b936a4d804ad608db28072)
* Fixed _.size (34eada9c525e589e7596ac5c8fc75e4447fa583e)
* Added `_.bind2` (749f2b4c80663fef50d1f27062be5f230b3ff3f3)
* Improved `_.map` to map key-value pairs to key-value pairs (e9d15840b4a84558e2ce1d1e6233b0f008071d17)

##1.4.0 (07/14/14)

###Breaking
#### Changes
* Aliases are available by default
* `_.find` is no longer an alias to `_.detect`
* Provided a new implementation of `_.unique`, removed argument `_.isSorted`
* `_.isNil` now returns true if arg is nil, an empty string or empty table and false otherwise.
* `_.size` now returns 0 for empty args instead of `nil`
* `_.unique` no longer accepts `iter` argument to transform original array values.
* `_.cycle` argument `n` now defaults to 1.
* `_.groupBy` no longer handles `iter` as a string

#### Renamed
* Renamed alias `_.uId` to `_.uid`
* Renamed `_.add` to `_.addTop`
* Renamed `_.uniq` as alias to `_.unique`
* Renamed `_.symmetric_difference` to `_.symmetricDifference`

#### Removed
* Removed `_.paired`

###Improvements & bugfixes
* `_.reduce` now supports an array of booleans
* `_.pick` now picks false values
* `_.concat` args `i` and `j` defaults explicitely to 1 and array length (for compatibility with LuaJIT)
* `_.pop` now takes an optional extra-arg n, to be the number of values to be popped
* `_.unshift` now takes an optional extra-arg n, to be the number of values to be retrieved
* Moved explicitely `_.toArray` to array functions
* `_.functions` accepts an extra-arg to prevent from looking-up for methods in metatables.

### New functions (and aliases)
* Added `_.find`
* Added `_.pipe`
* Added `_.complement`
* Added `_.juxtapose` and alias `_.juxt`
* Added `_.isunique` and alias `_.isuniq`
* Added `_.rep`
* Added `_.interleave`
* Added `_.interpose`
* Added `_.partition` and alias `_.part`
* Added `_.permutation` and alias `_.perm`
* Added `_.compare` as alias to `_.isEqual`
* Added `_.isIterable`
* Added `_.toBoolean`
* Added `_.pull` and alias `_.remove`
* Added `_.at`

### New aliases
* Added `_.xor` as alias to `_.symmetricDifference`

##1.3.2.1 (04/22/13)
Renamed global `MOSES_NO_ALIASES` to global `MOSES_ALIASES`. Aliases are not available by default.

##1.3.2 (04/19/13)
Added `_.import`, export library to context or _G
Added `noConflict` option to `_.import`
Added `MOSES_NO_ALIASES` option when requiring the library
Added `_.symmetric_difference`
Added `_.eachi`
Added  `_.isInteger`
Added `_.cycle`
Added `_.count`
Added `_.countf`
Added `_.chunk` (inspired from Ruby's Enumerable [#chunk](http://ruby-doc.org/core-2.0/Enumerable.html#method-i-chunk))
Added  `_.chop` as alias to `_.removeRange`
Added  `_.skip` as alias to `_.last`
Added  `_.diff` as alias to `_.difference`
Added  `_.symdiff` as alias to `_.symmetric_difference`
Added `_.forEachi` as alias to `_.eachi`
Added `_.loop` as alias to `_.cycle`
Renamed `_.pairs` to `_.paired`
Removed `_.count` as alias to `_.range`
Changed `_.difference behaviour`, now takes up to two arrays as args
Fixed internal inconsistencies with aliases, should not be used internally with regards to `MOSES_NO_ALIASES` option.
Fixed `_.each` implementation, should not return anything

##1.3.1 (04/12/13)
* Added chaining interface
* Renamed `_.isObject` to `_.isTable`
* Added `_.tap`, `_.chain`, `_()` and `_.value`
* Added `_.findWhere`
* Added `_.contains`
* _.functions no longer takes an output table
* Changed _.isArray behaviour, returns true only for real Lua arrays
* Updated specs
* Updated docs and samples

##1.3.0 (11/12/12)
* Removed _.iterate (slower than pairs, ipairs)
* Added _.identity
* Removed _.curry (was more like a closure, will provide a proper implementation later)
* Removed _.iter_to_array
* Most of all functions rewritten
* _.import/_.mixin now imports library functions to the global env.
* Added type checking functions as object functions
* Added new functions and aliases : Moses has 85 unique functions, 117 counting aliases.
* Added HTML docs
* Added Specs
* Added samples

##1.2.1 (08/20/12)
* Added `_.takeWhile` (as alias to `_.selectWhile`)
* Added `_.dropWhile` and `_.rejectWhile` (as alias)
* Updated Moses_Lib_Test.lua
* Updated documentation

##1.2 (08/19/12)
* Added `_.selectWhile`
* Added `_.mapReduce` and `_.mapr` (as alias)
* Added `_.mapReduceRight` and `_.maprr` (as alias)
* Added `_.bindn`
* Added `_.appendLists`
* Updated Moses_Lib_Test.lua
* Updated documentation

##1.1 (08/04/12)
* Removed `_.contains` as alias to `_.include`
* Added `_.removeRange` (as Array function)
* Added `_.sameKeys` and `_.contains` (as Collection functions)
* Added `_.bind` (as Utility function)
* Updated Moses_Lib_Test.lua
* Updated documentation

##1.0 (08/02/12)
* Added `_.append`, `_.invert`, `_.import`, `_.template`, `_.curry`
* Updated Moses_Lib_Test.lua
* Updated documentation

##0.1 (07/24/12)
* Initial Release
