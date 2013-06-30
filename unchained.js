// Generated by CoffeeScript 1.6.3
(function() {
  var unchained;

  this.unchained = unchained = function(entry, commands, path) {
    var args, func, isMutator, k, v, _results;
    if (path == null) {
      path = String(entry);
    }
    _results = [];
    for (k in commands) {
      v = commands[k];
      isMutator = k.match(/^\__/);
      if (isMutator) {
        k = k.substring(2);
      }
      func = entry[k];
      if ((func != null ? func.constructor : void 0) !== Function) {
        throw new Error("'" + k + "' is not available in " + path);
      }
      if (isMutator) {
        args = unchained._extractArgs(v);
        _results.push(unchained(func.apply(entry, args), v, "" + path + "." + k));
      } else {
        args = unchained._extractArgs(v);
        if (args.length) {
          _results.push(func.apply(entry, args));
        } else {
          _results.push(func.call(entry, v));
        }
      }
    }
    return _results;
  };

  unchained._extractArgs = function(commands) {
    var args, k;
    args = [];
    if (!(commands && typeof commands === 'object')) {
      return args;
    }
    while (-1 !== Object.keys(commands).indexOf(k = "__" + (String(args.length)))) {
      args.push(commands[k]);
      delete commands[k];
    }
    return args;
  };

}).call(this);