# JavaScript Summary Worksheet

## Learning Objectives

- Review major JavaScript concepts
- Review functions
- Review definitions on asynchronous code and HTTP requests
- Review definitions on Web API
- Review JavaScript syntax

## Group Questions

For the following section, practice the following process with your neighbors:
- Read the question with your neighbors
- Answer it on your own
- Check the answer
- Check-in with your neighbors: Do you or your neighbors have any questions?

---
1. What is the following code snippet doing?

```javascript
const createCakeLabel = (ingredients) => {
  return `Delicious ${ingredients[0]} Cake 🍰. Ingredients: ${ingredients}`;
}

const groceries = ['strawberries', 'sugar', 'eggs', 'flour', 'cream'];

createCakeLabel(groceries);
```

<details>

  <summary>
    Click here for the answer
  </summary>

  First it defines an arrow function `createCakeLabel`. This function takes in one parameter: `ingredients`. It returns a string that interpolates cake type and the ingredients.
  <br/>
  Then it defines a `const` variable `groceries`, which is an array of strings.
  <br/>
  Lastly, it _invokes_ or _calls_ the method `createCakeLabel` and _passes in_ `groceries`

</details>

---

2. The following two code snippets are doing different things. What is the difference?

A:

```javascript
const sayHi = () => {
  return 'hi';
}

const sayLoudGreeting = () => {
  console.log( sayHi().toUpperCase() );
}

sayLoudGreeting();
```

B:

```javascript
const sayHi = () => {
  return 'hi';
}

const sayLoudGreeting = (callGreeting) => {
  console.log( callGreeting().toUpperCase() );
}

sayLoudGreeting( sayHi );
```

<details>

  <summary>
    Click here for the answer
  </summary>

  In both, calling `sayGreeting()` calls `console.log`.

  <br>

  In A, in `sayGreeting`, it will `console.log` the evaluation of `sayHi().toUpperCase()`, and it will call `sayHi()` directly. Calling `sayGreeting` does not take in an argument.

  <br>

  In B, in `sayGreeting`, it takes in one parameter: a function named `callGreeting`. In B, we invoke `sayGreeting` with the function `sayHi`. We do not invoke `sayHi` the function at that time. We only invoke `sayHi` when there are parentheses next to it: for example `sayHi()`. `console.log` will log the evaluation of `callGreeting().toUpperCase()`. It does not call `sayHi()`, but instead it calls the function `callGreeting`.
</details>

---

3. How are arrow functions and non-arrow functions similar? How are arrow functions different from non-arrow functions? Do we have a preference for one syntax over the other here at Ada?

<details>

  <summary>
    Click here for the answer
  </summary>

  Arrow functions and non-arrow functions both are valid syntaxes to define functions. They are different in how they look. Also, arrow functions do not have their own `this`. We prefer arrow function syntax at Ada.

</details>

---

4. In what ways have we seen that JavaScript and Ruby are different? In what ways have they been the same?

<details>

  <summary>
    There's actually no answer for this one, please just discuss it a little with your neighbors. :)
  </summary>

  :) :) :)

</details>

## Definitions

In groups, find definitions/answers for the following concepts or questions:

1. What is Asynchronous Programming?
1. What does the `then()` and `catch()` syntax mean when we use `axios` to make an HTTP Request?
1. What is Event-Driven Programming? What does event handling mean?
1. What is Web API?
1. What is the DOM?
1. What is a single page application?

## JavaScript Syntax

1. Reduce this function to a minimal arrow function:

```js
const divisibleByThree = function(num) {
  return num % 3 === 0;
};
```

2. Convert the Ruby sample code into JavaScript

```ruby
def coffee_price is_iced, size, flavor_array
  price = 2.50

  if size == 0
  elsif size == 1
    price += 1
  else
    price *= 2
  end

  if is_iced
    price += 0.75
  end

  flavor_array.each do |flavor|
    puts "pumping #{flavor}"
    price += 0.50
  end

  price
end

puts coffee_price true, 3, ["vanilla", "lemon"]
```

