# Version history

## Unreleased

### Additions

* Added `mapi (t, f)` in table functions.

### Fixes and improvements

* Fixed `chunk` to avoid generating chunks at index 0. 
* Made argument `f` to `chunk` optional. Defaults to `identity`
* Fixed alias to `uniqueId`
* Fixed `M.powerset`
* Prevents straight calls to io and os modules for Redis compatibility

## 2.1.0 (09/12/2018)

### Breaking changes

* Renamed `toArray` to `pack`
* Renamed `reduceby` to `reduceBy`
* Removed `skip` as alias to `last`
* Changed prototype : `each(t, f, ...)` is now `each(t, f)`
* Changed prototype : `eachi(t, f, ...)` is now `eachi(t, f)`
* Changed prototype : `adjust(t, key, f, ...)` is now `adjust(t, key, f)`
* Changed prototype : `countf(t, f, ...)` is now `countf(t, f)`
* Changed prototype : `map(t, f, ...)` is now `map(t, f)`
* Changed prototype : `reduceBy(t, f, pred, state, ...)` is now `reduceBy(t, f, pred, state)`
* Changed prototype : `select(t, f, ...)` is now `select(t, f)`
* Changed prototype : `reject(t, f, ...)` is now `reject(t, f)`
* Changed prototype : `all(t, f, ...)` is now `all(t, f)`
* Changed prototype : `invoke(t, method, ...)` is now `invoke(t, method)`
* Changed prototype : `min(t, transform, ...)` is now `min(t, transform)`
* Changed prototype : `max(t, transform, ...)` is now `max(t, transform)`
* Changed prototype : `countBy(t, iter, ...)` is now `countBy(t, iter)`
* Changed prototype : `groupBy(t, iter, ...)` is now `groupBy(t, iter)`
* Changed prototype : `selectWhile(array, f, ...)` is now `selectWhile(array, f)`
* Changed prototype : `dropWhile(array, f, ...)` is now `dropWhile(array, f)`
* Changed prototype : `findIndex(array, pred, ...)` is now `findIndex(array, pred)`
* Changed prototype : `findLastIndex(array, pred, ...)` is now `findLastIndex(array, pred)`
* Changed prototype : `chunk(array, f, ...)` is now `chunk(array, f)`
* Changed prototype : `times(iter, n, ...)` is now `times(iter, n)`
* Changed prototype : `template(id, ...)` is now `template(id)`
* Changed prototype : `tap(obj, f, ...)` is now `tap(obj, f)`
* Changed prototype : `result(obj, method, ...)` is now `result(obj, method)`
* Changed prototype : `intersection(array, ...)` is now `intersection(array)`

### Other changes

* Renamed `array` to `tabulate`, with no alias
* Moved `invert` to object functions

### Additions

* Added `best` in table functions
* Added `allEqual` in table functions
* Added `sortedk` iterator in array functions
* Added `sortedv` iterator in array functions
* Added `disjoint` in array functions
* Added `nsorted` in array functions
* Added `duplicates` in array functions
* Added `xpairs` in array functions
* Added `xpairsRight` in array functions
* Added `call` in utility functions
* Added `type` in object functions
* Added `spreadPath` in object functions
* Added `flattenPath` in object functions
* Added `thread` in utility functions
* Added `threadRight` in utility functions
* Added `iterlen` in utility functions
* Added `skip` in utility functions
* Added `both` in utility functions
* Added `either` in utility functions
* Added `neither` in utility functions
* Added `dispatch` in utility functions
* Added `noarg` in utility functions

## 2.0.0 (08/23/2018)
### Breaking changes
* library functions now accept iterators prototyped as `f(v, k, ...)` instead of `f(k, v, ...)`.
It improves the benefits of chaning and helps writting a clear functional-style code.
Library functions affected with this breaking change are : 
`each`, `eachi`,`countf`, `map`, `reduceby`, `select`, `reject`, `all`, `groupBy`, `countBy`, 
`selectWhile`, `dropWhile`, `findIndex`, `findLastIndex`, `chunk`.
* `reduceby` is now prototyped as `reduceby(t, f, pred, state)` instead of `reduceby(t, f, state, pred)`.
* `times` is now prototyped as `times(iter, n, ...)` instead of `times(iter, n, ...)`.
* `bindAll` was renamed to `bindall`
* `functions` no longer accept optional `sort` third arguments
* `sliding` was renamed to `overlapping`
* Improved `range` to handle negative progressions and start the count from 1.
* `memoize` no longer takes a `hash` function.

### Other changes
* Made `shift` a default library function, and `pop` its alias.
* Moved `shuffle` from table function to array functions
* Made `iterator` to accept an extra optional arg `n`

### Additions

