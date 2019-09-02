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

You could later change the implementation of Stack to use an Array, but the users of the class would not need to change anything of their code.  This is because the implementation is hidden behind a public interface.  The top of the stack would reference the last element in the array.

**Stack ADT**
![Stack ADT](images/stackADT.png)

**Exercise**:  Implement a `top` method which returns the top of the stack without changing the stack.

**Exercise**:  Write a method which takes a string as an argument.  Return the string reversed using a Stack.

### The Function Stack

As methods get called in an application, the system stores the current instruction addresses, local variables etc on a stack known as the _system call stack_.  Then when a method ends, the topmost method is popped off the stack allowing the system to resume execution.

![Memory Layout Diagram](images/memory-layout.png)

The diagram below shows the memory used by a running application.  At the top, the text in the application, and global variables are stored.  Below them is the dyanmic data allocated.  At the bottom the system stack stores the functions called.

```ruby
def function_a(x)
{
   y = 4
   z = function_b(x, y)
   puts “The number is #{z}"
}

def function_b(int x, int y)
  # pause application
  return x + y;
end

x = 3
function_a(x)
```

For the code snippet above, the stack frame at the `# pause application` line would look like this:

![Stack frame example](images/call-stack.png)

<!-- Graphic saved at: https://drive.google.com/file/d/1SsxrrqIIw5oYonpKzwxvXAF3lTcQmB10/view?usp=sharing -->

As the application starts the system puts the main part of the application on the stack, and then main calls `function_a`.  So the system saves the arguments to `function_a` onto the stack, the address to return to (Main) when the method is finished and the local variabes in `function_a`.  Then `function_b` is called and the system saves the arguments to `function_b` onto the stack, the return address (function_a) and any local variables in `function_b`.  When function_b finishes, it's stack frame is popped off the stack, and the return address is used to resume `function_a`.  When `function_a` finishes the same pop operation is performed and the application returns to main.  When the main part of the application is finished, it's stack frame is popped off and the application terminates.  

When an error is raised, the stack is popped until the error is rescued in the current method, or the application terminates and a trace of all the elements on the stack at the time of the error is reported.

## Queues

A queue unlike a stack operates in a first-in-first out order.  Like a line of people at a concert, the first element to enter the queue is the first element removed.  
![Queue Diagram](images/queue.png)

As shown above elements are added to the back of the queue in an operation called _enqueue_ and removed with an operation called _dequeue_.  

Queues are great for any operation that needs to work with data in a first-in-first-out order.  For example some systems have worker processes which can be assigned tasks to work on and these worker processes take on jobs assigned to them in the order they appeared, completing one before taking on the next.

**Exercise**: With pseudocode implement a `front` method which returns the item at the front, but leaves the Queue unchanged without directly accessing any methods of the Queue except `dequeue`, `enqueue` and `empty?`.  Feel free to use any other data structures.

A Queue provides the following methods:

- **enqueue(item)** - This method puts an item into the back of the queue.
- **dequeue** - This method removes and returns the item at the front of the queue.
- **is_empty** - This method returns true if the queue is empty and false otherwise.

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
