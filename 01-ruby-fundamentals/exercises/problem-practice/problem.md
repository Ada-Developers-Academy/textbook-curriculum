# Math Problem Analyzer

This exercise will be good for you if you want more practice with:
- writing methods in a class
- calling methods on an instance of a class
- working within (some) code that is already written for you

In this exercise, we will use object-oriented principles to create a math problem analyzer. By providing both the text of a problem as well as the numeric answer, your program should be able to prompt your user with the question and provided answer and tell the user whether or not the answer is correct.

## The Code
There are two files that accompany this exercise. The `runner.rb` file contains the code that you should execute to determine whether or not your class code will work. The `problem.rb` file contains the starter code for the `Problem` class which you will modify. You should not need to modify the code in the `runner.rb` file to get the program to work.

## The Approach
Start by reading through the code in the `runner.rb` file. Trace through what each piece is expecting and be sure you understand the goal of the code. Next, take a look at the `Problem` class and identify the areas where comments have been left for you to fill in the code. 

## Optional
1. Add a `validate` method which will validate the user input to determine whether or it is valid before checking if it is the correct answer. Update the `runner.rb` code to use the `validate` method and permit the user to continue trying until they provide a valid input.
1. Modify the `runner.rb` code to allow the user to continue guessing when they get an incorrect answer.
