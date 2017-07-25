# Default Values for Method Arguments
## Learning Goals
- Differentiate between _positional_ and _keyword_ arguments
- Use _optional arguments_ to simplify method signatures

## Introduction: Coffee Price
Imagine we are writing a point-of-sale system for a local coffee shop. Our program needs to be able to calculate the price for various caffeinated beverages. Because this is one specific behavior, we have decided to encapsulate it in a method. After looking over the menu a bit, we've come up with the following code:

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
  if size == :grande
    price *= 1.3
  elsif size == :venti
    price *= 1.6
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
