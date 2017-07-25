# Default Values for Method Arguments
## Learning Goals
- Use an optional argument in a custom method
- Experiment with some common uses of optional/default values
  - reduce necessary code by planning for common values
  - introduce minor deviations in expected operation
  - handle _edge cases_, those situations where things won't work as planned

## Default Values for Methods
Here's a sparkly method:

```ruby
def exponate(base, power)
  base ** power
end

exponate(2, 2) #=> 4
exponate(3, 2) #=> 9
exponate(4, 10) #=> 1048576
exponate(10) #=> ArgumentError
```

__Question: What's the _method signature_ of our `exponate` method?__

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
