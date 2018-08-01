# Constants

## Introduction

We have learned about local variables so far. One other kind of variable in Ruby is a constant.

## Constants

Constants represent a variable that holds a value that is expected to **not** be re-assigned.

With a local variable, we can assign and re-assign values as much as we would like:

```ruby
current_age = 41
current_age = 42
```

What if we need a variable where it is _important_ that the variable is never reassigned?

Ruby gives us a way to communicate this in code with constants.

```ruby
BIRTH_DATE_DAY = "1"
BIRTH_DATE_MONTH = "August"
BIRTH_DATE_YEAR = "1980"
```

When we declare and assign a value to a constant, we know as programmers that we can't reassign it.

Here are some following rules of constants:
- Constants are all uppercase with using underscores to separate words
- Constants are available within the scope of their initialization
- Constants will raise an error if they are read before they're created
- Constants can not be defined inside of methods
- Constants are like any other variables, except that their value must remain constant for the duration of the program
- In Ruby, constants will raise a warning if re-assigned

```ruby
RENTAL_PERIOD = 14

def checkout_book
  puts "Your book is due in #{RENTAL_PERIOD} days."
end

checkout_book
```

This code outputs the following:
```
Your book is due in 14 days.
```

Here we observe that `checkout_book` has access to the constant `RENTAL_PERIOD`. This variable cannot be reassigned. Trying to reassign `RENTAL_PERIOD` to 15 later in the code produces the following error:

```
dynamic constant assignment
    RENTAL_PERIOD = 15
```

**Exercise:** in irb, with the code above and your own code, experiment with the following questions:

- If you define a new method, can it access the constant?
- If you close and re-open irb, does it still have access to old constants?

## Summary

In summary, we can use constants to define variables that should not be reassigned.

Understanding how to use variables must also be tied with our understanding of scope.

We'll be learning about other types of variables in the coming days and weeks.
