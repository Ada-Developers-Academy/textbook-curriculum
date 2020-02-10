# Intro to Exceptions: Raising Exceptions

## Learning Goals
By the end of this lesson you should be able to:
-   Define what an exception is
-   Raise your own exceptions
-   Explain why exceptions are used

## What is an Exception?

We always want Ruby programs to reach the final line of code successfully, with no errors raised.

But when a program runs, things can go wrong. Your program could try several of these very reasonable things, only to find out unexepected circumstances:

  - Your Ruby program could try to open a file that doesn't exist
  - Or connect to a resource online when the network is down
  - Or try to divide a number by zero, which is an operation that has no mathematical answer

**Exceptions** are a special kind of data type (special kind of _class_ or _object_). They can appear at different times. When they appear, they usually **stop** the execution of a program in order to indicate that the program can no longer keep running.

When an exception shows up, we typically say that an exception **was raised.**

**Ruby uses _exceptions_ to indicate that something has gone wrong.** Exceptions are the most urgent way to signal that there is a programming error-- it is **bad** news if your program stops running all together!

When we deal with exceptions, we should always consider:

1. What line of the program had an error, and raised an exception?
2. What kind of error was raised, and why?

We should find these answers from these two ways:

1. Reading the stack trace (where the error output is)
2. Reading the stack trace, the kind of exception, and reading any (default) details about that exception (consider the exception's name)

Only after understanding those two things, can we debug the program.

## Exceptions in Ruby

### Reading A `NameError` Example

You've seen exceptions before.  If you run the following in `irb`, Ruby will _raise_ a `NameError` exception.

```bash

irb(main):001:0> puts some_variable_without_a_value
Traceback (most recent call last):
        4: from /Users/<user>/.rbenv/versions/2.6.5/bin/irb:23:in `<main>'
        3: from /Users/<user>/.rbenv/versions/2.6.5/bin/irb:23:in `load'
        2: from /Users/<user>/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (undefined local variable or method `some_variable_without_a_value' for main:Object)
```

In this case, `NameError` is an exception that indicates what went wrong.  You may have also seen other errors in your projects, that will either have the word `Error` or `Exception` in it.

The `NameError`'s default context describes that a `NameError` is raised when the program tried to find a variable or method with a certain name, but couldn't find anything with that exact name.

### More Ruby Exceptions

There is an entire family of Exceptions in Ruby each indicating a different type of problem. **For now we will work with predefined Exceptions.**

Some examples of Ruby Exceptions is:
- `NameError`
- `NoMethodError`
- `ArgumentError`
- `RuntimeError`

### Exercise: Reading the Stack Trace

When an exception is generated, Ruby immediately leaves the current method and falls back to that method's caller and then that method's caller until the Exception is handled or it reaches the main program.

You may not appreciate it when your program crashes but as the exception unwinds through the calling methods it provides a _stack trace_ which is a list of the methods and line numbers encountered as the exception.

#### Practice with `NameError` Above

Consider this `NameError` in the example above:

1. What line of the program had an error, and raised an exception?
2. What kind of error was raised, and why?

<details>
  <summary>Curious for answers? Click here!</summary>

1. The program (`irb`) had an error on "line 1," indicated by the stack trace
2. It was a `NameError`, describing that it tried to find a variable or method with a certain name, but couldn't find anything with that exact name.

</details>

#### Practice with `place_order`
Try reading this Ruby script, and then reading the stack trace that gets produced when this script runs.

```ruby
# Imagine this code lives in a file named example.rb
def divide_check(order_items, number_of_people)
  total = order_items.sum.to_f

  return total / number_of_people
end


def place_order
  order = [13.5, 14.0, 15.0, 3]
  people = 3

  puts "Your order will cost #{divide_check(people, order)} per person"
end


place_order
```

Provides the following stack trace:

```bash
Traceback (most recent call last):
	2: from example.rb:16:in `<main>'
	1: from example.rb:12:in `place_order'
example.rb:2:in `divide_check': undefined method `sum' for 3:Integer (NoMethodError)
```

The Stack Trace above provides clues to where the problem was encountered allowing you to trace through the program and fix the bug.

Answer with a neighbor:

1. What is the bug above?
1. Where does the bug happen?

Notice that the Stack Trace indicates the line numbers and methods in which the Exception fell back through.

![Stack Trace Diagram](images/stack-trace.png)

## Raising Your First Exception

One common type of Exception is `ArgumentError`. This exception is used to alert the user that the provided argument to a method is invalid for some reason. For example, it doesn't make sense to call `divide_check` with a `number_of_people` that is less that one. If that does happen, it probably means the programmer who wrote the code that calls that method made a mistake.

We, Ruby developers, can raise an `ArgumentError` within our own script to help whoever runs the script understand what they did wrong.

```ruby
def divide_check(order_items, number_of_people)
  unless number_of_people.respond_to?(:greater) && number_of_people > 0 
      raise ArgumentError, 'You must provide a postive numeric argument to this method.'
  end

  total = order_items.sum

  return total / number_of_people
end
```

Now the stack trace looks like this:

```bash
Traceback (most recent call last):
	2: from example.rb:20:in `<main>'
	1: from example.rb:16:in `place_order'
example.rb:3:in `divide_check`: You must provide a postive numeric argument to this method. (ArgumentError)
```

This stack trace is more specific about the problem and prevents the application from going further with invalid arguments.

## An Example to Raising `ArgumentError`

By checking the parameters of a method for valid values & types we prevent unexpected output.  We could add to our method by adding a check to make sure that `order_items` has a sum method.

```ruby
unless order_items.method_defined? :sum && number_of_people > 0
  raise ArgumentError, 'You must provide a collection and a positive numeric argument to this method.'
end
```

This prevents our beautiful methods from being called with an invalid number of people when trying to divide the check.

### Why Raise Errors Ourselves?

Software development is normally a team sport.  In your career you will often write methods which will be used by other developers over the course of years.  In addition you may use a method you wrote **years** after you originally wrote it.  In such circumstances it can be easy to accidentally call a method with an invalid context.  By providing checks to ensure proper context, your methods are defensive, preventing misuse.  This can prevent more subtle and harder to debug applications.  In turn this can make your methods easier to use.

We may discover more and more patterns to use `raise`. Right now, know that it's an option that will help us out in the future.

## What to Look Forward To

Later in the curriculum we will learn:
  - How to write Ruby code that indicates what to do in case there's an exception (and not stop the program entirely)
  - How to create our own types of custom exceptions, to give us better detail and context for different problems


## Warnings are Not Exceptions

Now that we have more to read in our Terminal, it's good to note that Warnings are not Exceptions or Errors. If you see a "Warning" in your Terminal but your code still runs, it's not the same as an Error or Exception halting your code.

## Summary

In this lesson we have seen that an exception is a indication of a problem in your application.  When an exception occurs the method or block is immediately exited and ruby continues to retrace through the the call stack until the program ends and produces a _stack trace_ which lists the methods and line numbers which can help the programmer debug the application. We have also seen how we can raise our own `ArgumentError` Exceptions and how it can help prevent our methods from being called with invalid arguments.

## More Resources
-   [RubyLearning.com on Exceptions](http://rubylearning.com/satishtalim/ruby_exceptions.html)
-   [A Beginner's Guide to Exceptions in Ruby](http://blog.honeybadger.io/a-beginner-s-guide-to-exceptions-in-ruby/)
