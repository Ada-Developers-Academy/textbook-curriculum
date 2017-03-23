# Recursion

## Presentation
+ [Recursion](https://drive.google.com/open?id=1nnjCzrJ1-j-4t20Je0o5KgOa1-N53WQuOywApqsmqxc)

## Assignment
+ Assigned: [AdaGold/recursion-tracing](https://github.com/AdaGold/recursion-tracing)
+ Optional: [AdaGold/recursion-writing](https://github.com/AdaGold/recursion-writing)

## Notes
So far we have only learned how to solve problems iteratively using loops.  We will now learn how to solve problems recursively by having a method call itself.  

A geeky definition of recursion is as follows:
Recursion – see Recursion.

### Parts of a recursive algorithm

A Recursive algorithm has two parts:
1. If the problem is easy, solve it immediately.
2. If the problem can't be solved immediately, divide it into smaller problems, then:  Solve the smaller problems by applying this procedure to each of them.

We call a problem that can be solved immediately a *base case* and a problem that divides the problem into a smaller problem a *recursive case*.

So a recursive algorithm is really made up of:
- At least one base case.
- At least one recursive case.

### An example: factorial

Let’s consider the mathematical concept factorial.  In order to calculate a factorial (!), you multiply all the numbers from n down to 1, knowing that 1! = 1, 0! = 1.  

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

### Code it

Once we know what the base case and the recursive cases of a problem are, we can then write the code.

Given:
Factorial
- factorial(1) = 1
- factorial(n) = n * factorial(n-1)

We can code this as:
```
def factorial(n)
  if n == 1
    return 1
  else
    return n * factorial(n-1)
  end
end
```

or

```
def factorial(n)
  return 1 if n == 1
  return n * factorial(n-1)
end
```

### Trace through an example
When we follow what's happening as we make a recursive call, it can be hard to keep track of variables and results since there can be many activation records (or method calls). I like to use "bubbles" to show the activation calls (the activation stack). One day I'll add pictures here of that. For now, see the video.

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
