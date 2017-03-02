# Exception Handling In Rails

## Learning Goals
At the end of this you should be able to:

-  Explain how exception handling works.
-  Explain where you would want to use exception handling
-  Create rescue blocks to "catch" exceptions.

## Errors Errors Errors... How to Handle Them

With any program there are things that can go wrong, a file you are planning to read doesn't exist or is unreadable, the database is unavailable, somehow you try to divide something by zero.  Since there are always things that can go wrong it becomes desirable to have a way to recover without crashing your program or website in front of the user.

Ruby, like many programming languages chooses to handle errors with a technique called *Exception Handling*.  When an error occurs, Ruby generates an object instance called an Exception.  Exceptions are always subclasses of the [Exception](https://ruby-doc.org/core-2.3.1/Exception.html) class.

[![exceptions](images/exceptions.png)](http://findnerd.com/list/view/Exception-Handling-in-Rails-using-begin-rescue/21677/)

You can mark a section to recover from an error with a rescue block.  If an Exception is not "rescued" it will end the program with an error message.  

Here is an example of an error being handled:

```ruby
# sample_exception.rb
begin
  # Dividing by zero causes an error
  quotient = 5 / 0
  puts "Made it past the error"
rescue
  quotient = nil
  puts "Rescued the error and set quotient to nil"
end
```

The output would be:
```bash
$  ruby sample_exception.rb
Rescued the error and set quotient to nil
```

Without the rescue:

```ruby
# sample_exception.rb
begin
  # Dividing by zero causes an error
  quotient = 5 / 0
  puts "Made it past the error"
end
```
The output would be:
```bash
$  ruby sample_exception.rb
basic_exception_without_rescue.rb:4:in `/': divided by 0 (ZeroDivisionError)
	from basic_exception_without_rescue.rb:4:in `<main>'
```

### Rescuing Specific Types of Exceptions

There are a number of kinds of exceptions both for [regular'ol Ruby](https://ruby-doc.org/core-2.3.1/Exception.html) & [Rails](http://stackoverflow.com/a/19348733/918993).  Some types of errors we probably don't want to try to rescue because they are irrecoverable or so unexpected that we shouldn't write code to recover from them.  We can however set up specific blocks to recover from specific types of errors that we can and want to recover from.  Generally recoverable errors inherit from `StandardError` and for this reason when you place a rescue block without specifying the exception class Ruby will only handle exceptions inheriting from StandardError.  

The syntax will look like this:

```ruby
begin
  # some code that will create an exception.

rescue <some kind of exception>
  # Code to recover from that exception

rescue <some other kind of exception>
  # Code to recover from another type of exception

rescue
  # other exceptions handled here

ensure
  #  This code runs no matter what.  

end
```

#### One Ruby Example - CSVReader

In Ruby we could write code to handle problems, like in our CSV code to deal with problems, like being unable to open the CSV file.

```ruby
content = []
begin
  CSV.foreach("file.csv") do |row|

    content << row
  end

  rescue SystemCallError
    puts "I couldn't open the file."

end
```

#### Exceptions Continue Up The Stack

When an exception occurs, if it is not rescued in the immediate block or method it proceeds up and out of the method until the application crashes with an error message.

```ruby
def quotient_and_remainer dividend, divisor
  answer = [dividend / divisor]
  answer << quotient % divisor
  answer
end

begin
  puts quotient_and_remainer 10, 0
rescue ZeroDivisionError
  puts "Attempted to divide by zero"
end
```
The method `divide` here will generate an exception when it tries to divide 10 by zero.  The exception is not "caught" in the method so ruby leaves the method and falls back to the caller of the method, which does have a rescue block to catch the `ZeroDivisionError`.  

If the rescue block was missing the resulting error message would be:

```bash
method_exception_example.rb:3:in `/': divided by 0 (ZeroDivisionError)
	from method_exception_example.rb:3:in `divide'
	from method_exception_example.rb:10:in `<main>'
```

This is the result of the call stack.  The Error first occurs at line 3 in the 'divide' method (see above).  When the block is not "rescued," Ruby leaves the divide method and falls back to the caller of the method, and so on until it reaches the "main" program and exits.  Each line of the result, called a "backtrace," shows the path of execution in reverse order.  

So in the following example:

```ruby
def quotient_and_remainer dividend, divisor
  answer = [dividend / divisor]
  answer << dividend % divisor
  answer
end

def mystery(num)
  answer = []

  (0...9).each do |i|
    answer << quotient_and_remainer(num, i)
  end
  answer
end

begin
  puts "The Remainders are #{mystery(100)}"
end
```

1.  Ruby Starts by calling the `mystery` method which starts a loop with values from 0 to 9 (inclusive).  
2.  It then calls the `quotient_and__remainer` method with 100 & 0 as arguments.  
3.  Inside the `quotient_and_remainder` method it has a `ZeroDivisionError` error.
4.  Since the error is not rescued in `quotient_and_remainer` Ruby falls back to mystery.
5.  Since the error is not rescued in `mystery` Ruby falls back to the main program and exits with an error.

You can see the results in the error message:

```bash
multimethod.rb:2:in `/': divided by 0 (ZeroDivisionError)
	from multimethod.rb:2:in `quotient_and_remainer'
	from multimethod.rb:11:in `block in mystery'
	from multimethod.rb:10:in `each'
	from multimethod.rb:10:in `mystery'
	from multimethod.rb:17:in `<main>'
```

As you can see the error messages display in order as Ruby falls back from where it encountered the error, moving, "through the stack," unwinding the method calls that lead to the error.  



#### Exception Handling in Rails

In Rails we have a number of methods in ActiveRecord which can generate exceptions a few of which include:
-  save!
-  create!
-  update!

These methods trigger exceptions when validations fail or the database is unavailable.  So you could handle problems with creating a new task in TaskListRails using exceptions as follows.  

```ruby
  def create
    @task = Task.new(task_params)

    begin
      @task.save!
    rescue ActiveRecord::RecordInvalid
      flash[:notice] = "Cannot Save the Task."
    ensure
      redirect_to tasks_new_path
    end
  end
```

However while this can be done it isn't good practice.  It's considered best practice to [**not use exceptions for expected outcomes**](https://robots.thoughtbot.com/save-bang-your-head-active-record-will-drive-you-mad).  Since we expect users to give us invalid input on a regular basis, the above example does not qualify.  This leaves us with the question:  

### Why Would We Use Rescue?

There are a lot of [differing opinions](https://www.sitepoint.com/ruby-error-handling-beyond-basics/) on when and why you should implement exception handling in your code.  The consensus seems to be that exception handling should be for *exceptional* circumstances.  In other words you use Exception Handling (rescue) for abnormal events, and regular if statements for normal occurrences like validation errors.

##### So you would use If Statements for:
- Invalid user input (validation errors on Active Records Etc).  
- Users trying to access resources they do not have permission for.

##### You would use Exception Handling for:
-  Database failures
-  API service Failures
	- For example when Github is unavailable in a service it provides.  

So you could rewrite the Task Controller's create method as:
```ruby
 def create
    @task = Task.new(task_params)

    begin
      if ! @task.save
        msg = ""
        @task.errors.each do |field, message|
          msg += "#{field.to_s.capitalize}: #{message}"
        end
        flash[:notice] = msg
      end
    rescue
      flash[:notice] = "The task was unable to be saved."
      Rails.logger.error "The task #{@task} was unable to be saved with an error."
    end

    redirect_to tasks_new_path
    end
  end
```

This has a couple of advantages, if the save fails due to a validation error, then the user is notified and the program continues as normal.  If there is an exceptional circumstance, something wrong with the database or a similar error then an exception occurs and the user is notified, but you also can log the error to the Rails log.  

So why do save!, create! and update! exist?  Well because not everyone agrees and Ruby developers do try to make everyone happy.  


When you enter your internship you will begin to engage in something called *defensive programming*.  In [defensive programming](https://en.wikipedia.org/wiki/Defensive_programming) you write code to gracefully handle under unforeseen circumstances.  The idea is that you write code to try to catch all unforeseen circumstances.  When you have longer to work on production code, you will be expected to do more to handle and catch unforeseen errors.  As we are entering new material quickly, that's not something we can expect in student projects.  

However knowing how exception handling works will give you the tools you need to understand how you can trap errors and handle them as gracefully as possible.


## Resources
- [RubyLearning on Exceptions](http://rubylearning.com/satishtalim/ruby_exceptions.html)
- [Ruby Error Handling Beyond the Basics](https://www.sitepoint.com/ruby-error-handling-beyond-basics/)
- [Railscast Exception Handling, old but still valid](http://railscasts.com/episodes/53-handling-exceptions?autoplay=true)
