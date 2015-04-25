(function () {
  // Make a namespace `Assessment`.
  if(typeof Assessment === "undefined") {
    window.Assessment = {};
  }

  // write binarySearch(array, target)
  Assessment.binarySearch = function (array, target) {
    if (array.length === 0) {
      return -1;
    }

    var mid = Math.floor(array.length / 2);
    var cand = array[mid];
    if (cand === target) {
      return mid;
    } else if (cand > target) {
      return Assessment.binarySearch(array.slice(0, mid), target);
    } else {
      var result = Assessment.binarySearch(array.slice(mid + 1), target);
      if (result > -1) {
        result += mid + 1;
      }
      return result;
    }
  };

  // write nLengthSubstrings(string, n)
  Assessment.nLengthSubstrings = function (string, n) {
    var result = [];

    for (var i = 0; i + n <= string.length; i++) {
      result.push(string.substr(i, i + n));
    }

    return result;
  };

  // write myMap(array, callback)
  Assessment.myMap = function (array, callback) {
    var result = [];

    for (var i = 0; i < array.length; i++) {
      result.push(callback(array[i]));
    }

    return result;
  };

  // write primes(n)
  Assessment.primes = function primes (n) {
    var primeArr = [];
    var i = 1;

    while (primeArr.length < n) {
      i++;
      if (isPrime(i)) {
        primeArr.push(i);
      }
    }

    return primeArr;
  };

  function isPrime (n) {
    var i;
    for (i = 2; i < n; i++) {
      if (n % i === 0) {
        return false;
      }
    }

    return true;
  };

  // write myBind(context)
  Function.prototype.myBind = function myBind (context) {
    var fn = this;
    var bindArgs = Array.prototype.slice.call(arguments, 1);
    return function () {
      var callArgs = Array.prototype.slice.call(arguments);
      return fn.apply(context, bindArgs.concat(callArgs));
    };
  };

  // write inherits(ParentClass)
  Function.prototype.inherits = function inherits (ParentClass) {
    function Surrogate () {};
    Surrogate.prototype = ParentClass.prototype;
    this.prototype = new Surrogate();

    // This part is an unnecessary nice-to-have. `gizmo.constructor =>
    // Cat` is JavaScript's way of writing Ruby's `gizmo.class`. You
    // won't be tested on the constructor property.
    this.prototype.constructor = this;
  };
})();
