# Introduction to Automated Testing
## Learning Goals
- Learn about _Test Driven Development_ (TDD)
- Discover techniques to verify our code performs as expected using _automated tests_
- Write code that can test code using _assertions_
- Have a basic grasp on what _Rake_ & _Rakefiles_ are.

## TDD
**Test-Driven Development** is a programming technique that requires you to write solution code and automated test code simultaneously. The goal is to use _automated tests_ as a exploration of your code. __Tests are transient.__ As you work on a project, your understanding of the problems at hand will change. As they do, your tests will change.

### Starter Files

As we work we will use the files located in this [repository.](https://github.com/AdaGold/die).  Fork & Clone the repository and follow along as you go.  

### How to TDD
(1) Write a test that describes a feature of the software. Run the test, and watch it fail. Watching it fail is crucial! (2) Write code that makes all the tests pass. (3) Look for opportunities to clarify your code.

1. Write a test
1. Watch it fail
1. Make it pass
1. Clarify
1. Repeat

You'll often hear this cycle shorthanded as __Red, Green, Refactor__. Write a test and it is __red__ (many testing tools show failing tests in red text). Writing or updating code to make the test pass makes it __green__ (passing tests are usually shown in green text). Before moving on, take a moment to look for emerging patterns, needless duplication, and other opportunities to polish and clarify. This is __refactoring__, updating not to extend functionality, but to increase the clarity and consistency of our code.

![Red Green Refactor](images/tdd_flow.gif)

## The Anatomy of a Test
An _automated test_ is a piece of code in a project that can be run independently to verify the functionality of other code within the project. It exists to verify and clarify the role and use of code in the project. Here's an example of a software test:

```ruby
def exponate(base, power)
  base ** power
end

puts exponate(2,2) == 4
puts exponate(3,2) == 9
puts exponate(2,10) == 1024
```

The `puts` statements are _testing_ that the `exponate` method is doing what we expect. We can create _automated tests_ from this example by extracting the _tests_ into their own file:

```ruby
# exponate.rb
def exponate(base, power)
  base ** power
end
```

```ruby
# exponate_test.rb
require_relative './exponate'

puts exponate(2,2) == 4
puts exponate(3,2) == 9
puts exponate(2,10) == 1024
```

Now we can run our _test file_ with `$ ruby exponate_test.rb`. We should see output like:

```bash
/Ada/class-exercises $ ruby exponate_test.rb
true
true
true
```
__Question: Why bother?__
In the above example, the code in `exponate_test.rb` are _automated tests_. We can run that file whenever we want to ensure that `exponate` is still performing reasonably. When our requirements change, we can feel secure in changing our code because we have some _tests_ to let us know if we've broken something.


## Now Comes Minitest

Writing your own tests with puts is wonderful, but it would be handy to have a standard way that developers can use to write tests on their code, a way that other developers understand.  The maintainers of the Ruby language have adopted a testing library called [Minitest](http://docs.seattlerb.org/minitest/) as the default standard for testing in Ruby & later Rails.  For the remainder of your time using Ruby at Ada, we will be using Minitest to write unit-tests for your code.  [RSpec](http://rspec.info/) is another very common testing framework used along with Ruby and Rails. We won't be using it here at Ada but it's good to know about when you're browsing the internet for testing help.

### Before We Get Started 

Because colored output is so much nicer we'll add a gem called minitest-reporters.

Run this command in your terminal.

```bash
$  gem install minitest-reporters
```


### How To Use Minitest?

Lets say we need to write a class which simulates a 6-sided die.  We could use such a module in any number of board games (Monopoly etc).  

To start with we'll create a file to test the class.  We'll call it `die_test.rb`.  We will also require `minitest/autorun`

```ruby
# die_test.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'die'
```

Then we can create an empty file `die.rb` which will hold our class.  

```ruby
# die.rb
```


We can run the tests by typing:  `ruby die_test.rb` and get the following:

```bash
$ ruby die_test.rb
Run options: --seed 35264

# Running:



Finished in 0.000751s, 0.0000 runs/s, 0.0000 assertions/s.

0 runs, 0 assertions, 0 failures, 0 errors, 0 skips
```

We are now setup, but we haven't actually written a test yet.


### A Tale of Two Styles

In the TDD World there are two styles of testing.  In the first more traditional method people use *assertions* which are statements that check if a value is what it should be.  The other method is a subset of TDD, called Behavior-Driven Development (BDD) which accomplishes the same thing in a more English-friendly fashion that even non-developers can understand. 


#### Writing Your First Test - Assertion Style

To start we'll need to create a TestCase class.  We create a set of unit tests by subclassing `MiniTest::Unit::TestCase` and add each set of tests in instance methods.  


#### Step 1:  Create a TestDie Class

First we'll create a class that extends `Minitest::Unit::TestCase`, basically make a class that contains a series of TestCases.

```ruby
class TestDie < MiniTest::Unit::TestCase

end
```

The `< MiniTest::Unit::TestCase` indicates that this class gets all the methods & instance variables of the TestCase class in Minitest.  

#### Step 2:  Create a `test_creation_of_die` method.

Now we'll create a method called `test_creation_of_die`, this is a test-case.  All test-cases in assert-style Minitest must start with "test_".  


```ruby
# die_test.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'die'

class TestDie < MiniTest::Unit::TestCase
  def test_creation_of_die

  end
end
```

#### Step 3:  Add an assertion


So we have a test-case, but it's not actually checking anything yet.  So we can add an _assertion_ which is a method that **asserts** that a specific condition must be true.  In this case we need to **assert** that if we create a die, it's an instance of the Die class.

So we create a 


```ruby
# die_test.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'die'

class TestDie < MiniTest::Unit::TestCase
  def test_creation_of_die
    @die = Die.new
    # The class of @die should be Die
    assert @die.class == Die, "There must be a Die class."
  end
end
```

Notice the line `assert @die.class, Die`.  The `assert` method takes two required arguments and an optional message.  If the two required arguments are equal, the test passes, otherwise it fails.  

When we run this with `ruby die_test.rb` we get:

```bash
ruby die_test.rb
MiniTest::Unit::TestCase is now Minitest::Test. From die_test.rb:6:in `<main>'
Run options: --seed 29986

# Running:

E

Finished in 0.001219s, 820.3446 runs/s, 0.0000 assertions/s.

  1) Error:
TestDie#test_creation_of_die:
NameError: uninitialized constant TestDie::Die
Did you mean?  Dir
    die_test.rb:8:in `test_creation_of_die'

1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
```

**This is a good thing.**  We have our first **red** test.  There's an error because we haven't created the Die class yet.

####  Step 4:  Build a Die class

Lets do so:

```ruby
# die.rb

class Die

end
```

Now `ruby die_test.rb` gets us:

```bash
MiniTest::Unit::TestCase is now Minitest::Test. From die_test.rb:6:in `<main>'
Run options: --seed 61965

# Running:

.

Finished in 0.001211s, 825.7638 runs/s, 825.7638 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

Now we have our first **green/passing** test.  

There are a [number of assertions](https://gist.github.com/rastasheep/4248006#Minitest::Unit::TestCase) in Minitest beyond the assert method.  


#### A Word on Parentheses

Check out the code above.  We are calling assert without using parentheses here:  `assert @die.class == Die, "There must be a Die class."`  Ruby doesn't FORCE you to put parentheses around a method's arguments but [the community-driven style guidelines](https://github.com/bbatsov/ruby-style-guide) suggest that it's good coding style to put parentheses around method arguments **except** for methods part of an internal Domain Specific Language (DSL), or basically the syntax of some kind of framework like... Minitest.  

So you shouldn't put parentheses around the arguments to `assert` or later `must` method arguments, but you **should** around your own methods.  

#### Practice Exercise

Now we need to test that we can roll the die.  Write a test that checks the roll method of the Die class.  When a die is rolled it should return a number between 1 and 6 inclusive.  You can use the `assert_operator` method.  

#### Check & Verify

Check with your neighbor.  You can find a solution [here.](https://github.com/AdaGold/die/blob/solution/tests/die_test.rb)

### Spec Style Testing

Spec style tests look very different, but read in a more English friendly fashion.  We'll create the test with a file named `die_spec.rb`.

```ruby
# die_spec.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'die'
```

Up until now this all looks the same, now things change.  Instead of creating a class we'll write a `describe` block which identifies a group of tests that belong together, usually because they are testing the same thing.  Inside the `describe` block are `it` blocks.  Each `it` block is a test.   

Why?  Well to make things more readable we `describe` what we're testing, a class, or a feature etc.  You can even put `describe` blocks inside `describe` blocks to further organize our testing.  Then we can break each test-case into `it` blocks.  Minitest runs each `it` block in a random order and resets things between them to prevent one test result from interfering with another.   

```ruby
# die_spec.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'die'

describe "Testing Die Class" do
  it "You can create an instance of Die" do
    die = Die.new

    die.class.must_equal Die
  end
end

```

Observe how this reads more easily from left to right than our original assert test.  The idea with **BDD** is the that with our tests we are defining specifications or behaviors our code should follow.  

Similar to Assertions Minitest adds a bunch of methods to all objects called *matchers*.  There are a large number of matchers, but you can usually get by with `must_equal`, `must_include`, `must_match` and `must_raise`.  You can see a full list of Minitest matchers at the bottom of this lesson along with examples.  

### Exercise Writing Another Test

So just like writing the assertion, now write another test for the roll method.  You should create an `it` block and use the `must_be` matcher.  

### Check & Verify

Check again with your partner when you are finished.  You can find a solution [here](https://github.com/AdaGold/die/blob/solution/specs/die_spec.rb)


## Which Style Should I Use?

So which style is better?  Functionally both do the same job, but the spec-style is more readable by non-technical people.  So we will, from this point on, use **Spec-style tests.**  However it is important for you to know that both exist and when you get to rails, a great deal more documentation exists for assert-style tests compared to spec-style.   

## What Should I Test?

More important than how you test your code is what you are testing.  If you're not testing the right things bugs can creep through your tests and into production code.  Many many many developers have trouble knowing what to test.   Here are some general guidelines. 

*  Look at your code for branches (if statements and loops) and make sure that each branch of execution is tested.
*  Test your methods with edge case values.
	*  For example if your method takes an integer as a parameter you would test it with a positive number, a negative number and zero.
	*  If your method took an array as a parameter you would test it with an empty array, a one element array and a large array.  
*  Think about how someone might misuse your method, check for invalid or weird input.  If someone can break your code... they will.

## Organizing Code

As our projects get larger putting all our code in the same folder gets messy, especially with test files.  So we will be setting up projects like this:

![Project Structure](images/project_folder.png "project structure")

We will be placing our code in the **lib** folder, and our test specs in the **specs** folder.

### Wait What Is This Rakefile Thingy?

[Rake](https://github.com/ruby/rake) is a utility Ruby developers use which lets you set up tasks, like testing and running your programs.  Rake reads the Rakefile and follows the Ruby code in the Rakefile to execute listed tasks.  

All we are going to use Rake for now is testing, but later Rake will do all sorts of neat stuff for us.

To install rake please enter:

```bash
gem install rake
```

#### Setting Up

1.  Move your non-testing source code into a folder called `lib`.
1.  Move your testing specs into a folder called `specs`.
1.  Change the require_relative line in the spec to point to the lib folder.
1.  Create the following `Rakefile` in the project root directory

```ruby
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["lib"]
  t.warning = true
  t.test_files = FileList['specs/*_spec.rb']
end

task default: :test
```

You can now test your code with `$ rake`

```bash
$  rake
Run options: --seed 2866

# Running:

...

Finished in 0.001215s, 2469.1358 runs/s, 3292.1811 assertions/s.

3 runs, 4 assertions, 0 failures, 0 errors, 0 skips
```




## List of Minitest Matchers

|   Matcher	|   Example	|   What it does	|   	Negation |
|---	|---	|---	|---	|
|   `must_equal`	|   `obj1.must_equal obj2`	|   The test succeeds if the object equals the given object.  It fails otherwise.	|   	`wont_equal` |
|   `must_be`	|   `num.must_be :>, 5`	|   It lets you compare the given object to another using a given operator.  In this example num must be greater than 5.	|  `wont_be`  |
|   `must_be_empty`	|   `list.must_be_empty`	|   The test passes if the given collection is empty.	|  `wont_be_empty` |
|   `must_be_instance_of`	|   `@die.must_be_instance_of Die`	|   The test passes if the object is an instance of the given class.	|  `wont_be_instance_of`  |
|   `must_be_kind_of`	|   `list.must_be_kind_of Enumerable`	|   The test fails if the object is not a kind of the argument.	| `wont_be_kind_of`  |
|   `must_be_nil`	|   `list.must_be_nil`	|   The test fails if the given object is not nil.	|  `wont_be_nil`   |
|   `must_be_same_as`	|   `list.must_be_same_as another_list`	|   The test fails if the object is not the same as the given argument.	|    `wont_be_same_as`  |
|   `must_be_silent`	|   `proc { obj1.do_something }.must_be_silent`	|   The test fails if the given block outputs something to the terminal (like using puts etc).  	|  `wont_be_silent`   |  
|   `must_be_within_delta`	|   	`(Math::PI, (22.0 / 7.0)).must_be_within_delta 0.01` |  In the documentation's example: `(Math::PI, (22.0 / 7.0)).must_be_within_delta 0.01`, this expectation will pass because 22.0/7 - Math::PI == 0.001264..., which is less than the allowed delta of 0.01.	|  `wont_be_within_delta`  |
|   `must_include`	|   `list.must_include 31`	|   The test fails if the collection does not contain the given value.	|  `wont_include`  |
|   `must_match`	|   `name.must_match /silly/`	|   The test fails if the object doesn't match the given regular expression.	|  `wont_match`  |
|   `must_output`	|   `proc { obj.do_something }.must_output "something"	`|   The test fails if the given block does not output the given value.	|
|   `must_respond_to`	|   `die.must_respond_to :roll`	|   The test fails if the object does not respond to the given method name.  	|  `wont_respond_to`  |
|   `must_raise`	|   `proc { obj1.do_something }.must_raise NoMethodError`	|   The test fails if the given block does not raise the given exception.	|    |
|   `must_throw` |   	`proc { obj1.do_something }.must_throw Exception` |   	Similar to `must_raise`  You can probably safely ignore this, but you can see [here](http://stackoverflow.com/questions/51021/what-is-the-difference-between-raising-exceptions-vs-throwing-exceptions-in-ruby) for an explanation on the differences between raise and throw..  | `wont_throw`  |




## Resources
-  [Minitest Quick Reference](http://www.mattsears.com/articles/2011/12/10/minitest-quick-reference/)
-  [Getting Started With Minitest](https://semaphoreci.com/community/tutorials/getting-started-with-minitest)
-  [Source of TDD Image](http://luizricardo.org/2014/05/is-tdd-dead/)
-  [Want to change how Minitest results are reported?  Check here](https://github.com/kern/minitest-reporters)
