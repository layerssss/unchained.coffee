// Generated by CoffeeScript 1.6.3
(function() {
  var unchain, unchainv,
    __slice = [].slice;

  this.unchain = unchain = function() {
    var args, cb, fn, result, _i;
    fn = arguments[0], args = 3 <= arguments.length ? __slice.call(arguments, 1, _i = arguments.length - 1) : (_i = 1, []), cb = arguments[_i++];
    result = fn.apply(this, args);
    result.$ = unchain;
    result.$v = unchainv;
    return cb.call(result);
  };

  this.unchainv = unchainv = function(fn, args, cb) {
    return unchain.apply(this, [fn].concat(args).concat([cb]));
  };

}).call(this);
