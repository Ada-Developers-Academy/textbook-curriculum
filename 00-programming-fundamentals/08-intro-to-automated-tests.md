# Introduction to Automated Testing
## Learning Goals
- Learn about _Test Driven Development_ (TDD)
- Discover techniques to verify our code performs as expected using _automated tests_
- Write code that can test code using _assertions_

## TDD
Test-driven development is a programming technique that requires you to write solution code and automated test code simultaneously. The goal is to use _automated tests_ as a exploration of your code. __Tests are transient.__ As you work on a project, your understanding of the problems at hand will change. As they do, your tests will change.

### How to TDD
(1) Write a test that describes a feature of the software. Run the test, and watch it fail. Watching it fail is crucial! (2) Write code that makes all the tests pass. (3) Look for opportunities to clarify your code.

1. Write a test
1. Watch it fail
1. Make it pass
1. Clarify
1. Repeat

You'll often hear this cycle shorthanded as __Red, Green, Refactor__. Write a test and it is __red__ (many testing tools show failing tests in red text). Writing or updating code to make the test pass makes it __green__ (passing tests are usually shown in green text). Before moving on, take a moment to look for emerging patterns, needless duplication, and other opportunities to polish and clarify. This is __refactoring__, updating not to extend functionality, but to increase the clarity and consistency of our code.

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

Writing your own assertions is wonderful, but it would be handy to have a standard way that developers can use to write tests on their code, a way that other developers understand.  The maintainers of the Ruby language have adopted a testing library called [Minitest](http://docs.seattlerb.org/minitest/).  For the remainder of your time using Ruby, we will be using Minitest to write unit-tests for your code.



### How To Use Minitest?

Lets say we need to write a class which simulates a 6-sided die.  We could use such a module in any number of board games (Monopoly etc).  

To start with we'll create a file to test the class.  We'll call it `die_test.rb`.  We will also require `minitest/autorun`

```ruby
# die_test.rb

require 'minitest/autorun'
require_relative 'die'
```

Then we can create an empty file `die.rb` which will hold our class.  

We can run the tests by typing:  `ruby die_test.rb` and get the following:

```bash
$ ruby die_test.rb
Run options: --seed 35264

# Running:



Finished in 0.000751s, 0.0000 runs/s, 0.0000 assertions/s.

0 runs, 0 assertions, 0 failures, 0 errors, 0 skips
```


### A Tale of Two Styles

In the TDD World there are two styles of testing.  In the first more traditional method people use *assertions* which are statements that check if a value is what it should be.  The other method is a subset of TDD, called Behavior-Driven Development (BDD) which accomplishes the same thing in a more English-friendly fashion that even non-developers can understand. 


#### Writing Your First Test - Assertion Style

To start we'll need to create a TestCase class.  We create a set of unit tests by subclassing MiniTest::Unit::TestCase and add each set of tests in instance methods.  


```
# die_test.rb

require 'minitest/autorun'
require_relative 'die'

class TestDie < MiniTest::Unit::TestCase
  def test_creation_of_die
    @die = Die.new
    # The class of @die should be Die
    assert @die.class, Die, "There must be a Die class."
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

Lets do so:

```ruby
#die.rb
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

#### Spec Style Testing

Spec style tests look very different, but read in a more English friendly fashion.  We'll create the test with a file named `die_spec.rb`.

```ruby
# die_test.rb

require 'minitest/autorun'
require_relative 'die'
```

Up till now this all looks the same, but here it changes a bit.  Instead of creating a class we'll write a `describe` block which identifies a group of tests that belong together, usually because they are testing the same thing.  Inside the `describe` block are `it` blocks.  Each `it` block is a test.   

```ruby
# die_spec.rb

require 'minitest/autorun'
require_relative 'die'

describe "Testing Die Class" do
  it "You can create an instance of Die" do
    @die = Die.new

    @die.class.must_equal Die
  end
end

```

Notice the line `@die.class.must_equal Die`.  Similar to Assertions Minitest adds a bunch of methods to all objects called *matchers*.  

There are a large number of matchers, but you can usually get by with `must_equal`, `must_include`, `must_match` and `must_raise`.  You can see a full list of Minitest matchers at the bottom of this lesson along with examples.  

So which style is better?  Functionally both do the same job, but the spec-style is more readable by non-technical people.  So we will, from this point on, use Spec-style tests.  However it is important for you to know that both exist and when you get to rails, a great deal more documentation exists for assert-style tests compared to spec-style.  

## TODO Continue testing Lesson


### List of Minitest Matchers

|   Matcher	|   Example	|   What it does	|   	Negation |
|---	|---	|---	|---	|
|   `must_equal`	|   `obj1.must_equal obj2`	|   The test succeeds if the object equals the given object.  It fails otherwise.	|   	wont_equal |
|   must_be	|   `num.must_be :> 5`	|   It lets you compare the given object to another using a given operator.  In this example num must be greater than 5.	|
|   `must_be_close_to`	|   `num.must_be_close_to 5, 1`	|   It lets you compare the given object to another with a given tolerance.  The test succeeds if the object is within the tolerance of the first argument.	|
|   `must_be_empty`	|   `list.must_be_empty`	|   The test passes if the given collection is empty.	|
|   `must_be_instance_of`	|   `@die.must_be_instance_of Die`	|   The test passes if the object is an instance of the given class.	|
|   `must_be_kind_of`	|   `list.must_be_kind_of Enumerable`	|   The test fails if the object is not a kind of the argument.	|
|   `must_be_nil`	|   `list.must_be_nil`	|   The test fails if the given object is not nil.	|
|   `must_be_same_as`	|   `list.must_be_same_as another_list`	|   The test fails if the object is not the same as the given argument.	|
|   `must_be_silent`	|   `proc { obj1.do_something }.must_be_silent`	|   The test fails if the given block outputs something to the terminal (like using puts etc).  	|
|   `must_be_within_delta`	|   	`(Math::PI, (22.0 / 7.0)).must_be_within_delta 0.01` |  In the documentation's example: `(Math::PI, (22.0 / 7.0)).must_be_within_delta 0.01`, this expectation will pass because 22.0/7 - Math::PI == 0.001264..., which is less than the allowed delta of 0.01.	|
|   `must_include`	|   `list.must_include 31`	|   The test fails if the collection does not contain the given value.	|
|   `must_match`	|   `name.must_match /silly/`	|   The test fails if the object doesn't match the given regular expression.	|
|   `must_output`	|   `proc { obj.do_something }.must_output "something"	`|   The test fails if the given block does not output the given value.	|
|   `must_respond_to`	|   `die.must_respond_to :roll`	|   The test fails if the object does not respond to the given method name.  	|
|   `must_raise`	|   `proc { obj1.do_something }.must_raise NoMethodError`	|   The test fails if the given block does not raise the given exception.	|
|   `must_throw` |   	`proc { obj1.do_something }.must_throw Exception` |   	Similar to `must_raise`  You can probably safely ignore this, but you can see [here](http://stackoverflow.com/questions/51021/what-is-the-difference-between-raising-exceptions-vs-throwing-exceptions-in-ruby) for an explanation on the differences between raise and throw..



```ruby
# die.rb

# The Die class simulates a die, which can have a number 1-6
class Die
  # initialize Method
  # sets up the Die and gives the showing number a random value 1-6
  def initialize
      roll
  end
  # roll method
  # this method assigns a random number 1-6 to roll
  def roll
    return @showing = Random.rand(6)
  end
  def showing
    return @showing
  end
end
```

## Resources
[Minitest Quick Reference](http://www.mattsears.com/articles/2011/12/10/minitest-quick-reference/)