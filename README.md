A utility library which provides a set of helpers acting as shortcuts for common programming tasks,
and support for [functional programming](http://en.wikipedia.org/wiki/Functional_programming). It complements the built-in __Lua table library__, making easier operations on arrays, lists, 
collections, objects, through 85 weird, strange, bizarre, odd functions.<br/>
__Moses__ was deeply inspired by [Underscore.js](http://documentcloud.github.com/underscore/).

##Download
###Bash

```bash
git clone git://github.com/Yonaba/Moses.git
````

###Archive
* __Zip__: [current](https://github.com/Yonaba/Moses/archive/master.zip) | [old packages](https://github.com/Yonaba/Moses/tags)
* __Tar.gz__: [current](https://github.com/Yonaba/Moses/archive/master.tar.gz) | [old packages](https://github.com/Yonaba/Moses/tags)

###LuaRocks

```
luarocks install moses
````

##Installation##
Put the file [Moses.lua](https://github.com/Yonaba/Moses/blob/master/moses.lua) inside your project folder and call it using *require* command.

##Usage examples##
Find a complete set of samples in [moses.md](https://github.com/Yonaba/Moses/blob/master/docs/moses.md)
  
##Documentation##
A fully complete documentation, in HTML-format, can be found in [Docs](https://github.com/Yonaba/Moses/blob/master/docs), and is also available for [download](http://github.com/Yonaba/Moses/downloads). <br/>

##Credits and Acknowledgement##
* [Jeremy Ashkenas](https://github.com/jashkenas), for the amazing [Underscore.js](http://documentcloud.github.com/underscore/)
* [Marcus Irven](http://mirven.github.com/underscore.lua/) and [JTArchie](https://github.com/jtarchie/underscore-lua), which also insipred this.
* The amazing documentation generator [LDoc](https://github.com/stevedonovan/ldoc/) (from *Steve Donovan*), used to produce the current HTML documentation.

##Specification
Specs tests have been included. Run them using [Telescope](https://github.com/norman/telescope) with the following command from the root foolder:

```
tsc -f specs/*
```

##License##
This work is under [MIT-LICENSE](http://www.opensource.org/licenses/mit-license.php)<br/>
Copyright (c) 2012 Roland Yonaba

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
