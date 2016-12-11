# JavaScript Testing: Jasmine

## Learning Goals
- Understand that there are different types of testing for JavaScript
- Explore JavaScript testing using Jasmine
- Explore different ways for configuring Jasmine tests

### Testing in JavaScript: Overview
We have seen JavaScript used in two primary contexts thus far: _front-end_ and _back-end_. When we started using JavaScript, we were strictly running our code using `node` and not utilizing any of the browser interactivity functionality that we added later. This is an important distinction to think about, as we also test JavaScript based on these different contexts.

Testing front-end JavaScript is a more nuanced process than what we are used to. There are tools like [selenium](http://www.seleniumhq.org/) which allow you to automate the testing of web applications using a "headless" browser to simulate actions and events that a user might perform with your application. We will not be doing this type of JavaScript testing, but you are certainly welcome to look into it.

We will be focusing on back-end testing of JavaScript, since it is close to what we are used to and gives us the most "bang for our buck". We will be using a tool called Jasmine. [Jasmine](jasmine.github.io) is a "behavior-driven development framework for testing JavaScript code".

### Setup
We will utilize the basic application structure that we have used for our Backbone applications which has given us a file structure as well as some of the necessary dependencies.

1. Clone this repo: https://github.com/AdaGold/scrabble-jasmine-baseline
1. `npm install`
1. `npm test`
1. Copy in your original Scrabble code - watch out for those pieces that are in the baseline code that say "Do not remove"

We will start with the JavaScript file `scrabble.js` which will contain our code as well as a starter spec file `scrabble.spec.js` where we will write our tests.

Testing using Jasmine for JavaScript is fairly similar to what we saw with testing Ruby and Rails. As always, there are some specific differences.

### Anatomy of a Test
Since Jasmine is a BDD testing language, each test should have these components to describe the test behavior.

##### `describe`
Describe blocks should create test groupings based on _objects_ and _functions_.

We should use one `describe` block for our overall `Scrabble` object, and another nested one for the `score` method that we defined inside `Scrabble`.

Each `describe` function has two parameters. The first is the description of the `describe` block and the second is the function which contains the actions/logic. Note that we add a `;` at the end of each `describe` block.

```javascript
describe('Scrabble', function() {
  describe('score', function() {

  });
});
```

`it`: It blocks should define one distinct test. The description that goes along with the `it` block should describe the specific scenario that you are testing.

```javascript
describe('Scrabble', function() {
  describe('score', function() {
    it('should score a given word', function() {

    });
  });
});
```

`expect`: Expectations should be the "meat and potatoes" of your tests, inside of your `it` blocks. Each test has at least one `expect` statement to ensure the behavior is as expected.

```javascript
describe('Scrabble', function() {
  describe('score', function() {
    it('should score a given word', function() {
        expect(testScrabble.score('word')).toEqual(8);
    });
  });
});
```

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
