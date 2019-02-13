# More Conditionals
## Learning Goals
- Meet the _ternary_ operator!
- Discuss _postfix conditionals_
- Learn about using _compound operators_

## Ternary Operator
In our discussion precedence, we talked about the _unary_ operators (`+` and `-`) to indicate whether a value was positive or negative, i.e, `-15` and `+4.5`. All the operators we've met since then have been _binary_ operators, i.e. the `*` in `10 * 5`.

So if a _unary_ operator operates (hehe) on a single value, and a _binary_ operator operates on a pair of values, what would a _ternary_ operator do? It'd operate on three values!

The _ternary operator_ in Ruby doesn't do arithmetic. Instead, it performs logical operations, very similar to what we've done with `if else` blocks already. _Ternary operations_ have three parts: 1) a comparison, 2) a positive results, and 3) a negative result. The syntax is `comparison ? positive result : negative result`. If the comparison is `true`, then the positive result code is executed. If the comparison is `false`, then the negative result code is executed. Here's an example:

```ruby
# how we've done it so far
num = rand(11)
if num == 10
  puts "It's 10!"
else
  puts "It's not 10!"
end

# same code using a ternary instead
# condition ? eval_true : eval_false
puts num == 10 ? "It's 10!" : "It's not 10!"
```

```ruby
# no ternary :(
def avg_score(scores)
  if scores.length > 0
    scores.sum / scores.length
  else
    0
  end  
end

# with a ternary!
def avg_score(scores)
  # condition ? eval_true : eval_false
  scores.length > 0 ? scores.inject(0, :+) / scores.length : 0
end

# and one more! No ternary:
if @account.save
  message = "Success!"
else
  message = "Problems. :("
end

# with a ternary:
message = @account.save ? "Success!" : "Problems. :("
```

## Single-line Conditionals
We know that the `if` construct allows us to conditionally execute a block of code. Sometimes, those blocks are really short, like this:

```ruby
if argument.nil?
  raise ArgumentError
end
```

By using a _postfix conditional_, we can trim that three-line block into a single line that reads really well:

```ruby
raise ArgumentError if argument.nil?
```

Don't try to force the issue, but if you need to perform a conditional block that's a single line (and doesn't have a contra-case like `else`), then the _postfix conditional_ is for you. This patterns works for both `if` and `unless` statements. Here are a few more examples:

```ruby
# as long as my_var is truthy, do_this_method will execute
do_this_method(my_var) if my_var

# this is called a "guard clause"
return "" unless num > 0

# assign 5 to penalty.amount unless resume.is_markdown? is true
penalty.amount = 5 unless resume.is_markdown?
```

## Compound Operators
### Mathy Compound Operators
We've all written code like `x = x + 4` when we want to modify a previously assigned variable. Some folks have discovered _compound operators_, which are shortcuts to performing this kind of operation. They only work if you've already assigned a value to the variable; trying to use them before a value is assigned will raise `NoMethodError`.

```ruby
x = 10  # => 10
x += 50 # => 60, same as x = x + 50
x -= 10 # => 50, same as x = x - 10
x *= 2  # => 100, same as x = x * 2
x /= 20 # => 5, same as x = x / 20

puts x #=> 5
```

### Logical Compound Operators
There are also two _logical compound operators_, `||=` (or-equals) and `&&=` (and-equals).

Similar to their mathematical cousins, these operators are shorthand for a more verbose expression. The `||=` assignment only happens if the _existing value_ of the variable is _falsey_. It doesn't matter whether the _assignment value_ is _truthy_ or not; only the _existing value_ is checked for truthiness.

```ruby
# with a truthy existing value
existing_value = "elephant"
existing_value ||= "hotdog"
existing_value.inspect #=> "elephant"

# with a falsey existing value
existing_value = nil
existing_value ||= "hotdog"
existing_value.inspect # => "hotdog"

# with falsey values everywhere
existing_value = nil
existing_value ||= false
existing_value.inspect #=> "false"
existing_value ||= nil
existing_value.inspect #=> "nil"
```

The `&&=` is pretty useless. :) Well, to be more fair, I've not found a compelling use case for it. I'm including it here for the sake of completeness. With `&&=`, if the _existing value_ of the variable is _truthy_, then the variable is reassigned to the _assignment value_. Kinda like this:

```ruby
# with two truthy values
existing_value = "elephant"
existing_value &&= "hotdog"
existing_value.inspect #=> "hotdog"

# with a falsey existing value and a truthy assignment value
existing_value = nil
existing_value &&= "hotdog"
existing_value.inspect #=> "nil"

# with a truthy existing value and a falsey assignment value
existing_value = "elephant"
existing_value &&= nil
existing_value.inspect #=> "nil"
```

Both of these logical compound operators are not used terribly often in our Ruby code. The `||=` can be very powerful within Rails so we will definitely see it again later.

## What Have We Accomplished?
- Using the ternary operator to clean up more simplistic condition statements
- Using a single-line conditional when we don't need an `else` or `elsif`
- Identifying what a compound operator is and what they accomplish


## Additional Resources
- [Ternary Examples](https://alvinalexander.com/blog/post/ruby/examples-ruby-ternary-operator-true-false-syntax)
- [Variable Assignment: Compound](https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Operators#Assignment  )
