Function.prototype.inherits = function (superClass) {
  function Surrogate () {}
  Surrogate.prototype = superClass.prototype;
  this.prototype = new Surrogate();
};


function MovingObject (speed) {
  this.speed = (speed || 0);
}

MovingObject.prototype.boost = function (amount) {
  this.speed += amount;
};



function Ship (name, speed) {
  MovingObject.call(this, speed);
  this.name = name;
}

Ship.inherits(MovingObject);




function Asteroid (speed) {
  MovingObject.call(this, speed);
}

Asteroid.inherits(MovingObject);


Asteroid.prototype.explode = function () {
  console.log("BOOOOOM!");
};



var xwing = new Ship("X-Wing", 300000);
console.log(xwing.name + "is going " +xwing.speed + "m/s");
xwing.boost(9006);
console.log(xwing.speed);
var ast1 = new Asteroid(20000);
console.log(ast1.speed);
ast1.explode();
