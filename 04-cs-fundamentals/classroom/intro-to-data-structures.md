# Introduction to Data Structures

## Learning Goals

- Get familiar (at a high level) with different data structures:
  - Arrays
  - Linked Lists
  - Stacks
  - Queues
  - Graphs
  - Trees (Binary Trees, Binary Search Trees, Binary Heaps)

## Video Lesson & Notes

- [Video Lesson]()
- [Slide Deck Used in Video]()
- [Class Exercises]()


## Study of data structures - What and Why

A common problem in Computer Science is managing large amounts of data and performing different operations on them. **Data Structures** provide different well-known ways to organize data. Each data structure follows its own set of rules on how the data should get organized. The study of data structures is to understand these rules. Alongside these governing rules, we are also looking to understand how different common operations like insert, delete and search work on each of these data structures and understand the average and worst case efficiency for the common operations. Knowledge of well-known data structures allows us come up with optimal designs to our real world, practical coding projects.

How we structure and interact with our data can drastically affect the runtime of our software.  It is not unusual to go from operations taking minutes or hours to ones taking seconds by reorganizing the data structures used.  As a software developer it's important to learn how to select the appropriate data structure for the situation.

## Arrays

An array is our first data structure.  As [we have discussed](Arrays.md) arrays are a _homogenous_ data structure where each element can be accessed using a unique whole number known as an _index_.  Arrays are also allocated as a contigous block of memory.  This can be very helpful when saving data or loading data from other media.  Arrays are also a _static_ data structure where once allocated they cannot be dynamically resized.  If an array runs out of space, another array needs to be created and the data copied to the new array.  Similarly if not all elements allocated are being used, the developer is responsible for determining how to indicate unused elements.  Often unused elements are set to `nil` or 0.  

Arrays have the following advantages:

- Quick access to any element using an index number
- Efficient operations when interacting with hardware as all elements are in a contigous block of memory
- It is fast to add data to an array with unused elements

On the other hand it can be quite expensive to delete elements from an array.

### Deleting An Array Element

To remove an element in the middle of an array, each element in a subsequent index must be shifted over one element.

So to delete an element at a specific index in an array.

```
# traverse the array from index to the end
while index < length - 1
  # move each element one index to the left
  array[index] = array[index+1]
  index += 1
end
# reduce the length of the array
length = length - 1
```

![delete array element](images/delete-array-element.png)

This is an O(n) operation as the number of elements to shift depends on the length of the array.

#### Array Deletion Alternative

Consider the problem, you have an elementYou could, rather than shifting elements over instead use a convention to mark cells deleted.  Unfortunately this leaves the array _fragmented_ where items are no longer guaranteed to be adjacent and leads to longer search times.  Which method is best depends on the number of searches on the array and the number of deletions.

### Inserting An Array Element

Similarly inserting an element into a specific index requires first shifting elements one index right before inserting the element.

```
current_index = length -1

while current_index > index_to_insert
  array[current_index] = array[current_index - 1]
  current_index -= 1
end

array[current_index] = new_value
```

![insert element at index](images/insert-array-element.png)

<!-- Original images at:  https://drive.google.com/file/d/1tpencaf-NOr7_ED4v8Jx9SKjplL81Mh8/view?usp=sharing -->

This depends on the array having adequate unused space at the end.  This requires O(n) time complexity.

### Limitations of Arrays & Static Data Structures

Arrays have a few limitations

- Inserting and deleting elements is an expensive O(n) operation
- You cannot add more elements than the size of the data structure

So if:

- The maximum size is unknown ahead of time
- Insertions and deletions are common

Then you are best to consider an alternative data structure.  

## Stacks



## Queues

## Linked Lists

## Binary Trees

### Binary Search Trees

### A Type of Tree Heaps

## Graphs

## How to approach the study of data structures

Each of the data structures follow _different rules that allow us to achieve certain intents_. e.g. a **Stack** data structure is a _linear_ data structure where all additions and all deletions must occur at one end, known as the _top_. This restriction makes it so that the data structure will always return the last item that was inserted. This property makes it so that stack becomes the optimal data structure of choice to design the _collate_ functionality in a printer's software. This is what allows for the last page to be printed first, the next to last and so forth so that the final output of printed pages appear in the correct order. As we'll see in future lessons, the *stack* design get used in how method calls work on a computer to form the *call stack*.

Each of the different ways of organizing the data _optimizes certain operations on the data_. For instance, we saw that the [Array data structure](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Arrays.md) is very efficient in retrieving the value of an element at a particular index with O(1) time complexity. However if the number of elements are going to change often due to frequent additions and deletions, Arrays are cumbersome to work with. If additions and deletions are going to be frequent operations and those operations being efficient is more important than retrieving the *k*th item in the data structure, then a **Linked List** would provide a better choice than Array data structure. _Knowing which operations a given data structure optimizes for and which operations are cumbersome or expensive on the data structure will allow you to choose the right design for your purpose._

Some data structures are _specialized versions of other data structures_. For example, a **graph** is a _non-linear_ data structure consisting of a finite set of _nodes_ and _edges_. A **tree** is a _connected_, _acyclic_ graph where one node is ditinguished as the _root_ of the tree and all other nodes are connected by a _directed_ edge from exactly one other node that is known as its parent. The directed edges in a tree connect from a parent node to its children node. A **binary tree** is a specialized form of a tree with the retriction that each node can have at the most two children. A **binary search tree** further retricts a binary tree and allows for sorted organization of data enabling fast searches in expected O(log n) time.

Some data structures could be _implemented using other data strucutres_. For example, a **stack** or a **queue**, can both be implemented using either an array or a linked list. In other words, behind the scenes, a stack or a queue is implemented simply as an array or a linked list with further restrictions added.

## Summary

We have looked, at a high-level, at a variety of data structures which we will examine in the course of CS Fundamentals.  

## Terms

| Term | Definition |
|--- |--- |
| Data Structure | A method of organizing, and managing information which enables efficient access and modification |
| Array | A homogenous collection of elements each identified by an index number or key.  |
| Linked List | |

## Resources

- [Basecs on Data Structures](https://medium.com/basecs/tagged/data-structures)
- [MIT Open Courseware Intro to Algorithms](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/)
- [Former slides used in this course](https://docs.google.com/presentation/d/11Xxhv2y1SJ-oBzrmzPuosB69MLxI2g23SA_eEgPIbws/edit#slide=id.p1)