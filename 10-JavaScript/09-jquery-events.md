# jQuery Eventing

## Learning Goals
- See jQuery events
- Use jQuery events to manipulate the DOM

## First, let's see an example
Here is [an updated version](http://codepen.io/kariabancroft/pen/gLaBve) of the CodePen example we used with intro to jQuery.

This example is using the `click` event. When the item that we have selected is clicked, it will do the action that we've specified in the corresponding click function. The function that the event is associated with is referred to as a __callback__. In this case, there are anonymous functions because they exist only for this click purpose but are not used anywhere else.

```javascript
$("#someId").click(function () { // this is an "anonymous function"
                                 // we define it here and pass it to the
                                 // .click() function. When a click happens,
                                 // this function is called.
  /* Do something here! */
});
```

The jQuery `click()` function, waits for a user event--in this case the
user clicking the element with their mouse--and then calls the
function that you provide (the callback) when that event happens.

## More Events
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
