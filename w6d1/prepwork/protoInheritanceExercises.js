function Animal(name) {
  this.name = name;
}
function Dog(name, coatColor) {
  Animal.call(this, name);
  this.coatColor = coatColor;
}
function Poodle (name, coatColor, lastHaircut) {
  Dog.call(this, name, coatColor);
  this.lastHaircut = lastHaircut
}


function SurrogateAnimal() {}
SurrogateAnimal.prototype = Animal.prototype;
Dog.prototype = new SurrogateAnimal();

function SurrogateDog() {}
SurrogateDog.prototype = Dog.prototype;
Poodle.prototype = new SurrogateDog();




var myAnimal = new Animal("Bob");
var myDog = new Dog("Doggy", "brown");
var myPoodle = new Poodle("Fluffy", "white", "3-6-2015");

console.log(myAnimal);
console.log(myDog);
console.log(myPoodle);

function Cat(name) {
  Animal.call(this, name);
}

Cat.prototype = Object.create(Animal.prototype);
var gizmo = new Cat("Gizmo");
console.log(gizmo)
