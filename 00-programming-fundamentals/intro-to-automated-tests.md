# Introduction to Automated Testing
## Learning Goals
- Learn about _Test Driven Development_ (TDD)
- Be able to explain how the Red-Green-Refactor cycle works
- Be able to recognize the two testing styles

## TDD
**Test-Driven Development** is a programming technique that requires you to write solution code and automated test code simultaneously. The goal is to use _automated tests_ as a exploration of your code.  So as you make changes, refactor and add features you have tests of older existing features to ensure your new code hasn't broken anything.

Note however __tests are transient.__ As you work on a project, your understanding of the problems at hand will change. As they do, your tests will change.


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

## What Should I Test?

More important than how you test your code is what you are testing.  If you're not testing the right things bugs can creep through your tests and into production code.  Many many many developers have trouble knowing **what** to test.   Here are some general guidelines.

*  Look at your code for branches (if statements and loops) and make sure that each branch of execution is tested.
*  Test your methods with edge case values.
	*  For example if your method takes an integer as a parameter you would test it with a positive number, a negative number and zero.
	*  If your method took an array as a parameter you would test it with an empty array, a one element array and a large array.  
*  Think about how someone might misuse your method, check for invalid or weird input.  If someone can break your code... they will.

## Testing in Ruby

Writing your own tests with puts is wonderful, but it would be handy to have a standard way that developers can use to write tests on their code, a way that other developers understand.  The maintainers of the Ruby language have adopted a testing library called [Minitest](http://docs.seattlerb.org/minitest/) as the default standard for testing in Ruby & later Rails.  For the remainder of your time using Ruby at Ada, we will be using Minitest to write unit-tests for your code.  [RSpec](http://rspec.info/) is another very common testing framework used along with Ruby and Rails. We won't be using it here at Ada but it's good to know about when you're browsing the internet for testing help.  Later in JavaScript we will be using the [Jasmine](https://jasmine.github.io/) BDD framework to test our front-end code.

## A Tale of Two Styles

In the TDD World there are two styles of testing.  In the first more traditional method people use *assertions* which are statements that check if a value is what it should be.  The other method is a subset of TDD, called Behavior-Driven Development (BDD) which accomplishes the same thing in a more English-friendly fashion business analysts can understand.  At Ada we will use the second BDD style of testing.  You should know assertion-style testing is a thing, and that it accomplishes the same job as our behavior-driven development, but we will not require you to write assertion-style tests.

Below are examples of a test written in each format:

Assertion style tests suites are created by defining a class which extends Minitest::test and each test is defined in an instance method which starts with `test_`. The test then **asserts** things that must be true.  Note the `assert_equal` method.

```ruby
class EmailTest < Minitest::Test

  def test_subject_is_test_subject
    email = Email.new(subject: "Test Subject",
      from: "ada@adadev.org",
      to: "student@adadev.org",
      body: "test body")
      # If you create an instance of Email, the subject must be saved in the subject property.
    assert_equal "Test Subject", email.subject
  end
end
```
BDD or "spec-style" tests are written in a more English-friendly syntax.  Each set of tests are written within a `describe` block.  Each test is then written within an `it` block.  Inside the `it` block we arrange our code to set up an initial situation and perform some action we want to test (like creating an instance) and then state what we expect to be true with an expectation.  Note the `must_equals` method.

```ruby
describe "Email" do

  it "will have the proper subject" do
    email = Email.new(subject: "Test Subject",
      from: "ada@adadev.org",
      to: "student@adadev.org",
      body: "test body")

    email.subject.must_equal "Test Subject"
  end
end
```

## Summary

So you've been introduced to the concept of TDD and how, without a framework, you could write some tests yourself.  You have also read about the Red-Green-Refactor cycle and why it can be so powerful.  We also looked at what types of things we should test and had a brief introduction to testing in Ruby with Minitest.

## Resources
-  [Source of TDD Image](http://luizricardo.org/2014/05/is-tdd-dead/)
-  [TDD Definition from the Agile Alliance](https://www.agilealliance.org/glossary/tdd/#q=~(filters~(postType~(~'page~'post~'aa_book~'aa_event_session~'aa_experience_report~'aa_glossary~'aa_research_paper~'aa_video)~tags~(~'tdd))~searchTerm~'~sort~false~sortDirection~'asc~page~1))
