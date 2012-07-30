__Moses__ is a Lua library which provides a set of utilities and helpers acting as shortcuts for common programming tasks. 
It extends the built-in __Lua table library__, making easier operations on arrays, lists, collections, objects, etc.<br/>
__Moses__ was deeply inspired by [Underscore.js][]. It brings to Lua most of [Underscore.js][] functions and  A lot more!

##Installation##
Put the file [Moses.lua][] inside your project folder and call it using *require* command.
It will return a table containing a set of functions.

##Usage example##
    local list = _.range(10)
    => {0,1,2,3,4,5,6,7,8,9,10}
    list = _.map(list, function(_,value) return value*10+value end)
	  => {0,11,22,33,44,55,66,77,88,99,110}	
    list = _.filter(list,function(i,value) return value%2==0 end)
	  => {0,22,44,66,88,110}	
    _.each(list,print)
    =>  1	0
    =>  2	22
    =>  3	44
    =>  4	66
    =>  5	88
    =>  6	110
	
##API Overview##
__Moses__ offers functions, iterators to operate on arrays, collections, lists, nested tables.
A fully complete documentation, with usage examples can be found here : [Documentation][]<br/>
A set of tests for all functions provided can be found here : [Moses_Lib_Test.lua][]

##Credits and Thanks##
* [Jeremy Ashkenas][], for the amazing [Underscore.js][]
* [Marcus Irven][], for his Lua port, [Underscore.lua] []

##License##
This work is under [MIT-LICENSE][]<br/>
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

[Underscore.js]: http://documentcloud.github.com/underscore/
[Moses.lua]: https://github.com/Yonaba/Moses/blob/master/Lib/Moses.lua
[Documentation]: https://github.com/Yonaba/Moses/blob/master/Documentation
[Moses_Lib_Test.lua]: https://github.com/Yonaba/Moses/blob/master/Moses_Lib_Test.lua
[Underscore.lua]: http://mirven.github.com/underscore.lua/
[Marcus Irven]: http://www.marcusirven.com
[Jeremy Ashkenas]: https://github.com/jashkenas
[MIT-LICENSE]: http://www.opensource.org/licenses/mit-license.php