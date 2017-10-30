# Array data structure, Introduction to efficiency of algorithms
## Learning Goals
+ Arrays – as a data structure
  + How Array data structure or (native) arrays or arrays in strongly typed languages differ from objects of Ruby’s Array class
  + Algorithms related to Array data structure on unsorted and sorted data
    + Compute length given termination character
    + Search for a value
    + Find largest value
    + Find smallest value
    + Reverse an array
+ Introduction to Efficiency of Algorithms
  + Why we care about it
  + What do we care about: Time & Space
  + How to deduce efficiency and compare two algorithmic solutions to the same problem.

## Notes:
### Algorithm Efficiency
An _efficient algorithm_ is one that runs as fast as possible and requires as little computer memory as possible. You often have to settle for a trade-off between these two goals, compromising memory to make things faster, or speed to use less memory.

We consider performance of an algorithm in three different scenarios: Best-case, worst-case and average case.

Consider the task of performing a sequential search on some sort of list, i.e. an array. Best-case would be that your target value was found in the first element. Worst-case would be that the value was not there at all (so all elements would have to be compared and tested, including the last). Average-case would be mid-way between the two, and still dependent on the length of the list.

*In Computer Science, we care about worst case and average case, and represent these using asymptotic notation which we call Big-O.*

### Order Breakdown
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

## Essential Reading
Here's some good follow up reading after we meet in class:
  + [Big O notation and complexity in Ruby](https://devblast.com/b/big-o-notation-complexity-ruby) by DevBlast

## Exercises
Here's the exercises we'll cover in class.
Given an array data structure holding integer values, device an algorithm for the following exercises.
1. Compute the length of the array, given that the array is terminated by `nil` i.e. `array[length] = nil`.
2. Return the value at index k, such that 0 <= k < length.
3. <strong>Linear Search</strong> Search for a given integer value in the unsorted array. Return true if the value if found in the array. Return false otherwise.
4. Return the maximum (or minimum) integer value in the unsorted array.
5. Return the maximum (or minimum) integer value in a sorted array.
6. <strong>Binary Search</strong> Search for a given integer value in a sorted array. Return true if the value if found in the array. Return false otherwise.
7. Reverse the elements in the array in place.

## Assignments
Assignments are expected to be worked on after the class discussion and due before the next class.
1. Fork, clone and complete the methods in using_restricted_array.rb on [Ada-C8/Restricted-Arrays-Part1](https://github.com/Ada-C8/Restricted-Arrays-Part1). See the readme file for details. Submit your PR after testing your code.
2. Watch this [Video: Big O Notation](https://www.youtube.com/watch?v=v4cd1O4zkGw) by Gale Laakmann McDowell
3. Solve this [quiz](https://www.khanacademy.org/computing/computer-science/algorithms/asymptotic-notation/e/quiz--comparing-function-growth) by Khan Academy.

## Additional Resources:
Videos and additional reading material for furthering your learning for curiosity on topics related to what we covered in class:
   + [Big O notation, time and space complexity](https://www.interviewcake.com/article/python/big-o-notation-time-and-space-complexity?) by interview cake
   + [Binary Search](https://www.khanacademy.org/computing/computer-science/algorithms#binary-search) by Khan Academy
   + Work through [this quiz](http://www.codequizzes.com/computer-science/beginner/big-o-algorithms) on Big O. Try out the code snippets and read the answers.
   + Read about [Asymptotic Notation](https://www.khanacademy.org/computing/computer-science/algorithms#asymptotic-notation) by Khan Academy.

## Slide Deck
+ Slide Deck used in class</br>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://drive.google.com/file/d/0B__DV26QHsH4eHJqTWttLUdNZk0/view?usp=sharing">Array data structure and Introduction to Efficiency of Algorithms</a></span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</br>
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />
