# Intro to Asynchronous Programming

## Learning Goals

- Know the definition for synchronous programming
- Know the definition for asynchronous programming
- Understand that asynchronous programming will ask us to anticipate what to do after the asynchronous process is finished

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

Unlike the food-delivery example from above, synchronous code **executes and finishes** in a very specific order. An analogy may be more like calling the restaurant and making the order; the restaurant asks what dishes you want, and they wait when you answer before proceeding to the next question.

## What is Asynchronous Programming?

[Asynchronous Programming](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Concepts) is a method of programming that intentionally breaks program flow in order to:
1. call actions/processes outside of program flow, so that the program doesn't stop for a result
2. define what happens when the result comes back

How asynchronous programming is actually possible depends on the implementation/way of executing asynchronous calls.

If we get to employ asynchronous programming into our programs, then we get to do interesting things that would normally require us to wait a long time **at the same time** as doing other things, without waiting for a long task to finish.

In order to do this well, though, we will have to write code that:
- uses specific technologies that support running asynchronous code (again, this is a matter of tools and environment)
- anticipate all of the cases of what happens while an asynchronous call is running

## How Do We Write Asynchronous Programming?

To write good asynchronous code, we will have to determine and write the following things:

1. The _asynchronous call/function that we are invoking_
    - How do we order the food?
1. What do we do after the asynchronous call finishes
    - What do we do after we receive the food deliver?
1. What do we do if the asynchronous call doesn't finish successfully
    - What do we do if the food never arrives? What do we do if the restaurant calls back and says that they are out of food? What do we do if the restaurant calls back and says they lost your order?
1. Ensure that the rest of the program runs correctly, without bugs, even if it does things while the asynchronous call is executing
    - If you are watching TV while waiting for the food to be delivered, how do we make sure that you aren't too hungry and you order another dinner?
    - If you are hanging out with a friend while waiting for the food to be delivered, and your friend asks you to feed them now, what do you do?

## Conclusion

Asynchronous programming is a big, broad subject. Traditionally, we have written a lot of code that runs in a very specific order (synchronous). However, certain technologies allow us to write asynchronous code, and we'll see plenty in JavaScript.

To write asynchronous code, we'll generally need to anticipate four things:
1. How do we make an asynchronous call?
2. What should happen if the asynchronous call finishes successfully?
3. What should happen if the asynchronous call doesn't finish successfully?
4. What other pieces of code are depending on this asynchronous call?

## An Optional Aside: A Deeper Look

JS Event Loop

## Resources

- [MDN's intro on General Asynchronous Programming Concepts](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Concepts)
- [MDN's intro to Asynchronous JavaScript](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous)
- [MDN's article on JavaScript's Event Loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop)