# jQuery Event Handling

## Motivation
- Users do things all the time: clicking on buttons, highlighting text, pressing keys
- Being able to respond to these events is the core of making a web page dynamic

## Learning Goals
- See jQuery events
- Use jQuery events to manipulate the DOM

## jQuery Event Handling
### First, an Example
Here is [an updated version](http://codepen.io/kariabancroft/pen/gLaBve) of the CodePen example we used with intro to jQuery.

There are two new pieces, both of which look something like this:

```javascript
$('.dynamic-list').click(function() {
  $(this).addClass('list-thinking');
})
```

We use jQuery to select an element with the class `dynamic-list`, and then call the `click()` function on it. `click()` has one argument: a function to be called when the user clicks on the element. The function that the event is associated with is referred to as a _callback_.

In this case, the _callback function_ is _anonymous_, that is, defined inside the list of arguments instead of being assigned to an external variable. This isn't strictly necessary - we could just as easily have defined a named function and used it instead - but using anonymous functions for callbacks is a pretty common pattern in JavaScript.

The jQuery `click()` function waits for a user event--in this case the user clicking the element with their mouse--and then calls the function that you provide (the callback) when that event happens.

### This Looks Familiar...
We've seen something very similar to this jQuery event handling syntax in the past:

```javascript
$(document).ready(function() {
  // Do some stuff, manipulate the DOM
});
```

We use this to make sure the HTML document has finished loading before we start messing with it. Turns out `ready()` is just another event. The only difference is it's triggered by the browser automatically rather than by something the user does.

### More Events
There are a number of important jQuery events that we want to be aware of. `click` is one of the most common. Another set of events that we'll want to use are those related to keyboard events:
- `keydown`
- `keypress`
- `keyup`

Note that each of these have a slightly different and nuanced behavior. Also, the __key codes__ used for each are slightly different. For our purposes we will only examine [`keydown`](https://api.jquery.com/keydown/).

The way we invoke this method is similar to the click event, but we act on a keyboard action rather than a mouse action. The other relevant difference is that we care which key has been pressed, as opposed to the click event which is more relevant to the item we clicked on.

Let's see this [updated example](http://codepen.io/kariabancroft/pen/woKYRR):

```javascript
$("body").keydown(function(event) {
  if (event.key == 'a') {
    alert('You got an A!');
  }
});
```

Notice the `event` argument to our callback. This will get filled in with a bunch of info about what happened to trigger the event - for example, which key was pressed, exactly when the event occurred, and where the mouse was on the screen when it happened. The `event` argument has actually been available for all our events so far, we've just been ignoring it.

#### Exercise: Color Switching
[Using this CodePen](http://codepen.io/droberts-ada/pen/pNRbJd), build a script that changes the background color of the color-box div each time the spacebar or enter key is pressed.

Hints:
- Calling `nextColor()` will get the name of the next color to switch to.
- If you have a jQuery element named `target`, and you call `target.removeClass()` with no arguments, it will remove all classes from that element.
- Detecting keys like space and enter is a little different than letter keys. Look it up!
- `console.log()` is your friend.

## What Have We Accomplished?
- Learn how to listen for user events
- Explore some different types of events, including clicks and key presses

## Additional Resources
- [MDN on events](https://learn.jquery.com/events/introduction-to-events/)
- [jQuery: event.which()](https://api.jquery.com/event.which/)
