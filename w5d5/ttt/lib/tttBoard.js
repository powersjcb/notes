// ( function() {
  // if (typeof TicTacToe === "undefined") {
  //   window.TicTacToe = {};
  // }

  function Board(grid) {
    if (typeof grid === "undefined") {
      this.grid = [[null,null,null], [null,null,null], [null,null,null]];
    } else {
      this.grid = grid;
    }
  }

  // expects array of position
  Board.prototype.gridContent = function (pos) {
    return this.grid[pos[0]][pos[1]];
  };

  Board.prototype.isWon = function() {
    return this.winner() !== null;
  };


  Board.prototype.winner = function() {
    var that = this;
    var everyRow = everyRowColDiag();

    for (i = 0; i < everyRow.length; i++) {

      var rowOwner = allElementsAre(everyRow[i]);
      if (rowOwner === "X") {
        return "X";
      } else if (rowOwner == "O") {
        return "O";
      }
    }
    return null;


    // helper functions //

    function everyRowColDiag() {
      var everyCol = transpose(that.grid);
      var bothDiag = [[],[]];

      for ( var i = 0; i < that.grid.length; i++) {
        bothDiag[0].push(that.grid[i][i]);
        bothDiag[1].push(that.grid[i][that.grid.length-i-1]);
      }

      return that.grid.concat(everyCol, bothDiag);
    }

    // returns null if mismatch
    // returns value if all values are the same
    function allElementsAre(arr) {
      for (var i = 0; i < arr.length; i++) {
        if (arr[0] !== arr[i]) {
          return null;
        }
      }
      return arr[0];
    }

    // javascript does not have a transpose function?
    // atributed to: https://gist.github.com/femto113/1784503
    function transpose(a)
    {
      return a[0].map(function (_,c) {return a.map(function (r) {return r[c]; }); });
    }
  };


  Board.prototype.isEmpty = function(pos) {
    return this.gridContent(pos) === null;
  };


  Board.prototype.placeMark = function(pos, mark) {
    if (this.validMove(pos)) {
      this.grid[pos[0]][pos[1]] = mark;
      return true;
    } else {
      return false;
    }
  };

  Board.prototype.validMove = function(pos) {
    // on board
    // target position is null
    var zeroOrMore = pos[0] >= 0 && pos[1] >= 0;
    var smallEnough = pos[0] < this.grid.length && pos[1] < this.grid.length;
    return zeroOrMore && smallEnough && this.isEmpty(pos);
  };

  Board.prototype.render = function() {
    var gridSize = this.grid.length;
    console.log("  Tic Tac Toe");
    console.log("   0   1   2");
    for (i = 0; i < gridSize; i++) {
      var row = [];
      for (j = 0; j < gridSize; j++) {
        var content = this.gridContent([i,j]);
        if (content === null) {
          content = " ";
        }
        row.push(content);
      }
      console.log( i + "  " + row.join(" | ") );
      if (i < gridSize - 1) {
        console.log("  -----------");
      }
    }

  };



  module.exports = Board;
// })();

// var board = new Board([["X",null,null], ["X",null,null], ["X",null,null]]);
// console.log(board.isWon());
// board.render();
// board.placeMark([0,0], "X");
// board.render();
// console.log(board.winner());
