# Interview Questions - Algorithms

## Questions
### Strings
1. Strip whitespace from a string in-place e.g.

  ```ruby
  "H e  llo W orl     d"
  ```
  becomes
  ```ruby
  "HelloWorld"
  ```

1. Remove duplicate chars from a string e.g. `"AAA BBB"` -> `"A B"`
1. Find the first non-repeating character in a string e.g. `"ABCA"` -> `B`
1. Reverse a string e.g. `"Hello"` --> `"olleH"`
1. Reverse words in a string (words are separated by one or more spaces).  e.g. `"This is stuff"` --> `"stuff is This"` _Extra fun: Do it in-place._

### Arrays
1. You are given an unsorted array with integers between 1 and 1,000,000. One integer is in the array twice. Determine which one. _Extra fun: Do it without sorting._
1. You are given an unsorted array containing all integers between 1 and 1,000,000. One integer is missing. How can you determine which one? _Extra fun: Can you think of a way to do it by iterating through the array only once, without sorting?_
1. Return the sum of the two largest integers in an array e.g. Given `[19, 4, 2, -19, 100, 9]`, return `119` (100 + 19)
1. Return the largest sum of contiguous integers in the array e.g. Given `[-10, 2, 3, -2, 0, 5, -15]`, the largest sum is `8` (2 + 3 + -2 + 0 + 5)

<!-- UNSURE IF ANY OF THESE ARE ANY GOOD TO SHARE WITH STUDENTS - will look at later.

## Advanced Questions
+ Prison Guard
  - You're the guard of a prison, you want to keep an eye on the most dangerous prisoner. Each prisoner has a danger rank of his own and a group of friends (prisoners, who also have danger ranks). The guard has a list of prisoners with their corresponding danger ranks and he also has a list of the friends of each of the prisoners in the prison.
  - The danger rank is computed as follows: Prisoner 1 has a danger value of 5, his friends are Prisoner 2 and Prisoner 5, who have danger values of 3 and 4 respectively. So the danger value of Prisoner 1 is 5+3+4 = 12.
  - There could be any number of prisoners. Whichever prisoner has the highest value is the most dangerous(computed using the above method).
  - Friendship can be assumed to be symmetric.
  - Come up with an efficient algorithm to find the most dangerous prisoner?
+ Tape Backup System
  - You need to implement a new backup system, in which files are stored into data tapes. This new system must follow the following 2 rules:
    1. Never place more than two files on the same tape.
    2. Files cannot be split across multiple tapes.
  - It's guaranteed that all tapes have the same size and that they will always be able to store the largest file.
  - Every time this process is executed, we already know the size of each file, and the capacity of the tapes. Having that in mind, we want to design a system that is able to count how many tapes will be required to store the backup in the most efficient way.
  - The parameter of your function will be a structure that will contain the file sizes and the capacity of the tapes. You must return the minimum amount of tapes required to store the files.
  - Example: Input: Tape Size = 100; Files: 70, 10, 20  Output: 2
+ Tree Processing
  - Given a binary tree and a positive integer, return the k-th element of the tree
  - No preprocessing or modification of the tree allowed
+ Find the celebrity
  - Given a set of n people, find the celebrity
  - Celebrity knows himself and no one else
  - Everyone knows the celebrity
  - You are given the following helper: know(x,y) returns true if x knows y, false otherwise
  - O(n)?
+ Poker Hand
  - Given a hand of 5 cards, determine the best hand that can be made from those cards (Royal Flush... High Card)
  -->
