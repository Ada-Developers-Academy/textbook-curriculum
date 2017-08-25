# Loop Problem Practice

## Part 1

For each of the following problems, write the code to solve the problem. Each solution should be structured as a method that takes an array as a parameter and returns the result. **You should use the `Array#each` method to solve each problem.**

1. You are given an array of `String` objects, stored in a variable called `my_strings`. You want to use this array to create a new array of `Integer` objects, which represents the `length` of each string. We want to store the resulting array in a variable called `string_lengths`.
    <!-- MAP/COLLECT -->

1. You are given an array of `Integer` objects, stored in a variable called `my_nums`. You want to use this array to create a new array which contains `String` objects, which say "even" or "odd" depending on the `Integer` in the original array.
    <!-- MAP/COLLECT -->

1. You are given an array of `String` objects, stored in a variable called `my_strings`. You want to create a new array which only contains the strings from the original array that have a length that is smaller than 4. We want to store the resulting array in the original `my_strings` variable, overwriting the original value.
    <!-- REJECT! -->

1. You are given an array of `String` objects, stored in a variable called `my_strings`. You want to use this array to return the `String` that has the longest length. (In a tie, it should return the first `String` with the longest length)
    <!-- MAX_BY -->

## Part 2

Write **tests** for each of the problems above. You should have at least one _nominal case_ and one _edge case_ for each problem. Questions you should ask through your tests might include:
- Does the method work correctly in a _nominal case_, that is when the input is about what you would expect?
- What happens if the input array has 0 elements? What if it has only 1?
- How does the order of the input array affect the method?
- What if there's a tie, or if all the elements in the input array are the same?
- Are there any interesting values that individual elements might take to affect the result?
