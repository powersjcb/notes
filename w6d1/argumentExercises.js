function mySum () {
  var answer = 0;
  var args = Array.prototype.slice.call(arguments);
  args.forEach( function(num) {
    answer += num;
  });
  return answer;
}
console.log(mySum(1,2,3,4,5));


Function.prototype.myBind = function() {
  var context = Array.prototype.slice.call(arguments, 0, 1);
  var args = Array.prototype.slice.call(arguments, 1);
  return this.apply(context, args);
};

var f = function (arg1, arg2) {
  console.log("test " + arg1 + " " +  arg2);
};

var arr = [];


function curriedSum(numArgs) {
  var numbers = [];
  function _curriedSum (number) {
    numbers.push(number);
    if (numbers.length === numArgs) {
      return numbers.reduce( function (a, b) {
        return a + b;
      });
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

var sum = curriedSum(4);
console.log(sum(5)(30)(20)(1));

// converts function that can take many args
Function.prototype.curry = function (numArgs) {
  var context = this;
  var args = [];
  function _curried(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return context.apply(context, args);
    } else {
      return _curried;
    }
  }
  return _curried;
};


console.log(mySum.curry(3)(1)(2)(3));
