#Version history#

##1.3.1 (04/12/13)
* Added chaining interface
* Renamed `_.isObject` to `_.isTable`
* Added `_.tap`, `_.chain`, `_()` and `_.value`
* Added `_.findWhere`
* Added `_.contains`
* _.functions no longer takes an output table
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
