# Backbone Collections

## Learning Goals

At the end of this you should be able to:
- Explain what a Backbone collection is
- Place models into a collection
- Manipulate models in a collection
- Respond to events emitted by collections

## Introduction

In Backbone a Collection is a type of Model that has other Model instances inside it.  You can think of it as similar to an Array: an ordered collection of Models.  

Using a Collection instead of an Array will bring us similar benefits to using a Model instead of a raw JavaScript Object. Collections can abstract away complex bits of logic (like only selecting Models that match a condition), they're really good at talking to APIs, and they emit events when they change.

This lecture will be split into two parts, similar to the Models lecture. In the first part, we will retrofit our task list app to use a Collection instead of an array of Models, without adding any new functionality. In the second part, we will take advantage of this Collection to add a feature: the ability to delete a task.

## Adding a Collection
### Defining the Collection
The first thing we need to do is create the collection itself.  Our collection will get its own file: `app/collections/task_list.js`. As with models and views, we will call `extend()` on `Backbone.Collection`.

```javascript
// app/collections/task_list.js
import Backbone from 'backbone';
import Task from 'app/models/task';

var TaskList = Backbone.Collection.extend({
  model: Task
});

export default TaskList;
```

### Assembling the Collection
In `app.js`, we'll create a new instance of our Collection from our raw task data, and pass it to our View. First, import our new `TaskList` constructor:

```javascript
// app.js
import TaskList from 'app/collections/task_list';
```

Second, in `$(document).ready()`, instead of passing in an array of JavaScript objects when we create the `TaskListView`, we'll use them to create a `TaskList` and pass that instead.

```javascript
// app.js
$(document).ready(function() {
  var taskList = new TaskList(taskData);
  var application = new TaskListView({
    el: $('#application'),
    model: taskList
  });
  application.render();
});
```

Just like you can create a Model from a raw JavaScript object, you can create a Collection from an array of raw JavaScript objects.

Remember that a Collection is just a special type of Model. This means we can pass the Collection in under the `model` property, and Backbone will mostly know what to do. In fact, most of the changes to `TaskListView` will involve _removing_ code.

### Using the Collection
We'll need to tinker with `TaskListView` in a few places - everywhere it interacts with our list of tasks. [Here is a diff](https://gist.github.com/droberts-ada/a1e6ed27aea789d5fddf545c843058b6/revisions?diff=split) if you find such things helpful.

#### addTask()
First, let's change the `addTask()` function we wrote in the model lecture. We'll no longer be working with raw JavaScript objects, so we'll accept a task Model instead, and we'll just create a view for it and add that view to our list.

```javascript
// app/views/task_list_view.js
var TaskListView = Backbone.View.extend({
	// ...

	// Create a card for a task and add that card to our list of cards.
  addTask: function(task) {
    // Create a card for the new task
    var card = new TaskView({
      model: task,
      template: this.taskTemplate
    });

    // Add the card to our card list
    this.cardList.push(card);
  },

	// ...
});
```

#### initialize()
Next, `initialize()`. We don't need to create an empty array to store tasks, since they now live in `this.model` (our Collection). Similarly, we'll need to loop through `this.model` to add cards. Because we've already changed `addTask()`, the inside of the loop can stay the same.

```javascript
var TaskListView = Backbone.View.extend({
  initialize: function(options) {
    // ...

    // We'll keep track of a list of task models and a list
    // of task views.
    this.cardList = [];

    // Process each task
    this.model.forEach(function(task) {
      this.addTask(task);
    }, this); // bind `this` so it's available inside forEach

    // ...
  },
	// ...
});
```

#### createTask()
Finally, since `addTask()` has changed, in `createTask()` we need to turn the raw task we get from `getInput()` into a task Model and add it to our Collection. We can almost get away with a one-line change.

```javascript
// Get the input data from the form and turn it into a task
var TaskListView = Backbone.View.extend({
  // ...
  createTask: function(event) {
    // ...

    // Get the input data from the form and turn it into a task
    var task = new Task(this.getInput());

    // Create a card for the task
    this.addTask(task);

    // Add the task to our Collection
    this.model.add(task);

    // ...
  },
  // ...
});
```

### Render on Update
Our app should be back to a functional state, but there's one more change we should make now, still in `TaskListView`. Remember how bummed out we were in the last lecture about calling `render()` in `createTask()`? Well now that our View is backed by a Collection, we can do something about it.

