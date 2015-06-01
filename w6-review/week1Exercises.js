_ = require('underscore');

Array.prototype.myUniq = function () {
  var uniq = [];
  var seen = {};
  for (var i = 0; i < this.length; i++) {
    if (!seen[this[i]]) {
      uniq.push(this[i]);
      seen[this[i]] = true;
    }
  }
  return uniq;
};

// console.log(_.isEqual([2,2,1,2,3,4,4,4,4].myUniq(), [2,1,3,4]));


Array.prototype.twoSum = function (n) {
  pairs = [];
  for (var i = 0; i < this.length; i++) {
    for (var j = i+1; j < this.length; j++ ) {
      if (this[i]+ this[j] === n) {
        pairs.push([i,j]);
      }
    }
  }
  return pairs;
};

// console.log([0,1,-1,2,-2,5].twoSum(0));


// myTranspose
// 1. iterate through col, then rows
// 2. push each col element into new row
// 3. push new row into tranposed

Array.prototype.myTranspose = function () {
  tranposed = [];

  for (var colIdx = 0; colIdx < this[0].length; colIdx++) {
    var row = []; // refers to new row
    for (var rowIdx = 0; rowIdx < this.length; rowIdx++) {
      row.push(this[rowIdx][colIdx]);
    }
    tranposed.push(row);
  }
  return tranposed;
};

// console.log([[1,2,3]].myTranspose());


var stockPicker = function (days) {
  var bestProfit = 0;
  var cheapest = days[0];
  var cheapestDay = 0;
  var highestDay = 0;

  for (var i = 1; i < days.length; i++) {
    if (days[i] < cheapest) {
      cheapest = days[i];
      cheapestDay = i;
    }
    if ( days[i] - cheapest > bestProfit) {
       bestProfit = days[i] - cheapest;
       highestDay = i;
    }
  }
  return [cheapestDay, highestDay];
};

// console.log(stockPicker([5,1,5,10,2,3,4]));

// nth factorial terms in array, recursive
// factorial -> 1,
var factorial = function (n) {
  if (n === 0) {
    return [1];
  }
  var lastFact = factorial(n-1);
  return lastFact.concat(n*lastFact.slice(-1)[0]);
};
// console.log(factorial(5));

var fibonacci = function (n) {
  if (n === 1) {
    return [0];
  } else if (n === 2) {
    return [0,1];
  }

  var lastFib = fibonacci(n-1);

  return lastFib.concat(lastFib.slice(-1)[0] + lastFib.slice(-2)[0]);
};

// console.log(fibonacci(10));
