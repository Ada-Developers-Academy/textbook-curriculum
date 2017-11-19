# Working with Backbone Events

In this lesson we'll look at Backbone's event handling behavior, one of the big advantages Backbone provides over raw JavaScript objects. We will use this to build two new types of functionality for our BackBooks app: adding and sorting.

## Learning Goals

By the end of this lesson, you should be able to:

- Describe what a Backbone event is
- Register a callback function for an event
- List some of the events emitted by collections, including `update` and `sort`

## Backbone Events

Backbone models and collections can emit events. This works almost exactly like the DOM events we've already seen. The big difference is that while DOM events are triggered in response to user actions, Backbone events are triggered when our data changes.

TODO DPR: Maybe move this code down to the vocab section, to give a clear running example?

We listen for Backbone events in the same way we listen for DOM events: using the `.on()` function. For example, to listen for a `update` event on our `bookList`, we would use the following code.

```javascript
let updateHandler = (list) => {
  // do some work, handle the update
};
bookList.on('update', updateHandler);
```

Once this code has ben run, whenever our `bookList` emits a `update` event the `updateHandler()` function will be called. Neat!

Why is this important? **It means we can separate code that updates the model from code that updates the DOM.** In practice, this allows us to simplify and DRY our code that handles DOM events.

TODO DPR: diagram. Something like
```
     => DOM event handler (jQuery) =>
DOM                                    Model / Collection
     <= Backbone event handler     <=
```
### Event Vocabulary

Before we go any further, let's review our vocabulary around event handling. This vocab is general - it applies not just to DOM events and Backbone events in JavaScript, but to event handling in any language.

**Trigger:** When an event happens, we say that the event has been _triggered_.
- A user _triggers_ a `click` event by clicking a button
- Our code _triggers_ a `update` event on the `bookList` whenever it adds a book to the list

**Emit:** We might also say that an object _emits_ a `click` event. This usually indicates we're focused more on how our program responds the event than on what caused it.
- The button _emits_ a `click` event
- The `bookList` _emits_ a `update` event

**Event Handler:** Code that responds to an event is called an _event handler_ (sometimes _handler_ for short). In JavaScript, this will usually take the form of a callback function.
- In the above code, `updateHandler()` is an _event handler_

**Listen / Register:** When we associate a handler with an event, we say we are now _listening_ for the event. We also say that we have _registered_ an event handler.
- In the above code, we are _listening_ for a `update` event
- We have _registered_ the `updateHandler()` function as an event handler

## Adding Models to a Collection

## Sorting the Collection

## Summary

## Additional Resources
