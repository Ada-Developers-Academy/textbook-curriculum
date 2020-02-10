# Introduction to Automated Testing

## Intro: How Do We Verify Our Code is Working?

Think about a previous coding project.

What was one project requirement? How did you meet that project requirement?

How did you know that you fully met that project requirement?

How did you know that your project was working **as expected**?

<details>

  <summary>Take a few minutes to consider, and check your list of strategies against ours.</summary>

  To verify that our code meets the given requirement, we probably employed any number of these:

1. Figure out "what the correct, expected output is," THEN run the Ruby program, and then compare it to what we see on the screen. We need to make sure that our output gets `puts`ed onto the screen.
1. Check that our code's logic makes sense. We need to make sure through reading code that our actual output can possibly create the correct solution.
1. Ask someone else if our code is correct. We need to make sure that this person understands what "correct" means, and how to check our program.
</details>

### But All Of These Strategies Require Clarity, Comparison, and Time

All of our strategies to verify code correctness have a few things in common: the strategies show that we need clarity, the ability to compare, and time.

#### Our Example: Imagine the Method `calculate_sales_tax(cost)`

For our intro example, imagine that Becca has a file `calculator.rb`. In Becca's file, she has a method named `calculate_sales_tax(cost)`, which is a method that takes in a Float `cost`, and `return`s a Float that is the tax for that cost.

Imagine that we need to verify if Becca's method `calculate_sales_tax(cost)` is accurate or not.

**However, we have one hiccup:** We can run `calculate_sales_tax(cost)` as many times as we want, with whatever argument, but we cannot look at Becca's method.

#### Clarity

In order to verify that the code is correct, **we need to understand what correct means.** Observe the vocabulary, definitions, and example below for some vocabulary that will help us find clarity.

| Concept | Definition | Example
| --- | --- | --- |
| What piece of code are we verifying? | What is method that we're testing? | `calculate_sales_tax(cost)`
| Context | What things need to be _set up_ in order for us to call this method? | What is the argument `cost` going to be? We may say one time that `cost = 17.00`
| Expected Value | Given the context we set up, what is the _literal value_ that the code _should_ produce. What is the _answer_ that we can **expect** to see, if everything is working correctly? | If we go by Seattle's sales tax of 10.1%, then the **expected value** is `1.717`.
| Actual Value | What do we get when we _actually_ run this method, with this context (argument)? | Let's imagine in this example that we got `1.7` from `calculate_sales_tax(17.00)`

When we have this vocabulary, we may be able to conclusively say:

- When we run `calculate_sales_tax(cost)`...
- with the context of passing `17.00` as cost...
- we **expect** to get back `1.717`...
- even if we may **actually** get `1.7`

#### Comparison

Once we have a grasp on what our expected value is and our actual value is, we need to be able to compare.

So far as programmers, we probably used our Human Abilities to do this comparison.

This probably actually used a bunch of steps:

1. We wrote down on a piece of paper that the expected answer is `1.717`
2. We programmed in our `calculate_sales_tax(cost)` method OR in our `calculator.rb` file a `puts` statement to print out the actual value
3. We opened Terminal to run `$ ruby calculator.rb`
4. We read through the program output in Terminal to look for the actual value, `1.7`
5. We used mental comparison to prove that `1.717` is not equal to `1.7`
6. We expected that our expected value would equal the actual value... And because `1.717` is not `1.7`, then our method is not correct

#### Time

Being able to spell out all of this detail, and _then_ run `$ ruby calculator.rb` took a few minutes... Which is fine.

But what happens when we need to verify that our code is correct _every time we change the code_?

These minutes add up, very quickly.

## Learning Goals
- Learn about how automated unit tests are used to verify code correctness
- Learn about _Test Driven Development_ (TDD)
- Be able to explain how the Red-Green-Refactor cycle works

## Automated Unit Tests are Used to Verify Code Correctness

In order to participate in the huge software industry, programmers need to _ensure_ that their code is "correct," whatever "correct" may mean.

If humans/programmers are able to determine what "correct" means, then humans/programmers can use **automated unit tests** to verify that their code is correctly in a much more clear, readable and scalable, and faster way.

**An automated unit test suite** is a set of code that is written to verify that code is correct.

By default, a programmer should supply:
- The source code (the code to test)
- Any context
- What the expected value is
- How to compare expected and actual

### Running the Tests Produces Failures or Passes

When a programmer supplies all of these details, especially any details about _comparison_, then they can _run_ the unit tests.

Whenever automated unit tests run, we can general expect one of three outcomes:

| Outcome | Description | Example | "Color" |
| --- | --- | --- | --- |
| Pass | There was a line in the unit test that expressed the expected relationship between expected value vs. actual value, and this expectation was met. | We expect an expected value `100` to equal the actual value `100`, and it does! | "Green"
| Fail |  There was a line in the unit test that expressed the expected relationship between expected value vs. actual value, and this expectation was **NOT** met.  | We expect an expected value `100` to equal the actual value `999`, and it does not. | "Red"
| Error | There was an Exception that was raised before the test could finish. This test cannot "pass" or "fail" because the code stopped prematurely | We may see a `SyntaxError` and the stack trace related to it instead of "pass" or "fail" | N/A

