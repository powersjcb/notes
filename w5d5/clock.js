function Clock () {
  this.time = null;
}

Clock.TICK = 5000;

Clock.prototype.printTime = function() {
  this.hour    = function () { return this.time.getHours(); };
  this.minute  = function () { return this.time.getMinutes(); }
  this.second  = function () { return this.time.getSeconds(); }
  console.log([this.hour(), this.minute(), this.second()].join(":"));
};

Clock.prototype.run = function () {
  this.time = new Date();
  this.printTime();
  setInterval(this._tick.bind(this), Clock.TICK);
}

Clock.prototype._tick = function () {
  this.time.setTime(this.time.getTime() + Clock.TICK );
  this.printTime();
}

var clock = new Clock();
clock.run();
