# Practicing Interview Problems

| TASKS - You have three tasks to complete -- they are highlighted in the text below `like this`.
|-------------------------------------------------
| 1. Read Articles
| 2. Come up with some example answers to chitchat questions.
| 3. Come up with two solutions to the problem at the end. |

Technical interviews can be stressful, but like most anything else, they are a learned, practiced skill. DON'T PANIC! Technical interviews are not necessarily about evaluating the validity of your solution, but often are more about evaluating a candidate's technical communication skills and problem solving approach.

`Read these articles:`  
+ [Coding Interview Tips: How to get better at technical interviews without practicing](https://www.interviewcake.com/article/coding-interview-tips)
	- `Come up with 1 example for each of the following:`
		1. example of an interesting technical problem you solved
		1. example of an interpersonal conflict you overcame
		1. example of leadership or ownership
		1. story about what you should have done differently in a past project
+ [Big O Notation: Using not-boring math to measure code's efficiency](https://www.interviewcake.com/article/big-o-notation-time-and-space-complexity)

If you approach problems systematically, and communicate clearly, you'll be most of the way there.

## Problem Solving approach

1. **Understand the Probem**
   * Ask your interviewer questions
   * Draw a picture of what you understand
   * Create a specific example

1. **Devise a plan**
   * What is the simplest approach that you can think of?
   * Have you solved any similar problems
   * Outline your approach in plain English
   * Draw a picture of your data structure

1. **Execute the plan**
   * Turn your plain language description into code
   * Write whiteboard code slowly
   * Check each step
   * Ask questions / call out places where you don't know the syntax

1. **Check your answer**
   * Run examples through your whiteboard code
   * Think about the number of steps that your solution takes
   * Can you improve your solution? Red, Green, Refactor!

## Example Problem: Reversing a Linked List

***Problem statement***: Given a linked list ```l```, write a method ```reverse``` that takes ```l``` as input and then returns a linked list ```rev_l``` which has its values in reverse order. You may mutate the list ```l```.

A linked list is defined via the following class:

```
class ListItem
  attr_accessor :value, :nxt
  def initialize(val, nxt = nil)
    @value = val
    @nxt  = nxt
  end
end
```

Each ListItem has a ```value``` method which returns the value stored in the list item, and a ```next``` method that returns the next ListItem if it exists and ```nil``` if that item does not exist.

`Try to come up with *two* solutions to this problem. You do not need to code/test your solution for realz, just sketch out the psuedocode and run through a test case or two. Explain why 1 solution is better than the other. If you cannot come up with two solutions on your own: compare with a peer and discuss pros/cons of each solution.`
