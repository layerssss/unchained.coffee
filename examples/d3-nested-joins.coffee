$ -> 
      

  sx = d3.scale.linear().range([0, d3.select('svg').attr 'width']).domain [0, 20]
  sy = d3.scale.linear().range([0, d3.select('svg').attr 'height']).domain [0, 20]
  sr = d3.scale.linear().range([0, 30]).domain [0, 1]
  draw = (cb)->
    data = []
    for i in [0..10 + 10 * Math.random()]
      data.push row = []
      for i in [0..10 + 10 * Math.random()]
        row.push Math.random()

    unchained d3,
      __select:
        __0: 'svg'
        __selectAll:
          __0: 'g'
          __data:
            __0: data
            __1: (row, i)-> i
            __enter:
              append: 'g'
            __exit:
              remove: null
            each: (row, i)->
              unchained d3,
                __select:
                  __0: this
                  __selectAll:
                    __0: 'circle'
                    __data:
                      __0: row
                      __1: (circle, j)-> j
                      __enter:
                        __append: 
                          __0: 'circle'
                          attr:
                            r: 0
                      __exit:
                        remove: null
                      __transition:
                          attr:
                            cx: (circle, j)-> sx j
                            cy: sy i
                            r: (circle, j)-> sr circle

    cb() if cb?.constructor is Function

  func = ->
    draw ->
      setTimeout func, 500
  func()