"user strict";
readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function HanoiGame() {
  var that = this;
  this.stacks = [[3, 2, 1],[],[]];
}

HanoiGame.prototype.isWon = function() {
  return this.stacks.slice(1).some(function (el) {
    el.length === 3;
  });
};


HanoiGame.prototype.isValidMove = function(startTower, endTower) {
  var stacks      = this.stacks;
  var validStacks = (startTower >= 0 && startTower <= 2) &&
      (endTower >= 0 && endTower <=2) && startTower !== endTower;
  var sourceEmpty = stacks[startTower].length === 0;

  var targetEmpty   = stacks[endTower].length === 0;
  var targetLarger  = stacks[startTower] < stacks[endTower];

  if (!sourceEmpty && validStacks && (targetEmpty || targetLarger)) {
    return true;
  } else {
    return false;
  }
};

HanoiGame.prototype.move = function(startTower, endTower) {
// returns true or false if completed
  if (this.isValidMove(startTower, endTower)) {
    var stack = this.stacks;
    stack[endTower].push(stack[startTower].pop());

    return true;
  } else {

    return false;
  }
};

HanoiGame.prototype.print = function() {
  // prints stacks using JSON.stringify
  console.log(JSON.stringify(this.stacks));
};

HanoiGame.prototype.promptMove = function(callback) {
  // reader.question("prompt", callback)
  this.print();
  reader.question("Move from:", function(startingTower) {
    var moveFrom = parseInt(startingTower);
    reader.question("Move to:", function(endingTower) {
      var moveTo = parseInt(endingTower);

      callback(moveFrom, moveTo);
    });
  });
};

HanoiGame.prototype.run = function(reader, completionCallback) {
// prompt for move
// try to perform move, print error msg if failing
// if (not won), run again
// else, log that game has been won, call completionCallback
// close reader
  var that = this;
  this.promptMove(function (move1, move2) {
    console.log(move1 + " " + move2);
    if (that.isWon()) {
      // game won on last move
      console.log("You win!");
      completionCallback();
    } else if (that.move(move1, move2)) {
      // valid move
      that.run(reader, completionCallback);
    } else {
      // error
      console.log("Invalid move \n");
      that.run(reader, completionCallback)
    }



  });


};

towers = new HanoiGame();

// console.log(towers.stacks);
// console.log(towers.isWon());
// console.log(towers.isValidMove(0,3));
// towers.print()

towers.run(reader, function () {
  reader.close();
});
