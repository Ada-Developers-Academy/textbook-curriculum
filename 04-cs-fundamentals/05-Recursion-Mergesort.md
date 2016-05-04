# Mergesort

## Assignment
+ [AdaGold/mergesort](https://github.com/AdaGold/mergesort)

## Notes
Mergesort is a recursive sorting algorithm. Mergesort works by splitting a list of elements in half repeatedly until reaching a list size of 1 or 0. Each half of the list is recursively sorted, and then merged back together to form the final sorted list. Like most recursive sorts, the merge sort has an algorithmic complexity of O(n log n). For the curious, [here's an explanation of Mergesort complexity](https://www.khanacademy.org/computing/computer-science/algorithms/merge-sort/a/analysis-of-merge-sort).

### Mergesort Algorithm
1. If the size of the array is larger than 1
  + Split the list in half.
  + MergeSort each half of the list.
  + Merge the sorted halves back together in order.
2. Otherwise, if the size of the array is not larger than 1
  + Assume an array of size 1 or 0 is in order.

### Mergesort Visualization
Let's look at it in action: [Mergesort Visualization](https://www.cs.usfca.edu/~galles/visualization/ComparisonSort.html)
