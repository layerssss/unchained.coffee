this.unchained = unchained = (entry, commands, path)->
  path?= String entry
  result = entry
  for k, v of commands
    isMutator = k.match /^_+([^_].*)$/
    k = isMutator[1] if isMutator

    func = entry[k]
    throw new Error "'#{k}' is not available in #{path}" unless func?.constructor is Function

    if isMutator
      args = unchained._extractArgs v
      result = unchained (func.apply entry, args), v, "#{path}.#{k}"
    else
      args = unchained._extractArgs v
      if args.length
        result = func.apply entry, args
      else
        result = func.call entry, v
  return result
  

unchained._extractArgs = (commands, prefix='')->
  if prefix == ''
    args = unchained._extractArgs commands, '_'
    return args if args.length
    return unchained._extractArgs commands, '__'
    
  args = []
  return args unless commands && typeof(commands) == 'object'
  while -1 != Object.keys(commands).indexOf k = "#{prefix}#{String args.length}"
    args.push commands[k]
    delete commands[k]
  return args