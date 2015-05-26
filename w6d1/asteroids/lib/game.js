(function () {
  if (typeof Asteroids === "undefined") {
    window.Asteroids = {};
  }


var Game = Asteroids.Game = function () {
  this.NUM_ASTEROIDS = 50;
  this.asteroids = [];
  this.addAsteroids();
};
Game.DIM_X = 500;
Game.DIM_Y = 500;

Game.prototype.addAsteroids = function () {
  for (var i = 0; i < this.NUM_ASTEROIDS; i++) {
    var position = this.randomPosition();
    this.asteroids.push(new Asteroids.Asteroid({pos: position}));
  }
};

Game.prototype.randomPosition = function () {
  var x = Math.random() * Game.DIM_X;
  var y = Math.random() * Game.DIM_Y;
  return [x, y];
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0,0, Game.DIM_X, Game.DIM_Y);
  this.asteroids.forEach( function (asteroid) {
    asteroid.draw(ctx);
  });
};

Game.prototype.moveObjects = function () {
  this.asteroids.forEach( function (asteroid) {
    // console.log(asteroid.radius + " " + asteroid.pos)
    asteroid.move();
  });
};





// this.asteroids.forEach(move.call);

// function forEach(cb) {
//   for (...) {
//     move.call(asteroid)
//   }
// }

})();
