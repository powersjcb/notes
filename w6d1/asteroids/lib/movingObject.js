(function () {
if (typeof Asteroids === "undefined") {
  window.Asteroids = {};
}

// pos, vel, radius, color
var MovingObject = Asteroids.MovingObject = function (obj) {
  this.pos = obj.pos;
  this.vel = (obj.vel || 0);
  this.radius = obj.radius;
  this.color = obj.color;
};

MovingObject.prototype.draw = function (ctx) {
  // ctx (context, should be '2d' env of canvas)

  //starts path of object outline
  ctx.beginPath();
  //draw outline
  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fillStyle = this.color;
  ctx.fill();
  ctx.strokeStyle = '#ffffff';
  ctx.stroke();
};

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
};


})();
