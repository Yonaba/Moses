[![Build Status](https://travis-ci.org/Yonaba/Moses.png)](https://travis-ci.org/Yonaba/Moses)
[![Coverage Status](https://coveralls.io/repos/Yonaba/Moses/badge.png?branch=master)](https://coveralls.io/r/Yonaba/Moses?branch=master)
[![License](http://img.shields.io/badge/Licence-MIT-brightgreen.svg)](LICENSE)

A Lua utility-belt library for [functional programming](http://en.wikipedia.org/wiki/Functional_programming). It complements the built-in __Lua table library__, making easier 
operations on arrays, lists, collections.<br/>

__Moses__ was deeply inspired by [Underscore.js](http://documentcloud.github.com/underscore/).

##Download & Installation
###Bash

```bash
git clone git://github.com/Yonaba/Moses.git
````

###Archive
* __Zip__: [Latest stable 1.3.2.1](https://github.com/Yonaba/Moses/archive/Moses-1.3.2.1-1.zip) | [current](https://github.com/Yonaba/Moses/archive/master.zip) | [all](https://github.com/Yonaba/Moses/tags)
* __Tar.gz__: [Latest stable 1.3.2.1](https://github.com/Yonaba/Moses/archive/Moses-1.3.2.1-1.tar.gz) | [current](https://github.com/Yonaba/Moses/archive/master.tar.gz) | [all](https://github.com/Yonaba/Moses/tags)

###LuaRocks
```
luarocks install moses
````

###MoonRocks
```bash
luarocks install --server=http://rocks.moonscript.org/manifests/Yonaba moses
````

##Usage##
Put the file [moses.lua](https://github.com/Yonaba/Moses/blob/master/moses.lua) inside your project folder and call it using *require* command.

__Note__: 
The full source [moses.lua](https://github.com/Yonaba/Moses/blob/master/moses.lua) is quite heavy (~59 kiB).<br/>
You can alternatively use the [minified version](https://github.com/Yonaba/Moses/blob/master/moses_min.lua) (~17.5 kiB).

##Tutorial##
Find a complete set of code examples in [moses.md](https://github.com/Yonaba/Moses/blob/master/doc/tutorial.md)
  
##Documentation##
Available in HTML-format for download : see [doc](https://github.com/Yonaba/Moses/blob/master/doc).
Read it in your browser : see [online doc](http://yonabe.github.io/Moses/doc)

##Credits and Acknowledgement##
* [Jeremy Ashkenas](https://github.com/jashkenas), for the amazing [Underscore.js](http://documentcloud.github.com/underscore/)
* [Marcus Irven](http://mirven.github.com/underscore.lua/)'s and [JTArchie](https://github.com/jtarchie/underscore-lua)'s 1-to-1 ports that also inspired this.
* [LDoc](https://github.com/stevedonovan/ldoc/) (from *Steve Donovan*) used to generate the current HTML documentation.

##Specification
Spec tests have been included.<br/>
Run them using [Telescope](https://github.com/norman/telescope) with the following command from the root foolder:

```
tsc -f spec/*
```

##License##
This work is under [MIT-LICENSE](http://www.opensource.org/licenses/mit-license.php)<br/>
Copyright (c) 2012-2014 Roland Yonaba. <br/>
See [LICENSE](LICENSE).

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/Yonaba/moses/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

