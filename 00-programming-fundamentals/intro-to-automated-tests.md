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

### A More Practical Example

Lets consider a class designed to embody the concept of a bill.  This could be a grocery store bill, an online bill from a store, or anything that takes in a list of items with prices and calculates a subtotal, tax and total price.  

In Ruby `Bill` could look like:

```ruby
class Bill
  def initialize(item)
    #...
  end

  def subtotal
    #...    
  end

  def tax
    #...    
  end

  def total
    #...    
  end
end
```

We will give each `Bill` a list of prices for individual items and it should be able to:

- Calculate the subtotal before taxes
- Calculate the sales taxes
- Calculate the total amount owed

So when we test the Bill class we will need to test both _nominal cases_, where we test that your code works normally, and _edge cases_ where you test the borders of possible inputs.  Anytime you think of a scenario where you say, "Huh that's interesting,"" or "I dunno," you're probably at an _edge case_.

#### Nominal Cases

Some nominal cases include:

- Can I create a `Bill` with a list of normal prices?
- Given a created bill, does it calculate the subtotal correctly?
- Given a created bill does it calculate the proper sales tax?
- Given a created bill does it calculate the proper total, including tax?

For every method you create you should include **at least one nominal test.**

#### Edge Cases

Edge cases push the bounds of what's normal.  Given our Bill example, the input is a list of prices, thus a good edge case might include:

-  Can I create a `Bill` with an empty list?

In Ruby this might look like `Bill.new([])`.  It could easily happen through a programming error, or an end-user mistake.  

How do we deal with this scenario?  There's not an obvious answer.  The program could work fine returning zero for `Bill#subtotal`, `Bill#tax` and `Bill#total`, or it could raise an error, or something else.  Because it's not immediately obvious it makes a clear _edge case_.  You, as the designer, have to decide on the proper behavior and should write a test for it.  

**Questions:**

-  Are there any other edge cases, or variations on input you should test for when you create a `Bill`?  
- Are there edge cases to test for with `Bill#tax`, `Bill#total`, or `Bill#subtotal`

### The Process of Testing: Arrange-Act-Assert

Testing typically follows this pattern:
1. Arrange our code with all our variables and inputs:  **Arrange**
2. Perform an action which we want to test: **Act**
3. Check with an expectation if it gives the desired result:  **Assert**.

There are exceptions to this pattern, such as when we only want to test that specific methods exist (no actions), but you will see the arrange-act-assert pattern over and over again in many languages and frameworks.

## Testing in Ruby

Writing your own tests with puts is wonderful, but it would be handy to have a standard way that developers can use to write tests on their code, a way that other developers understand.  The maintainers of the Ruby language have adopted a testing library called [Minitest](http://docs.seattlerb.org/minitest/) as the default standard for testing in Ruby & later Rails.  For the remainder of your time using Ruby at Ada, we will be using Minitest to write unit-tests for your code.  [RSpec](http://rspec.info/) is another very common testing framework used along with Ruby and Rails. We won't be using it here at Ada but it's good to know about when you're browsing the internet for testing help.  Later in JavaScript we will be using the [Jasmine](https://jasmine.github.io/) BDD framework to test our front-end code.

## A Tale of Two Styles

In the TDD World there are two styles of testing.  In the first more traditional method people use *assertions* which are statements that check if a value is what it should be.  The other method is a subset of TDD, called Behavior-Driven Development (BDD) which accomplishes the same thing in a more English-friendly fashion business analysts can understand.  At Ada we will use the second BDD style of testing.  You should know assertion-style testing is a thing, and that it accomplishes the same job as our behavior-driven development, but we will not require you to write assertion-style tests.



## Summary

So you've been introduced to the concept of TDD and how, without a framework, you could write some tests yourself.  You have also read about the Red-Green-Refactor cycle and why it can be so powerful.  We also looked at what types of things we should test and had a brief introduction to testing in Ruby with Minitest.

## Resources
-  [Source of TDD Image](http://luizricardo.org/2014/05/is-tdd-dead/)
-  [TDD Definition from the Agile Alliance](https://www.agilealliance.org/glossary/tdd/#q=~(filters~(postType~(~'page~'post~'aa_book~'aa_event_session~'aa_experience_report~'aa_glossary~'aa_research_paper~'aa_video)~tags~(~'tdd))~searchTerm~'~sort~false~sortDirection~'asc~page~1))
