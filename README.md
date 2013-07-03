![coffee-unchained](https://f.cloud.github.com/assets/1559832/742967/0ebd0b88-e3dd-11e2-8309-5827454e9406.jpg)

unchained.coffee
================

## Problem

There are just too many `chains` in the `JavaScript` world.

### too fancy for CoffeeScript !

```coffeescript
# jquery
$(document.createElement 'div')
  .appendTo('body')
  .css(
    width: 100
    height: 50
  )
  .text('haha')


# d3
circle = svg.selectAll("circle")
    .data(data)
circle.enter()
    .append("circle")
    .attr("r", 2.5)
circle
    .attr("cx", (d)-> d.x)
    .attr("cy", (d)-> d.y)
circle.exit().remove()
```

### this is more CoffeeScript!

```
# jquery
unchained window,
  _$:
    _0: document.createElement 'div'
    _appendTo:
      _0: body
      css:
        width: 100
        height: 50
      text: 'haha'


# d3
unchained svg.
  _selectAll:
    _0: "circle"
    _data:
      _0: data
      _enter:
        _append:
          _0: "circal"
          attr:
            r: 2.5
      attr:
        cx: (d)-> d.x
        cy: (d)-> d.y
      _exit:
        _remove: null
```

## Usage

```coffeescript
unchained entry, commands
```

* `@entry` is an object where the chain started.
* `@commands-object` consists of key-value pairs of commands.
* commands can be either a "forward chaining" or a "setter call".

### Forward Chainning

"Forward chaining" means chaining method which returns a shallow copy of current entry, or at least with its state changed. Popular examples are: [jQuery.fn.find](http://api.jquery.com/find/), [d3.selection.selectAll](https://github.com/mbostock/d3/wiki/Selections#wiki-selectAll). In order to specify a "forward chaining", you have to add one or more underscore(s) in front of the command name, and arguments are supplied via keys `_0`, `_1`.. 

e.g.

```coffeescript
...
_find:
  _0: 'div.btn'
  ...more subsequent commands called on returned entry

...

```

### Setter Call

"Setter call"s are methods whose returned value we don't care. Most methods (except `hasClass`) in [jQuery API # Attributes section](http://api.jquery.com/category/attributes/) are "setter call"s, when used with values.

If you need to supply more than one arguments to a "setter call". You need to specify them in this form: (use [jQuery.fn.css](http://api.jquery.com/css/) as an example)

```
unchained $('div'),
  css:
    _0: 'background-color'
    _1: 'red'
# equivelent to: $('div').css('background-color': 'red')
# without returned value
```

### what?

* see [some examples](http://micy.in/unchained.coffee/#examples)


## Development

* source on [https://github.com/layerssss/unchained.coffee/](https://github.com/layerssss/unchained.coffee/)

