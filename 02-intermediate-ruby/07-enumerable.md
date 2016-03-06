# `Enumerable`
## Learning Goals
- Recap _object composition_
- Learn about the _module_ `Enumerable`
- Try out a Ruby _mixin_
- Discover some really, really useful methods provided by `Enumerable`

## Using _modules_ to make _mixins_
A _mixin_ is a collection of methods in a _module_ that is _composed_ into a Ruby class via either `include` (for instance methods) or `extend` (for class methods). Ruby classes can by _dynamically extended_, meaning that, at any point after it is declared, a class can be re-opened and modified.

Here's an example of extended a class directly. Let's copypasta this into a file in our `sandbox` and give it a try.

```ruby
# ~/C5/sandbox/extend-string.rb
class String # <= wat?!? We can do this? We sure can!
  def smiley_spaces
    self.gsub(/\s+/, " :) ")
  end
end
```

Neat, right? Ruby treats all classes--whether provided by Ruby or us--as equal. They can be mixed, extended, modified, and reconstructed to our hearts' content. Dang, I really love Ruby.

### Our First Mixin
Let's take this idea and crank it up to eleven. We can create a module and then `include` it in any class we like. The methods in that module then act like they were defined there, becoming available to all instances of the class. In this way, we have created code that can be reused by many classes. Here's a ridiculous example; let's put it in our sandbox and give it a spin in `irb`:

```ruby
# ~/C5/sandbox/extend-string.rb
# below the code we wrote earlier, add:
module AllSmiles
  def to_smile
    ":)" * self.length
  end
end

class String
  include AllSmiles
end

class Array
  include AllSmiles
end
```

__Question: Could I `include AllSmiles` in class `Fixnum`? Why?__

## So what is `Enumerable`?
`Enumerable` is a `module` that is _mixed in_ to both `Array` and `Hash` (and a couple other classes too, but those are the main ones). Like our _mixin_ above, it is dependent on the class providing a necessary method. For `AllSmiles`, we can only `include` it in classes that repond to the message `length`.

For `Enumerable`, that method is `each`. Every method provided by the _mix in_ leverages `each` to do really interesting and useful things with collections. If an object can be `each`ed, it can use `Enumerable`. Here's a run down of __some__ of the fun stuff in `Enumerable`:

### `map` & `collect`
These do the same thing. The iterate the collection and return an array of the __results of the block evaluation__.

```ruby
# using `each`
results = []
[1,2,3].each { |n| results << n ** 2 }
results # => [1, 4, 9]

# using `map` or `collect`
results = [1,2,3].collect { |n| n ** 2 }
results # => [1, 4, 9]
```

### `sort` & `sort_by`
Returns an array containing the items sorted by either their own `<=>` method, or by using the results of the supplied block.

Use `sort` when the sorting calculation/algorithm is inexpensive, in terms of memory required and/or objects allocated. Use `sort_by` when the calculation/algorithm is expensive. `sort_by` uses a [Schwartzian Transform](https://en.wikipedia.org/wiki/Schwartzian_transform) to minimize the cost of sorting things that require expensive caluclations. Err on the side of using `sort` unless you explicitely identify it as a performance bottleneck.

```ruby
[1,3,6,3,2,346,6,7].sort # => [1, 2, 3, 3, 6, 6, 7, 346]

Product.all.sort_by do |product|
  product.margins_average_year_over_year(adjust_for_inflation: true)
end
```

### `min`, `max`, `min_by`, & `max_by`
```ruby
[1,2,4].max
# => 4
[1,2,4].min
# => 1
Sale.all.min_by { |sale| sale.amount }
Sale.all.max_by { |sale| sale.amount }
```

### `group_by`
```ruby
Product.all.group_by {|product| product.name.split.last }
# Returns a hash, the keys being the name of the food type, the values being an array of products.
```

### `find` & `detect`
```ruby
[1,2,3,4].find {|n| n < 3 }
# => 1
```

### `select` & `reject`
Use these methods to filter collections by a conditional provided in the block. `select` will filter for elements where the condition is `true`. `reject` filters for elements where the condition is `false`.

```ruby
(1..100).to_a.find {|n| n % 10 == 0 }
# => [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

(1..15).to_a.reject { |n| n % 5 == 0 }
# => [1, 2, 3, 4, 6, 7, 8, 9, 11, 12, 13, 14]
```

### `reduce` & `inject`


## There's so much more to discover
`Enumerable` is one of my favorite things about Ruby. It is immensely useful. With it, we can write expressive, highly semantic code that is also concise. Spend some time with the [Enumerable docs](http://ruby-doc.org/core-2.3.0/Enumerable.html). Good knowledge in here will serve you in every application you build, And not just with Ruby. The methods contained in `Enumerable` describe ideas and patterns you'll find in every programming discipline (and technical interview, just sayin').
