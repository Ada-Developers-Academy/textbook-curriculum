# Create a Fortune Teller in Javascript
Create an object in JS that will allow you to read a fortune. Your object should contain a way to __instantiate__ the JS object with the name of your fortune teller.

You should have one method, `read` that takes no parameters and __returns a string__ which represents a random choice from a (short) Array of fortunes. The string shall also contain the name of the fortune teller.

## How should it work?
The following code should run once you've written your code. Use it as a template for how to structure your objects and function(s).

```javascript
let myFortune = new Fortune("Ada");
reading = myFortune.read();
console.log(reading); // "Ada says: 'Try again later.'"
```

## HINT:
Creating a random number in JS is much harder than in Ruby, so we've provided that to you here:
```javascript
Math.floor(Math.random() * fortunes.length)
```
