# Interview Questions - Algorithms

## Questions
+ Reverse words in a string (words are separated by one or more spaces). Now do it in-place. By far the most popular string question!
+ Reverse a string
+ Strip whitespace from a string in-place `void StripWhitespace(char* szStr)`
+ Remove duplicate chars from a string ("AAA BBB" -> "A B") `int RemoveDups(char* szStr)`
+ Find the first non-repeating character in a string:("ABCA" -> B ) `int FindFirstUnique(char* szStr)`
+ You are given an array with integers between 1 and 1,000,000. One integer is in the array twice. How can you determine which one? Can you think of a way to do it using little extra memory.
+ You are given an array with integers between 1 and 1,000,000. One integer is missing. How can you determine which one? Can you think of a way to do it while iterating through the array only once. Is overflow a problem in the solution? Why not?
+ Returns the largest sum of contiguous integers in the array Example: if the input is (-10, 2, 3, -2, 0, 5, -15), the largest sum is 8 `int GetLargestContiguousSum(int* anData, int len)`
+ Implement Shuffle given an array containing a deck of cards and the number of cards. Now make it O(n).
+ Return the sum two largest integers in an array `int SumTwoLargest(int* anData, int size)`
+ Sum n largest integers in an array of integers where every integer is between 0 and 9 `int SumNLargest(int* anData, int size, int n)`

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
