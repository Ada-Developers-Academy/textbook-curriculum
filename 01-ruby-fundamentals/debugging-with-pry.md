# Debugging

## Learning Goals
- Read and analyze a stack trace
- Understand how to use `pry` for debugging in Ruby code
- Better understand the scope of variables and instances in an application when testing

Debugging your code is a skill that you will use throughout your career. Over time you will get better at figuring out what the issues are with your code and addressing them more efficiently. The skills addressed in this lecture are intended to be a starting for your practice of debugging and we imagine you'll continue bulding these over the years.

### Reading Errors via Stack Traces

When an exception is raised, it immediately stops the current method, just like `return`. It will then bubble its way up through the program, method by method. If it makes it all the way to the top, Ruby will print out a summary of the exception and a description of what the program was doing when the exception happened, also known as a **stack trace**.

A stack trace contains a ton of useful information, including a list of methods and blocks that Ruby was inside when the exception was raised. Being able to quickly read a complex stack trace is a super useful skill, so let's examine one now.

First, take a look at the following stack trace that running this new test on the code from the clock example in the [Testing With Minitest](../02-intermediate-ruby/testing-with-minitest.md) lesson.

![A stack trace; it shows a test failure and several lines of output.](images/test-stack-trace.png)


**Activity**: Now, with your neighbors, spend a few minutes looking at this error in detail. Try anyway to answer the following questions:
1. What file has the code that was _originally called_ to create the error?
2. What file has the code where the _error is located_? (Is this different than your answer to the question above?)
3. Without seeing the code but using the error details, what do you think the code in question could look like?

**Review**: While you don't have the code, an error message with a stack trace gives you a lot more information than you might be expecting!

First, let's look at each piece of the provided error.

![The earlier stack trace; marked up to highlight the test description, exception type, exception message and which portion is the stack trace.](images/test-stack-trace-markup-exception.png)

Next, we'll take a look at all of the details of the stack trace itself.

![The earlier stack trace; marked up to highlight the file paths and the line numbers](images/test-stack-trace-markup-trace.png)

With this information, now we can more confidently answer our questions above:
1. `clock_test.rb` - line 15 specifically
2.  `clock.rb` - line 9 specifically within the `each` method
3. The code is checking that there are only 59 seconds in a minute.

The questions that we've asked you to answer about this error message are not arbitrary. Whenever you get an error, you should be overjoyed! It provides you with this extremely useful information and should never be ignored.

<details>
<summary>Here are the <code>clock.rb</code> and <code>clock_test.rb</code> that we used above.  Did they look like what you expected?</summary>
<br>

```ruby
# clock_test.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'clock'

Minitest::Reporters.use!

describe "clock" do
  # other tests omitted.

  it "handles the leap second" do
    # https://en.wikipedia.org/wiki/Leap_second

    expect(clock(23, 59, 60)).must_equal "23:59:60"
  end
end
```

```ruby
# clock.rb

def clock(hours, minutes, seconds)
  time_fields = [hours, minutes, seconds]
  max_values = [23, 59, 59]

  time_fields.each_with_index do |field, index|
    if field > max_values[index]
      raise ArgumentError.new("#{field} is too large")
    end
  end

  time_fields.map! do |field|
    if field < 10
      "0#{field}"
    else
      "#{field}"
    end
  end

  return "#{time_fields[0]}:#{time_fields[1]}:#{time_fields[2]}"
end
```

</details>

### Using `pry`

You've already been introduced to pry in our discussion about gems, but now we're going to ensure you see how to use it in all of your projects all the time! 

`pry` has a tool you can use: `binding.pry`

With code that we've already written in a file, we can use a Pry command to pause our code and more closely inspect. We can use Pry instead of using a bunch of `puts` commands in a program.

### How to get started

1. You may already have these gems installed, but just to be safe run `gem install pry pry-byebug`.
1. Require the gem at the top of the file you'd like to debug: `require 'pry'`.
1. In your code, write `binding.pry` anywhere you want to pause the code that's being run. Doing so will allow you to evaluate what code is doing up to that point, like checking what what a variable equals while being changed in a loop.

### Test it out

Because programs are read from top to bottom, any code that is after a `binding.pry` command will not be read. Run the code in the exercise below, as you would normally. To exit, type 'exit-program'.

```ruby
require 'pry'

def useful_method
  first_variable = "Something useful"
  puts first_variable

  binding.pry

  another_variable = "Where am I!?"
  puts another_variable
  first_variable = "Time for change"
end

# call them method!
useful_method
```
Your terminal should open in interactive environment that looks something like this:
![Pry running in the terminal; the code is on line 9 and there are commands showing the values of a couple of variables before exiting.](./images/pry.png)


### Debug Code
The following code is not coming out as expected. I am expecting the method to return 55 when I pass 50, but am getting 5. Oh bugger! Let's use pry to dig into what is causing the problem!

``` Ruby
def add_5_years(age)
  5.times do
    age + 1
  end
  return age
end

puts add_5_years(50)
```

<details>
<summary>What do we need to change to use Pry in this file.</summary>

``` Ruby
require 'pry'

def add_5_years(age)
  5.times do
    age + 1
  end

  binding.pry
  return age
end

binding.pry
puts add_5_years(50)
```

</details>

### Stepping through your program

You can move through your program using the following commands.

- `next`, run the next line of your program, jumping over any methods.
- `step`, run the next line of your program, descending into any methods.
- `finish`, run until this method returns.
- `continue`, run until the next `binding.pry` or the end of the program.

### What else can Pry do!?
I'm so glad you asked!

Pry also has the following handy commands that let you see what objects are currently available in your program to focus on and interact directly with.

- `ls`,  shows you the local variables defined in the current context, and any public methods or instance variables defined on the current object.
- `cd`, command is used to move into a new object (or scope) inside a Pry session. When inside the new scope it becomes the self for the session and all commands and methods will operate on this new self.

### Try it out!
Open your current project and inspect functionality of your code using PRY! Practice using the ls and cd commands.

## Key Takeaway
Debugging your code is a critical skill to establish in your programming career. Using error messages and `pry` in your test-driven development process will help you pinpoint the cause of errors more efficiently.

## Additional Resources
- [Debugging with Pry](https://learn.co/lessons/debugging-with-pry)
* [Pry Byebug](https://github.com/deivid-rodriguez/pry-byebug)
- Dig into [Pry's documentation](http://pryrepl.org/) (with screencasts) to learn even more
- Here's a handy list of more [Pry commands](https://github.com/pry/pry/wiki/State-navigation#Ls)!
