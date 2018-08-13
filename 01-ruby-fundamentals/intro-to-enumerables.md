# `Enumerable`s

## Learning Goals

- Learn about the _module_ `Enumerable`
- Understand how `Enumerable` works with Arrays and Hashes
- Practice using the `Enumerable` built-in method `map`

## What is `Enumerable`?

`Enumerable` is a _module_ that is _mixed in_ to both `Array` and `Hash` types in Ruby.

At this very moment, we will not go into the full definition of a module. Instead, we'll work with an abbreviated definition: Ruby has a built-in set of code and methods accessed via `Enumerable`. Arrays and Hashes by default have and can use the methods defined within `Enumerable`.

`Enumerable` itself describes a set of methods that can be used on "things that can be counted." More specifically, it is likely that Ruby things that have a `.each` method on them can also access the other Enumerable methods.

Just as we've been using `.each` to iterate over items in an array or a hash, we're going to explore other methods that do _iteration and more_ that are defined in Enumerable.

## `map`

Sometimes when we have an array of elements, we want a new array that is based off of the original array, but the new array's elements are slightly and consistently different.

Let's think of an example situation. Let's say you have an array of strings that represent food items `food_items`, and you want to make a new array `spicy_food_items` of all of those food items with `"spicy"` before each item name.

How would you do it? Talk through your strategy with your seat squad.

### Initial approach without an `Enumerable` method

You might approach it with using a `.each`:

```ruby
food_items = ['veggie pizza', 'dumplings', 'meatball', 'spumoni']
spicy_food_items = []

food_items.each do |food|
  spicy_food = 'spicy ' + food
  spicy_food_items << spicy_food
end

# spicy_food_items => ["spicy veggie pizza", "spicy dumplings", "spicy meatball", "spicy spumoni"]
```

Let's reflect:

1. Why was iteration a good strategy to handle this problem?
1. Why did we need a second array `spicy_food_items`? What was the initial value of `spicy_food_items`, and where was it defined? Is there a way to use a `.each` and not have a second array?
1. In the `each` loop, what was the value of the local variable `food`?
1. What was the operation we needed to perform on each `food`?

### Refactoring to use `Enumerable`'s `map` method

Let's now take a second to consider an alternative way to solving this problem. Again, we want a new array that is based off of the original array, but the new array's elements are slightly and consistently different.

The `map` method will operate on an array, go through each element in the array, perform some operation defined in a code block for each element on the array, and return an array of the same size with the operation performed for each element.

[This is Ruby's documentation for the `map` method](https://ruby-doc.org/core-2.5.1/Enumerable.html#method-i-map). A skill we will learn as developers is to always check documentation as a source of truth for learning what methods are available, what they do, what they take in as parameters, and what they return.

Let's refactor our code above to use `map` instead of `each`:

```ruby
food_items = ['veggie pizza', 'dumplings', 'meatball', 'spumoni']
spicy_food_items = food_items.map do |food|
  'spicy ' + food
end

# spicy_food_items => ["spicy veggie pizza", "spicy dumplings", "spicy meatball", "spicy spumoni"]
```

Take some time to read the code, and then we'll read it together.

1. Where is the the second array `spicy_food_items` defined and assigned a value? How is that different from the `each` loop?
1. The documentation refers to a _block_. Where is the _block_? What is the block doing?
1. Why don't we have to shovel `'spicy ' + food` into the second array?

With the person next to you, describe the similarities and differences between using `.each` and `.map` to solve this problem.

#### Practice `map` on arrays

Solve this first using an each loop, then with the person next to you, refactor it to use `map`.

1. Given the following array `greetings`, assign to a new variable `loud_greetings` a new array. In the new array, each element should be like the original array, but all in [upcase (CAPITAL) letters](https://ruby-doc.org/core-2.2.3/String.html#method-i-upcase).

```ruby
greetings = ['hello', 'howdy', 'hey there']

# loud_greetings => ["HELLO", "HOWDY", "HEY THERE"]
```

### Using map with a hash

When using `map` on arrays, we saw that we gave a name to every element in our block:

```ruby
result = ['first element', 'second element', 'third element'].map do |element|
  "#{element.split(' ').first}"
end

# result => ["first", "second", "third"]
```

In the above example, `element` was the name of the local variable that referred to the current element in the iteration.

When using `map` on hashes, in each round of iteration, we look at each key-value pair, and get reference to that key-value pair.

```ruby
meal_plan = {
  breakfast: "waffles",
  lunch: "sandwich",
  dinner: "rice and curry"
}

result = meal_plan.map do |key, value|
  "key: #{key}, value: #{value}"
end

# result => ["key: breakfast, value: waffles", "key: lunch, value: sandwich", "key: dinner, value: rice and curry"]
```

1. What's the data type of `result`? What's the size of `result`? Is it different than what you would expect?
1. What does `key` refer to? What does `value` refer to?
1. If we wanted to refactor the names `key` and `value` to names with more meaning, what could we choose?

#### Practice `map` on hashes

Solve this first using an each loop, then refactoring it to use `map`.

1. Given the following hash `students`, assign to a new variable a new array `formatted_names`. In the new array, each element should be hash with the same key, but the value in [upcase (CAPITAL) letters](https://ruby-doc.org/core-2.2.3/String.html#method-i-upcase).

```ruby
students = {
  student_a: 'Dasher',
  student_b: 'Dancer',
  student_c: 'Prancer'
}

# formatted_names => [{:student_a=>"DASHER"}, {:student_b=>"DANCER"}, {:student_c=>"PRANCER"}]
```

## Conclusion on `map`

`map` is a method that `Enumerable` provides that iterates a collection and returns an array of the __results of the block evaluation__. Because `Enumerable` methods apply to arrays and hashes, we can use `.map` and any `Enumerable` method on arrays and hashes.

Whenever you need a second array that is based off of an original first array, consider using `map`.

`Enumerable` has a lot of methods that can solve problems around collections, and we'll look at those later, too, but we find that having a strong understanding of `map` will be a great start.
