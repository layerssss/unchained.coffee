this.unchain = unchain = (fn, args..., cb)->
  result = fn.apply @, args
  result.$ = unchain
  cb.call result
