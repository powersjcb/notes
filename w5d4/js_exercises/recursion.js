(function() {
    // make a namespace
  if(typeof Recursion === "undefined") {
    window.Recursion = {};
  }

  Recursion.range = function(startVal, endVal) {
    if ( endVal < startVal) {
      return [];
    }

    return [startVal].concat(Recursion.range(startVal+1, endVal));
  }

  Recursion.exp = function(b, n) {
    if (n === 0) {
      return 1;
    }
    return b * Recursion.exp(b, n-1);
  }

  Recursion.fib = function(n) {
    if ( n === 2) {
      return [1, 1]
    } else if (n === 1) {
      return [1]
    }  else if (n === 0) {
      return []
    }

    var lastFibs = Recursion.fib(n-1)
    console.log(lastFibs);
    console.log(n);
    return lastFibs.concat(lastFibs[lastFibs.length-1] + lastFibs[lastFibs.length-2])
  }

  Recursion.bSearch = function(arr, target) {
    if (!arr.length) {
      return null;
    }

    var mid = parseInt(arr.length/2);
    var zeroToMid = arr.slice(0, mid);
    var midToEnd = arr.slice(mid+1);

    if (arr[mid] === target) {
      return mid;
    } else if (arr[mid] > target) {
      return Recursion.bSearch(zeroToMid, target)
    } else {
      result = Recursion.bSearch(midToEnd, target);

      // if result is null, get coereced to zero
      if (result > -1) {
        result += mid + 1;
      }
      return result;
    }
  };

  // Recursion.makeChange = function(amount, changeArr) {
  //   if (amount < Math.min.apply(null, changeArr)) {
  //     return [];
  //   }
  //   var coins
  //   var found_match = false
  //   for (var i = 0; !found_match && i < changeArr.length; i++) {
  //     var coinCount = parseInt(amount / changeArr[i]);
  //     if (coinCount > 0) {
  //       coins = new Array(coinCount)
  //       for (var j = 0; j < coins.length; j++ ) {
  //         coins[j] = changeArr[j]
  //       }
  //     }
  //   }
  //   return coins.concat(Recursion.makeChange(amount-coins[0]*value, changeArr));
  // }




  Recursion.mergeSort = function(arr) {
    if (arr.length === 1) {
      return arr;
    }

    var midPoint  = parseInt(arr.length / 2);
    var leftSide  = arr.slice(0, midPoint);
    var rightSide = arr.slice(midPoint);

    var leftSorted  = Recursion.mergeSort(leftSide);
    var rightSorted = Recursion.mergeSort(rightSide);

    return mergeSorted(leftSorted, rightSorted);




  };


  function mergeSorted(left, right) {
    var mergedArray = [];
    while (left.length && right.length) {

      if (left[0] > right[0]) {
        mergedArray.push(right.shift());
      } else {
        mergedArray.push(left.shift());
      }
    }
    return mergedArray.concat(left).concat(right) ;
  }







})();
