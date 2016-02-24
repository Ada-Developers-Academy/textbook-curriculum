# Introduction to Automated Testing
## Learning Goals
- Learn about _Test Driven Developement_ (TDD)
- Discover techniques to verify our code performs as expected using _automated tests_
- Write code that can test code using _assertions_

##TDD
Test-driven development is a programming technique that requires you to write solution code and automated test code simultaneously. The goal is to use _automated tests_ as a exploration of your code. __Tests are transient.__ As you work on a project, your understanding of the problems at hand will change. As they do, your tests will change.

### How to TDD
(1) Write a test that describes a feature of the software. Run the test, and watch it fail Watching it fail is crucial! (2) Write code that makes all the tests pass. (3) Look for opportunities to clarify your code.

1. Write a test
1. Watch it fail
1. Make it pass
1. Clarify
1. Repeat

You'll often hear this cycle shorthanded as __Red, Green, Refactor__. Write a test and it is __red__ (many testing tools show failing tests in red text). Writing or updating code to make the test pass makes it __green__ (passing tests are usually shown in green text). Before moving on, take a moment to look for emerging patterns, needless duplication, and other oppotunitites to polish and clarify. This is __refactoring__, updating not to extend functionality, but to increase the clarity and consistency of our code. 

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
jeremy@iridium ~/sandbox/exponate
❤️  :: ruby exponate_test.rb 
true
true
true
```
__Question: Why bother?__
In the above example, the code in `exponate_test.rb` are _automated tests_. We can run that file whenever we want to ensure that `exponate` is still performing reasonably. When our requirements change, we can feel secure in changing our code because we have some _tests_ to let us know if we've broken something.

### Assertions
An _assertion_ is the part of the _automated test suite_ that tells us whether our code did what we expected it to. Usually, _assertions_ are special methods that will evaluate whether an expression is `true`. If it is, the _assertion_ is true, the test passes (green test), otherwise it fails (red test).

### Exercise: Write an `assert` method
Let's build our own `assert` method in the `exponate_test.rb` file. Here's what it should look like:

- `assert` accepts two arguments 
  - an expression
  - an optional message
- return true if the expression is true
- raise an error (using `Exception.new`) if the expression is false
  - if the user provided an optional message, use it as the error message
  - otherwise use a default message

### Exercise: More Specific Assertions
With your chair pair, create an `assertions.rb` file. Copy the  `assert` example that we made together to this file and use it as a guide to write additional, more specific _assertions_:

- `assert_equal`, asserts that two expressions are equal to each other
- `assert_nil`, asserts that the passed expression is nil
- `assert_includes`, asserts that a value is included in an array
- make up your own assertion

