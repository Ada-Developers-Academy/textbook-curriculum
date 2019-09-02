# Stacks & Queues

## Learning Goals

By the end of this lesson you should be able to:

- Describe the Stack & Queue data structures
- Explain the concept of an Abstract Data Type (ADT)
- Implement a Stack and a Queue using a linked list or an array
- Use Stacks and Queues to solve problems

## Introduction

At Ada we have often talked about hiding implementation details behind a public interface.  In this lesson we will look at two common data types which can be implemented in a variety of ways, Stacks and Queues.  Both data structures are described by what they do, rather than how they are written.  This is different from a linked list in that they key feature of a linked list is that it is implemented by linking nodes together into a chain.  A Stack on the other hand is a set of methods and how they behave.  The internals of a stack can be done in any number of ways.  So this lesson could be called an introduction to abstract data types.  

## Abstract Data Types (ADT)

## Stacks

**Exercise**:  Implement a `top` method which returns the top of the stack without changing the stack.

**Exercise**:  Write a method which takes a string as an argument.  Return the string reversed using a Stack.

### The Function Stack

## Queues

**Exercise**: Implement a `front` method which returns the item at the front, but leaves the Queue unchanged without directly accessing any methods of the Queue except `dequeue`, `enqueue` and `empty?`.  Feel free to use any other data structures.


### Queue Implementation Considerations

Linked Lists

Arrays

## Exercises

1. Given a Binary Search Tree where each node contains links to the left and right children and an integer value. Implement pre-order traversal for a binary search tree using **iterative** approach.

Note the recursive solution to preorder is as follows:

```ruby
def preorder(current_node, list)
  list << current_node.value
  # Add the left node to the system stack and do preorder on the left
  preorder(current_node.left, list) 
  # Add the right node to the system stack and do preorder on the right
  preorder(current_node.right, list)

  return list
end
```

2. Write a function to print all integer values in a binary tree in breadth first traversal iteratively. (Hint: Use a Queue.)
3. Describe how you would implement a Queue using 2 Stacks.
4. Describe how you would implement a Stack using 2 Queues.


## Summary

## Terms & Terminology

| Term      | Description |
| ----------- | ----------- |
| Abstract Data Type (AD)      |  A type of data structure described by a set of operations it can perform.  It is abstract because the details of implementation are not included.  Thus for example, one developer could implement a Stack ADT with a linked list and another could use an array.       |
| Stack   | An Abstract Data Type which stores data in a Last-in-first-out (LIFO) order.  The first element added will always be the last element removed, and the most recent element added will be the first removed.         |
| Queue   | An Abstract Data Type which stores data in a First-In-First-Out (FIFO) order.  The first element stored in the data structure will be the first element removed.  You can think of a Queue as a line, where the first person to get in line is the person served first.         |

## Resources

- [Geeks for Geeks on Queue Implementation with a circular array](https://www.geeksforgeeks.org/implementation-deque-using-circular-array/)

