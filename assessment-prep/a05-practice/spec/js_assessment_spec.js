describe("nLengthSubstrings", function() {
  it("should return the substrings of length n", function() {
    expect(Assessment.nLengthSubstrings("animal", 5)).toEqual(["anima", "nimal"]);
  });

  it("should return [] if the string is not long enough", function() {
    expect(Assessment.nLengthSubstrings("ant", 5)).toEqual([]);
  });

  it("should return the string if the string is of length n", function () {
    expect(Assessment.nLengthSubstrings("ant", 3)).toEqual(["ant"]);
  });
});

describe("myMap", function() {
  var originalArray, spy;

  beforeEach(function () {
    originalArray = null;
    spy = {
      callback: function (el) {
        return el * el;
      }
    };
  });

  it('calls the callback passed to it', function () {
    spyOn(spy, 'callback');
    Assessment.myMap([1, 2, 3], spy.callback);
    expect(spy.callback).toHaveBeenCalled();
  });

  it('yields each element to the callback', function () {
    spyOn(spy, 'callback');
    Assessment.myMap([1, 2], spy.callback);
    expect(spy.callback).toHaveBeenCalledWith(1);
    expect(spy.callback).toHaveBeenCalledWith(2);
  });

  it('does NOT call the Array#forEach or Array#map methods', function () {
    originalArray = [1, 2, 3];
    spyOn(originalArray, 'forEach');
    spyOn(originalArray, 'map');
    Assessment.myMap(originalArray, spy.callback);
    expect(originalArray.forEach).not.toHaveBeenCalled();
    expect(originalArray.map).not.toHaveBeenCalled();
  });

  it('returns a mapped array', function () {
    originalArray = [1, 2, 3];
    expect(Assessment.myMap(originalArray, spy.callback)).toEqual([1, 4, 9]);
  });

  it("does not modify the original array", function () {
    originalArray = [1, 2, 3];
    Assessment.myMap(originalArray, spy.callback);
    expect(originalArray).toEqual([1, 2, 3]);
  });
});

describe("primes", function() {
  it("should return the first 5 primes in order", function() {
    expect(Assessment.primes(5)).toEqual([2, 3, 5, 7, 11]);
  });

  it("should handle 0 correctly", function() {
    expect(Assessment.primes(0)).toEqual([]);
  });

  it("should handle 1 correctly", function() {
    expect(Assessment.primes(1)).toEqual([2]);
  });
});

describe("binarySearch", function() {
  var searchArr;

  beforeEach(function () {
    searchArr = [1, 2, 3, 4, 5, 6, 7];
  });

  it("should find an element in the right side of the array", function() {
    expect(Assessment.binarySearch(searchArr, 7)).toEqual(6);
  });

  it("should find an element in the left side of the array", function () {
    expect(Assessment.binarySearch(searchArr, 1)).toEqual(0);
  });

  it("should return -1 when an element is not present", function () {
    expect(Assessment.binarySearch(searchArr, 8)).toEqual(-1);
  });

  it("should recursively search the correct half of the array", function () {
    spyOn(Assessment, "binarySearch").andCallThrough();
    expect(Assessment.binarySearch(searchArr, 6)).toEqual(5);
    expect(Assessment.binarySearch).toHaveBeenCalledWith([5, 6, 7], 6);
  });
});

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

  it("should call the function method style on the context", function () {
    expect(sally.sayHello.myBind(sally)()).toEqual("Sally says hello!");
  });

  it("should pass in bind-time argument to the method", function () {
    expect(sally.greetOne.myBind(sally, markov)())
      .toEqual("Sally says hello to Markov");
  });

  it("should pass in two bind-time arguments to the method", function () {
    expect(sally.greetTwo.myBind(sally, markov, curie)())
      .toEqual("Sally says hello to Markov and Curie");
  });

  it("should combine bind-time and call-time arguments", function () {
    expect(sally.greetTwo.myBind(sally, markov)(curie))
      .toEqual("Sally says hello to Markov and Curie");
  })
});

describe("inherits", function() {
  var Animal, Dog, dog;

  beforeEach(function() {
    Animal = function() {
      this.name = "Yogi";
    };

    Animal.prototype.makeNoise = function() { return "Hi!"; };

    Dog = function() {
      this.age = 7;
    };

    Dog.inherits(Animal);

    Dog.prototype.bark = function() { return "Woof!"; };

    dog = new Dog();
  });

  it("should properly set up the prototype chain between a child and parent", function() {
    expect(dog.bark()).toBe("Woof!");
    expect(dog.makeNoise()).toBe("Hi!");
  });

  it("should not call the parent's constructor function", function() {
    expect(dog.name).toBeUndefined();
  });

  it("should maintain separation of parent and child prototypes", function() {
    Dog.prototype.someProperty = 42;
    var animal = new Animal();
    expect(animal.someProperty).toBeUndefined();
    expect(animal.makeNoise()).toBe("Hi!");
  });

  it("should properly work for longer inheritance chains", function() {
    var Poodle = function() { this.name = "Bill"; };

    Poodle.inherits(Dog);

    Poodle.prototype.shave = function() { return "Brrr."; };

    var poodle = new Poodle();
    expect(poodle.name).toBe("Bill");
    expect(poodle.shave()).toBe("Brrr.");
    expect(poodle.makeNoise()).toBe("Hi!");
    expect(poodle.bark()).toBe("Woof!");
  });
});
