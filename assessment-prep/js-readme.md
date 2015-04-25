# Javascript Assessment Preparation

**Basic Invocation Styles**

Make sure to understand function, constructor, and method styles of
function invocation.

**Basic Method Callbacks**

Understand the `this` problem: why doesn't `doThreeTimes(cat.meow)`
work? It will call `cat.meow` **function** style.

Understand the anonymous function closure solution:

```js
doThreeTimes(function () {
  cat.meow();
});
```

Understand the shortcut `bind` solution:

```js
// both are equivalent
doThreeTimes(cat.meow.bind(cat));
doThreeTimes(Cat.prototype.meow.bind(cat));
```

**Bind**

Understand that `call` forces a method to be called method style on an
object:

```js
// all three are equivalent
cat.meow();
cat.meow.call(cat);
Cat.prototype.meow.call(cat);
```

**Call and Bind**

Understand how to write `bind` with `call`:

```js
// This version of `bind` ignores arguments.
function bind1(fn, obj) {
  // return a new function that is safe to call function style and
  // calls `fn` method style on `obj`.
  return function () {
    return fn.call(obj);
  }
}

// add a `myBind` method to `Function.prototype`
Function.prototype.myBind = function (obj) {
  return bind1(this, obj);
}
```

**arguments**

Understand the special `arguments` variable:

```js
function sum1(num1, num2, num3) {
  return num1 + num2 + num3;
}

function sum2(nums) {
  var result = 0;
  for (var i = 0; i < nums.length; i++) {
    result += nums[i];
  }

  return result;
}

sum2([1, 3, 5]);

function sum3 () {
  var result = 0;
  for (var i = 0; i < arguments.length; i++) {
    result += arguments[i];
  }

  return result;
}

sum3(1, 3, 5);
```

**Slicing Arguments**

Understand how to `slice` the `arguments`, even though `arguments` is
not a proper `Array` object:

```js
function sum4 (msg, nums) {
  var result = 0;
  for (var i = 0; i < nums.length; i++) {
    result += nums[i];
  }

  console.log(msg + " " + result);
}

sum4("sum is", [1, 3, 5]) // => "sum is 9"

function sum5 (msg) {
  // We want all the numbers that are passed, but not the first
  // argument, which is a string.
  //
  // We'd like to call `arguments.slice(1)`, but `Array.prototype.slice`
  // lives in the `Array.prototype`, and `arguments` is not an `Array`
  // so it doesn't have that method.
  //
  // But `arguments` is enough like an array (has `.length` and `[i]`
  // operations) that we can force calling `slice` on it.
  var nums = Array.prototype.slice.call(arguments, 1);

  var result = 0;
  for (var i = 0; i < nums.length; i++) {
    result += nums[i];
  }

  console.log(msg + " " + result);
}

sum5("sum is", 1, 3, 5);
```

Let me argue why we can force `slice` to be called on `arguments`:

```js
Array.prototype.mySlice = function (startIdx) {
  var slicedArray = [];
  for (var i = startIdx; i < this.length; i++) {
    slicedArray.push(this[i]);
  }

  return slicedArray;
};

// if we say `Array.prototype.mySlice.call(arguments, 1)`, we call
// `mySlice`, forcing `this = arguments`. In `mySlice`, we use
// `this.length` and `this[i]`. `arguments`, while not a true `Array`
// object, has both these two properties.
```

**Call vs Apply**

Understand how to write `call` in terms of `apply`. You can't do it
the other way around. We need to use the `arguments` variable to
collect up arguments to `call`.

```js
Function.prototype.call = function (context) {
  // collect up args passed `fn.call(ctx, 1, 2, 3)` into an array
  // `[1, 2, 3]`
  var args = Array.prototype.slice.apply(arguments, [1]);
  return this.apply(context, args);
}
```

**Write A Really Good Bind**

Our previous version of `bind` written using `call` does not pass
arguments:

```js
function Cat (name) {
  this.name = name;
}

Cat.prototype.sayTwice = function (msg1, msg2) {
  console.log(this.name + " says " + msg1);
  console.log(this.name + " says " + msg2);
};

var gizmo = new Cat("Gizmo");
gizmo.sayTwice("hello", "goodbye");

var f = Cat.prototype.sayTwice.bind(gizmo);

// does not work; "hello" and "goodbye" are not passed to the
// `sayTwice`.

f("hello", "goodbye");
```

Let's use `arguments` to improve `bind` so that it can take arguments
at **call-time**:

```js
Function.prototype.bind = function (context) {
  var unboundMethod = this;
  return function () {
    // This just builds a true array our of `arguments`, slicing no
    // elements.
    var args = Array.prototype.slice.call(arguments, 0);

    return unboundMethod.apply(context, args);
  };
};

var f = Cat.prototype.sayTwice.bind(gizmo);
f("hello", "goodbye");
```

Now the arguments "hello" and "goodbye" will be captured into `args`
(`["hello", "goodbye"]`) by the bound function, and passed to
`unboundMethod` via the second argument of `apply`.

Last of all, let's allow the user to specify some arguments at
**bind-time** and more arguments at **call-time**. We want to be able
to write:

```js
var f = Cat.prototype.sayTwice.bind(gizmo, "hello");
f("goodbye")
// should be equivalent to `gizmo.sayTwice("hello", "goodbye")`
```

To do so:

```js
Function.prototype.bind = function (context) {
  var unboundMethod = this;
  var bindTimeArgs = Array.prototype.slice.call(arguments, 1);

  return function () {
    var callTimeArgs = Array.prototype.slice.call(arguments, 0);
    return unboundMethod.apply(
      context,
      bindTimeArgs.concat(callTimeArgs)
    );
  };
};
```

**Inheritance**

Know how to implement an `inherits` method (the `Surrogate` trick).
