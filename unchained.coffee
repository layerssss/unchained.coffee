this.unchain = unchain = (fn, args..., cb)->
  result = fn.apply @, args
  result.$ = unchain
  result.$v = (fn, args, cb)-> unchain.apply @, [fn].concat(args).concat [cb]
  cb.call result
