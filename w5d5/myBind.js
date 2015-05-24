Function.prototype.myBind = function (context) {
  var fn = this;
  return function () {
    fn.apply(context);
  };
};


// testing
function times(num, fun) {
  for (var i = 0; i < num; i++) {
    fun(); // call is made "function-style"
  }
}

obj = {
  name : "Bob",
   sayName: function () {
    console.log(this.name);
  }
};



times( 10, obj.sayName.myBind(obj) );
