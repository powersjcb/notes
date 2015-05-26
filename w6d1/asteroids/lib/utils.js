(function () {
if (typeof Asteroids === "undefined") {
  window.Asteroids = {};
}

var Util = Asteroids.Util = {};

var inherits = Util.inherits = function (ChildClass, BaseClass) {
  function Surrogate () { this.constructor = ChildClass; }
  Surrogate.prototype = BaseClass.prototype;
  ChildClass.prototype = new Surrogate();
};

Util.randomVec = function (length) {
  var angle = Math.random() * Math.PI * 2;
  var x = (Math.sin(angle) * length);
  var y = (Math.cos(angle) * length);
  return [x,y];
};

Util.randomRadius = function () {
  return this.getRandomInt(15, 30);
};


// generic helper function, random from min to max
Util.getRandomInt = function (min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
};

})();
