# Default Values for Method Arguments
## Learning Goals
- Differentiate between _positional_ and _keyword_ arguments
- Use _optional arguments_ to simplify method signatures

## Keyword Arguments

### Introduction: Coffee Price
Imagine we are writing a point-of-sale system for a local coffee shop. Our program needs to be able to calculate the price for various caffeinated beverages. Because this is one specific behavior, we have decided to encapsulate it in a method.

After looking over the menu a bit, we've come up with the following code:

```ruby
def coffee_price(type, size)
  # Find the base price for this drink
  if type == :drip
    price = 1.5
  elsif type == :latte
    price = 3.7
  elsif type == :cappuccino
    price = 3.2
  else
    puts "Invalid coffee type: #{type}"
    return
  end

  # Modify for size
  if size == :tall
    # no change
  elsif size == :grande
    price *= 1.3
  elsif size == :venti
    price *= 1.6
  else
    puts "Invalid size: #{size}"
  end

  price
end
```

The `coffee_price` method would be invoked as follows:

```ruby
price = coffee_price(:latte, :venti)
puts "Your total is #{price} dollars"
```

Spend some time reading through the above code, then answer the following questions:
- What's the _method signature_ of the `coffee_price` method?
- What does `coffee_price` _return_?
- Why is it useful to put this functionality in a method?
- How does the method work? Does anything surprise you about it?
- How would you make sure this method does the right thing?
- What happens if your argument doesn't match what the method expects, like `coffee_price(:decaf, :grande)`?

### Adding More Options

Now that we've got the basics, it's time to add some of the options on our coffee menu.
- Milk: can be regular (no change), soy ($0.50 extra) or almond ($1.00 extra), scaled by size
- Extra shots of espresso: $0.50 each
- Served cold: $1.00 extra

Let's update our code to match:

```ruby
def coffee_price(type, size, milk, extra_shots, cold)
  # Find the base price for this drink
  if type == :drip
    price = 1.5
  elsif type == :latte
    price = 3.7
  elsif type == :cappuccino
    price = 3.2
  else
    puts "Invalid coffee type: #{type}"
    return
  end

  # Modify price for milk type
  if milk == :regular
    # no change
  elsif milk == :soy
    price += 0.5
  elsif milk == :almond
    price += 1.00
  else
    puts "Invalid milk: #{milk}"
  end

  # Modify for size
  if size == :tall
    # no change
  elsif size == :grande
    price *= 1.3
  elsif size == :venti
    price *= 1.6
  else
    puts "Invalid size: #{size}"
  end

  # Charge for extra shots
  price += extra_shots * 0.5

  # Charge for a cold drink
  if cold
    price += 1
  end

  price
end
```

The code is starting to get pretty complicated, but that makes sense because our coffee pricing logic is also complex.

Our _method signature_ is also starting to get complex. Here are two examples of calling the new `coffee_price`:

```ruby
# Price a venti iced soy latte with 3 extra shots
coffee_price(:latte, :venti, :soy, 3, true)

# Price a tall drip
coffee_price(:drip, :tall, :regular, 0, false)
```

There are a few problems with this:
- The caller has to remember the order of the arguments
- When reading the call, there's no way to tell which argument is which
- The caller must provide values for all arguments, even for the "standard" way of doing things

All of these put the onus on the caller to do things right, which is just asking for trouble. **A well-written method is easy to use right and hard to use wrong** - by that standard, this is not good code.









## Create an _optional argument_ by adding a _default value_
We can define an _optional argument_ by assigning a _default value_ to one or more of the arguments in the _method signature_:

```ruby
def exponate(base, power = 2) # <= power will be 2 unless we pass in something else
  base ** power
end

exponate(2) #=> 4
exponate(2, 3) #=> 8
exponate(4) #=> 16
```

__Question: Is this a good use case for an optional argument?__

Let's look at another example:

```ruby
def exponate(base, power, abs = false)
  if abs
    (base ** power).abs
  else
    base ** power
  end
end

exponate(2) #=> ArgumentError
exponate(-2, 3) #=> -8
exponate(-2, 3, true) #=> 8, why?

```

__Question: Is this a good use case for an optional argument?__

*  [Optional Arguments](source/OptionalArguments.rb)
*  [Slides:  Default Method Arguments](https://docs.google.com/presentation/d/1ifhG3r30N5w8UBc4HKPzvntTlxifnf3T0L-QfEjL6GU/edit#slide=id.p)
* [Ruby 2 Keyword Arguments](https://robots.thoughtbot.com/ruby-2-keyword-arguments)
