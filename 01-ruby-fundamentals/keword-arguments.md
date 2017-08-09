# Keyword Arguments and Default Values for Parameters
## Learning Goals
- Differentiate between _positional_ and _keyword_ arguments
- Use _optional arguments_ to simplify method signatures
- Add _default values_ to method parameters

## Keyword Arguments

### Introduction: Coffee Price
Imagine we are building a point-of-sale system for a local coffee shop. Our program needs to be able to calculate the price for various caffeinated beverages. Because this is one specific behavior, we have decided to encapsulate it in a method.

After looking over the menu a bit, we've come up with the following rules:
- There are 3 different types of coffee, each with a different base price
  - Drip, $1.50
  - Latte, $3.70
  - Cappuccino, $3.20
- Bigger sizes of coffee apply a multiplier to the base price
  - Tall, base price
  - Grande, base price X 1.3
  - Venti, base price X 1.6

These rules translate into the following code.

```ruby
def coffee_price(type, size)
  # Find the base price for this drink
  case type
  when :drip
    price = 1.5
  when :latte
    price = 3.7
  when :cappuccino
    price = 3.2
  else
    puts "Invalid coffee type: #{type}"
    return
  end

  # Modify for size
  case size
  when :tall
    # No change
  when :grande
    price *= 1.3
  when :venti
    price *= 1.6
  else
    puts "Invalid size: #{size}"
    return
  end

  return price
end
```

The `coffee_price` method would be invoked as follows:

```ruby
price = coffee_price(:latte, :venti)
puts "Your total is #{price} dollars"
```

Spend some time reading through the above code, then answer the following questions:
- What's the _method signature_ of the `coffee_price` method?
- What can `coffee_price` _return_?
- Why is it useful to put this functionality in a method?
- How does the method work? Does anything surprise you about it?
- How would you make sure this method does the right thing?
- What happens if your argument doesn't match what the method expects, like `coffee_price(:decaf, :grande)`?
- Why do we use _symbols_ as the values for `type` and `size` instead of _strings_?

### Adding More Options

Now that we've got the basics, it's time to add some of the options on our coffee menu.
- Extra shots of espresso: $0.50 each
- Served cold: $1.00 extra

Let's update our code to match:

```ruby
def coffee_price(type, size, extra_shots, cold)
  # Find the base price for this drink
  case type
  when :drip
    price = 1.5
  when :latte
    price = 3.7
  when :cappuccino
    price = 3.2
  else
    puts "Invalid coffee type: #{type}"
    return
  end

  # Modify for size
  case size
  when :tall
    # No change
  when :grande
    price *= 1.3
  when :venti
    price *= 1.6
  else
    puts "Invalid size: #{size}"
    return
  end

  # Charge for extra shots
  price += extra_shots * 0.5

  # Charge for a cold drink
  if cold
    price += 1
  end

  return price
end
```

The code is starting to get pretty complicated, but that makes sense because our coffee pricing logic is also complex.

Our _method signature_ is also starting to get complex. Here are two examples of calling the new `coffee_price`:

```ruby
# Price a venti hot latte with 3 extra shots
coffee_price(:latte, :venti, 3, false)

# Price a tall iced drip
coffee_price(:drip, :tall, 0, true)
```

There are a few problems with this:
- The caller has to remember the order of the arguments
- When reading the call, there's no way to tell which argument is which
- The caller must provide values for all arguments, even for the "standard" way of doing things (i.e. no extra shots)

All of these put the onus on the caller to do things right, which is just asking for trouble. **A well-written method is easy to use right and hard to use wrong** - by that standard, this is not good code.

### Keyword Arguments

One way to address these problems is with a technique called _keyword arguments_. Here's what they look like:

```ruby
# Define the method
def coffee_price(type, size, extra_shots: 0, cold: false)
  # ... calculate price, same code as before ...
  return price
end

# Price for a venti latte with 3 extra shots
coffee_price(:latte, :venti, extra_shots: 3, cold: false)

# Price for a tall iced drip
coffee_price(:drip, :tall, cold: true)

# Price for a grande cappuccino
coffee_price(:cappuccino, :grande)
```

The only things we've changed are the parameters in the method signature, the body of the method remains the same. The end result should resemble [this gist](https://gist.github.com/droberts-ada/07714ad0e2a3bc5a60c50d6a78e02f15).

There are a few things to note here:
- In the method signature, each keyword argument comes with a _default value_
  - The syntax is similar to keys and values in a hash
- When you invoke a method, keyword arguments are optional
  - If you omit one, the value from the method signature will be used instead
- When a method is invoked, any keyword arguments are passed by name (a.k.a. _keyword_)
- Keyword arguments can be passed in any order.
- Keyword arguments can co-exist with regular arguments (also called _positional arguments_)
  - Positional arguments must come first, both in the definition and when the method is called
  - All positional arguments must be supplied for every call

### When to use Keyword Arguments

Keyword arguments aren't always the right choice.

Sometimes an argument doesn't have a clear default value. For `type`, should the default be `:drip`, `:latte` or `:cappuccino`?

Sometimes a method doesn't make sense without one of the arguments. How can you price coffee if you don't know the size?

In these cases, positional arguments are usually the right choice. Keyword arguments are useful when a method has an alternate way of behaving, or a long list of optional arguments.

The difference between the two is similar to the difference between options (flags) and arguments to a command-line program. Options change _how_ the program behaves, arguments change _what_ it acts on.

## Summary

- **Positional arguments** are the type of method arguments we've seen so far
- **Keyword arguments** are given by name, and have a default value
- Keyword arguments can make calling a method easier
- Keyword arguments aren't the right solution to every problem
  - If an argument is required or there's no clear default, positional arguments are often better

## Additional Resources
* [Ruby 2 Keyword Arguments](https://robots.thoughtbot.com/ruby-2-keyword-arguments)
