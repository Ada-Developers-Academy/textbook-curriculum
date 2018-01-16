# Introduction to Minitest

Minitest is the default testing framework for Ruby.  We will learn and explore writing tests by creating a class which simulates a 6-sided die.  We could use such a module in any number of board games (Monopoly etc).  We are going to build the `Die` class in a TDD fashion using Minitest, a framework for TDD which is built-into the Ruby language, as our testing framework.  In doing so we will both learn the syntax of Minitest and practice writing code in a TDD fashion.

## Learning Goals
- Discover techniques to verify our code performs as expected using _automated tests_
- Write code that can test code using _expectations._
- Have a basic grasp on what _Rake_ & _Rakefiles_ are

## Starter Files

As we work we will use the files located in this [repository.](https://github.com/AdaGold/die).  Fork & Clone the repository and follow along as you go.

Our starter code has 2 files we will focus on.  
- `die.rb` a file we will build our class in to simulate a 6-sided die.
- `die_spec.rb` a file in which we will place tests to verify that our code meets expectations.

### Before We Get Started

Because colored output is so much nicer we'll add a gem called minitest-reporters.

Run this command in your terminal.

```bash
$  gem install minitest-reporters
```

### How To Use Minitest?

To start with we'll add some code to `die_spec.rb`.  We will also require `minitest/autorun`

```ruby
# die_test.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'die'
```

Note that `die.rb` which will hold our class is currently empty.

```ruby
# die.rb
```


We can run the tests by typing:  `ruby die_spec.rb` and get the following:

```bash
$ ruby die_test.rb
Run options: --seed 35264

# Running:



Finished in 0.000751s, 0.0000 runs/s, 0.0000 assertions/s.

0 runs, 0 assertions, 0 failures, 0 errors, 0 skips
```

We are now setup, but we haven't actually written a test yet.


#### Writing Your First Test

To start we'll need to create a `description` block and place our tests inside that block.


#### Step 1:  Create a `describe` block

```ruby
# die_spec.rb
require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'die'

describe "die" do

end
```

The `describe` block indicates that this contains a suite of tests.  Minitest will run these tests together and any instance variables created inside this block will be shared among the test cases.

#### Step 2:  Create an `it` block

Now we'll create an `it` block which is a test-case.  Each `describe` block can have many `it` blocks inside it and even many `describe` blocks.  Each `it` block however should focus on testing one specific thing, while `describe` blocks are used to group a set of tests.


```ruby
# die_spec.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'die'

describe "die" do
  it "Can be created" do
    # Testing goes in here
  end
end
```

#### Step 3:  Add an expectation


So we have a test-case, but it's not actually checking anything yet.  So we can add an _expectation_ which is a method call that describes a condition it **expects** the given item to meet.  In this case we need to **expect** that if we create a die, it's an instance of the Die class.  Expectations typically start with `must_` or `wont_`.

So lets write our expectation

```ruby
# die_spec.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'die'

describe "die" do
  it "Can be created" do
    @die = Die.new
    # the class of @die should be Die
    @die.class.must_equal Die
  end
end
```

Notice the line `@die.class.must_equal Die`.  Minitest adds the `must_equal` method to all objects and it takes one required argument.  If the required argument is equal to the object `must_equal` is being called on, the expectation passes, otherwise it fails.

When we run this with `ruby die_spec.rb` we get:

```bash
ruby die_spec.rb
Run options: --seed 2271

# Running:

Run options: --seed 2271

# Running:

EE

Error:
die#test_0001_Can be created:
NameError: uninitialized constant Die
Did you mean?  Dir
    die_spec.rb:8:in `block (2 levels) in <main>'

Finished in 0.001745s, 573.0659 runs/s, 0.0000 assertions/s.

  1) Error:
die#test_0001_Can be created:
NameError: uninitialized constant Die
Did you mean?  Dir
    die_spec.rb:8:in `block (2 levels) in <main>'

1 runs, 0 assertions, 0 failures, 1 errors, 0 skips



Finished in 0.382043s, 2.6175 runs/s, 0.0000 assertions/s.
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

Now `ruby die_spec.rb` gets us:

```bash
Run options: --seed 39582

# Running:

Run options: --seed 39582

# Running:

..

Finished in 0.001041s, 960.6148 runs/s, 960.6148 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

Finished in 0.367340s, 2.7223 runs/s, 2.7223 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

Now we have our first **green/passing** test.

There are a [number of expectations](http://mattsears.com/articles/2011/12/10/minitest-quick-reference/) in Minitest beyond the `must_equal` method.

**Exercise** Look at the list of expectations above and revise the `@die.class.must_equal Die` to use the `must_be_instance_of` expectation instead.


#### A Word on Parentheses

In the code above, we are calling `must_equal` without using parentheses `@die.class.must_equal Die`.  Ruby doesn't FORCE you to put parentheses around a method's arguments but [the community-driven style guidelines](https://github.com/bbatsov/ruby-style-guide) suggest that it's good coding style to put parentheses around method arguments **except** for methods which are part of an internal Domain Specific Language (DSL), or basically the syntax of some kind of framework like... Minitest.

So you shouldn't put parentheses around the arguments to `must` method arguments, but you **should** around your own methods.

#### Practice Exercise

Now we need to test that we can roll the die.  Write a test (`it` block) that checks the roll method of the Die class.  When a die is rolled it should return a number between 1 and 6 inclusive.  You can use the `must_be` method.

#### Check & Verify

Check with your neighbor.  You can find a solution [here.](https://github.com/AdaGold/die/blob/solution/specs/die_spec.rb)

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
-  [Want to change how Minitest results are reported?  Check here](https://github.com/kern/minitest-reporters)
