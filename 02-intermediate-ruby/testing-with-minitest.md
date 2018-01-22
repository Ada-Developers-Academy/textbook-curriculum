# Testing With Minitest

Minitest is the default testing framework for Ruby.  We will learn and explore writing tests by creating a class which simulates a bill with the ability to calculate, subtotal, tax and total.  We could use such a class in any number of e-commerce applications.  We are going to build the `Bill` class in a TDD fashion using Minitest, as our testing framework.  In doing so we will both learn the syntax of Minitest and practice writing code in a TDD fashion.

## Learning Goals
- Discover techniques to verify our code performs as expected using _automated tests_
- Test code using _expectations._
- Have a basic grasp on what _Rake_ & _Rakefiles_ are

## Starter Files

As we work we will use the files located in this [repository](https://github.com/AdaGold/bill_calculator).  Fork & Clone the repository and follow along as you go.

Our starter code has 2 files we will focus on.  
- `bill.rb` a file we will build our class in to simulate a bill.
- `bill_spec.rb` a file in which we will place tests to verify that our code meets expectations.

### Before We Get Started

Because colored output is so much nicer we'll add a gem called minitest-reporters.

Run this command in your terminal.

```bash
$  gem install minitest-reporters
```

### How To Use Minitest?

To start with we'll add some code to `bill_spec.rb`.  We will also require `minitest/autorun`

```ruby
# bill_test.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'bill'
```

Note that `bill.rb` which will hold our class is currently empty.

```ruby
# bill.rb
```


We can run the tests by typing:  `ruby bill_spec.rb` and get the following:

```bash
$ ruby bill_test.rb
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
# bill_spec.rb
require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'bill'

describe "bill" do

end
```

The `describe` block indicates that this contains a suite of tests.  Minitest will run these tests together and any instance variables created inside this block will be shared among the test cases.

#### Step 2:  Create an `it` block

Now we'll create an `it` block which is a test-case.  Each `describe` block can have many `it` blocks inside it and even many `describe` blocks.  Each `it` block however should focus on testing one specific thing, while `describe` blocks are used to group a set of tests.


```ruby
# bill_spec.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'bill'

describe "bill" do
  it "Can be created" do
    # Testing goes in here
  end
end
```

#### Step 3:  Add an expectation


So we have a test-case, but it's not actually checking anything yet.  So we can add an _expectation_ which is a method call that describes a condition it **expects** the given item to meet.  In this case we need to **expect** that if we create a bill, it's an instance of the Bill class.  Expectations typically start with `must_` or `wont_`.

So lets write our expectation

```ruby
# bill_spec.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'bill'

describe "Bill" do
  it "Can be created" do
    bill = Bill.new
    # the class of @bill should be Bill
    bill.class.must_equal Bill
  end
end
```

Notice the line `bill.class.must_equal Bill`.  Minitest adds a bunch of expectations including the  `must_equal` method to all objects and most take one required argument.  If the required argument is equal to the object `must_equal` is being called on, the expectation passes, otherwise it fails.

When we run this with `ruby bill_spec.rb` we get:

```bash
ruby bill_spec.rb
Run options: --seed 21626

# Running:

EE

Error:
bill#test_0001_can be created:
NameError: uninitialized constant Bill
    bill_spec.rb:9:in `block (2 levels) in <main>'


bin/rails test bill_spec.rb:8



Finished in 0.003340s, 299.4012 runs/s, 0.0000 assertions/s.

  1) Error:
bill#test_0001_can be created:
NameError: uninitialized constant Bill
    bill_spec.rb:9:in `block (2 levels) in <main>'

1 runs, 0 assertions, 0 failures, 1 errors, 0 skips



Finished in 0.457662s, 2.1850 runs/s, 0.0000 assertions/s.
1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
```

**This is a good thing.**  We have our first **red** test.  There's an error because we haven't created the Bill class yet.

####  Step 4:  Write Code To Make It Pass

Lets make the test pass by creating a Bill class.

```ruby
# bill.rb

class Bill

end
```

Now `ruby bill_spec.rb` gets us:

```bash
Run options: --seed 32657

# Running:

..

Finished in 0.001089s, 918.2736 runs/s, 918.2736 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

Finished in 0.454822s, 2.1987 runs/s, 2.1987 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

```

Now we have our first **green/passing** test.