From the [Backbone docs](http://backbonejs.org/#Collection-add), when a Model is added to a Collection the collection will emit to events: an `'add'` event and an `'update'` event, in that order. Several other actions, such as removing a Model, will also trigger the `'update'` event.

Our strategy will be to listen to both events. The `'add'` handler will create a card for the newly added model, and add it to our list of cards. The `'update'` handler will re-render the page. Conveniently, we already have functions that do both these things: `addTask()` and `render()`. Because the events will always be emitted in that order, we know that the new card will be ready by the time `render()` is called.

We'll add a couple calls to `this.listenTo()` inside `TaskListView.initialize()`:

```javascript
var TaskListView = Backbone.View.extend({
  initialize: function(options) {
    // ...

    // When a model is added to the collection, add a card for it
    this.listenTo(this.model, 'add', this.addTask);

    // Re-render the whole list when the collection changes
    this.listenTo(this.model, 'update', this.render);
  },
	// ...
});
```

Now we can remove the calls to both `addTask()` and `render()` from `createTask()`. The result is a much more compact function:

```javascript
var TaskListView = Backbone.View.extend({
  // ...

  createTask: function(event) {
    // Normally a form submission will refresh the page.
    // Suppress that behavior.
    event.preventDefault();

    // Add the task to our Collection
    var rawTask = this.getInput();
    this.model.add(rawTask);

    // Clear the input form so the user can add another task
    this.clearInput();
  },

  // ...
});
```

#### Check-in Point
Right now, your application should have the same functionality as before: tasks can be created and marked complete. Your code should look [like this](https://gist.github.com/droberts-ada/a1e6ed27aea789d5fddf545c843058b6).

## Deleting Tasks
The next feature we will add to our task list app is the ability to a delete a task. This will give us exposure to how Collections interact with the Models they contain, as well as the types of events emitted by Collections.

**Question:** Given what we've seen so far with Models, what code will we need to change to achieve this feature? What will the control flow look like in the app once it's done?

### Setup
First, we need to add a delete button. Since tasks should be deleted one by one, we'll add it to our template next to the "Mark Complete" button.

```html
<button class="button small-6 large-2 columns complete-button">
	Mark <%= task.complete ? "Incomplete" : "Complete" %>
</button>
<button class="alert button small-6 large-2 columns delete-button">
	Delete
</button>
```

### Handling DOM Events
Next, we'll listen to click events on our button and do something about them. Since the button is owned by the `TaskView`, that's where our click handler will go, just like the click handler for the "Mark Complete" button.

```javascript
// app/views/task_view.js
var TaskView = Backbone.View.extend({
	// ...

	events: {
    "click .complete-button": "completeHandler",
    "click .delete-button": "deleteHandler"
  },

  deleteHandler: function() {
    // Show a popup box asking the user for confirmation
    if (window.confirm("Are you sure you want to delete this task?")) {
      this.model.destroy();
    }
  },

	// ...
})
```

### Handling Collection Events
We're not quite finished. `this.model.destroy()` will remove the Model from any Collection that contains it, but the `TaskView` that owned that Model is still part of our application. Our next task is to find it and remove it.

From the [Backbone docs](http://backbonejs.org/#Collection-remove), when a Model is removed from a Collection, the collection emits two events: a `'remove'` event and an `'update'` event, in that order.

We already have our app set up to re-render when an `'update'` event happens on the Collection. It sounds like the `'remove'` event is where we should destroy the card for our newly deleted event.

First we'll set up a listener for the `'remove'` event. In `TaskListView.initialize()`:

```javascript
var TaskListView = Backbone.View.extend({
  initialize: function(options) {
    // ...

    // Re-render the whole list when the Collection changes
    this.listenTo(this.model, 'update', this.render);

    // When a Model is removed from the Collection, remove the
    // corresponding card from our list.
    this.listenTo(this.model, 'remove', this.removeTask);
  },
	// ...
});
```

Next, our event handler, `removeTask()`. [Again from the docs](http://backbonejs.org/#Events-catalog), the handler will be supplied with three arguments: `model`, `collection`, and `options`. `model` is the only one we need. Our strategy will be to create a new card list containing every card where the card's model doesn't match the removed model.

```javascript
var TaskListView = Backbone.View.extend({
  // ...

  removeTask: function(task) {
    var filteredList = [];
    this.cardList.forEach(function(card) {
      if (card.model != task) {
        filteredList.push(card);
      }
    });
    this.cardList = filteredList;
  }
});
```

## What Have We Accomplished?

- Replace the array of Models in our `TaskListView` with a proper Backbone Collection
- Listen to events on the Collection to know when to update our View
- Add the ability to delete a task from our task list

## Additional Resources
- [Backbone docs on Collections](http://backbonejs.org/#Collection)
- [cdnjs on Collections](https://cdnjs.com/libraries/backbone.js/tutorials/what-is-a-collection)
