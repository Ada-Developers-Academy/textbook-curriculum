# Test Writing Exercise

In this exercise you will look at a problem description and write a set of tests to evaluate a solution.  Then you will review the tests of another classmate and make suggestions for improvement.  Lastly you will write solution code to satisfy your tests.

## Exercise Goal

The goal of this set of exercises is to:

*   Practice writing tests
*   Review the tests written by another and look for:
    *   Testing all edge-cases
    *   Ways to DRY-up tests

## Flatten Array Problem Description

This method should take a nested list and return a single flattened list with all values except nil.

The challenge is to write a function that accepts an arbitrarily-deep nested list-like structure and returns a flattened structure without any nil values.

For Example:

Ex 1:

input: `[1,[2,3,nil,4],[nil],5]`

output: `[1,2,3,4,5]`

Ex 2:

input: `['Peter', ['Paul', [ 'Mary' ]]]]`

output: `['Peter', 'Paul', 'Mary']`

## Stage 1:  Write the Tests

Write a set of tests to evaluate a method named `flatten_array` which takes a single array as a parameter and returns that array flattened like above.  It should also remove any nil values.


## Stage 2:  Test Review

With a classmate review your written tests and look for:

*   Edge-cases uncovered
*   Return values tested correctly
*   Opportunities to DRY-up code


## Stage 3:  Refactor

Finally refactor your tests from your partner's suggestions and write a `flatten_array` method in pseudocode to solve the tests.  The problem is *hard* and the point of this exercise is not to write the method, but rather to practice writing tests and examining where your code may not satify the test.

Answer the following questions:

*   Will your code satify the tests?  If not where would it fail?



*   Explain your biggest takeaway from reviewing your classmate's tests
