# JS Calculator Exercise
Build a calculator command line interface (CLI) that allows a user to perform arithmetic operations.

## Baseline
- Create and enter a new directory for this project, such as:
  + `$ mkdir js-calculator && cd js-calculator`
- Once inside the project directory, install `prompt` with npm. This package allows for gathering input from a user.
  + `$ npm install prompt`
  + When it's done, you should now have a directory called `node_modules`
- Create the file that will contain your program's code: `$ touch calculator.js`
- Open `calculator.js` in your editor and paste this code into it:
  ```javascript
  'use strict';
  const prompt = require('prompt');
  
  const calculator = function calculator(error, result) {
    console.log(result);
  }  
  

  //start the prompt
  prompt.start();

  //collect two numbers (num1 and num2) and an operation
  //then call the function `calculator` with the results
  prompt.get(['num1','num2','operation'], calculator);
  ```
- Run your program with `$ node calculator.js`. What happens? What do you see? How do you interact with the program?

## Primary Requirements

From this base code, write a program that simulates a calculator.

The program should use the input operation and two numbers to provide the result of applying the operation to the two numbers.

- The program should have support for these four operations:
    - add (+)
    - subtract (-)
    - multiply (\*)
    - and divide (/)

Practice using variables, conditionals, and functions to build out this calculator program.

### User Stories

As a user, when I launch the calculator program with `$ node calculator.js`...
- I want to be able to enter `2`, then `3`, then `+`, so that I can see that the sum of 2 and 3 is `5`
- I want to be able to enter `2`, then `3`, then `-`, so that I can see that the difference of 2 and 3 is `-1`
- I want to be able to enter `2`, then `3`, then `*`, so that I can see that the product of 2 and 3 is `6`
- I want to be able to enter `6`, then `3`, then `/`, so that I can see that 6 divided by 3 is `2`

## Optional Enhancements
- The program should accept both the name (`add`) and the symbol (`+`) for each possible operation.
- Print out the formula in addition to the result, i.e. `2 + 2 = 4`
- Add support for computing exponents (`2^4 = 2 * 2 * 2 * 2 = 16`).
- Add support for the modulo operator (`10 % 3 = 1`).
- Gracefully handle unexpected user input:
  - What happens if the user input is empty (i.e., the user just pressed enter)?
  - What happens if the user tries to add `hotdog` to `elephant`?
- Add support for more complex expressions, i.e. `10 / (5 + 5) = 1`.
