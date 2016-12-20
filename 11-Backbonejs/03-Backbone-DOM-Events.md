# Backbone Events

## Learning Goals
By the end of this lecture, you should be able to...

- Respond to DOM events in Backbone views
- Compare handling events in Backbone to doing so using just jQuery
- Confidently use Backbone event handlers to make changes to the underlying data

## Responding to User Events
So far, our Backbone application has only been able to serve static, hard-coded data. This isn't very useful, and it's not very interesting, so let's give the user the ability to add a task to the list.

### Setup
We'll add a simple HTML form to the top of the page with two fields: a title and a description. When the user clicks the "Add Task" button or presses enter, the task should be displayed in the list. There should also be a "Clear" button, which resets the form.

Here's some HTML to get us started. This will replace the whole `<main>` section from the previous lecture.

```html
<main id="application" class="row">
  <section class="small-12 columns">
    <h1>Task List</h1>

    <form class="row new-task">
      <div class="small-12 large-4 columns">
        <label for="title">Title</label>
        <input type="text" name="title"></input>
      </div>
      <div class="small-12 large-4 columns">
        <label for="description">Description</label>
        <input type="text" name="description"></input>
      </div>
      <div class="small-12 large-4 columns">
        <!-- Placeholder for vertical alignment -->
        <label class="show-for-large">&nbsp;</label>
        <button type="submit" class="success button">Add Task</button>
        <button type="button" class="warning button clear-button">Clear</button>
      </div>
    </form>
  </section>

  <ul class="task-list small-12 large-6 columns end">
  </ul>
</main>
```

Note that webpack is only watching our JavaScript files for changes. You'll have to refresh the page if you want to see the new HTML.

**Question:** If you didn't know anything about Backbone, how would you solve this problem? What steps would your application have to go through?

#### HTML Forms and the Submit Event
In addition to the click or keypress event that happens when a user clicks the button or presses enter, an HTML form will emit a "submit" event when either of those things happens. This isn't a Backbone thing, it's just how HTML forms work. You could handle the submit event in jQuery with code like this:

```javascript
$('.my-form').submit(callbackFunction);
```

One tricky thing: by default, _any_ button in a form will emit a submit event when clicked. To disable this behavior, you need to give your HTML button a `type="button"` attribute (like we have for our clear button).

## Clearing the Form
It's not quite as glamorous as adding a new task, but clearing the form provides a good introduction to Backbone's event system without tying us up in complex logic, so we'll start there.

### The `events` View Property
Since there's one new task form for our whole application, the `TaskListView` will be responsible for handling these events. In fact, `TaskListView` is the _only_ thing we'll need to modify for this entire lecture! All this code will go in `src/app/views/task_list_view.js`.

One of the things Backbone looks for in a view besides `initialize()` and `render()` is an object called `events`, which will look something like this:

```javascript
// src/app/views/task_list_view.js
var TaskListView = Backbone.View.extend({
  initialize: function(options) {
    // ...
  },

  render: function() {
    // ...
  },

  events: {
    'click .clear-button': 'clearInput'
  }
});
```

The keys in the `events` object are event strings, which have the form `"event css-selector"`. The event is the name of the event to listen for - something like "click", "submit" or "keydown". The CSS selector tells Backbone on which element(s) to expect the event. So in our example, we're looking for a "click" event on an element with class "clear-button".

The values in the `events` object are the stringified names of functions to call when the corresponding event happens. So when we get a click on an element with class clear-button, Backbone will search our view for a function called clearInput and call it. We'd better go ahead and add one:

```javascript
events: {
  'click .clear-button': 'clearInput'
},

clearInput: function(event) {
    console.log("clearInput called");
}
```

Now when you click the button, your application should log to the console.

### Handling the Event
Now that our callback is being called, we need to handle the event. We know from our experience with jQuery that we need to do the following:

1. Select the DOM elements for the form inputs
1. Call `val('')` to set the current value of the input to an empty string

Since the form elements aren't ever going to go away, it makes sense to keep track of them in `initialize()`. The following lines use jQuery to find the input elements and put them in an object:

```javascript
initialize: function() {
  // ... whatever was here before ...

  // Keep track of our form input fields
  this.input = {
    title: this.$('.new-task input[name="title"]'),
    description: this.$('.new-task input[name="description"]')
  };
}
```

Next, in `getInput()` we need to clear those elements. The following JavaScript should do the trick:

```javascript
clearInput: function(event) {
  this.input.title.val('');
  this.input.description.val('');
}
```

#### Check-in Point
Right now, you should be able to type things in both form fields, and when you click the "Clear" button, everything you typed should go away. Your code should look [like this](Ada C6 Backbone Views Checkin 2).

## Adding a Task
### Try It Yourself!
Now that you've seen how to do event handling in Backbone, work with the person next to you and attempt to add a task to the list. Remember, you're listening for a "submit" event on the `<form>`.

### Listening For The Event
Our initial setup will be very similar to the clearInput event:

```javascript
// inside TaskListView
events: {
  'submit .new-task': 'createTask',
  'click .clear-button': 'clearInput'
},

createTask: function(event) {
  event.preventDefault();
  console.log('createTask called');
},
```

Notice the `event.preventDefault()`. You might have seen something similar last week. What does it do? What happens if we comment it out?

### Handling the Event
Handling the createTask event will be a little trickier than clearing the form. We'll have to follow these steps:

1. Get the input data from the form and turn it into a task
  - This would be a good thing to do in a function. Let's call it `getInput()`.
1. Add the new task to our list of tasks
1. Create a card for the new task, and add it to our card list
  - These two steps will look very similar to what we did in `initialize()`
1. Re-render the whole list, now including the new card
1. Clear the input form so the user can add another task
  - We just wrote a function to do this in the last section!

Code to do so might look like the following:

```javascript
// in TaskListView
createTask: function(event) {
  // Normally a form submission will refresh the page.
  // Suppress that behavior.
  event.preventDefault();

  // Get the input data from the form and turn it into a task
  var task = this.getInput();

  // Add the new task to our list of tasks
  this.taskData.push(task);

  // Create a card for the new task, and add it to our card list
  var card = new TaskView({
    task: task,
    template: this.taskTemplate
  });
  this.cardList.push(card);

  // Re-render the whole list, now including the new card
  this.render();

  // Clear the input form so the user can add another task
  this.clearInput();
},

// Build a task from the data entered in the .new-task form
getInput: function() {
  var task = {
    title: this.input.title.val(),
    description: this.input.description.val()
  };
  return task;
},
```

The observant among you might notice that we've got some shared code in `initialize()` and `createTask()`, and postulate that we might DRY up this code somehow. We will address this in the next lesson.

#### Check-in Point
You should now be able to add a task to the list! The clear button should also still work. Your code ought to look something [like this](https://gist.github.com/droberts-ada/b94a3bc5108e31e3d3341bafe7098445).

## What Have We Accomplished?

- Added an HTML form to our page to allow the user to add a task
- Created a simple event handler to clear the form inputs
- Created a more complex event handler to add a new task to the list

## Additional Resources

- [Backbone view events](http://backbonejs.org/#View-events)
- [Backbone event library](http://backbonejs.org/#Events)
- [Site-point tutorial on Backbone events](https://www.sitepoint.com/backbone-basics-events/)