#### Added support for operators
* Arithmetic operators : `add`, `sub`, `mul`, `div`, `mod`, `exp`, `pow` (alias to `exp`), `unm`, `neg` (alias to `unm`), `floordiv`, `intdiv`
* Relational operators : `eq`, `neq`, `lt`, `gt`, `le`, `ge`
* Logical operators : `land`, `lor`, `lnot`
* Concatenation operator : `concat`
* Length operator : `length`, `len` (alias to `length`)

#### Added functions
* Added `adjust` in table functions
* Added `xprod` in array functions
* Added `prepend` in array functions
* Added `zeros` in array functions
* Added `ones` in array functions
* Added `vector` in array functions
* Added `aperture` in array functions
* Added `sum` in array functions
* Added `product` in array functions
* Added `mean` in array functions
* Added `median` in array functions
* Added `powerset` in array functions
* Added `zipWith` in array functions
* Added `pairwise` in array functions
* Added `applySpec` in utility functions
* Added `nthArg` in utility functions
* Added `cond` in utility functions
* Added `castArray` in utility functions
* Added `unary` in utility functions
* Added `ary` in utility functions
* Added `rearg` in utility functions
* Added `unfold` in utility functions
* Added `converge` in utility functions
* Added `path` in object functions

#### Added function aliases
* Added `update` as alias to `adjust`
* Added `always` as alias to `constant`
* Added `intersperse` as alias to `interpose`
* Added `sliding` as alias to `aperture`
* Added `tabulate` as alias to `array`
* Added `matches` as alias to `isEqual`
* Added `average` as alias to `mean`
* Added `nAry` as alias to `ary`
* Added `transposeWith` as alias to `zipWith`

## 1.6.1 (04/27/17)

* Added `_.array`
* Added `_.clear`
* Added `_.time`
* Added `_.before`

## 1.6.0 (14/04/17)

* Added `_.toObj`
* Added `_.noop`
* Added `_.partialRight`
* Added `_.flip`
* Added `_.overArgs`
* Added `_.over`
* Added `_.overEvery`
* Added `_.overSome`

## 1.5.1 (04/13/17)

* Added `_.curry`
* Added `_.fill`
* Added `.transpose` as an alias to `_.zip`

## 1.5.0 (04/10/17)

#### Additions
* Added `_.bind2`
* Added `_.reduceby`
* Added `_.iterator` (and alias `_.iter`)
* Added `_.sliding`
* Added `_.sample`
* Added `_.sampleProb`
* Added `_.where`
* Added `_.sortBy`
* Added `_.findIndex`
* Added `_.findLastIndex`
* Added `_.bindAll`
* Added `_.partial`
* Added `_.kvpairs`
* Added `_.property`
* Added `_.propertyOf`
* Added `_.constant`

* Added parameter `pad` to `_.partition`

#### Changes, bugfixes
* Improved `_.select`
* Fixed `_.compose`
* Made `_.contains` as an alias to `_.include`
* Improved `_.all`
* Fixed `_.size`
* Improved `_.map` to map key-value pairs to key-value pairs
* Fixed `_.partition` to generate an error for partition size < 1.


## 1.4.0 (07/14/14)

### Breaking
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

### Improvements & bugfixes
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

## 1.3.2.1 (04/22/13)
Renamed global `MOSES_NO_ALIASES` to global `MOSES_ALIASES`. Aliases are not available by default.

## 1.3.2 (04/19/13)
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

## 1.3.1 (04/12/13)
* Added chaining interface
* Renamed `_.isObject` to `_.isTable`
* Added `_.tap`, `_.chain`, `_()` and `_.value`
* Added `_.findWhere`
* Added `_.contains`
* _.functions no longer takes an output table
* Changed _.isArray behaviour, returns true only for real Lua arrays
* Updated specs
* Updated docs and samples

## 1.3.0 (11/12/12)
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

## 1.2.1 (08/20/12)
* Added `_.takeWhile` (as alias to `_.selectWhile`)
* Added `_.dropWhile` and `_.rejectWhile` (as alias)
* Updated Moses_Lib_Test.lua
* Updated documentation

## 1.2 (08/19/12)
* Added `_.selectWhile`
* Added `_.mapReduce` and `_.mapr` (as alias)
* Added `_.mapReduceRight` and `_.maprr` (as alias)
* Added `_.bindn`
* Added `_.appendLists`
* Updated Moses_Lib_Test.lua
* Updated documentation

## 1.1 (08/04/12)
* Removed `_.contains` as alias to `_.include`
* Added `_.removeRange` (as Array function)
* Added `_.sameKeys` and `_.contains` (as Collection functions)
* Added `_.bind` (as Utility function)
* Updated Moses_Lib_Test.lua
* Updated documentation

## 1.0 (08/02/12)
* Added `_.append`, `_.invert`, `_.import`, `_.template`, `_.curry`
* Updated Moses_Lib_Test.lua
* Updated documentation

## 0.1 (07/24/12)
* Initial Release
