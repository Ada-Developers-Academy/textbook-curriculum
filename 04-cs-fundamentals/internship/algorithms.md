# Introduction to Algorithms

## Learning Goals

By the end of this lesson you should be able to:

- Further explain time and space complexity
- Explain the term algorithm
- Explain two categories of algorithms _greedy_ and _divide and conquer_

## Video Lesson

- [Video Lesson]()
- [Slide Deck used for the lesson](https://drive.google.com/file/d/1G9bvJj4DJcLUVBiirtRG9lcb_VXVbhmd/view)

## What is an an algorithm

So what is an algorithm?  An _algorithm_ is a finite set of instructions that, if followed, accomplishes a particular task.  You can think of it as a series of steps to accomplish a task.  For example Google maps has an algorithm to calculate the best route to drive between any two points on map.  

All algorithms must have:

- Input
  - An Algorithm may accept zero or more inputs
- Output
  - An algorithm should produce some result
- Clarity
  - Each step in an algorithm should be a clear and unabigouous
- Finiteness
  - An algorithm should end after a finite number of steps. 
  - An algorithm cannot repeat forever (otherwise it doesn't solve a problem)
- Effectiveness
  - It should be possible for a person or computer to fulfill each step in an algorithm and the algorithm should accomplish the given task.

The art of computer science is really the art of devising, analyzing, proving the correctness and testing algorithms.

### Algorithms areas of study

The study of computer science is the study of algorithms.  Researchers in CS focus on:

- **Devising** algorithms
  - This is the art of using data structures and design strategies to develop new and useful algorithms
  - It also encompasses optimizing and generalizing existing algorithms
- **Validating** algorithms
  - This is the art of proving the correctness of an algorithm for all possible inputs
  - This is very similar to a mathematical proof
- **Analyzing** algorithms
  - This is identifying the time and space complexity of an algorithm
- **Testing** Algorithms
  - When we test an algorithm we are really debugging it.  
  - When we test an algorithm we run it on sample data and try to determine if it failed and if so correct the error.
  - We also _profile_ or conduct performance measurements by running the algorithm on sample data and measuring performance changes and memory usage.
    - If you have seen [leetcode](https://leetcode.com/), this site will take your solution to a common programming problem and compare it's performance to solutions from other developers.

**Question**

Now that hardware is so cheap and powerful and now that we have enormous cloud computing providers like AWS, is it worth wasting a programmer's valuable time trying to shave off seconds from the runtime of an algorithm?

## Analyzing Algorithms

When we analyze an algorithm we generally do not care how an algorithm performs on a specific input size.  Instead we look at how the runtime and memory usage changes as the input size grows.  Looking at how an algorithm's runtime and memory usage increases with increasing input is called, _Asymptotic Analysis_.

Why bother with asymptotic analysis?  Why bother with examining how an algorithm increases in runtime and memory usage as the input size increases?  This allows us to compare algorithms and select one over another.  It also allows us to judge if any algorithm will be able to solve a particular problem within a meaningful amount of time or the system's limited storage capacity.

Most often we measure things in terms of _worst-case_ performance of an algorithm.  This is important when response time and memory usage is critical like in managing a self-driving car or autopilot system.  There are also times where the _average-case_ performance is important, especially where an algorithm is run often or in many instance, like an analysis program run regularly on a cloud platform.

| Big-O | English Term
|--- |--- |
| O(1) | Constant |
| O(log n) | Logarithmic |
| O(n) | Linear |
| O(n<sup>2</sup>) | Quadratic |
| O(n<sup>3</sup>) | Cubic |
| O(2<sup>n</sup>) | Exponential |
| O(n!) | Factorial |


Analyzing Binary Search Trees

### Mergesort

## Categories of Algorithms

### Divide & Conquer

### Greedy

### Dynamic Programming

## Summary

## Resources

- [Geeks for Geeks on Greedy Algorithms and the Knapsack problem](https://www.geeksforgeeks.org/greedy-algorithms/)
- [HackerEarth: Basics of Greedy Algorithms](https://www.hackerearth.com/practice/algorithms/greedy/basics-of-greedy-algorithms/tutorial/)

## In Class
Divide and Conquer algorithms:
+ Merge sort
+ Binary Search Tree
Greedy algorithms:
+ Greedy sort - updated to be selection sort
+ Merging sorted lists
+ Knapsack problem
Introduction to Graphs and graph representation
+ Dijkstra's algorithm for shortest path

## Slide Deck
+ Slide Deck used in class</br>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://drive.google.com/open?id=1G9bvJj4DJcLUVBiirtRG9lcb_VXVbhmd">Introduction to Algorithms</a> <a href="https://drive.google.com/open?id=1RXNXuQjH8I76OcJaua5TTUMlbJ9l5kcX">Graphs</a></span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</br>
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a>
