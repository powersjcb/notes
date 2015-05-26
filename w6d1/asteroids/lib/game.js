(function () {
  if (typeof Asteroids === "undefined") {
    window.Asteroids = {};
  }


var Game = Asteroids.Game = function () {
  this.NUM_ASTEROIDS = 6;
  this.asteroids = [];
  
  this.addAsteroids();

};
Game.DIM_X = 500;
Game.DIM_Y = 500;

Game.prototype.addAsteroids = function () {
  var pos = this.randomPosition();
  this.asteroids.push(new Asteroids.Asteroid({pos: pos}));
};

Game.prototype.randomPosition = function () {
  var x = Asteroids.Util.getRandomInt(0, Game.DIM_X);
  var y = Asteroids.Util.getRandomInt(0, Game.DIM_Y);
  return [x, y];
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0,0, Game.DIM_X, Game.DIM_Y);
  this.asteroids.forEach( function (asteroid) {
    asteroid.draw();
  });
};

Game.prototype.moveObjects = function () {
  this.asteroids.forEach( function (asteroid) {
    console.log(asteroid);
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
