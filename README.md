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
circle = d3.select('svg').selectAll("circle")
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
unchain $, (document.createElement div), ->
  @$ @appendTo, 'body', ->
    @css
      width: 100
      height: 50
    @text 'haha'

# d3
unchain d3.select, 'svg', ->
  @$ @selectAll, 'circle', ->
    @$ @data, data, ->
      @$ @enter, ->
        @$ @append, circle, ->
          @attr r: 2.5
      @attr
        cx: (d)-> d.x
        cy: (d)-> d.y
      @$ @exit, ->
        @remove()
```

## Usage

* see [some examples](http://micy.in/unchained.coffee/#examples)


## Development

* source on [https://github.com/layerssss/unchained.coffee/](https://github.com/layerssss/unchained.coffee/)

