# Intro to Backbone Models

## Learning Goals

By the end of this lesson you should be able to:

- Explain what a Backbone Model is
- Create your own Backbone Model
- Instantiate your Backbone Model and assign attributes
- Use some basic Backbone Model methods
- Listen to Backbone Model events
- Explain why `get()` and `set()` should be used on a Backbone Model

## What is a Backbone Model
So far, all our views have been built around raw data. This works fine when the data is simple and static, but will start to become very messy as the things we do with our data get more complex.

This is where Backbone models come in. Models in Backbone fill the same role they do in Rails: keeping track of your data. Things you can do with a model in Backbone include:

- Setting default values for new data
- Validating changes to the data
- Reading data from and writing it to an API
- Abstracting away complex bits of business logic
- Keeping track of a collection of data
- Triggering events when the data changes

Organizing all this functionality ourselves would be a giant pain in the butt, so let's add a model to our task list!

## Adding Models
In this first section, we will create a model to represent a single task. We will add this model to our application without adding any new functionality. Later we'll take advantage of the model to add some new features that would be much more difficult without it.

### Defining the Task Model
The first thing we need to do is create the model itself. Just like with views, we'll call `extend()`, this time on `Backbone.Model`. Our model will get its own file: `src/app/models/task.js`.

```javascript
// src/app/models/task.js
import Backbone from 'backbone';

var Task = Backbone.Model.extend({
  defaults: {
    title: "Unknown Task",
    description: "placeholder description"
  },
  initialize: function() {
    console.log("Created new task with title " + this.title);
  }
});

export default Task;
```

I may have lied when I said we weren't going to add any new functionality. We've provided two properties in our call to `extends()`, both of which get us something new.

The first property is an object called `defaults`, which sets default values for our model's attribute. When a new model is created, any attributes that aren't provided will be filled in from here. The `defaults` object is not required, nor are you required to provide a default for every attribute.

The second property is one we've seen before in our views: `initialize()`. This function is called once when the model is created, and can be used to set up anything special. Right now we just log to the console.

### Using the Model
Now that we've defined a model to represent a task, we need to use it in our application.

#### TaskListView
Most of the work will be in `TaskListView`. We're going to be making a bunch of changes, so it might make sense to [consult this diff](https://gist.github.com/droberts-ada/78472d66dbdb3b02fde52ea6cfc3a674/revisions?diff=split).

Since the `Task` model is defined in a separate file, we need to import it:

```javascript
import Task from 'app/models/task';
```

There are two more changes we'll need to make, each in two places. First, we need to change the way we store tasks. Instead of an array of raw JavaScript objects, we'll store an array of `Task` models. Second, we need to build our `TaskViews` around `Task`s, rather than around raw objects. We'll need to make these changes everywhere a task is added, that is, in both `initialize()` and `createTask()`.

As we noticed at the end of the last lecture, the process of adding a card is similar enough in both places to warrant a separate function. Since we're messing with this anyway, now is a good time. We'll call our new function `addTask()`.

```javascript
// Turn a raw task into a Task model, add it to our list of tasks,
// create a card for it, and add that card to our list of cards.
addTask: function(rawTask) {
  // Create a Task from this raw data
  var task = new Task(rawTask);

  // Add the new task model to our list
  this.modelList.push(task);

  // Create a card for the new task
  var card = new TaskView({
    model: task,
    template: this.taskTemplate
  });

  // Add the card to our card list
  this.cardList.push(card);
},
```

And now update `initialize()` and `createTask()` to use our new function:

```javascript
initialize: function(options) {
  // Compile a template to be shared between the individual tasks
  this.taskTemplate = _.template($('#task-template').html());

  // Keep track of the <ul> element
  this.listElement = this.$('.task-list');

  // We'll keep track of a list of task models and a list
  // of task views.
  this.modelList = [];
  this.cardList = [];

  // Process each task
  options.taskData.forEach(function(task) {
    this.addTask(task);
  }, this); // bind `this` so it's available inside forEach

  // Keep track of our form input fields
  this.input = {
    title: this.$('.new-task input[name="title"]'),
    description: this.$('.new-task input[name="description"]')
  };
},

// ...

createTask: function(event) {
  // Normally a form submission will refresh the page.
  // Suppress that behavior.
  event.preventDefault();

  // Get the input data from the form and turn it into a task
  var task = this.getInput();

  // Keep track of this task
  this.addTask(task);

  // Re-render the whole list, now including the new card
  this.render();

  // Clear the input form so the user can add another task
  this.clearInput();
},
```

#### TaskView
One more thing to do: make our `TaskView` wrap the model. Like `el`, `model` is a Backbone thing which means we don't need to store it ourselves.

```javascript
// src/app/views/task_view.js
var TaskView = Backbone.View.extend({
  initialize: function(options) {
    this.template = options.template;
  },

  render: function() {
    var html = this.template({task: this.model.attributes})
    this.$el.html(html);

    // Enable chained calls
    return this;
  }
});
```

#### Check-in Point
Your site should now be functioning again. We haven't added any new functionality, but you should be able to see the 3 initial tasks and add new ones. Your code should look [like this](https://gist.github.com/droberts-ada/269a7dd0d809a5c8aab5e44891499d27).

## Marking a Task Complete
To explore how Backbone models work, let's add a new feature to our site: a button to mark a task complete. A completed task should be rendered with a <strike>strike</strike> through the name, and the "mark complete" button should instead "mark incomplete".

### Setup
First, lets modify our task template to reflect this:

