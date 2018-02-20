# Debugging

## Learning Goals
- Understand how to use `pry` for debugging in Ruby code
- Better understand the scope of variables and instances in an application when testing

### Reading Errors via Stack Traces

When an exception is raised, it immediately stops the current method, just like `return`. It will then bubble its way up through the program, method by method. If it makes it all the way to the top, Ruby will print out a summary of the exception and a description of what the program was doing when the exception happened, also known as a **stack trace**.

A stack trace contains a ton of useful information, including a list of methods and blocks that Ruby was inside when the exception was raised. Being able to quickly read a complex stack trace is a super useful skill, so let's examine one now.

First, take a look at the following stack trace that came from running some of the tests within the grocery store project.

![test stack trace](images/test-stack-trace.png)

**Activity**: Now, with your pair, spend a few minutes looking at this error in detail. We know you don't have access to the code, but try anyway to answer the following questions:
1. What file has the code that was _originally called_ to create the error?
2. What file has the code where the _error is located_? (Is this different than your answer to the question above?)
3. Without seeing the code but using the error details, what do you think the code in question could look like?

**Review**: While you don't have the code, an error message with a stack trace gives you a lot more information than you might be expecting!

First, let's look at each piece of the provided error.

![test stack trace errors](images/test-stack-trace-markup-p1.png)

Next, we'll take a look at all of the details of the stack trace itself.

![test stack trace details](images/test-stack-trace-markup-p2.png)

With this information, now we can more confidently answer our questions above:
1. `online_order_spec.rb` - line 65 specifically
2.  `order.rb` - line 20 specifically within the `add_product` method
3. Trying to use the `[]` Array syntax to access an element on a variable that does not have an Array value

The questions that we've asked you to answer about this error message are not arbitrary. Whenever you get an error, you should be overjoyed! It provides you with this extremely useful information and should never be ignored.

### Using `pry`

You've already been introduced to pry in our discussion about gems, but now we're going to ensure you see how to use it in all of your projects all the time!

In that introduction, we briefly mentioned that `pry` has a tool you can use: `binding.pry`. Go back now and [re-read those notes](../../01-ruby-fundamentals/intro-to-ruby-gems.md#pry) if you don't remember what it was all about!

### Exercise

Setup: Clone [this repository]() to get started.

The code you've been given contains two primary interesting things: (1) tests and (2) many errors.


## Key Takeaway
Debugging your code is a critical skill to establish in your programming career. Using error messages and `pry` in your test-driven development process will help you pinpoint the cause of errors more efficiently.

## Additional Resources
- [Debugging with Pry](https://learn.co/lessons/debugging-with-pry)
