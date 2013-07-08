this.unchain = unchain = (fn, args..., cb)->
  result = fn.apply @, args
  result.$ = unchain
  result.$v = unchainv
  cb.call result
this.unchainv = unchainv = (fn, args, cb)-> unchain.apply @, [fn].concat(args).concat [cb]
