# Introduction to Recursion
## Learning Goals
  + Understand what is recursion
  + Trace through a recursive function call and understand time and space comlexities
  + Author a recursive algorithm and explain time and space complexities

## Notes
So far we have only learned how to solve problems iteratively using loops.  We will now learn how to solve problems recursively by having a method call itself.  


### Parts of a recursive algorithm
A Recursive algorithm has two parts:
1. If the problem is easy, solve it immediately.
2. If the problem can't be solved immediately, divide it into smaller problems, then:  Solve the smaller problems by applying this procedure to each of them.

We call a problem that can be solved immediately a *base case* and a problem that divides the problem into a smaller problem a *recursive case*.

So a recursive algorithm is really made up of:
- At least one base case.
- At least one recursive case.

### An example: factorial
Let’s consider the mathematical concept factorial.  In order to calculate a factorial of a number *n*, denoted as *n!*, you multiply all the numbers from n down to 1. The base cases are for numbers 0 and 1: 1! = 1, 0! = 1.

So,
5! = 5 * 4 * 3 * 2 * 1
10! = 10 * 9 * 7 * 6 * 5 * 4 * 3 * 2 * 1
3000! = 3000 * 2999 * 2998 * 2997 * … * 3 * 2 * 1

We could also state 5! = 5 * 4 * 3 * 2 * 1 as:
	5! = 5 * 4!
	4! = 4 * 3!
	3! = 3 * 2!
	2! = 2 * 1!	And we know 1! = 1

So, in general:
n! = n * (n-1) * (n-2) * (n-3) * … * 1

Which broken down to model a recursive algorithm is:
- If simple, Solve it immediately --> 1! = 1, 0! = 1
- If not simple, solve a small piece and then try to solve the rest --> n! = n * (n-1)!

If we were to divide this concept into a recursive definition, we might say:
- If n = 1, return 1
- If n > 1, return n * (n-1)!
We call this the *static view* of a recursive method.  Basically the static view is the mathematical way of looking at a recursive problem.

Mathametically, factorial can be explained as:</br>
*0! = 1*</br>
*n! = n × (n-1)!*      if *n > 0*</br>
The second statement shows the **recurrence relationship** while computing factorial of a number.


### Code it
Once we know what the base case(s) and the recursive case(s) of a problem are, we can then write the code.

**Given**:
Factorial
- factorial(1) = 1
- factorial(n) = n * factorial(n-1)

We can code this as:
```ruby
def factorial(n)
  if n == 1
    return 1
  else
    return n * factorial(n-1)
  end
end
```

or

```ruby
def factorial(n)
  return 1 if n == 1
  return n * factorial(n-1)
end
```

### Trace through an example
When we follow what's happening as we make a recursive call, it can be hard to keep track of variables and results since there can be many activation records (or method calls). Trace what you expect to show up on the stack: the function call along with parameters e.g. *factorial(3)* shows up on the stack. Then it makes a recursive call, so *factorial(2)* gets pushed above it on the stack. With another recursive call, *factorial(1)* gets pushed on the stack. *factorial1)* is the base case. It returns 1 and *factorial(1)* gets popped from the stack. This return value of 1 is multiplied to 2, and 2 gets returned by factorial(2) as it gets popped from the stack. The stack frame for *factorial(3)* get popped after 3 is multiplied with the returned value of 2. 6 gets returned as the final value of *factorial(3)*.

### Understanding space and time complexities for the example



<!--
Need to think through the following and update
### Why (or why not) Recursion?
Some problems are naturally recursive.  If you can easily identify a base case and a recursive case, then a recursive method might be easier to write and understand.  Sometimes a recursive method just makes more sense than an iterative method.  All recursive methods can be written iteratively.

However, recursive methods come at a cost.  Recursive methods use a lot of memory because each activation requires more memory to be allocated for each parameter and local variable.

### Writing a recursive method
When writing a recursive method, try the following:
- Think about how you can reduce the problem to one or more simpler sub-problems of the same form.
- Think about what information you need to give to the sub-problems (the parameters).
- Think about what information you want back from the sub-problems (the return type).
- Write the method header.
- Think about the base case: When is the answer so simple that we know the answer without recursing?
- Think about the recursive case: How are we going to break the problem into a smaller problem (by calling out method again) and get closer to the base case?
Write the code.
- Write a method specification (like the static view of the problem) that explains exactly what it will do in terms of the parameters. Include any preconditions.
- Test out your code with several different cases.

## Presentation
+ [Recursion](https://drive.google.com/open?id=1nnjCzrJ1-j-4t20Je0o5KgOa1-N53WQuOywApqsmqxc)

## Assignments
+ Assigned: [AdaGold/recursion-tracing](https://github.com/AdaGold/recursion-tracing)
+ Optional: [AdaGold/recursion-writing](https://github.com/AdaGold/recursion-writing)

## Additional Resources:
- This content assumes a good understanding of [understand a function call](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Understanding%20function%20calls.md)

## Slide Deck
+ Slide Deck used in class</br>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://www.slideshare.net/secret/hYxKn9Azw2bUFs">Introduction to Recursion</a></span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</br>
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br /> Please use the <strong>Download</strong> button and play the slide show locally (PowerPoint works best). Without this, the animations which are necessary in understanding the solutions will not render properly.
-->
