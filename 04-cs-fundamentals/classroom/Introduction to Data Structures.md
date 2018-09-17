# Introduction to Data Structures
## Learning Goals
+ Get familiar (at a high level) with different data structures:
  + Arrays
  + Linked Lists
  + Stacks
  + Queues
  + Graphs
  + Trees (Binary Trees, Binary Search Trees, Binary Heaps)

## Notes
Please see the slide deck linked at the bottom of this page.

### Study of data structures - What and Why
A common problem in Computer Science is managing large amounts of data and performing different operations on them. **Data Structures** provide different well-known ways to organize data. Each data structure follows its own set of rules on how the data should get organized. The study of data structures is to understand these rules. Alongside these governing rules, we are also looking to understand how different common operations like insert, delete and search work on each of these data structures and understand the average and worst case efficiency for the common operations. Knowledge of well-known data structures allows us come up with optimal designs to our real world, practical coding projects.

### How to approach the study of data structures
Each of the data structures follow _different rules that allow us to achieve certain intents_. e.g. a **Stack** data structure is a _linear_ data structure where all additions and all deletions must occur at one end, known as the _top_. This restriction makes it so that the data structure will always return the last item that was inserted. This property makes it so that stack becomes the optimal data structure of choice to design the _collate_ functionality in a printer's software. This is what allows for the last page to be printed first, the next to last and so forth so that the final output of printed pages appear in the correct order. As we'll see in future lessons, the *stack* design get used in how method calls work on a computer to form the *call stack*.

Each of the different ways of organizing the data _optimizes certain operations on the data_. For instance, we saw that the [Array data structure](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Arrays.md) is very efficient in retrieving the value of an element at a particular index with O(1) time complexity. However if the number of elements are going to change often due to frequent additions and deletions, Arrays are cumbersome to work with. If additions and deletions are going to be frequent operations and those operations being efficient is more important than retrieving the *k*th item in the data structure, then a **Linked List** would provide a better choice than Array data structure. _Knowing which operations a given data structure optimizes for and which operations are cumbersome or expensive on the data structure will allow you to choose the right design for your purpose._

Some data structures are _specialized versions of other data structures_. For example, a **graph** is a _non-linear_ data structure consisting of a finite set of _nodes_ and _edges_. A **tree** is a _connected_, _acyclic_ graph where one node is ditinguished as the _root_ of the tree and all other nodes are connected by a _directed_ edge from exactly one other node that is known as its parent. The directed edges in a tree connect from a parent node to its children node. A **binary tree** is a specialized form of a tree with the retriction that each node can have at the most two children. A **binary search tree** further retricts a binary tree and allows for sorted organization of data enabling fast searches in expected O(log n) time.

Some data structures could be _implemented using other data strucutres_. For example, a **stack** or a **queue**, can both be implemented using either an array or a linked list. In other words, behind the scenes, a stack or a queue is implemented simply as an array or a linked list with further restrictions added.


## Exercises
Here's the exercises we'll cover in class.
1. Design and implement a method that will return true if the two input strings are anagrams of each other, and false otherwise. What is the time and space complexity of this method?
2. Understand how delete and insert algorithms work on a static data structure like an array

## Assignments
Complete the string manipulation practice questions:
- [Ada-C10/string_reverse](https://github.com/Ada-C10/string_reverse)
- [Ada-C10/reverse_words](https://github.com/Ada-C10/reverse_words)
- [Ada-C10/reverse_sentence](https://github.com/Ada-C10/reverse_sentence)
- [Ada-C10/palindrome_check](https://github.com/Ada-C10/palindrome_check)
- [Ada-C10/encode_repeating](https://github.com/Ada-C10/encode_repeating)

## Additional Resources:
- Check if two strings are anagrams of each other: [anagram solved](http://www.geeksforgeeks.org/check-whether-two-strings-are-anagram-of-each-other/)

## Slide Deck
+ Slide Deck used in class</br>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://drive.google.com/file/d/0B__DV26QHsH4NFFtNGc0aWpZWXc/view?usp=sharing">Introduction to Data Structures</a></span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</br>
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br /> 
