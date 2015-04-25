describe("Function.prototype.myBind", function () {
  var Cat;
  var sally, markov, curie;

  beforeEach(function () {

    Cat = function Cat (name) {
      this.name = name;
    };

    Cat.prototype.sayHello = function () {
      return this.name + " says hello!";
    };

    Cat.prototype.greetOne = function (otherCat) {
      return this.name + " says hello to " + otherCat.name;
    };

    Cat.prototype.greetTwo = function (otherCat1, otherCat2) {
      return this.name + " says hello to " + otherCat1.name + " and " +
        otherCat2.name;
    };

    sally = new Cat("Sally");
    markov = new Cat("Markov");
    curie = new Cat("Curie");
  });

  it("sets the context and returns a function which can be called function style", function () {
    spyOn(Cat.prototype.sayHello, 'bind').andCallThrough();
    expect(sally.sayHello.myBind(sally)()).toEqual("Sally says hello!");
    expect(Cat.prototype.sayHello.bind).not.toHaveBeenCalled();
  });

  it("should pass in bind-time argument to the method", function () {
    spyOn(Cat.prototype.greetOne, 'bind').andCallThrough();
    expect(sally.greetOne.myBind(sally, markov)())
      .toEqual("Sally says hello to Markov");
    expect(Cat.prototype.greetOne.bind).not.toHaveBeenCalled();
  });

  it("should pass in two bind-time arguments to the method", function () {
    spyOn(Cat.prototype.greetTwo, 'bind').andCallThrough();
    expect(sally.greetTwo.myBind(sally, markov, curie)())
      .toEqual("Sally says hello to Markov and Curie");
    expect(Cat.prototype.greetTwo.bind).not.toHaveBeenCalled();
  });

  it("should combine bind-time and call-time arguments", function () {
    spyOn(Cat.prototype.greetTwo, 'bind').andCallThrough();
    expect(sally.greetTwo.myBind(sally, markov)(curie))
      .toEqual("Sally says hello to Markov and Curie");
    expect(Cat.prototype.greetTwo.bind).not.toHaveBeenCalled();
  })
});

describe("myCall", function () {
  it("should take a function and bind the given context and call the function", function () {
    var myObj = {
      name: "John"
    };
    var myFunc = function () {
      return this.name;
    };

    expect(JSA.myCall(myFunc, myObj)).toMatch(/John/);
  });

  it("should pass through any given arguments", function () {
    var myObj = {
      count: 10
    }
    var adder = function (x, y, z) {
      this.count += (x + y + z);
      return this.count;
    };

    expect(JSA.myCall(adder, myObj, 1, 2, 3)).toEqual(16);
  });
});

describe("myCurry", function () {
  beforeEach(function () {
    this.myObj = {
      count: 10
    };
  });

  it("should take a function, object, and curry if 1 is passed", function () {
    var echo = function (arg) {
      return arg;
    };

    var first = JSA.myCurry(echo, this.myObj, 1);
    expect(first("one")).toMatch(/one/);
  });

  it("binds to obj if passed in", function () {
    var count = function () {
      return this.count;
    };

    var first = JSA.myCurry(count, this.myObj, 1);
    expect(first("")).toEqual(10);
  });

  it("currys arguments and calls function after called with total num args", function () {
    var sum = function(a, b, c) {
      return this.count + a + b + c;
    };
    var curriedSum = JSA.myCurry(sum, this.myObj, 3);
    var result = curriedSum(1)(2)(3);
    expect(result).toEqual(16);
  });
});
