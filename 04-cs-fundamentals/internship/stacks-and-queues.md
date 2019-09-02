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

An _Abstract Data Type_, is a type of object which is described by the methods it has and how they perform.  Implementation details are not included.  You could for example create a `List` class.  You can provide methods to add elements and even retriveve elements at a given index.  The user of your class never needs know if you used an array or linked list to store the information internally.  The class is called _abstract_ because the data structure's description is independent from it's implementation.  The process of providing only the public interface and hiding implementation details is known as _abstraction_.  We will examine & implement 2 different ADTs known as Stacks and Queues.

## Stacks

A Stack is a data structure which stores a list of data and only provides access in a Last-In-First-Out (LIFO) order.  You've seen stacks before at Ada.  When we discussed recursion we noted that function calls are saved on the system stack.  This is so the most recent function called is the first function returned to when the current function ends.

A Stack provides the following methods:

- **push(item)** - This method puts an item into the stack at the top.
- **pop** - This method removes and returns the item on the top of the stack.
- **is_empty** - This method returns true if the stack is empty and false otherwise.

A Stack might also implement a `peek` method which returns, but does not remove the item on top of the stack, and `size` which would return the number of items on the stack.

You can picture a Stack like a stack of plates where new plates can be added and removed from the top, but cannot be removed from the middle or bottom of the structure.

![Stack Diagram](images/stack.png)

### Implementation of a Stack

You can use any linear data structure to implement a stack.  For example you could implement a `Stack` class like this:

```ruby
class Stack
  
  def initialize
    @list = LinkedList.new
  end

  def push(item)
    @list.add_front(item)
  end

  def pop()
    return nil if self.empty?

    item = list.remove_front

    return item
  end

  def empty?()
    return @list.empty?
  end
end
```

You could later change the implementation of Stack to use an Array, but the users of the class would not need to change anything of their code.  This is because the implementation is hidden behind a public interface.

**Stack ADT**
![Stack ADT](images/stackADT.png)

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

