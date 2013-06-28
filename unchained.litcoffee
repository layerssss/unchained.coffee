unchained.coffee
================

CoffeeScript Unchained!

# Scenario

    # todo

# Usage

```coffeescript
unchained entry, commands
```

* `@entry` is a object where all the chain started
* `@commands` is a object of commands-hash
* see [some examples](http://micy.in/unchained.coffee/examples/)


    this.unchained = unchained = (entry, commands, path)->
      path?= String entry
      
      for k, v of commands
        isMutator = k.match /^\__/
        k = k.substring 2 if isMutator

        func = entry[k]
        throw new Error "'#{k}' is not available in #{path}" unless func?.constructor is Function

        if isMutator
          args = unchained._extractArgs v
          unchained (func.apply entry, args), v, "#{path}.#{k}"
        else
          args = unchained._extractArgs v
          if args.length
            func.apply entry, args
          else
            func.call entry, v
    
    unchained._extractArgs = (commands)->
      args = []
      return args unless commands && typeof(commands) == 'object'
      while -1 != Object.keys(commands).indexOf k = "__#{String args.length}"
        args.push commands[k]
        delete commands[k]
      return args


# Development

* source on `src` branch: [https://github.com/layerssss/unchained.coffee/tree/src](https://github.com/layerssss/unchained.coffee/tree/src)      

# License

Copyright (c) 2009-2013 Michael Yin

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.







