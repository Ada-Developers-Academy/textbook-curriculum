# Recursive Programming Strategies

In this lesson we will look at some programming strategies, Divide & Conquer and Dynamic programming, and how they can be used to solve recursive problems.

## Video Lesson

- [Video Lesson]()
- [Slides](https://docs.google.com/presentation/d/12RqNPG1B1ZTOijfKfL99Ewv4w1p6bR-L7Sj2EHN3Fv4/edit#slide=id.p1)
- [Exercise](https://github.com/Ada-C12/recursive-dynamic-programming)

## Learning Goals

By the end of this less you should be able to:

- Explain what a divide & conquer solution is
- Write some divide & conquer solutions
- Explain the concept of dynamic programming
- Explain the concept of memoization
- Use dynamic programming to optimize programming solutions

## Divide & Conquer

_Divide & Conquer_ is an algorithmic paradigm.  This means it's an approach to problem solving.  You have already seen such solutions previously.  When we wrote a binary search, we we will revisit below we divided the problem into an easier-to-solve subproblem and then solved the subproblem.  As we will see MergeSort works similarly.  

When we write a divide & conquer solution we normally:

1. Break the problem into subproblems of the same type.
1. Recursively solve the subproblems
1. Combine the solved subproblems to solve the larger problem

### Example:  Binary Search

We will start with a previously discussed algorithm, Binary Search. 

With binary search we select the middle of the given range in an array.  If we find the element we return it.  Otherwise we determine if the element is in the left or right of the array and performs binary search in the proper half.  

Each iteration divides the array in half and performs the binary search on a smaller subproblem.

```ruby
def recursive_binary_search(array, to_find, low = 0, high = array.length - 1)
  mid = (high + low) / 2

  return nil if high < low

  if array[mid] == to_find
    return mid
  elsif array[mid] > to_find
    return recursive_binary_search(array, to_find, low, mid - 1)
  else
    return recursive_binary_search(array, to_find, mid + 1, high)
  end
end
```

You can see a nice animation of Binary search on [Daniel Liang's website](http://www.cs.armstrong.edu/liang/animation/web/BinarySearch.html).

### Example:  QuickSort

QuickSort is a sorting algorithm which takes  a divide & conquer approach to solving these steps.

1. If the array is only one element or empty, you are done, the array is sorted.
1. Pick an element from the array as a _pivot_.
1. Move all elements smaller than the pivot to the left and all elements larger than the piviot to the right.  Note that the pivot is now in the correct index.
1. Perform QuickSort on the left and right sides of the pivot.

![QuickSort](images/Quicksort.png)

So in terms of Divide & Conquer, you pick a pivot and move elements smaller to the left and larger to the right and you have two smaller subproblems.  Then you call quicksort on each section, which is a smaller subproblem.

If the pivot is relatively well chosen you will divide the list `log n` times, and shift at most `n` elements with each level of division arriving at an O(n log n) runtime.

**Weakness of QuickSort**: The Pivot

Notice however we said, **if** the pivot is well chosen.  If the pivot does not break the list into two relatively equal subarrays it will not arrive at an O(n log n) runtime.  Instead it will approach O(n<sup>2</sup>) runtime.

For example if with each iteration the pivot is the smallest remaining element in an array, rather than splitting the array into approximately n/2 sized pieces, instead you have one subarray of size n-1.

### Example:  MergeSort

Merge sort is a *divide-and-conquer* algorithm. It involves the following three stages:

1. **Divide** the array into two sub-arrays at each step until each sub-array is of size one.
1. **Sort** each sub-array. (An array of size one is sorted by default.)
1. **Merge** the sub-arrays into one array by combining two sub-arrays into one at each step.</br></br>

This is usually done by keeping track of three indices in the array: *starting index*, *ending index* and *midway index* as shown in the image below. </br></br>

![Merge Sort Example](images/MergeSort.png)

</br>As you can see in the image above, in the first *divide* step, the original array of size eight gets divided into two sub-arrays of size four each. This is done by setting *starting index* to *0*, the index of the first element in the array and the *ending index* set to the index of the last element in the array. The *midway index* is then computed using the formula: </br>
&nbsp;&nbsp;&nbsp;&nbsp;*midway index* = (*starting index* + *ending index*)/2

For the first *divide* step, the *midway index* will be *(0+7)/2* i.e. *3* (by considering the floor of *3.5*).</br>
In the next *divide* step, we have two sub-arrays, one ranging in index from *0* to *3* and the other ranging in index from *4* to *7*. The sub-arrays are not yet of size one. So, the same action gets repeated to compute the *midway index*. This *divide* stage continues until the original array of size *n* is reduced to sub-arrays of size *1* each.

A sub-array of size one is trivially, and by default sorted.

The *merge* stage starts by combining two sub-arrays at a time. While combining the sub-arrays containing *7* and *2* respectively, the values in each is compared, the smaller value i.e. *2* is written to the lower index, and the higher value i.e. *7* is written to the higher index. The mergining process continues in this manner. An auxiliary array of size *n* is often used to faciliate the merge steps. 

Consider the two sub-arrays *[1, 2, 7, 8]* and *[3, 5, 6, 9]* in the final merge step in our example image above.

- We start with comparing *1* with *3*. The smaller value, *1* gets written to the auxiliary array. (Auxiliary array: *[1]*)
- Next, we compare *2* with *3*. *2* gets written to the auxiliary array. (Auxiliary array: *[1, 2]*)
- Next, we compare *7* with *3*. *3* gets written to the auxiliary array. (Auxiliary array: *[1, 2, 3]*)
- Next, we compare *7* with *5*. *5* gets written to the auxiliary array. (Auxiliary array: *[1, 2, 3, 5]*)
- Next, we compare *7* with *6*. *6* gets written to the auxiliary array. (Auxiliary array: *[1, 2, 3, 5, 6]*)
- Next, we compare *7* with *9*. *7* gets written to the auxiliary array. (Auxiliary array: *[1, 2, 3, 5, 6, 7]*)
- Next, we compare *8* with *9*. *8* gets written to the auxiliary array. (Auxiliary array: *[1, 2, 3, 5, 6, 7, 8]*)
- At this point, all elements of the first sub-array have been merged. So, all remaining elements of the second sub-array get copied over linearly to the auxiliary array. In this case, only one element is left in the second sub-array. So, *9* gets copied over to the auxiliary array. (Auxiliary array: *[1, 2, 3, 5, 6, 7, 8, 9]*)

This two-way merging continues until there are no more sub-arrays and the orignal array is completely soorted. Finally, the auxiliary array gets linearly copied back to the original array.

**Analysis:** The time complexity of merge sort is *(n log n)*. Let's look closer to understand this.

- **Divide**: Finding the midway index is a straightforward computation (*midway index* = (*starting index* + *ending index*)/2). This takes constant time regardless of the subarray.
- **Merge**: Merging a total of *n* elements takes *O(n)* time. If there are two sub-arrays of size *n/2* each, then we will compare one element from one sub-array with another element from the second sub-array and one of the two will get copied. This step will continue until all are copied, taking a total of *O(n)* time.
- As the sub-problems get smaller, the number of sub-problems doubles at each level, but the merging time halves. The doubling and halving cancel each other out and so the merging takes *O(n)* time at each level of the merge steps (as seen in the image above). 
- **Base case**: In the base case, we have sub-arrays of size *1* and a total of *n* subarrays. It takes *O(1)* time to sort an array of size one. Overall, merging at base level is *O(n)* time, just like any other level.
- **Count of levels**: Starting with *n* elements and reducing by half at each level, until we reach one element sized array takes *log n* steps. Similarly, starting with sub-arrays of one element each and combining two sub-arrays at a time until we reach an array of *n* elements also takes *log n* steps.
Overall, each level takes *O(n)* time. There are *O(log n)* such levels. Resulting in an overall time complexity of O(n log n) for merge sort.

Note: We will look closer at merge sort and its implementation when we discuss *Recursive algorithms* in the future.

For small arrays insertion sort performs better than merge sort, but as the size of the array grows merge sort becomes much more performant.  There are other O(n log n) sorting algorithms, notably [Quick Sort](https://www.geeksforgeeks.org/quick-sort/), and [Heap Sort](../internship/heaps.md).

## Dynamic Programming

Dynamic programming is a way to optimize a recursive or iterative solution.  When we see a problem that repeatably involves solving the same problem repeatably we can optimize it by using Dynamic programming.  The key concept is to recognize subproblems we solve repeatably and store the solutions to those problems, also called _memoizing_, to use the stored solutions in solving larger problems.

Dynamic Programming is in some ways similar to Divide & Conquer.  A Dynamic Programming problem breaks the problem into subproblems and saves the solutions to those subproblems.  The key difference is that in dynamic programming the subproblems are often overlapping and stored.  In a divide and conquer problem the larger problems is divided into two non-overlapping subproblems and the solutions to each subproblem is used to solve the larger problem.

### Fibonacci

The classic Fibonacci sequence is inherently recursive, but also inefficient to solve in a straightforward recursive manner.  

In the Fibonacci sequence Fib(n):

Fib(0) = 0, for n = 0
Fib(1) = 1, for n = 1
Fib(n) = Fib(n-1) + Fib(n-2), for n > 1

We could code the Fibonacci sequence as follows:

```ruby
def fibonacci(n)
  if n == 0 || n == 1
    return n
  end

  return fibonacci(n-1) + fibonacci(n-2)
end
```

However this is widely inefficient.  Note below for the Fibonacci of 5, how `Fibonacci(2)` is called 3 times.  `Fibonacci(1)` is called 5 times.  As `n` grows larger, this occurs more and more often.  For any n > 1, we end up making 2<sup>n</sup> method calls!  

![Fibonacci of 5, note how the same subproblems are repeatably called](images/fibonacci-inefficient.png)

Instead of solving the same problems over and over again we can solve these problems by storing them  in a `memo` and using the stored subproblems to make calculating the larger problem more efficient.

Below we have dynamic programming solutions, both iterative & recursive.

```ruby
# Iterative Solution
def fibonacci(n)
  if n == 0 || n == 1
    return n
  end

  solutions = [0, 1]
  current = 2

  while current < n
    solutions << solutions[current - 1] + solutions[current - 2]
    current += 1
  end

  return solutions[current - 1] + solutions[current - 2]
end

# Recursive Solution

def fibonacci_recursive(n)
  return fib_helper([0, 1], 2, n)
end

def fib_helper(solutions, current, n)
  return n if n == 0 || n == 1

  if current == n
    return solutions[n - 1] + solutions[n-2]
  end

  solutions << solutions[current - 1] + solutions[current -2]
  return fib_helper(solutions, current + 1, n)
end
```

**Question** Note how to solve Fibonacci(n) we only need Fibonacci(n-1) and Fibonacci(n-2).  Can we reduce our space complexity from O(n) to O(1).  Discuss with your neighbor how you can do so for the iterative solution.

### Problem:  Longest Common Subsequence

**With your neighbor attempt to solve the following problem:**

Given two strings `text1` and `text2`, return the length of their longest common subsequence.

A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.

If there is no common subsequence, return 0.

#### Example 1:


**Input:** text1 = "abcde", text2 = "ace" 

**Output:** 3 

**Explanation:** The longest common subsequence is "ace" and its length is 3.
 
#### Example 2:

**Input:** text1 = "abc", text2 = "abc"

**Output:** 3

**Explanation:** The longest common subsequence is "abc" and its length is 3.

#### Example 3:

**Input:** text1 = "abc", text2 = "def"

**Output:** 0

**Explanation:** There is no such common subsequence, so the result is 0.
 
## Terms

| Term 	| Definition 	|
|---	|---	|
| Divide & Conquer 	|  In computer science, divide and conquer is an algorithm design paradigm based on multi-branched recursion. A divide-and-conquer algorithm works by recursively breaking down a problem into two or more sub-problems of the same or related type, until these become simple enough to be solved directly. The solutions to the sub-problems are then combined to give a solution to the original problem.	|
| Dynamic Programming 	| The algorithmic strategy of breaking a problem down into subproblems  in such a way to solve repeated subproblems and use the stored results to solve a larger problem.  |
| Memoization | An optimization technique used primarily to speed up algorithms by storing the results of subproblems and returning the cached result when the same subproblem occur again. |
| Pivot | An element used in Quicksort to divide the array into two sections, one section less than the pivot and the other greater than the pivot.  The choice of the pivot has enormous implications to the efficiency of QuickSort.


## Summary

In this lesson we looked at two common strategies for solving programming problems Divide & Conquer and Dynamic Programming.  Each strategy involves breaking down a large problem into easier-to-solve subproblems.

In a divide and conquer solution we break a large problem into one or more smaller subproblems and then use the solution to the subproblems to solve the larger problem.  

In a Dynamic Programming approach subproblems are solved saved for use in solving larger instances of the problem.  In this manner you often exchange larger space complexity for smaller time complexity.

## Resources

- [Wikipedia Divide & Conquer](https://en.wikipedia.org/wiki/Divide-and-conquer_algorithm)
- [Geeks for Geeks - Dyanmic Programming](https://www.geeksforgeeks.org/dynamic-programming/#basicProblems)
- [Ugly Number Problem](https://www.geeksforgeeks.org/ugly-numbers/)
- [Quora - How should I explain dynamic programming to a 4-year-old?](https://www.quora.com/How-should-I-explain-dynamic-programming-to-a-4-year-old/answer/Jonathan-Paulson)
