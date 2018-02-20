# Creating Custom Exceptions

## Learning Goals
- Create custom exception classes
- Use custom exception classes

## Creating Custom Exceptions

Sometimes you run into a situation where the built in Ruby exceptions don't quite describe what went wrong. For example, imagine you have a program for processing credit card transactions. Here are two types of thing that could go wrong:

- The credit card number is the wrong type - maybe we expected a `String` of digits, but got a `Boolean`. This implies a programming error, and should be fixed by the engineer.
- The credit card number is [invalid](https://en.wikipedia.org/wiki/Luhn_algorithm) - there are too many or too few digits, or it doesn't match some other check. This implies the user has given us bad data, and should be asked politely to try again.

The two problems need to be handled in different ways, and the easiest way to do this is with different types of exceptions. In the first case an `ArgumentError` seems like the correct choice, but Ruby doesn't provide an exception for an invalid card number. Lucky for us, Ruby allows you to define custom exceptions!

As we discussed above, exceptions are just classes that inherit from `Exception` or one of its subclasses, so making your own is as simple as defining a new class. You'll usually want to inherit from `StandardError`, so that your exception can be handled with `rescue`.

First, we'll create the custom exception class:
```ruby
class InvalidCardNumberError < StandardError
end
```

Next, we can use the custom exception class. (Note: This assumes you are loading the class from a file or relevant location from within this code)
```ruby
def process_transaction(card_number, amount)
  # card_is_valid? is defined elsewhere
  unless card_is_valid?(card_number)
    raise InvalidCardNumberError.new("Invalid credit card number #{card_number}")
  end
  # ... process the transaction ...
end
```

This gives us the same functionality as `StandardError`, but with a different name. You can rescue it by name with `rescue InvalidCardNumberError`. Oftentimes that's all you need.

## Key Takeaway
We create custom exception classes when we need a more detailed exception name or behavior. We use these custom exception classes in the same way we use built-in Ruby exceptions.

## Additional Resources
- [Getting Started with Ruby Exceptions](https://launchschool.com/blog/getting-started-with-ruby-exceptions)
