# javascript notes


## Functions

```
// functions.js
var nameOfFunction = function(args) {
  var method_variable = 'cats';
  console.log(method_variable);
}

// frowned upon(?) version of same thing
function nameOfFunction() {
  var method_variable = 'cats';
  console.log(method_variable);
}
```


## Objects (kinda like classes & functions)

```
// object.js
var person {
  firstName : "Foo",
  lastName  : "Bar",
// can also have functions inside
  greet : function(name) {
      console.log('Hi, ' + this.firstName );
  }
};
```

## Loops

```
var myArray = [1, 2, 3, 4, 5];
var i;
var len = myArray.length;
for (i = 0; i < len; i = i + 1) {
  log('item at index ' + i + "is" + myArray[ i ] );
}
```


## "this#"


## Logical operators for code execution
A-la ||= in ruby
```
foo && bar() // runs bar() if foo is truthy
var bar = baz || createBar();
var bar = false || 1;  // returns 1

// ternary operator - much like ruby
var prop = (dim === 'width') ? 'true case' : 'false case';
```


## Reserved words
abstract boolean break byte case catch char class const continue debugger
default delete do double else enum export extends false final finally float
for function goto if implements import in instanceof int interface long
native new null package private protected public return short static super
switch synchronized this throw throws transient true try typeof var
volatile void while with
