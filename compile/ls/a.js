// Generated by LiveScript 1.2.0
(function(){
  var take, slice$ = [].slice;
  take = curry$(function(n, list){
    var x, xs, takeThree, lastThree;
    x = list[0], xs = slice$.call(list, 1);
    switch (false) {
    case !(n <= 0):
      [];
      break;
    case !empty(list):
      [];
      break;
    default:
      [x].concat(take(n - 1, xs));
    }
    take(2, [1, 2, 3, 4, 5]);
    takeThree = take(3);
    takeThree([3, 4, 5, 6, 7, 8]);
    lastThree = function(){
      return reverse(takeThree(reverse.apply(this, arguments)));
    };
    return lastThree([1, 2, 3, 4, 5, 6, 7, 8]);
  });
  function curry$(f, bound){
    var context,
    _curry = function(args) {
      return f.length > 1 ? function(){
        var params = args ? args.concat() : [];
        context = bound ? context || this : this;
        return params.push.apply(params, arguments) <
            f.length && arguments.length ?
          _curry.call(context, params) : f.apply(context, params);
      } : f;
    };
    return _curry();
  }
}).call(this);
