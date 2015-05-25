"use strict";
var readline = require("readline");
var Board = require("./tttBoard");

var reader = readline.createInterface({
  input : process.stdin,
  output: process.stdout
});



// ( function() {
  // if (typeof TicTacToe === "undefined") {
  //   window.TicTacToe = {};
  // }

  function Game() {
    this.board =  new Board();
    this.moves = [];
  }

  Game.prototype.makeMove = function(move) {
     var mark = (this.moves.length % 2 === 0) ? "X" : "O";

     if (this.board.placeMark(move, mark)) {
       this.moves.push(move);
     }
  };

  Game.prototype.play = function() {
    var game  = this;
    var board = this.board;
    this.board.render();
    this.getMove(reader, function (move) {
      game.makeMove(move);
      console.log(board.isWon());

      if (board.isWon() || game.moves.length >= Math.pow(board.grid.length, 2)) {
        console.log("Game over" + board.winner() + "won.");
        board.render();
        reader.close();
        return;
      } else {
        game.play();
      }
    });
  };

  Game.prototype.getMove = function(reader, callback) {
    var game = this
    reader.question("Enter move:", function (answer) {
      callback(JSON.parse(answer));
    });
  };



  var game = new Game();
  game.play();


  // interface to canvas down here
  //
  // Game.prototype.parseClicks = function (callback) {
  //   var canvasPosition = {
  //     x: canvas.offset().left,
  //     y: canvas.offset().top
  //   };
  //
  //
  //
  //
  //   callback(move)
  // };


// })();
