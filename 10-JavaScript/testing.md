# JavaScript Testing with Jasmine

## Learning Goals
By the end of this lesson, students should be able to...

- Describe what makes testing JavaScript web apps complex
- Discuss strategies for mitigating this complexity
- Run Jasmine tests from the command line
- Enumerate the parts of a Jasmine test file
- Write tests in Jasmine for models and business logic

## Testing in JavaScript

Automated testing is an essential part of the process of writing good software. [Study](http://ieeexplore.ieee.org/abstract/document/1201238/) [after](http://www.sciencedirect.com/science/article/pii/S0950584903002040) [study](https://link.springer.com/article/10.1007/s10664-008-9062-z) have shown that folowing a strong test-driven development workflow reduces bug counts, increases code maintainability and helps teams deliver projects on time (and spend less time fixing them later).

While JavaScript is no exception to this rule, there are a few factors that make testing front-end web applications a little more difficult than what we've seen so far:

- Front-end JavaScript code is designed to run in the browser and often takes advantage of built-in browser mechanisms. This makes tests difficult to run automatically from the terminal.
- JavaScript applications often talk to an external API.
- Many JavaScript apps are built around manipulating the DOM and responding to user events, which are difficult to simulate and verify.

In short, most interesting JavaScript code is full of *external dependencies*. Much of the effort involved in testing a JavaScript app goes into mocking, eliminating or working around these dependencies.

### Testing Strategy

We'll be using a test suite called [Jasmine](https://jasmine.github.io/index.html) (maintained by Pivotal Labs, part of the Ada network). Jasmine is availabe as an npm package, and it is included in our standard Ada webpack setup.

Jasmine tests are run from the command line using `npm test` (more on this later). While this is fast and convenient, it also means that our tests are being run without support from the browser, and anything that relies on the browser (like manipulating the DOM or waiting for user events) will break.

To get around this, there are basically two strategies to follow:
- Use a technology like [Selenium](http://www.seleniumhq.org/) to *mock* the DOM
- Build your application so that as much of the business logic as possible can run without the DOM

Since our remaining time together is short, we'll use the second technique. It will be very reminiscent of model testing in Rails, and in fact we will focus our JavaScript testing on models. The testing techniques we learn here will also transfer directly to any command-line JavaScript programs you write, including something like a Node-Express server.

As an aside, Selenium is a *really* cool technology, we just don't have the time to do it justice. Maybe it would make a good piece of a capstone project...?

### Setup
We will utilize the same basic application structure that we have used for our Backbone applications. In fact, the project we'll be working with is a complete Backbone SPA. To let us focus on the process of writing tests with Jasmine rather than implementing some bit of complex logic, we'll be using a Backbonified version of our good old Scrabble game.

1. Clone this repo: `https://github.com/AdaGold/scrabble-jasmine-baseline`
1. `npm install`
1. `npm start`

Spend some time playing with the site. What models, collections and views do you think there might be? What functionality is still missing?

Now look through the code, and confirm or rebuke your suspicions. Pay close attention to the `spec` directory, which is where the tests live - we'll dive into it a little later. To run the tests, type `npm test` at the console.

Similar to Rails, the `spec` directory has the same structure as the `src` directory. Each file `src/dir/name.js` may have a corresponding `spec/dir/name.spec.js`.

Because we're running tests via `npm`, our tests have access to all our WebPack infrastructure, and `import` and `export` statements will work about as you'd expect.

### Anatomy of a Test

There are already some tests written for the `Word` model, so let's begin there. Open up `spec/models/word.spec.js`.

Because Jasmine is a behavior-driven testing language, testing using Jasmine for JavaScript is fairly similar to what we saw using Minitest for Ruby and Rails. As always, there are some specific differences.

Each test should have these components to describe the test behavior.

#### `describe` Blocks
Describe blocks should create test groupings based on _objects_ and _functions_.

We should use one `describe` block for our overall `Word` model, and another nested one for each method or set of behavior we want to test. `Word` has one for the constructor, another for validations and a third for the `score()` method.

Each `describe` function has two parameters. The first is the description of the `describe` block and the second is the function which contains the actions/logic. Note that we add a `;` at the end of each `describe` block.

```javascript
describe('Word', function() {
  describe('constructor', function() {

  });
});
```

#### `it` Blocks

`it` blocks should define one distinct test. The description that goes along with the `it` block should describe the specific scenario that you are testing.

```javascript
describe('Word', function() {
  describe('constructor', function() {
    it ('Converts text to lowercase', function() {

    });
  });
});
```

#### `expect` Statements

Expectations should be the "meat and potatoes" of your tests, inside of your `it` blocks. Each test has at least one `expect` statement to ensure the behavior is as expected.

The syntax of `describe` and `it` is pretty similar to Minitest (at least as similar as Ruby and JS can be), but `expect` is somewhat different. Note that there are actually two functions being called, the `expect` and the matcher (`toEqual` in this case), each taking one argument.

```javascript
describe('Word', function() {
  describe('constructor', function() {
    it ('Converts text to lowercase', function() {
      var word = new Word({ text: 'TeSt' });
      expect(word.get('text')).toEqual('test');
    });
  });
});
```

And that's all a test is. Go ahead and add another one to the spec file, but this time make sure it will fail (e.g. `expect(false).toEqual(true);`). Then re-run the tests, just to see what a failure looks like. Fix the test and run it again. Not too different from Minitest, right?

### Matchers
Just like in testing with Ruby and Rails, Jasmine has a number of **matchers** that allow us to construct our tests. Below are the most common:

| Code | Meaning     |
| :------------- | :------------- |
| `expect(x).toEqual(y);` | Compares objects `x` and `y` and passes if they are equivalent  |
| `expect(x).toBe(y);` | Compares objects `x` and `y` and passes if they are the same object |
| `expect(x).toMatch(pattern);` | Compares `x` to string or regular expression pattern and passes if they match |
| `expect(x).toBeDefined();` | Passes if `x` is **not** undefined |
| `expect(x).toBeNull();` | Passes if `x` is null |
| `expect(x).toBeTruthy();` | Passes if `x` evaluates to true |
| `expect(x).toBeFalsy();` | Passes if `x` evaluates to false |
| `expect(x).toContain(y);` | Passes if `array` or `string` `x` contains `y` |
| `expect(x).toBeLessThan(y);` | Passes if `x` is less than `y` |
| `expect(x).toBeGreaterThan(y);` | Passes if `x` is greater than `y` |
| `expect(fn).toThrow(e);` | Passes if a function, `fn`, throws exception `e` when executed |

The Jasmine docs also have some great examples of how to use the different matchers.
[https://jasmine.github.io/edge/introduction#section-Included_Matchers](https://jasmine.github.io/edge/introduction#section-Included_Matchers)

## Exercise

### Wave 1: `word.spec.js`

Read through the rest of the implemented tests in `word.spec.js`. Many of them cover model validations, which we haven't explicitly covered but which are similar enough to Rails to pick up. Is there anything in the tests that surprised you?

Now use a test-driven development workflow to implement the `Word.score()` method. Remember: the TDD cycle: pseudocode-red-green-refactor!

Feel free to borrow production (non-test) code from either of the previous times we've implemented scrabble - the learning objective is to practice Jasmine testing syntax, not to build the Scrabble logic for the third time.

Once we've spent some time here, we'll come back as a class and compare results.

### Wave 2: `word_list.spec.js`

Follow the same TDD workflow to test and implement `WordList.highestScoringWord()` and `.totalScore()`. Note that `.totalScore()` does not contain test stubs, so you'll have to come up with your own tests.

## What Have We Accomplished?

- Discuss the theory of testing JavaScript web applications
  - *External dependencies* such as the DOM, user events and APIs make it difficult
- Evaluate strategies for dealing with these challenges
  - *Mock* the DOM
  - Separate business logic from display logic and test it in isolation
- Examine Jasmine's BDD DSL
  - `describe` blocks for suites
  - `it` blocks for individual tests
  - `expect` statements (with matchers) to verify particular conditions
- Practice writing tests with Jasmine

## Additional Resources

- [Jasmine documentation](https://jasmine.github.io/api/2.6/global) 
- [Jasmine Examples v2.6](https://jasmine.github.io/2.6/introduction) (full of good examples)
- [Selenium](http://www.seleniumhq.org/)
- [Testing Backbone models with Jasmine](https://tinnedfruit.com/articles/testing-backbone-apps-with-jasmine-sinon-2.html)
- [Backbone model validations](http://beletsky.net/2012/11/baby-steps-to-backbonejs-model.html) (the next post on this blog is about testing them!)
