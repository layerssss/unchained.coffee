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

    keyFunc = 
    unchain d3.select, 'svg', ->
      @$ @selectAll, 'g', ->
        @$ @data, data, ((data, i)-> i), ->
          @$ @enter, ->
            @append 'g'
          @$ @exit, ->
            @remove()
          @$ @selectAll, 'circle', ->
            @$ @data, ((row)-> row), ((data, i)-> i), ->
              @$ @enter, ->
                @$ @append, 'circle', ->
                  @attr r: 0
              @$ @exit, ->
                @remove()
              @$ @transition, ->
                @attr
                  cx: (circle, j, i)-> sx j
                  cy: (circle, j, i)-> sy i
                  r: (circle, j, i)-> sr circle

    cb() if cb?.constructor is Function

  func = ->
    draw ->
      setTimeout func, 500
  func()