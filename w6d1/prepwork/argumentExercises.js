// sums arbitrary arguments
function sum() {

}


// bind that takes arguments
function myBind() {

}

// functional programming version
// decompose a function that takes multiple arguments into one that takes
// single arguments successively until it has the sufficient number of arguments to run
function curriedSum(numArgs) {
  var sum, numbers;
  sum = 0;
  numbers = [];
  function _curriedSum(number) {
    numbers.push(number);
    console.log(numbers);
    if (numbers.length >= numArgs) {
      return numbers.reduce( function (a, num) { return a + num; });
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

var x = curriedSum(3)(1)(2)(3);
console.log(x);
