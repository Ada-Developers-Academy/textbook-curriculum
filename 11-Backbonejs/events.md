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

As a demonstration of this technique, we will add functionality for adding a book to our library. This is what the high-level architecture will look like:

TODO DPR: expanded diagram similar to above but w/ event names

1. A user fills out and submits the "Add a book" form, triggering a `submit` DOM event
1. Our `submit` event handler will read the form data and use it to add a book to the collection
1. When the book is added, the collection will emit a `update` event
1. Our `update` event handler will re-build the table of books in the DOM

We will build these components in reverse order, starting with the handler for the `update` event, and then adding code to read the form and add a model to the collection.

### Building the `update` Event Handler

Let's look a little closer at that `update` event we mentioned earlier. This is a real event that Backbone collections emit automatically whenever a model is added to or removed from the collection. The `update` event was emitted yesterday when we called `bookList.add()`, but since we weren't yet listening for it nothing happened as a result.

How do we know that the `update` event will be triggered on `.add()`? By reading [Backbone's documentation for the `.add()` function](http://backbonejs.org/#Collection-add). Backbone also has a list of [all the events that are emitted automatically](http://backbonejs.org/#Events-catalog), which includes the arguments passed to the event handler. Very useful information!

Reading this list, we see that when Backbone invokes a callback for the `update` event it passes the collection that was updated as an argument. That means that our event handler needs to have the following structure:

```javascript
const updateHandler = (bookList) => {
  // Handle the update
};
```

What should our handler do? Usually an event handler is responsible for updating the DOM to reflect the current state of the model or collection. In this case, that means we need to rebuild the table of books.

Fortunately we've already got a function that does exactly that: `render()`. Render also conveniently takes a `BookList` as an argument. Of course the previous lesson was designed with this in mind, but it's also good that Backbone allows our code to follow a somewhat intuitive pattern.

The following code will register `render()` as an event handler for the `update` event.

```javascript
bookList.on('update', render);
```

**Question:** Where should this registration code be placed? Does it need to be inside `$(document).ready`? Why or why not?

**Question:** How would we test this code manually, to ensure we've connected all the pieces correctly?

### Triggering the `update` Event

Now that we've got our event handler in place, we need to build some code that triggers an `update` event by adding a model to our collection. This code itself will be an event handler, waiting for the `submit` even on the form.

Working with the person next to you, build this logic. Things to think about include:

- Where will you define this function?
- How will you read the values from the form?
- How will you turn these values into a new model in the collection?
- Where will you listen for the `submit` event?
- Do you need to prevent the `submit` event's default behavior?
- Do you need to clear the form?
- What sort of logging might you add to aid you in debugging?

We'll come back as a class and review this code. Once you're finished, you should have something like this.

TODO DPR: add resource from the `add-book` branch

## Sorting the Collection



## Summary

## Additional Resources
