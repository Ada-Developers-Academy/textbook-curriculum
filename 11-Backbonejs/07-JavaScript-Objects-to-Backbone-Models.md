# Scrabble-JS Total Conversion to Backbone.js!

We've already done Scrabble & Player objects in Javascript.  Now we'll take those generic objects and turn'em into Backbone Models! 

## Learning Goals
With this live code/lecture you should develop the following skills:
- Learn how Backbone Models compare with pure Javascript Objects.
- Learn how to adjust Jasmine tests for Backbone models


### Baseline Setup
The starting code with Scrabble & Player objects are located [here](https://github.com/CheezItMan/scrabble-js-to-backbone).  The file has two JavaScript files `src/scrabble.js` and `src/player.js`.  It also has two spec files `spec/scrabble_spec.js` and `spec/player_spec.js`.  

Go ahead and fork & clone the repo.  

Then take a minute to look at the `scrabble.js` and `player.js` together with your partner to get a bit familiar with them.  

#### Commands
Because this uses the scaffold you still need to run `npm install` after forking and cloning the repository. **You do not need to run** `npm start` as we won't have a web application.

To run your tests you should use the command `npm test`.  **Please Run your tests before starting to make sure things are working.**

#### Using the REPL
If you want to interact with the Scrabble objects in the terminal via a REPL, you'll need to do things in a specific way (due to the scaffold's use of webpack).

To access the REPL you should use the command `npm run repl` in your project directory. Once in the REPL, you'll need to use the following syntax to import your file (this example assumes it was named `src/scrabble.js`):


```javascript
const Scrabble = require('scrabble').default;
console.log(Scrabble.score("Ada"));

const Player = require('player').default;
var player1 = new Player("Ada");
console.log(player1.hasWon());
```

### A brief word on `const`

In JavaScript `const` is used to create a constant, in i.e. a variable which cannot be reassigned or changed.  You have to initialize the constant on the same line in which you declare it.  

## Converting Scrabble to a Backbone Model

Scrabble is a fairly simple JavaScript object. It has only 3 functions, one of which is a helper function.  `scoreLetter()` and `highestScoreFrom()`.  So we can first Modify it by changing the generic object to instead extend Backbone.Model.

```javascript
const Scrabble = Backbone.Model.extend({

});
```

The argument to `extend` is a JavaScript object listing attributes and functions that any new instance of the model will have.  The second is optional and we'll skip it here.  

Since the generic Scrabble object only has a few functions, no instance data, that makes a conversion relatively straightforward.

As an example if we wanted to give a function `sample()` to Scrabble we could do it this way:

```javascript
const Scrabble = Backbone.Model.extend({
  sample: function() {
    console.log("This works!");
  }
});
```

Notice that the function has the `name: function() { ...` syntax instead of `Scrabble.prototype.name = function() {...`.  We can convert the scoreLetter function this way.

```javascript
const Scrabble = Backbone.Model.extend({
  scoreLetter: function(letter) {
    letter = letter.toUpperCase();
    var letters = ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T', 'D', 'G', 'B', 'C', 'M', 'P', 'F', 'H', 'V', 'W', 'Y', 'K', 'J', 'X', 'Q', 'Z'];
    var scores = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 8, 8, 10, 10];
    for (var i = 0; i < letters.length; i++){
      if (letters[i] == letter){
        return scores[i];
      }
    }
    return 0;
  }
});
```

### Convert Scrabble.js to a Backbone Model.

Now you & your partner work to convert the rest of the `scrabble.js` file to a Backbone Model.

Then run the tests with `npm test`.

### Check-In

