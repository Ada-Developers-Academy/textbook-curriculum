# Heaps

## Video Lesson & Slides

## Introduction

In this lesson we will introduce a new data structure, a heap!  Heaps are a great way to store information in a semi-order.  Essentially if you have a collection of data that you can sort or compare, you can add it to a heap.  A heap maintains a [complete binary tree](https://web.cecs.pdx.edu/~sheard/course/Cs163/Doc/FullvsComplete.html).  In a complete binary tree each level is full except the last, and the last level is filled from left-to-right.  Further, in a heap each parent has a specific order-relationship with it's chilren.  In a Min-Heap every parent node is less than it's child nodes.  In a max-heap, every parent node is greater than it's parent nodes.

Below is a drawing of a Max-Heap.

![Heap Diagram](images/heap.png)

<!-- Image source:  https://drive.google.com/file/d/17cH7vfyZg-PFlULi-bO2K4H61oc4pCDT/view?usp=sharing -->

On the other hand this is **not** a Max-Heap.  Notice that 47 on the bottom level is greater than 25, it's parent.

![Invalid Max-Heap](images/invalid-max-heap.png)

This is also **not** a Max-Heap.  The last level is not full from left-to-right.  The 20 should be the left-child of 35.

![Another Invalid Max-Heap](images/invalid-max-heap2.png)

## Implementation

While you **can** implement a heap with linked TreeNode objects, it can be **much** easier to implement a heap with an array.

Consider if the root is at index 0, the left child could be at index 1, and right index 2.  The child of index 1 would be at index 3 and 4 while the children of index 2 are at 5 and 6... we could write a formula to find the children of a node at index _i_.

`left_child = i * 2 + 1`
`right_child = i * 2 + 2`

So this heap in array format would be:

![Heap Diagram](images/heap.png)

Array format:

![Heap as an Array](images/heap-as-array.png)

### Adding An Element

To add an element to a heap, you place it into the end of the array (or the next logical leaf).  Then you do a heap-up operation comparing the new node to it's parent and swapping them if they are out of order.  Then, if a swap occured repeat the operation using the new node's updated location.

Below is an example of adding a node to a heap.

![heap-up diagram](images/heap-up.png)

When finished the heap could look like this.

![Heap-up finished diagram](images/add-element-finished.png)

Pictured with an array it would look like this:

![heap-up with an array](images/heap-up-array.png)

The add method would look like this:

```ruby
# This heap is sorted by key-value pairs
def add(key, value)
  @store << HeapNode.new(key, value)

  # Compare the new node with it's parent
  # If they are out of order swap and heap-up
  # using the parent's index number.
  heap_up(@store.length - 1)
end
```

**Exercise** Write pseudocode for the heap-up method using an array implementation for a heap.  Then compare your steps with your neighbor.

#### Add Node Time Complexity

Adding a value to the end of the array is an O(1) operation.  Performing the heap-up operation will at worst-case perform 1 swap per level of the heap.  Since there are `Log n` levels to the heap, then adding a node is a O(log n) operation.



## Uses for Heaps

### Priority Queues

Once use for a heap is a _Priority Queue_.  A priority queue is an abstract data type, like a stack or a regular queue.  However with a queue items are added and removed in a first-in-first-out (FIFO) order.  Priority queues remove items with the highest priority items removed first.  By using a heap to implement a priority queue you can build a data structure to serve data by priority.  


### 

### Heapsort

## Resources

- [Basecs on Heaps](https://medium.com/basecs/learning-to-love-heaps-cef2b273a238)
- [Basecs on Heapsort](https://medium.com/basecs/heapify-all-the-things-with-heap-sort-55ee1c93af82)
- [Geeks for Geeks on Heaps](https://www.geeksforgeeks.org/heap-data-structure/)
