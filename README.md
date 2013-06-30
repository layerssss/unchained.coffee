![logo](https://f.cloud.github.com/assets/1559832/726912/c8ab97f8-e144-11e2-9924-9768d1da1286.jpg)

unchained.coffee
================

## Problem

### too fancy for CoffeeScript !

```coffeescript
$(document.createElement 'div')
  .appendTo('body')
  .css(
    width: 100
    height: 50
  )
  .text('haha')
```

### this is more CoffeeScript!

```
unchained window, # $ === window.$
  __$:
    __0: document.createElement 'div'
    __appendTo:
      __0: body
      css:
        width: 100
        height: 50
      text: 'haha'
```

## Usage

```coffeescript
unchained entry, commands
```

* `@entry` is a object where all the chain started
* `@commands` is a object of commands-hash
* see [some examples](http://micy.in/unchained.coffee/#examples)


## Development

* source on [https://github.com/layerssss/unchained.coffee/](https://github.com/layerssss/unchained.coffee/)

