window.PostApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new PostApp.Routers.Router({
      $rootEl: $("#content")
    });
    Backbone.history.start();
  }
};

Function.prototype.myBind = function myBind (context) {
  var fn = this;
  var bindArgs = Array.prototype.slice.call(arguments, 1);
  return function () {
    var callArgs = Array.prototype.slice.call(arguments);
    return fn.apply(context, bindArgs.concat(callArgs));
  };
};

JSA = {};

JSA.myCall = function (fn, obj) {
  var args = [].slice.apply(arguments, [2]);//#call would be cheating :)
  return fn.apply(obj, args);
};

JSA.myCurry = function (fn, obj, numArgs) {
  var args = [];

  function curriedFun (arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return fn.apply(obj, args);
    } else {
      return curriedFun;
    }
  }

  return curriedFun;
};