Now check your results with [this Gist](https://gist.github.com/CheezItMan/b8e420690c99b532a4399927480eb153).


## Converting Player to Backbone

Player is a bit more complicated, the player has some instance data, plays and name and a bunch of instance methods.  We'll take a two step approach, one step to get it working and then to improve our code and make it a bit more "Backbony&trade;".  

### Getting the darn thing working!

First we can convert the constructor to an `initialize()` function.

```javascript
const Player = Backbone.Model.extend({
  defaults: {
  },
  initialize: function(options) {
    this.name = options.name;
    this.plays = [];
    this.scrabble = new Scrabble();
  },
});
```

Notice that we changed this:

```javascript
const Player = function(name) {
  this.name = name;
  this.plays = [];
  this.scrabble = new Scrabble();
};
```

to this:

```javascript
initialize: function(options) {
  this.name = options.name;
  this.plays = [];
  this.scrabble = new Scrabble();
}
```
Because the initialize function plays much the same role as a constructor in Backbone we do many of the same actions in the initialize method.  

We also left the defaults object in, just so we can add to it later at the end.

Before working on your own, you will also need to modify the `beforeEach()` function in the spec file to look like this:

```javascript
beforeEach(function() {
  player = new Player({
    name: "bob"
  });
});
```

*Note:* `beforeEach()` is a handy way to DRY-up your testing code.  It gets run before every test.

### Now add the rest of the functions

Next you and your partner finish migrating the rest of the functions into the Backbone Model.

Then run your tests with `npm test`

### Check-in

When you finish you can check your code [here](https://gist.github.com/CheezItMan/3034de6f979b27e36144bf14b1088018):  

### Creating Instances of Player

You can then create new player instances with:

```javascript
var player1 = new Player({
  name: 'Ms. Lovelace'
});
```

### Making it Backbony!

For this we need to understand the difference between Backbone attributes (which you get and set with the `get()` and `set()` functions).  Like we did above, we've added instance variables `plays` and `name` to instances of the model.  The alternative is to use Backbone attributes set in the `defaults` object or using the `set` function.  

#### Why Use Backbone Attributes?

For what we're doing so far, Backbone Attributes are a bit of overkill, but they do provide a few features which could be useful in... Tic-Tac-Toe!

1.  Changing a Backbone Attribute triggers the `change` event on the model, which can be critical in rendering a model using a view.  
1.  Backbone has a `fetch()` and a `save()` function which could potentially help you connect a model with a server's API to get and save data, assuming the attributes match attributes specified in the API.  Hmmm... maybe reading an API ahead of time is a good idea.  Don't worry, if they don't exactly match, there's a work-around.  

You can convert plays and name to attributes here.

```javascript
// src/player.js
const Player = Backbone.Model.extend({
  defaults: {
    plays: [],
    name: "Player-?"
  },
  initialize: function(options) {
    this.scrabble = new Scrabble();
  },
	...
```

People can still create a new player as before:

```javascript
var player1 = new Player({
  name: 'Ada Lovelace'
});
```




## What!  All My Tests Broke!

Yes, the tests were written using instance variables instead of using `get()` and `set()`, and yes **OMG** that's a lot to change.  

Don't worry, you can find working tests [here](https://gist.github.com/CheezItMan/2d617fc903bf381c549b2859cc13c0bf).

The primary changes in the JavaScript tests are:

1.  Convert direct changes of an attribute to use the `set()` function.  `player1.name = "bob";` to `player1.set('name', 'bob');`
1.  Convert reads of the attribute to use the `get()` function.
1.  You will have to change the `beforeEach()` function to create the Player in a Backbone fashion


## JS Objects vs Backbone Models

Backbone Models are JavaScript Objects with a number of additional functions inherited from Backbone.Model.  

When you use Backbone Models you need to remember:

1.  You can decide how the model is set up with the `initialize()` function.  
1.  Instance functions are passed in via an object in the 1st argument to the `extend()` function.
1.  Backbone attributes are useful when you want to synch data with a server via an API or when you want the `change` event to trigger when they are modified.  

## What Did We Learn here?

1.  JavaScript objects can be quickly converted into Backbone Models
1.  Backbone Model attributes are special instance variables that can be accessed with `get()` and `set()` functions and  can both trigger events when they are modified and can be synched with an API (more on that later).
1.  We've practiced using Jasmine to test our Backbone Models


# Resources & Notes
-  Thanks to Emily for the original JavaScript code
-  [Backbone & Jasmine Testing](https://www.youtube.com/watch?v=GqEzbKoKbsI&t=1144s)
	- [Source Code](https://github.com/brendajin/jasmine-backbone)

