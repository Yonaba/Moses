[![Build Status](https://travis-ci.org/Yonaba/Moses.png)](https://travis-ci.org/Yonaba/Moses)
[![License](http://img.shields.io/badge/Licence-MIT-brightgreen.svg)](LICENSE)
[![Lua](https://img.shields.io/badge/Lua-5.1%2C%205.2%2C%205.3%2C%20JIT-blue.svg)]()
[![git-brag-stats](https://labs.turbo.run/git-brag?user=Yonaba&repo=Moses)](https://github.com/turbo/git-brag)

A Lua utility-belt library for [functional programming](http://en.wikipedia.org/wiki/Functional_programming).<br/>

## Download

### Archive
* __zip__: [1.6.1 (stable)](http://github.com/Yonaba/Moses/archive/Moses-1.6.1-1.zip) | [dev](http://github.com/Yonaba/Moses/archive/master.zip) | [all releases](http://github.com/Yonaba/Moses/tags)
* __tarball__: [1.6.1 (stable)](http://github.com/Yonaba/Moses/archive/Moses-1.6.1-1.tar.gz) | [dev](http://github.com/Yonaba/Moses/archive/master.tar.gz) | [all releases](http://github.com/Yonaba/Moses/tags)

### Bash

```bash
git clone git://github.com/Yonaba/Moses.git
````

### LuaRocks
```
luarocks install moses
````

### MoonRocks

```bash
moonrocks install moses
````

## Usage

```lua
local _ = require "moses"
````

*Note:* the full source [moses.lua](https://github.com/Yonaba/Moses/blob/master/moses.lua) is quite heavy (~70 kiB). You can alternatively use the [minified version](https://github.com/Yonaba/Moses/blob/master/moses_min.lua) (~22 kiB).

## Tutorial

Find a complete set of code examples in [tutorial.md](https://github.com/Yonaba/Moses/blob/master/doc/tutorial.md).
  
## Documentation

* See *doc* folder : [doc](https://github.com/Yonaba/Moses/blob/master/doc)
* Or browse it online : see [online doc](http://yonaba.github.io/Moses/doc).

## Credits and Acknowledgement

* [Jeremy Ashkenas](https://github.com/jashkenas), for the amazing [Underscore.js](http://documentcloud.github.com/underscore/)
* [Marcus Irven](http://mirven.github.com/underscore.lua/)'s and [JTArchie](https://github.com/jtarchie/underscore-lua)'s 1-to-1 ports that also inspired this
* [Matthew Rocklin](https://github.com/mrocklin)'s [Toolz](https://github.com/pytoolz/toolz/) from which I borrowed some ideas
* [LDoc](https://github.com/stevedonovan/ldoc/) used to generate the current HTML documentation.

## Specification

Run [spec tests](https://github.com/Yonaba/Moses/blob/master/spec) using [Telescope](https://github.com/norman/telescope) with the following command from the root folder:

````
tsc -f spec/*
````

## License

This work is under [MIT-LICENSE](http://www.opensource.org/licenses/mit-license.php)<br/>
Copyright (c) 2012-2017 Roland Yonaba. <br/>
See [LICENSE](LICENSE).


