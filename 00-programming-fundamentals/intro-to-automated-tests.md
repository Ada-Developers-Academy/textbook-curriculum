# Introduction to Automated Testing

## Learning Goals
- Learn about how automated unit tests are used to verify code correctness
- Define what "expected value" and "actual value" are in a test case
- Define what a test "pass" vs. "failure" are
- Consider the categories "positive nominal," "negative nominal," "positive edge," and "negative edge" in order to model different tests cases to construct
- Learn about _Test Driven Development_ (TDD) and its Red-Green-Refactor cycle

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

## Automated Unit Tests are Used to Verify Code Correctness

In order to participate in the huge software industry, programmers need to _ensure_ that their code is "correct," whatever "correct" may mean.

If humans/programmers are able to determine what "correct" means, then humans/programmers can use **automated unit tests** to verify that their code is correctly in a much more clear, readable and scalable, and faster way.

**An automated unit test suite** is a set of code that is written and run to verify that code is correct.

By default, a programmer should supply:
- The source code (the code to test)
- Any context
- What the expected value is
- How to compare expected and actual

### Running the Tests Produces Failures or Passes

When a programmer supplies all of these details, then they can _run_ the unit tests.

Whenever automated unit tests run, we can general expect one of three outcomes:

| Outcome | Description | Example | "Color" |
| --- | --- | --- | --- |
| Pass | There was a line in the unit test that expressed the expected relationship between expected value vs. actual value, and this expectation was met. | We expect an expected value `100` to equal the actual value `100`, and it does! | "Green"
| Fail |  There was a line in the unit test that expressed the expected relationship between expected value vs. actual value, and this expectation was **NOT** met.  | We expect an expected value `100` to equal the actual value `999`, and it does not. | "Red"
| Error | There was an Exception that was raised before the test could finish. This test cannot "pass" or "fail" because the code stopped prematurely | We may see a `SyntaxError` and the stack trace related to it instead of "pass" or "fail" | N/A

## How Do We Construct a Test Case?

A single test case is one single specific scenario used to verify that the code is working in one aspect. How do we construct a test case?

Tests actually have a lot of flexibility in how they're written. The nuance and depth from tests all comes down to how we consider the following:

- What is the method we are testing, and what are all of its responsibilities? What _should_ it be doing?
- What is any context for this method that we need to set up: What are some example inputs and arguments?
- Given some specific inputs, what is its **expected value**?
- What are some possible **actual values** that the method can produce, and **what the actual value's relationship to the expected value**?

### Consider the `calculate_sales_tax(cost)` Example

We may answer the above questions for the example `calculate_sales_tax(cost)` in the following ways:

Responsibilities:

1. The method is responsible for calculating sales tax when given a total cost
2. The method is responsible for giving the sales tax in dollar amount, as a number, not rounded, not as a string
3. The method is responsible for returning `0` if `cost` is a number `0` or less
4. The method is responsible for raising an `ArgumentError` if `cost` is not a number

Example Inputs, their expected value, and their relationship to the actual value:

1. `17.00`, `1.717`, the actual value should be equal to this expected value
2. `777.77`, `78.55477`, the actual value should be equal to this expected value
3. `-88`, `0`, `cost` is less than or equal to `0`, AND the actual value should be equal to this expected value
4. `9banana`, the program should raise an ArgumentError, the program should raise an ArgumentError

This list of example inputs, expected values, and their relationship to actual values are actually all **test cases**!

## Different Types of Test Cases

The following section describes these four types of test cases:

1. Positive Nominal Test Cases
2. Negative Nominal Test Cases
3. Positive Edge Test Cases
4. Negative Edge Test Cases

What kind, how many, and how we write these test cases will change based on the situation. Sometimes we won't find any test cases within a certain category!

How we categorize test cases isn't that important. **What's important is being able to consider all of the possible test cases.**

### The Obvious Test Case is the Nominal Test Case

Consider the test cases we listed above.

When we say that we must test that `calculate_sales_tax(cost)` is a correct method, which of these test cases is "the most obvious" test case that we **DEFINITELY** need to check?

**A nominal test case** is a type of test case that describes a piece of _core functionality_ needed for the success of this method. This **is the test case that verifies that the method does its primary responsibility.**

A test suite, comprised of many test cases, may have many nominal test cases.

#### Positive Nominal Test Cases and Negative Nominal Test Cases

A **positive nominal test case** is a type of test case that describes a set of inputs and expectations of the most obvious, most typical use of the method to show **it works as expected.**

Example: We may test that the `calculate_sales_tax(cost)` method does work with the most obvious, most typical use case. If we give the method a number (`17.00`),
  - we should get back a number (`1.717`)
  - we should get it back in a certain format (as a number, not as a formatted String)

A **negative nominal test case** is a test case of the most obvious, most typical way that this method can handle unexpected input.

Example: We may test that the `calculate_sales_tax(cost)` method gracefully handles the most obvious, most typical case that it could break. If we give the method the non-number input `9banana`, we should get back an error.

### The Non-Obvious Test Case is the Edge Test Case

