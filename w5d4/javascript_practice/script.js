// script.js


// for (var i = 0; i < 5; i++) {
//   console.log("thing")
// }


var a = [1, 2, 3, 4]



// instead of passing a block, you pass an annonymous function
// a.forEach( function (num) {
//   console.log(num)
// });

var cat = {
  name: "Breakfast",
  age : 8,

  purr: function () {
    console.log("meow!");
  },

  age_one_year: function () {
    // "this" is not optional like self in ruby
    //   must be called to access object properties.
    this.age += 1;
  },

  purrMore: function () {
    for ( var i = 0; i < 5; i++ ) {
      this.purr()
    }
  }

};

// console.log( cat.name + "'s age is " + cat.age)
// console.log(cat.purr())
// cat.age_one_year()
// console.log( cat.name + "'s age is " + cat.age)
// console.log(cat.purrMore())

// constructor functions are the equivalent of ruby classes
//   they have camel case names to show disinction

function Kitten(name, age) {
  this.name = name;
  this.age  = age;

  this.meow = function () {
    console.log(this.name + ' says "meow!"');
  };
}

var kitten = new Kitten("Earl", 2);

// console.log(kitten.meow())


// And again with prototypes to reduce duplicatoin of meow method
//   behaves like a parent class method, can be overidden
function Kitten(name, age) {
  this.name = name;
  this.age  = age;
}

Kitten.prototype.meow = function () {
  console.log(this.name + ' says "meow!"');
};

k1 = new Kitten("Earl2", 2);
k2 = new Kitten("Houdini", 1);
