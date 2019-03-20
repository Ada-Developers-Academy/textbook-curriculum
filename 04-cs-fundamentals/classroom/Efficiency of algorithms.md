# Algorithmic Efficiency
An _efficient algorithm_ is one that runs as _fast_ as possible and _requires as little computer memory_ as possible. You often have to settle for a trade-off between these two goals, compromising memory to make things faster, or speed to use less memory.

We consider performance of an algorithm in three different scenarios: Best-case, worst-case and average case.

Consider the task of performing a sequential search on some sort of list, i.e. an array. Best-case would be that your target value was found in the first element. Worst-case would be that the value was not there at all (so all elements would have to be compared and tested, including the last). Average-case would be mid-way between the two, and still dependent on the length of the list.

_In Computer Science, we care about worst case and average case, and represent these using asymptotic notation which we call Big-O._

This is because we need to plan our software systems to be performant in the worst case and average case scenarios.
- <b>Worst case consideration</b>: It is important to consider the worst case scenario when the response time is critical. e.g. the shutdown program for a nuclear power plant.
- <b>Average case consideration</b>: If an algorithm is to be used many times on many different instances, it may be more important to know the average execution time. e.g. calculating total cost for all the items in the shopping cart for a user for an e-commerce website like etsy.com or amazon.com

## Quantitative analysis of efficiency
So, we are interested in the efficiency of the algorithm in terms of the algorithm's <b>speed</b> and the algorithm's <b>memory utilization</b>. These are measured and described in terms known as <b>time complexity</b> and <b>space complexity</b> respectively.

Typically, we are interested in doing this analysis before a single line of code is written.

It stands to reason to ask <b>why</b> we are interested in deducing and quantitatively representing the efficiency of the algorithm. Here are the reasons:
1. To make quantitative judgments about the value of one algorithm over another.
1. To allow us to predict whether the software will meet any efficiency constraints that exist.

## Time complexity
While quantitatively representing the speed of an algorithm, we are looking to share _the rate of change of number of operations in an algorithm as the either the size or the value of the input to the algorithm changes_.

Let's consider an example: an algorithm reverses the values in the input array of integers.
Example; if the input array is:

Values  | 4 | 8 | 0 | 3 | 9
--------|---|---|---|---|---
Indices | 0 | 1 | 2 | 3 | 4 

the algorithm should change the input array to look like:

Values  | 9 | 3 | 0 | 8 | 4
--------|---|---|---|---|---
Indices | 0 | 1 | 2 | 3 | 4 

One approach to solve this problem is the following algorithm which swaps values within the array:
    <b>Check the input</b>:
    - If the array has no more than one element, then we are all done!
    <b>Initialize variables</b>:
    - `i` is an index for the first element in the array (`i` = 0)
    - `j` is an index for the last element in the array, set to the value of array length minus one.
    <b>Algorithm steps</b>:
    While `i` is less than `j` perform the steps below in a loop:
    - Swap the values at index `i` and `j`.
    - Increment `i`.
    - Decrement `j`.
    The array is reversed.

<b>Exercise</b>: 

## Space complexity
Similarly, while quantitatively sharing memory utilizaton of an algorithm, we are interested in sharing _the rate of change of amount of memory or space needed by an algorithm as the either the size or the value of the input to the algorithm changes_.

## Order Breakdown in Big O terms
To quantitatively represent the worst case performance for <b>speed</b> and <b>memory utilization</b> of an algorithm, we use the <b>Big O notation</b>, pronounced "big oh notation" or the <b>asymptotic notation</b>.

- *O(1)* is the no-growth curve. An *O(1)* algorithm's performance is conceptually independent of the size of the data set on which it operates. Such an algorithm is said to have *constant* time complexity. Array element access using index is O(1).
- *O(log n)* means that the data set size affects the efficiency of the algorithm in a *logarithmic* fashion. The key thing to note is that *log (base 2) n* grows slowly. Doubling *n* has a relatively small effect. Logarithmic curves flatten out nicely.
- *O(n)* says that the algorithm's performance is directly proportional to the size of the data set being processed. Such an algorithm is said to have *linear* time complexity. Scanning an array takes *O(n)* time.
- *O(n^2)* says that the algorithm's performance is proportional to the square of the data set size. This happens when the algorithm processes each element of a set, and for each element processing, another pass through all the remaining elements in the set is required. Such an algorithm is said to have *quadratic* time complexity. We'll see this when we look at some sorting algorithms in future lessons.

### Nuances
- Usually when an algorithm's growth rate is a mix of orders, the dominant order is shown, and the rest are dropped. *O(n^2) + O(n)* or *O(n^2 + n)* would be shortened to *O(n^2)*.
- Likewise, constants are dropped. Constants only shift our graph slightly, but do not affect the overall look of the graph by much. *O(2n)* is shortened to *O(n)*. *O(1⁄2 n)* is shortened to *O(n)*.

### Complexity Analogy
Consider a physical phone book as an example to illustrate Big O notation for algorithm complexity. Let's take a look at some of the use cases related to phone book:
- *O(1)* – Find a random person’s phone number by flipping open any page in the phone book.
- *O(log n)* – Given a person’s name, find the corresponding phone number (This is a binary search for a person’s phone number).
- *O(n)* – Find all people whose phone numbers contain the digit "5".
- *O(n log n)* – Sort a phone book’s pages by looking at the first name on each page. We'll look at such a sort algorithm in a future lesson.
