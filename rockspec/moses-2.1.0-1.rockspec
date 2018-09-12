package = "moses"
version = "2.1.0-1"
source = {
   url = "https://github.com/Yonaba/Moses/archive/Moses-2.1.0-1.tar.gz",
   dir = "Moses-Moses-2.1.0-1"
}
description = {
   summary = "Utility-belt library for functional programming in Lua",
   detailed = [[
    A utility-belt library for functional programming, which complements the built-in 
    Lua table library, making easier operations on arrays, lists, collections.
   ]],
   homepage = "http://yonaba.github.com/Moses/",
   license = "MIT <http://www.opensource.org/licenses/mit-license.php>"
}
dependencies = {
   "lua >= 5.1, < 5.4"
}
build = {
  type = "builtin",
  modules = {
    ["moses"] = "moses.lua",
    ["moses_min"] = "moses_min.lua",
  },
  copy_directories = {"doc","spec"}	
}