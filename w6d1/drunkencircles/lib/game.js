(function () {
  if (typeof Circles === "undefined") {
    window.Circles = {};
  }

  var Game = Circles.Game = function (xDim, yDim) {
    this.xDim = xDim;
    this.yDim = yDim;

    this.circles = [];
    for (var i = 0; i < Game.NUM_CIRCLES; ++i) {
      this.circles.push(
        Circles.Circle.randomCircle(xDim, yDim, Game.NUM_CIRCLES)
      );
    }
  };

  Game.NUM_CIRCLES = 4000;

  Game.prototype.render = function (ctx) {
    ctx.clearRect(0, 0, this.xDim, this.yDim);

    this.circles.forEach(function (circle) {
      circle.render(ctx);
    });
  };

  Game.prototype.moveCircles = function () {
    var game = this;
    this.circles.forEach(function (circle) {
      circle.moveRandom(game.xDim, game.yDim);
    });
  };

  Game.prototype.start = function (canvasEl) {
    // get a 2d canvas drawing context. The canvas API lets us call
    // a `getContext` method on a canvas DOM element.
    var ctx = canvasEl.getContext("2d");

    // render at 60 FPS
    window.setInterval((function () {
      this.moveCircles();
      this.render(ctx);
    }).bind(this), 1000 / 60);
  };
})();
