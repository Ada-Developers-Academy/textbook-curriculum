# Calculator-Node Exercise
Build a calculator command line interface (CLI) that allows a user to perform arithmetic operations.

## Baseline
- Create and enter a new directory in `exercises`:
  + `$ cd ~/ADA/exercises`
  + `$ mkdir calculator-js && cd calculator-js`
- Install `prompt` with npm. This package allows for gathering input from a user.
  + `$ npm install prompt`
  + When it's done, you should now have a directory called `node_modules`
- Create the file that will contain your program's code: `$ touch calculator.js`
- Open `calculator.js` in your editor and paste this code into it:
  ```javascript
  'use strict';
  var prompt = require('prompt');

  //start the prompt
  prompt.start();

  //collect two numbers (num1 and num2) and an operation
  //then call the function `calculator` with the results
  prompt.get(['num1','num2','operation'], calculator)

  function calculator(error, result) {
    console.log(result)
  }
  ```
- Run your program with `$ node calculator.js`

## Primary Requirements
The program should use the input operation and two numbers to provide the result of applying the operation to the two numbers.

- The program should have support for these four operations:
    - add (+)
    - subtract (-)
    - multiply (*)
    - and divide (/)
- The program should accept both the name (`add`) and the symbol (`+`) for each possible operation.

## Optional Enhancements
- Print out the formula in addition to the result, i.e. `2 + 2 = 4`
- Add support for computing exponents (`2^4 = 2 * 2 * 2 * 2 = 16`).
- Add support for the modulo operator (`10 % 3 = 1`).
- Gracefully handle unexpected user input:
  - What happens if the user input is empty (i.e., the user just pressed enter)?
  - What happens if the user tries to add `hotdog` to `elephant`?
- Add support for more complex expressions, i.e. `10 / (5 + 5) = 1`.
