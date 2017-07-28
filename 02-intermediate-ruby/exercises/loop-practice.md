# Loop Problem Practice

## Part 1

For each of the following problems, write the code to solve the problem. **You should use the `.each` method to solve each problem.**

1. You are given an array of `String` objects, stored in a variable called `my_strings`. You want to use this array to create a new array of `Integer` objects, which represents the `length` of each string. We want to store the resulting array in a variable called `string_lengths`.
<!-- MAP/COLLECT -->

1. You are given an array of `Integer` objects, stored in a variable called `my_nums`. You want to use this array to create a new array which contains `String` objects, which say "even" or "odd" depending on the `Integer` in the original array.
<!-- MAP/COLLECT -->

1. You are given an array of `String` objects, stored in a variable called `my_strings`. You want to create a new array which only contains the strings from the original array that have a length that is smaller than 4. We want to store the resulting array in the original `my_strings` variable, overwriting the original value.
<!-- REJECT! -->

1. You are given an array of `String` objects, stored in a variable called `my_strings`. You want to use this array to return the `String` that has the longest length. (In a tie, it should return the first `String` with the longest length)
 <!-- MAX_BY -->

## Part 2

1. For each question above, refactor your code to utilize methods. For each of the "given array" in the problem, make that a **parameter** that will be passed in to your method. Each result of the problem should be `return`ed.
1. Write **tests** for each of the problems above. You should have at least one _nominal case_ and one _edge case_ for each problem.