There are a [number of expectations](http://mattsears.com/articles/2011/12/10/minitest-quick-reference/) in Minitest beyond the `must_equal` method.

**Exercise** Look at the list of expectations above and revise the `bill.class.must_equal Bill` to use the `must_be_instance_of` expectation instead.


#### A Word on Parentheses

In the code above, we are calling `must_equal` without using parentheses `bill.class.must_equal Bill`.  Ruby doesn't FORCE you to put parentheses around a method's arguments but [the community-driven style guidelines](https://github.com/bbatsov/ruby-style-guide) suggest that it's good coding style to put parentheses around method arguments **except** for methods which are part of an internal Domain Specific Language (DSL), or basically the syntax of some kind of framework like... Minitest.

So you shouldn't put parentheses around the arguments to `must` method arguments, but you **should** around your own methods.

### Adding Functionality

We are going to require that Bill must be instantiated with a list (array) of hashes.  Each item will have a name and price.  So we will revise the test to look like this:

```ruby
# bill_test.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'bill'

describe "bill" do
  it "can be created" do
    bill = Bill.new [{name: 'Coffee', price: 4.75}, {name: 'Pancakes', price: 8.75}]
    # the class of @bill should be Bill
    bill.class.must_equal Bill
  end
end
```

We also need to ensure that if Bill.new is called without an argument it raises an error.  

So we will add another `it` block and use the `must_raise` expectation.

```ruby
it "will raise an error if created with an invalid argument" do
  proc {
    bill = Bill.new
  }.must_raise ArgumentError
end
```

**Question**: Look back at the [guidelines for what to test]().  What other kinds of things should we test on the `initialize` method?

#### Practice Exercise

Now we need make a method that calculates the bill subtotal.  Write a test (`it` block) that creates an instance of Bill, calls a `subtotal` method and ensure that it returns the correct answer (the sum of the prices).  You can use the `must_equal` matcher.  

#### Check & Verify

Check with your neighbor.  You can find a solution [here.](https://github.com/AdaGold/bill_calculator/commit/12548edbe1d88bce598b642764e7953c10ced204)

### Arrange-Act-Assert

In our tests we will typically follow this pattern:
1. Arrange our code with all our variables and inputs:  **Arrange**
2. Perform an action which we want to test: **Act**
3. Check with an expectation if it gives the desired result:  **Assert**.

There are exceptions to this pattern, such as when we only want to test that specific methods exist (no actions), but you will see the arrange-act-assert pattern over and over again in your code.

### Practice Exercise - Sales Tax

Now write a test to evaluate the Sales tax on a particular bill.  Add another `it` block inside the existing `describe` block.

Then modify `Bill` to make the test pass.

Check your solution with a classmate and you can verify your answer [here.](https://github.com/AdaGold/bill_calculator/blob/solution/specs/bill_spec.rb)

**Question**:  What additional edge cases should you cover?
## Drying Tests

Notice that we are doing `bill = Bill.new ...` a lot!  We can DRY out our code by adding a `before` block inside our `describe`.  `before` blocks are executed before each `it` executes.  That lets us create an instance variable and use it rather than repeat our **arrange** steps.

```ruby
describe "Bill" do
  before do
    @bill = Bill.new [{name: 'Coffee', price: 4.75}, {name: 'Pancakes', price: 8.75}]
  end

  it "can be created" do
    # the class of @bill should be Bill
    @bill.must_be_instance_of Bill
  end

  ...
```

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
1.  Change the **require_relative** line in the spec to point to the lib folder.
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
Now you can have as many spec files as you want and run all the tests with a single `rake` command.

## Homework

Tonight create a test for the total bill including the tax.  Then write code to make the test pass.  

## List of Minitest Matchers

|   Matcher	|   Example	|   What it does	|   	Negation |
|---	|---	|---	|---	|
|   `must_equal`	|   `obj1.must_equal obj2`	|   The test succeeds if the object equals the given object.  It fails otherwise.	|   	`wont_equal` |
|   `must_be`	|   `num.must_be :>, 5`	|   It lets you compare the given object to another using a given operator.  In this example num must be greater than 5.	|  `wont_be`  |
|   `must_be_empty`	|   `list.must_be_empty`	|   The test passes if the given collection is empty.	|  `wont_be_empty` |
|   `must_be_instance_of`	|   `@bill.must_be_instance_of Bill`	|   The test passes if the object is an instance of the given class.	|  `wont_be_instance_of`  |
|   `must_be_kind_of`	|   `list.must_be_kind_of Enumerable`	|   The test fails if the object is not a kind of the argument.	| `wont_be_kind_of`  |
|   `must_be_nil`	|   `list.must_be_nil`	|   The test fails if the given object is not nil.	|  `wont_be_nil`   |
|   `must_be_same_as`	|   `list.must_be_same_as another_list`	|   The test fails if the object is not the same as the given argument.	|    `wont_be_same_as`  |
|   `must_be_silent`	|   `proc { obj1.do_something }.must_be_silent`	|   The test fails if the given block outputs something to the terminal (like using puts etc).  	|  `wont_be_silent`   |
|   `must_be_within_delta`	|   	`(Math::PI, (22.0 / 7.0)).must_be_within_delta 0.01` |  In the documentation's example: `(Math::PI, (22.0 / 7.0)).must_be_within_delta 0.01`, this expectation will pass because 22.0/7 - Math::PI == 0.001264..., which is less than the allowed delta of 0.01.	|  `wont_be_within_delta`  |
|   `must_include`	|   `list.must_include 31`	|   The test fails if the collection does not contain the given value.	|  `wont_include`  |
|   `must_match`	|   `name.must_match /silly/`	|   The test fails if the object doesn't match the given regular expression.	|  `wont_match`  |
|   `must_output`	|   `proc { obj.do_something }.must_output "something"	`|   The test fails if the given block does not output the given value.	|
|   `must_respond_to`	|   `bill.must_respond_to :tax`	|   The test fails if the object does not respond to the given method name.  	|  `wont_respond_to`  |
|   `must_raise`	|   `proc { obj1.do_something }.must_raise NoMethodError`	|   The test fails if the given block does not raise the given exception.	|    |
|   `must_throw` |   	`proc { obj1.do_something }.must_throw Exception` |   	Similar to `must_raise`  You can probably safely ignore this, but you can see [here](http://stackoverflow.com/questions/51021/what-is-the-difference-between-raising-exceptions-vs-throwing-exceptions-in-ruby) for an explanation on the differences between raise and throw..  | `wont_throw`  |


## Resources
-  [Minitest Quick Reference](http://www.mattsears.com/articles/2011/12/10/minitest-quick-reference/)
-  [Getting Started With Minitest](https://semaphoreci.com/community/tutorials/getting-started-with-minitest)
-  [Want to change how Minitest results are reported?  Check here](https://github.com/kern/minitest-reporters)
