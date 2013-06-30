this.unchained = unchained = (entry, commands, path)->
  path?= String entry
  
  for k, v of commands
    isMutator = k.match /^\__/
    k = k.substring 2 if isMutator

    func = entry[k]
    throw new Error "'#{k}' is not available in #{path}" unless func?.constructor is Function

    if isMutator
      args = unchained._extractArgs v
      unchained (func.apply entry, args), v, "#{path}.#{k}"
    else
      args = unchained._extractArgs v
      if args.length
        func.apply entry, args
      else
        func.call entry, v
  

unchained._extractArgs = (commands)->
  args = []
  return args unless commands && typeof(commands) == 'object'
  while -1 != Object.keys(commands).indexOf k = "__#{String args.length}"
    args.push commands[k]
    delete commands[k]
  return args