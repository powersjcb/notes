Array.prototype.uniq = function() {
  var holder = [];
  var seenYet = {}

  for (var i = 0; i < this.length; i++) {
    if (!seenYet[this[i]]) {
      holder.push(this[i])
      seenYet[this[i]] = true
    }
  }
  return holder
}

Array.prototype.twoSum = function() {
  var sumsToZero = []
  for (var i = 0; i < this.length - 1; i++) {
    for (var j = i + 1; j < this.length; j++ ) {
      if (this[i] + this[j] === 0) {
        sumsToZero.push([i,j])
      }
    }
  }
  return sumsToZero
}


Array.prototype.myTranspose = function () {
  var transposed = []

  for ( var j = 0; j < this[0].length; j++) {
    var row = []
    for ( var i = 0; i < this.length; i++) {
      row.push(this[i][j])
    }
    transposed.push(row)
  }
  return transposed
}


Array.prototype.myEach = function (func) {
  for (var i = 0; i < this.length; i++) {
    func(this[i]);
  }
  return this
}


Array.prototype.myMap = function(func) {
  var arr = [];
  this.myEach( function(val) {
    arr.push(func(val));
  });

  return arr;
}

Array.prototype.myInject = function(func) {

  var accumulator = this[0];
  this.slice(1, this.length).myEach( function(val) {
    accumulator += func(val);
  });

  return accumulator;
};


Array.prototype.bubbleSort = function() {
  // if(typeof options === "undefined") {
  //   // options = //func for determing method
  // }
  var notSorted = true;
  while (notSorted) {
    for (var i = 0; i < this.length - 1; i++) {
      notSorted = false;
      // var a = this[i], b = this[i+1];

      if (this[i] > this[i + 1]) {
        var temp  = this[i];
        this[i] = this[i + 1];
        this[i + 1] = temp;
        notSorted = true;
      }
    }
  }
  return this;
}


String.prototype.substrings = function() {
  subs = [];
  for (var i = 0; i < this.length; i++) {
    for (var j = i + 1; j <= this.length; j++) {
      console.log(this.slice(i,j))
      subs.push(this.slice(i,j));
    }
  }
  return subs;
}
