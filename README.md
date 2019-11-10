[![Build Status](https://travis-ci.org/Yonaba/Moses.png)](https://travis-ci.org/Yonaba/Moses)
[![Latest Stable](https://img.shields.io/badge/Latest_Stable-2.1.0-blue.svg)](https://github.com/Yonaba/Moses/releases/tag/Moses-2.1.0-1)
[![License](http://img.shields.io/badge/Licence-MIT-brightgreen.svg)](LICENSE)
[![Lua](https://img.shields.io/badge/Lua-5.1%2C%205.2%2C%205.3%2C%20JIT-blue.svg)]()

A Lua utility-belt library for [functional programming](http://en.wikipedia.org/wiki/Functional_programming).<br/>

## Examples

How can I get the sum of all integers between 1 and 100 ?

```lua
local sum = M.sum(M.range(100))
print(sum) -- 5050
````
Say I am looking for the length of the longest word in some array ?

```lua
local words = {'some','words','of','different','lengths'}
print(M.max(words, M.op.length)) -- 9 letters
````

What is the sum of all fibonacci numbers for n below or equal 25 ?

```lua
local function fib(n) return n < 2 and n or fib(n - 1) + fib(n - 2) end
local fibsum = M.sum(M.map(M.range(25), fib))
print(fibsum) -- 196417
````

Or let us do the same, object-oriented style with chaining :

```lua
local function fib(n) return n < 2 and n or fib(n - 1) + fib(n - 2) end
local fibsum = M.chain(M.range(25)):map(fib):sum():value()
print(fibsum) -- 196417
````

Or even shorter :

```lua
local fibsum = M(M.range(25)):map(fib):sum():value()
print(fibsum) -- 196417
````

Feel free to download and try it on your own!

## Download

### Archive
* __2.1.0__ *(latest stable)*: [zip](http://github.com/Yonaba/Moses/archive/Moses-2.1.0-1.zip) | [tar.gz](http://github.com/Yonaba/Moses/archive/Moses-2.1.0-1.tar.gz) 
* __Previous versions__ : [tags](http://github.com/Yonaba/Moses/tags)

### Bash

```bash
git clone git://github.com/Yonaba/Moses.git
````

### LuaRocks

````
luarocks install moses
````

### MoonRocks

````
moonrocks install moses
````

## Usage

```lua
local M = require "moses"
````

*Note:* the full source [moses.lua](https://github.com/Yonaba/Moses/blob/master/moses.lua) is quite heavy (~92 kiB, 3115 LOC). You can alternatively use the [minified version](https://github.com/Yonaba/Moses/blob/master/moses_min.lua) (~35 kiB, 561 LOC).

## Tutorial

Find a complete set of code examples in [tutorial.md](https://github.com/Yonaba/Moses/blob/master/doc/tutorial.md).
  
## Documentation

* Read it [online](http://yonaba.github.io/Moses/doc).

## Credits and Acknowledgement

* [Jeremy Ashkenas](https://github.com/jashkenas), for the amazing [Underscore.js](http://documentcloud.github.com/underscore/)
* [Marcus Irven](http://mirven.github.com/underscore.lua/)'s and [JT Archie](https://github.com/jtarchie/underscore-lua)'s 1-to-1 ports that also inspired this
* [Matthew Rocklin](https://github.com/mrocklin)'s [Toolz](https://github.com/pytoolz/toolz/) from which I borrowed some ideas
* [Steve Donovan](https://github.com/stevedonovan)'s [LDoc](https://github.com/stevedonovan/ldoc/), used to generate the current HTML documentation.
* [Mark Langen](https://github.com/stravant)'s [LuaMinify](https://github.com/stravant/LuaMinify/), used to generate a minified version of this library.

## Specification

Run [spec tests](https://github.com/Yonaba/Moses/blob/master/spec) from Lua using [busted](https://github.com/Olivine-Labs/busted/) with the following command from the root folder:

````
busted
````

## License

This work is under [MIT-LICENSE](http://www.opensource.org/licenses/mit-license.php)<br/>
Copyright (c) 2012-2018 Roland Yonaba. <br/>
See [LICENSE](LICENSE).