```html
<script type="text/template" id="task-template">
  <li class="task row">
    <div class="small-12 large-10 columns">
      <h2>
        <% if (task.complete) { %>
          <strike>
        <% } %>
        <%- task.title %>
        <% if (task.complete) { %>
          </strike>
        <% } %>
      </h2>
      <p>
        <%- task.description %>
      </p>
    </div>
    <button class="button small-12 large-2 columns complete-button">
      Mark <%= task.complete ? "Incomplete" : "Complete" %>
    </button>
  </li>
</script>
```

**Question:** Given what we know so far about views and models, what changes will we need to make to our JavaScript in order to make this happen?

### DOM Events
As before, we'll need to register an event handler to listen for the DOM event emitted when the user clicks the "Mark Complete" button. The button will be part of a card, and cards are managed by `TaskView`s, so we should listen for our click event there.

```javascript
// app/views/task_view.js
var TaskView = Backbone.View.extend({
  // ... initialize() and render() ...
  events: {
    "click .complete-button": "completeHandler"
  },

  completeHandler: function(event) {
    console.log("completeHandler called!");
  }
});
```

What should `completeHandler()` do? We could have it modify the model directly, but that's not great design. Instead, as in Rails, we should put as much of our business logic as possible in the model. We'll create a `toggleComplete()` method in the model, and simply call it from the view.

```javascript
// app/models/task.js
var Task = Backbone.Model.extend({
  // ... defaults, initialize() ...

  toggleComplete: function() {
    var newStatus = !this.get('complete');
    this.set('complete', newStatus);
  }
});
```

```javascript
// app/views/task_view.js
var TaskView = Backbone.View.extend({
  // ... initialize(), render() ...
  events: {
    "click .complete-button": "completeHandler"
  },

  completeHandler: function(event) {
    console.log("completeHandler called!");
    this.model.toggleComplete();
  }
});
```

### Model Events
Notice that rather than accessing `this.complete` directly in the model, we use `this.get('complete')` and `this.set('complete', value)`. You can also use `this.unset('complete')`. **You should always use `get()` and `set()` to access or modify model data.** This allows Backbone to intercept these calls and do extra things, like validating the data or triggering events.

Model events are one of the big reasons to use Backbone models over regular JavaScript objects. When `set()` is called on a model object, it triggers the model's `change` event. It's common for a view wrapping a model to listen for that `change` event, and re-render itself when the event occurs.

#### Binding to a Model Event
A weird fact about Backbone is that the view's `events` property can only be used for DOM events. This means we'll have to bind an event handler manually, in our view's `initialize()` function.

```javascript
// app/views/task_view.js
var TaskView = Backbone.View.extend({
  initialize: function(options) {
    this.template = options.template;

    // Listen to our model, and re-render whenever it changes.
    this.model.bind('change', this.render.bind(this));
  },

  // ... render(), events, completeHandler() ...
});
```

That's pretty complex for one line, so let's break it down a little. The basic way to subscribe to a Backbone event is as follows:

```javascript
thingThatEmitsEvents.bind('event-name', callbackFunction);
```

So in our case `thingThatEmitsEvents` is `this.model`, and `'event-name'` is `'change'`. We're waiting for `this.model` to emit a `'change'` event, and then we want to call some function.

#### Bind and Bind
For `callbackFunction`, we've got `this.render.bind(this)`. To understand what's going on here, remember that the `this` keyword doesn't always do what you want in a callback function. Saying `this.render.bind(this)` is like saying "I want to use `this.render`, but I also want `this` to mean what I think it means". It's similar to supplying `this` as the second argument to `forEach()` like we did yesterday. You could with some effort use a closure to accomplish the same thing.

The fact that calling `bind()` on a Backbone object and on a function do completely different things has the potential to be very confusing. That's OK! It's confusing stuff.

#### Why Not Render From completeHandler?
An astute and wary student might point out: all this `get()` and `set()` and binding to model events seems like an awful amount of trouble to go to. In the last lecture, we just called `render()` directly from `TaskListView.createTask()`. Why not do the same from `TaskView.completeHandler()`?

Good catch, hypothetical student! Ideally we shouldn't be calling `render()` in `createTask()` either, and we'll be removing it in the next lecture once we've learned a little about collections. But that doesn't address the core of the question: why listen for model events at all?

The reason is, if you're a view, you have no guarantee that all changes to the model will come through you. Maybe the model comes from a database server and is updated periodically. Maybe there are multiple views for the same model, and when one changes the others should pick it up. Model events can be an effective solution to all of these problems.

#### Check-in Point
Our new functionality should now be working. When the "Mark Complete" button is clicked, the title of the task gets struck out, and the button text changes to "Mark Incomplete". Your code should look [like this](https://gist.github.com/droberts-ada/0a18925644f6f1e5db1ec11eddf7dbba).

**Question:** With the person next to you, come up with a list of steps for how the app goes from button click to striking the title of the task.

## What Have We Accomplished
- Create a basic Backbone model to represent a task
- Replace the raw JavaScript objects in our application with this model
- Add a button to our TaskView that will mark the task complete
- Plumb the DOM event through the TaskView to update the model
- Listen to events on our model and re-render the card when the model changes

## Resources
- [Backbone Model & View Documentation](http://backbonejs.org/#Model-View-separation)
- [An Intro to Backbone Models & Collections](http://liquidmedia.org/blog/2011/01/backbone-js-part-1/)
- [Backbone Fundamentals, Models Chapter](https://addyosmani.com/backbone-fundamentals/#models-1)
- [Tutorial on JavaScript bind()](http://javascriptissexy.com/javascript-apply-call-and-bind-methods-are-essential-for-javascript-professionals/)