### We Will Write and Use Unit Tests

Over this curriculum, we should find deeper and deeper ways to verify that our code is correct with different testing libraries and syntaxes.

## TDD Helps Us Focus On Correct Code

**Test-Driven Development (TDD)** is a programming workflow technique where we write unit tests **before** and **to drive** writing our source code (solution code/implementation code).

When we use this programming technique, programmers get to use _automated tests_ as a way to explore, build, and test your code as a repeated workflow loop. 

### How to TDD

Test-Driven-Development follows this process and order. Note that writing the test comes before writing the implementation code. That's the "test-driven" part!

1. Write a test
1. Watch it fail
1. Make it pass
1. Refactor
1. Repeat

#### TDD is Summarized as "Red, Green, Refactor"

![Red Green Refactor](images/tdd_flow.gif)

You'll often hear this cycle shorthanded as __Red, Green, Refactor__.

1. Write a test that describes a feature of the software.
1. Run the test, and watch it fail. Watching it fail is crucial! This helps us confirm that the test is working as expected: we **should** get a test failure (or reasonable error) before the implementation code is written. This is watching a test result in **red** (or not passing the test).
1. Write code that makes all the tests pass. This makes the test **green.**
1. Look for opportunities to improve your code. This is most appropriate time to **refactor**-- after you have a messy working solution. This step does not add functionality.

Don't forget to make sure that your tests are still passing after the refactor!

#### TDD Checks Our Code As We Go

So as you make add features, change existing code, and refactor to better quality code, you have tests of older existing features to ensure your new code hasn't broken anything.

## What Test Cases Should I Write?

Tests actually have a lot of flexibility in how they're written. The nuance and depth from tests all comes down to how we consider the following:

- What is the method we are testing, and what are all of its responsibilities? What _should_ it be doing?
- What is any context for this method that we need to set up: What are some example inputs and arguments?
- Given some specific inputs, what is its **expected value**?
- What are some possible **actual values** that the method can produce, and **what the actual value's relationship to the expected value**?

### Consider the `calculate_sales_tax(cost)` Example

We may answer the above questions for the example `calculate_sales_tax(cost)` in the following ways:



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
  def initialize(items)
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
- Given a created `Bill` does it calculate the subtotal correctly?
- Given a created `Bill` does it calculate the proper sales tax?
- Given a created `Bill` does it calculate the proper total, including tax?

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

Order | Step 
1. Arrange our code with all our variables and inputs:  **Arrange**
2. Perform an action which we want to test: **Act**
3. Check with an expectation if it gives the desired result:  **Assert**

There are exceptions to this pattern, such as when we only want to test that specific methods exist (no actions), but you will see the arrange-act-assert pattern over and over again in many languages and frameworks.

## Testing in Ruby

It would be handy to have a standard way that developers can use to write tests on their code, a way that other developers understand.

The maintainers of the Ruby language have adopted a testing library called [Minitest](http://docs.seattlerb.org/minitest/) as the default standard for testing in Ruby & later Rails.  For the remainder of your time using Ruby at Ada, we will be using Minitest to write unit-tests for your code.  [RSpec](http://rspec.info/) is another very common testing framework used along with Ruby and Rails. We won't be using it here at Ada but it's good to know about when you're browsing the internet for testing help.  Later in JavaScript we will be using the [Jasmine](https://jasmine.github.io/) BDD framework to test our front-end code.

<!-- ## A Tale of Two Styles

In the TDD World there are two styles of testing.  In the first more traditional method people use *assertions* which are statements that check if a value is what it should be.  The other method is a subset of TDD, called Behavior-Driven Development (BDD) which accomplishes the same thing in a more English-friendly fashion business analysts can understand.  At Ada we will use the second BDD style of testing.  You should know assertion-style testing is a thing, and that it accomplishes the same job as our behavior-driven development, but we will not require you to write assertion-style tests. -->

#### Code Will Change, But Our Tests Will Be There For Us

We should run our **entire** automated unit test suite often. When our requirements change, we can feel secure in changing our code because we have some _tests_ to let us know if we've broken something.

__Tests are transient.__ As you work on a project, your understanding of the problems at hand will change. As they do, your tests will change.


Keep in mind the balance between evolving requirements, evolving tests, and tests that should stay the same. This balance will change with every task.

## Summary

So you've been introduced to the concept of TDD and how, without a framework, you could write some tests yourself.  You have also read about the Red-Green-Refactor cycle and why it can be so powerful.  We also looked at what types of things we should test and had a brief introduction to testing in Ruby with Minitest.

## Resources
-  [Source of TDD Image](http://luizricardo.org/2014/05/is-tdd-dead/)
-  [TDD Definition from the Agile Alliance](https://www.agilealliance.org/glossary/tdd/#q=~(filters~(postType~(~'page~'post~'aa_book~'aa_event_session~'aa_experience_report~'aa_glossary~'aa_research_paper~'aa_video)~tags~(~'tdd))~searchTerm~'~sort~false~sortDirection~'asc~page~1))
-  [Medium Article:  "TDD Changed My Life"](https://medium.com/javascript-scene/tdd-changed-my-life-5af0ce099f80)
