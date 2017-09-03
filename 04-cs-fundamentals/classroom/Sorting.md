# Sorting
<!--
## Presentation
+ [Sorting and Efficiency](https://drive.google.com/open?id=1elJdFGo1ZcEI8rcmWgbSUFS33b-DoB2z_cA1yRaM1ec)
-->
<!--
## Assignment
+ [AdaGold/big-o](https://github.com/AdaGold/big-o)
-->
## Homework before class
Watch the following videos, read the notes before class

+ Watch this [sorting algorithms' comparison demo](https://www.youtube.com/watch?v=ZZuD6iUe3Pc) and this [visualization](https://www.cs.usfca.edu/~galles/visualization/ComparisonSort.html)

## Notes

### Bubble Sort
BUBBLE SORT: O(n^2)
The bubble sort algorithm is a simple sorting algorithm that repeatedly steps through the list to be sorted, compares each pair of adjacent items and swaps them if they are in the wrong order. The pass through the list is repeated until no swaps are needed, which indicates that the list is sorted. The algorithm, which is acomparison sort, is named for the way smaller elements "bubble" to the top of the list. 

### Selection Sort
The selection sort works by selecting the smallest unsorted item remaining in the list, and then swapping it with the item in the next position to be filled.

![Selection Sort Example](images/selection-sort.png)

Selection sort has a complexity of O(n^2).

### Insertion Sort
The insertion sort works by inserting each item into its proper place in a final list. The simplest implementation of this requires two list structures - the source list and the list into which sorted items are inserted. To save memory, most implementations use an in-place sort that works by moving the current item past the already sorted items and repeatedly swapping it with the preceding item until it is in place.

![Insertion Sort Example](images/insertion-sort.png)

The insertion sort has a complexity of O(n^2). Unlike selection sort, insertion sort has a best case time complexity of O(n) when the items are already sorted.
