(function () {
  if (window.Asteroids === undefined) {
    window.Asteroids = {};
  }

var GameView = Asteroids.GameView = function (game, ctx) {
  this.ctx = ctx;
  this.game = game;
};

GameView.prototype.start = function () {
  var that = this;
  setInterval(
    function () {
    that.game.moveObjects();
    that.game.draw(that.ctx);
    },
    20
  );
};

})();
