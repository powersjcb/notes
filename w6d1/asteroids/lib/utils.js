(function () {
if (typeof Asteroids === "undefined") {
  window.Asteroids = {};
}

var Util = Asteroids.Util = {};

Util.inherits = function (childClass, parentClass) {
  function Surrogate () {}
  Surrogate.prototype = parentClass.prototype;
  childClass = new Surrogate();
};

Util.randomVec = function (length) {
  var angle = Math.random() * Math.PI * 2;
  var x = Math.floor(Math.sin(angle) * length);
  var y = Math.floor(Math.cos(angle) * length);
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
