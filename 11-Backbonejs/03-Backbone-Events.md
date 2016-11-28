# Backbone Events

## Learning Goals

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

### Clearing the Form
It's not quite as glamorous as adding a new task, but clearing the form provides a good introduction to Backbone's event system without tying us up in complex logic, so we'll start there.

#### The `events` View Property
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

#### Handling the Event
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
clearInput: function() {
  this.input.title.val('');
  this.input.description.val('');
}
```

#### Check-in Point
Right now, you should be able to type things in both form fields, and when you click the "Clear" button, everything you typed should go away. Your code should look [like this](Ada C6 Backbone Views Checkin 2).

### Adding a Task

## What Have We Accomplished?

## Additional Resources