**An edge test case** is a type of test case that verifies that the method can work successfully, even given non-obvious context. This **is the test case that verifies that the method works, even with very unexpected context.**

A test suite, comprised of many test cases, may have many nominal test cases.

#### Positive Edge Cases and Negative Edge Cases

A **positive edge test case** is a test case that describes a set of inputs and expectations that are on the limits of the method's most obvious, most typical way of working successfully.

Some positive edge case inputs to consider are:
- What if the input is huge, bigger than most expected data? For example, what if `cost` was the value `999 999 999 999 999 999 999 999 999`?
- ... or smaller than expected? Like `0.00001`?
- What if `cost` is `0`?
- What if `cost` is a negative number?

A **negative edge test case** is a test case that test that this method can handle the most non-obvious, most atypical unexpected input.

Some negative edge case inputs to consider are:
- What if `cost` is not a number?

## Testing in Ruby

Validating our code is something that we've been doing, and will continue to do!

In general, we've been validating our code manually-- by running our code, and checking our code and Terminal output against what's in our brains.

We also have been manually testing our code in Ruby code, with `puts` statements and conditional logic.

Consider the following code:

```ruby
my_test_input = 17.00
expected_value = 1.717
actual_value = calculate_sales_tax(my_test_input)

if (expected_value == actual_value)
  puts "Your calculate_sales_tax method correctly calculated the sales tax of #{my_test_input}!"
else
  puts "Something was wrong... your calculate_sales_tax method was not accurate"
end
```

This is a totally valid way to verify that our code works in Ruby when a unit test suite is not required.

### Our Testing Library in Ruby is Minitest

It would be handy to have a standard way that developers can use to write tests on their code, especially a way that other developers understand.

The maintainers of the Ruby language have adopted a testing gem called [Minitest](http://docs.seattlerb.org/minitest/) as the default standard for testing in Ruby & later Rails. For the remainder of your time using Ruby at Ada, we will be using Minitest to write unit-tests for your code.

Minitest will introduce proper syntax for how to actually go for test case description, to an automated test suite we can run in Terminal.

### The Components of a Written Test: Arrange-Act-Assert

After we consider the test cases we need to write, we must begin the process of writing Ruby code with Minitest!

When we actually start writing test cases, we will typically follow this pattern:

For every test case:
1. Arrange our code with all our variables and inputs:  **Arrange**
2. Perform an action which we want to test: **Act**
3. Check with an expectation if it gives the desired result:  **Assert**

This kind of looks familiar! Consider making the following comparisons with the vocabulary we used to construct test cases earlier:

| Step | Part of the Test Case We Described Earlier |
| --- | --- |
| Arrange | The setup of _context_ that we described earlier (what are our inputs and arguments?)
| Act | The method that we are verifying and testing
| Assert | The combination of expected value, actual value, and their relationship

There are exceptions to this pattern, but you will see the arrange-act-assert pattern over and over again in many languages and frameworks.

<!-- ## A Tale of Two Styles

In the TDD World there are two styles of testing.  In the first more traditional method people use *assertions* which are statements that check if a value is what it should be.  The other method is a subset of TDD, called Behavior-Driven Development (BDD) which accomplishes the same thing in a more English-friendly fashion business analysts can understand.  At Ada we will use the second BDD style of testing.  You should know assertion-style testing is a thing, and that it accomplishes the same job as our behavior-driven development, but we will not require you to write assertion-style tests. -->

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

We should run our **entire** automated unit test suite often. When our requirements change, we can feel secure in changing our code because we have some _tests_ to let us know if we've broken something.

__Tests are transient.__ As you work on a project, your understanding of the problems at hand will change. As they do, your tests will change.

Keep in mind the balance between evolving requirements, evolving tests, and tests that should stay the same. This balance will change with every task.

## Summary and Discussion Questions

Writing tests is a practiced skill, with a little bit of art to it.

It requires patience in order to question constantly:

- What is this method supposed to do?
- How can I verify that it's working?
- What are all of the possible, reasonable test cases that I can write to verify that it's working?
- How do I write it?

We will slowly build on these skills.

Consider these discussion questions about this material:

1. What are automated unit tests? What do we mean by "expected value" and "actual value" when constructing a test case?
1. When does a test "pass"? When does it "fail"?
1. What are the steps to constructing a test case?
1. What does a "nominal case" in tests mean? What does "edge case" mean?
1. What is Act-Arrange-Assert?
1. What is Red-Green-Refactor?

## Resources
-  [Source of TDD Image](http://luizricardo.org/2014/05/is-tdd-dead/)
-  [TDD Definition from the Agile Alliance](https://www.agilealliance.org/glossary/tdd/#q=~(filters~(postType~(~'page~'post~'aa_book~'aa_event_session~'aa_experience_report~'aa_glossary~'aa_research_paper~'aa_video)~tags~(~'tdd))~searchTerm~'~sort~false~sortDirection~'asc~page~1))
-  [Medium Article:  "TDD Changed My Life"](https://medium.com/javascript-scene/tdd-changed-my-life-5af0ce099f80)
