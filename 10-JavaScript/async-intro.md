# Intro to Asynchronous Programming

## Learning Goals

- Know the definition for synchronous programming
- Know the definition for asynchronous programming

## A Pizza Metaphor

Imagine the laziest, most exhausted Friday evening at home. It's dinner time, and you have no food in your freezer or fridge, and you aren't about to go grocery shopping, and nobody will make dinner for you. You are going to make a phone call to your favorite restaurant (they're not on an app) and order a dinner for yourself to be delivered to your bed.

There is a series of things that happens between the moment you make the order right to the point where you take the first bite.

In pain-staking detail, with a neighbor, outline all of the actions you would do that start at picking up the phone, and end at eating your meal.

<details>
  <summary>
    No, seriously. Take 3 minutes to make a list of the actions you do. After that, then read more here.
  </summary>

  What we imagine most people saying is that they somehow make the order, then wait for the order, and then eat.

  It's actually way more likely that people say they make the order, then **while they wait for the order, they do other things,** like read, shower, sleep, watch TV. **You are only able to eat your food after the food order has been** received, cooked, assembled, assigned a driver, driven over, and **delivered to you**.

  This is all to point out that two processes happened at the same time. One process was the food order being received, made, and delivered. The other process was your life: You didn't stop everything you were doing and sit on the couch and stared at the wall while you were waiting for food. Or maybe you did! The point is, you didn't **need** to stop executing other actions while you were waiting for your food. You were able to do plenty of other actions and processes while the food-delivery process was working and finishing.

  Lastly, **once the food delivery happened, you knew what action you had to do next: receive the food and then eat it!**

  Throughout this lesson, we can keep in mind these two questions:
  1. When does this line of code "finish"?
  1. What do we do when this line of code "finishes"?

</details>

## We have been writing Synchronous Code this whole time!

The code that we've always written has been [synchronous](https://developer.mozilla.org/en-US/docs/Glossary/synchronous) code. This means that our code has always finished executing an entire line of code before proceeding to the next line of code.

For example, observe this Ruby code and this JavaScript code which do the same thing:

```ruby

def say_apples
  puts "apples"
end

def say_oranges
  puts "oranges"
end

say_apples
say_oranges
```

```javascript
const sayApples = function() {
  console.log('apples');
}

const sayOranges = function() {
  console.log('oranges')
}

sayApples();
sayOranges();
```

Both code snippets print out `apples` first, and then `oranges` second, because we call the method/function that prints `apples` first, and we call the method/function that prints `oranges` second. If we need to change the order of how these print, we need to change the order of the lines of code.

### Analogy

Unlike the food-delivery example from above, synchronous code happens in 

## What It Means For Our Code

Implications...

Ways we have to shift our thinking...

## How Do We Write Asynchronous Code?

Write code for what happens afterwards...

Not just that, but for what happens on every case...

## An Optional Aside: A Deeper Look

JS Event Loop

## Resources

- [MDN's intro on General Asynchronous Programming Concepts](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Concepts)
- [MDN's article on JavaScript's Event Loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop)