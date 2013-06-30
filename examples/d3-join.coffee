
shuffle = (array) ->
  m = array.length
  t = undefined
  i = undefined
  while m
    i = Math.floor(Math.random() * m--)
    t = array[m]
    array[m] = array[i]
    array[i] = t
  array
alphabet = "abcdefghijklmnopqrstuvwxyz".split("")

$ -> 
  sx = d3.scale.linear().range([0, d3.select('svg').attr 'width']).domain [0, 20]
  y = d3.select('svg').attr('height') / 2
  draw = (cb)->
    shuffle alphabet
    start = Math.floor alphabet.length * Math.random() * 0.5
    end = start + 4 + Math.floor alphabet.length * Math.random() * 0.5
    data = alphabet.slice start, end

    unchained d3,
      __select:
        __0: 'svg'
        __selectAll:
          __0: 'g'
          __data:
            __0: data
            __1: (d)-> d
            __enter:
              __append:
                __0: 'g'
                __append: 
                  __0: 'text'
                  text: (d)-> d
                  style:
                    'font-size': '8em'
            __transition:
              attr:
                transform: (d, i)-> "translate(#{sx i}, #{y})"
            __exit:
              remove: null

    cb() if cb?.constructor is Function

  func = ->
    draw ->
      setTimeout func, 500
  func()