# exercism.io - Javascript

## Overview

Exercism.io is a set of mini-quests designed to introduce you to a new language, in this case Javascript.  It will present you with problems and a set of test suites to verify that your solution is correct.  Learning by TDD!  It's a great way to explore the language.

## Setup
<!--
//To install Exercism first install Nodejs (you may have this already installed.

# ```bash
#//$  brew install node
#//```
-->
Install Jasmine, which is a testing suite (like Minitest) for Javascript.

```bash
$  npm install jasmine-node -g
```

Then install exercism
```bash
$  brew install exercism
```

Then verify that it's working with:
```bash
$  exercism --version
```

You can see what commands you can execute with:
```bash
$  exercism
```

By default exercism will download files to `~/exercism` you can configure it with:

```bash
$  exercism configure --dir=~/some/other/place
```

You can fetch your lessons with:
```bash
$  exercism fetch javascript <Lesson-Name>
```

You can skip a particular lesson with:

```bash
$  exercism skip javascript <Lesson-Name>
```

You can test the particular suite by changing directory into the assignment folder and running:

```bash
$  jasmine-node .

jasmine-node .
F

Failures:

  1) Hello World says hello world with no name
   Message:
     Expected undefined to equal 'Hello, World!'.
   Stacktrace:
     Error: Expected undefined to equal 'Hello, World!'.
    at jasmine.Spec.<anonymous> (/Users/username/exercism/javascript/hello-world/hello-world.spec.js:7:34)

Finished in 0.007 seconds
1 test, 1 assertion, 1 failure, 0 skipped

```

This should look quite familiar with our close and personal friendship with Minitest.  


### Getting an API Key - optional

Exercism has a method for you to submit your solutions to be reviewed by other devs. To do so you'll need an API key.  You can get one [here](http://exercism.io/) by logging in via your github account.  

You can then input your key with:

```bash
exercism configure --key=<YOUR_KEY_HERE>
```

When you are ready to submit, enter the following command:
```bash
exercism submit <File-Name>
```

## Getting Started - Leap Year

Now fetch the leap_year assignment and take a look at the spec.

```javascript
var Year = require('./leap');

describe('Leap year', function() {

  it('is not very common', function() {
    var year = new Year(2015);
    expect(year.isLeap()).toBe(false);
  });

  xit('is introduced every 4 years to adjust about a day', function() {
    var year = new Year(2016);
    expect(year.isLeap()).toBe(true);
  });

  xit('is skipped every 100 years to remove an extra day', function() {
    var year = new Year(1900);
    expect(year.isLeap()).toBe(false);
  });

  xit('is reintroduced every 400 years to adjust another day', function() {
    var year = new Year(2000);
    expect(year.isLeap()).toBe(true);
  });

  // Feel free to enable the following tests to check some more examples
  xdescribe('Additional example of a leap year that', function () {

    it('is not a leap year', function () {
      var year = new Year(1978);
      expect(year.isLeap()).toBe(false);
    });

    it('is a common leap year', function () {
      var year = new Year(1992);
      expect(year.isLeap()).toBe(true);
    });

    it('is skipped every 100 years', function () {
      var year = new Year(2100);
      expect(year.isLeap()).toBe(false);
    });

    it('is reintroduced every 400 years', function () {
      var year = new Year(2400);
      expect(year.isLeap()).toBe(true);
    });

  });

});
```


It looks a lot like minitest spec-style testing.  The first line:

`var Year = require('./leap');`

Is a Node technique to import a module from a file named `leap.js`.  So at the end of your `leap.js` file you will need a line like:

```javascript
module.exports = <class_name>;
```

Next look at the test cases.  Each test case makes a new instance of a `Year` class and call a `.isLeap()` method.  So you will need to create a `leap.js` file and create a Year class.  Most of the examples you write will follow this pattern.  

So work to create Leap Year program to satisfy the tests and run.

```bash
$  jasmine-node .
```
Until you satisfy the tests.

#### Notice some tests are skipped!
Once you do, edit the test cases and change the `xit` cases to `it`.  Those test cases have been skipped initially.


For this initial problem if you get stuck you can check [here](http://exercism.io/submissions/95a82aaa98b3417c85c5dbe36044d79f)
