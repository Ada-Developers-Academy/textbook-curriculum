# `Enumerable`
## Learning Goals
- Learn about the _module_ `Enumerable`
- Discover some really, really useful methods provided by `Enumerable`

## Purpose
Ruby provides a really neat module called `Enumerable`. It contains a set of extremely useful methods that you can use on collections like Arrays and Hashes. To gain a bit of understanding of what `Enumerable` is doing for us, we are going to dive into how Ruby allows you to use **modules** to make **mixins**.

## Using _modules_ to make _mixins_
A _mixin_ is a collection of methods in a _module_ that is _composed_ into a Ruby class via either `include` (for instance methods) or `extend` (for class methods). Ruby classes can by _dynamically extended_, meaning that, at any point after it is declared, a class can be re-opened and modified.

## What is `Enumerable`?
`Enumerable` is a `module` that is _mixed in_ to both `Array` and `Hash` (and a couple other classes too, but those are the main ones) using the `include` keyword. `Enumerable` is a _mixin_.

The mixin `Enumerable` is dependent on the class providing a necessary method or member. For `Enumerable`, that method is `each`. Every method provided by the _mixin_ leverages `each` to do really interesting and useful things with collections. If an object can be `each`ed, it can use `Enumerable`. Here's a run down of __some__ of the fun stuff that `Enumerable` provides:

### `map` & `collect`
These do the same thing. The iterate the collection and return an array of the __results of the block evaluation__.

```ruby
# using `each`
results = []
[1,2,3].each { |n| results << n ** 2 }
results # => [1, 4, 9]

# using `map` or `collect`
results = [1,2,3].map { |n| n ** 2 }
results # => [1, 4, 9]
```

### `sort` & `sort_by`
Returns an array containing the items sorted by either their own `<=>` method, or by using the results of the supplied block.

Use `sort` when the sorting calculation/algorithm is inexpensive, in terms of memory required and/or objects allocated. Use `sort_by` when the calculation/algorithm is expensive. `sort_by` uses a [Schwartzian Transform](https://en.wikipedia.org/wiki/Schwartzian_transform) to minimize the cost of sorting things that require expensive calculations. Err on the side of using `sort` unless you explicitly identify it as a performance bottleneck.

```ruby
[1, 3, 6, 3, 2, 346, 6, 7].sort # => [1, 2, 3, 3, 6, 6, 7, 346]

Product.all.sort_by do |product|
  product.margins_average_year_over_year(adjust_for_inflation: true)
end
```

### `min`, `max`, `min_by`, & `max_by`
These methods find the maximum and minimum values in a collection. You can use `max` and `min` if a collection's values can be directly compared (i.e., they are all `Float` and `Integer` values).

```ruby
numbers = (1..100).to_a.sample(15)

# finding max with each
max = 0
numbers.each do |num|
  max = num if num > max
end

# using `max` and `min`
numbers.max
numbers.min
```

If the values are not directly comparable, the `min_by` and `max_by` do similar work but take a block in which you can derive the values to compare:

```ruby
# getting the grocery order with min and max totals
least = GroceryStore::Order.all.min_by { |order| order.total }
most = GroceryStore::Order.all.max_by { |order| order.total }
```

### `select` & `reject`
Use these methods to filter collections by a conditional evaluation. `select` will filter for elements where the condition is `true`. `reject` filters for elements where the condition is `false`.

```ruby
(1..100).to_a.select {|n| n % 10 == 0 }
# => [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

(1..15).to_a.reject { |n| n % 5 == 0 }
# => [1, 2, 3, 4, 6, 7, 8, 9, 11, 12, 13, 14]
```

## There's so much more to discover
`Enumerable` is one of the most exciting things about Ruby. It is immensely useful. With it, we can write expressive, highly semantic code that is also concise. Spend some time with the [Enumerable docs](http://ruby-doc.org/core/Enumerable.html). Good knowledge in here will serve you in every application you build, and not just with Ruby. The methods contained in `Enumerable` describe ideas and patterns you'll find in every programming discipline.

## Activity: Divide & Conquer Enumerable
In a group of 4, you shall research each of these `Enumerable` methods. Prepare a short (<5 minute) demonstration to present to the group.
- `reduce` & `inject`
- `all?` & `any?`
- `find` & `detect`
- `group_by`
- `zip`
- `drop_while` & `take_while`

## Activity: Refactor Loops
Let's take what we just learned about `Enumerable` and apply that to the [Loop Problem Practice](https://github.com/AdaGold/standalone-exercises/blob/master/loop-problem-practice.md) that we did previously. Work with your seat squad to refactor each problem to use one of these `Enumerable` methods we just learned about.

## Additional Resources
- For more information on Mixins, read up on it in [this chapter](mixins.md)
- For another interesting Mixin, look up [Comparable](https://ruby-doc.org/core-2.4.0/Comparable.html)
