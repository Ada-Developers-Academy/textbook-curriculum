# Interview Practice Exercises

With another student or two, practice using these problems on a whiteboarding exercise.  Use [Repl.it](https://repl.it) to practice online whiteboarding.

As you play the role of interviewer take notes on:

- Do they ask good clarifying questions.
- Do they test their code
- Do they cover necessary edge-cases
- Do they explain their thinking clearly

##  Max Consecutive Ones

Given a binary array, find the maximum number of consecutive 1s in this array.

**Example 1:**

```
Input: [1,1,0,1,1,1]
Output: 3
Explanation: The first two digits or the last three digits are consecutive 1s.
    The maximum number of consecutive 1s is 3.
```
Note:

- The input array will only contain 0 and 1.
- The length of input array is a positive integer and will not exceed 10,000

[Reference](https://leetcode.com/problems/max-consecutive-ones/)

## Pairs of Songs With Total Durations Divisible by 60

In a list of songs, the i-th song has a duration of time[i] seconds. 

Return the number of pairs of songs for which their total duration in seconds is divisible by 60.  Formally, we want the number of indices i, j such that i < j with (time[i] + time[j]) % 60 == 0.

**Example 1:**

```
Input: [30,20,150,100,40]
Output: 3
Explanation: Three pairs have a total duration divisible by 60:
  (time[0] = 30, time[2] = 150): total duration 180
  (time[1] = 20, time[3] = 100): total duration 120
  (time[1] = 20, time[4] = 40): total duration 60
```

**Example 2:**

```
Input: [60,60,60]
Output: 3
Explanation: All three pairs have a total duration of 120, which is divisible by 60.
```

Note:

- 1 <= time.length <= 60000
- 1 <= time[i] <= 500

[Reference](https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/)

## Merging Sorted Arrays

In order to win the prize for most cookies sold, my friend Alice and I are going to merge our Girl Scout Cookies orders and enter as one unit.

Each order is represented by an "order id" (an integer).

We have our lists of orders sorted numerically already, in arrays. Write a method to merge our arrays of orders into one sorted array.

**Example:**

```ruby
my_array     = [3, 4, 6, 10, 11, 15]
alices_array = [1, 5, 8, 12, 14, 19]

puts merge_arrays(my_array, alices_array)
# Prints [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
```

[Reference](https://www.interviewcake.com/question/ruby/merge-sorted-arrays?course=fc1&section=array-and-string-manipulation)

## Highest Value Palindrome

Palindromes are strings that read the same from the left or right, for example madam or 0110.

You will be given a string representation of a number and a maximum number of changes you can make. Alter the string, one digit at a time, to create the string representation of the largest number possible given the limit to the number of changes. The length of the string may not be altered, so you must consider 0's left of all higher digits in your tests. For example 0110 is valid, 0011 is not.

Given a string representing the starting number and a maximum number of changes allowed, create the largest palindromic string of digits possible or the string -1 if it's impossible to create a palindrome under the contstraints.

### Function Description

Complete the `highest_value_palindrome` function in the editor below. It should return a string representing the largest value palindrome achievable, or -1.

`highest_value_palindrome` has the following parameter(s):

- **s:** a string representation of an integer
- **n:** an integer that represents the length of the integer string
- **k:** an integer that represents the maximum number of changes allowed

### Input Format

The first line contains two space-separated integers, `n` and `k`, the number of digits in the number and the maximum number of changes allowed.
The second line contains a n-digit string of numbers.

**Constraints**

- 0 < n < 10^5
- 0 <= k <= 10^5
- Each character `i` in the number is an integer where 0 <= i <= 9.


**Output Format**

Print a single line with the largest number that can be made by changing no more than `k` digits. If this is not possible, print -1.

**Sample Input 0**

```
4 1
3943
```

**Sample Output 0**

```
3993
```

**Sample Input 1**

```
6 3
092282
```

**Sample Output 1**

```
992299
```

**Sample Input 2**

```
4 1
0011
```

**Sample Output 2**

```
-1
```

**Explanation:**

Sample 0

There are two ways to make 3943 a palindrome by changing no more than k=1 digits:

1. 3943 --> 3443
1. 3943 --> 3993

3993 > 3443 so we return 3993

[Reference](https://www.hackerrank.com/challenges/richie-rich/problem)

## Further Problems

You can find further problems on the [Questions from Previous Cohorts](https://docs.google.com/spreadsheets/d/1fEDgUvF3e7VVVzlkrV2X6_5nqFA7_34B7FdWsZUDxZc/edit#gid=677105308) document.