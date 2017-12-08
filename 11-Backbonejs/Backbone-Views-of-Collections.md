# Views of Collections

We have created a view for an individual task.  However, views can also be built to manage a collection.  Therefore our next step is to create a TaskListView.  This view will manage everything we have on the site, including the form to add a new task to the list.

## Learning Goals
-  Create a view to manage the entire TaskList collection
-  Create a `render` method which creates and renders a group of smaller views
-  Create event listeners to add new models to the collection
-  Create event listeners for Backbone Events

## Our Approach
To accomplish these goals, we're going to take the following concrete steps with our backbone-tasklist project:
1. **Move the responsibility of rendering a list of tasks out of app.js**. Replicate the implementation of `renderList` in `app.js` into a TaskListView that manages the TaskList collection, and render all tasks in the task list
1. Use the new TaskListView in `app.js`
1. Remove the now redundant `renderList` in `app.js`
1. **Move the responsibility of adding a new task to the list of tasks out of app.js**. Define an event listener for the TaskListView to handle adding a new task
1. **Move the responsibility of re-rendering the list of tasks on update out of app.js**. Update our TaskListView to listen to the Backbone Event 'update' and re-render

## Getting Started

This view starts like `TaskView` with a new file named `/src/views/task_list_view.js`.  We can move our renderList code into the view's render method and make a few adjustments.

```javascript
// /src/views/task_list_view.js
import Backbone from 'backbone';
import _ from 'underscore';
import $ from 'jquery';
import TaskView from '../views/task_view';

const TaskListView = Backbone.View.extend({
  initialize: function(params) {
    this.template = params.template;
  },
  render: function() {
    // Clear the unordered list
    this.$('#todo-items').empty();
    // Iterate through the list rendering each Task
    this.model.each((task) => {
      // Create a new TaskView with the model & template
      const taskView = new TaskView({
        model: task,
        template: this.template,
        tagName: 'li',
        className: 'task',
      });
      // Then render the TaskView
      // And append the resulting HTML to the DOM.
      this.$('#todo-items').append(taskView.render().$el);
    });
    return this;
  }
});

export default TaskListView;
```
Just like in `TaskView`, in `initialize` we store the template in an attribute of the view.  The view's render method looks like the render method we wrote earlier with a few differences.

We finish the `render` method by appending each TaskView to the list inside the DOM and when the loop is finished we `return this;` by convention.  It's a fairly common pattern developers use in JavaScript to deal with confusing `this` issues.


### About `this.$`

In the `render` method we clear the list using `this.$`.  The method `this.$` performs a jQuery selection for HTML inside `el`.  Using `this.$` we can ensure that our view does not interact with any code outside of it.  **You should never use jQuery directly within a view.**  Instead **you should use `this.$`** just as you would jQuery to avoid impacting the DOM outside your view.  


### Updating `app.js`

We will adjust our `$(document).ready` handler to use the `TaskListView`.


```javascript
// app.js
// imports etc...

import TaskListView from './views/task_list_view';

// ...

$(document).ready(function() {
  // Why does this belong in $(document).ready ?
  const taskListView = new TaskListView({
    model: taskList,
    template: _.template($('#task-template').html()),
    el: 'main',
  });

  taskListView.render();
});
```

We create the TaskListView and set the following things:
- `model`: we'll pass in `taskList` to so that it's the main model we'll be operating on
- `template`: we'll pass in the Underscore template (which is a function) for the task template, as we'll be using this template by passing it to our TaskView within the TaskListView
- `el`: We can start off our View attached to an existing element in the DOM, in this case we're choosing our `main` tag.

Lastly, we call render on the taskListView.

Let's take the time to also remove the references to `renderList` and `TaskView` in `app.js`, as they are now unused!

### Handling Creating New Tasks

Just like we added event handlers in the `TaskView` to handle button clicks, we can add an event handler to create a new task and a method to read from the new task form, and add them to the collection. Let's move our logic to add a new task into our view.

![Creating New Tasks](images/addButton.png)


```javascript
// views/task_list_view.js
import Task from '../models/task'

...
}, // end of render

  events: {
    'click #add-new-task': "addTask"
  },
  addTask: function(event) {
    event.preventDefault();
    const taskData ={};
    ['task_name', 'assignee'].forEach( (field) => {
      const val = this.$(`#add-task-form input[name=${field}]`).val();
      if (val != '') {
        taskData[field] = val;
      }
    });
    const newTask = new Task(taskData);

    if (newTask.isValid()) {
      this.model.add(newTask);
      this.updateStatusMessageWith(`New task added: ${newTask.get('task_name')}`);
    } else {
      this.updateStatusMessageFrom(newTask.validationError);
    }
    this.model.add(newTask);
  },
  updateStatusMessageFrom: (messageHash) => {
    const statusMessagesEl = this.$('#status-messages');
    statusMessagesEl.empty();
    _.each(messageHash, (messageType) => {
      messageType.forEach((message) => {
        statusMessagesEl.append(`<li>${message}</li>`);
      })
    });
    statusMessagesEl.show();
  },
  updateStatusMessageWith: (message) => {
    const statusMessagesEl = this.$('#status-messages');
    statusMessagesEl.empty();
    statusMessagesEl.append(`<li>${message}</li>`);
    statusMessagesEl.show();
  }
});

export default TaskListView;
```

Again, this looks very much like what we originally wrote in `app.js`  We did change the code to use `this.$` instead of direct jQuery, and we called any helper methods we defined (such as `updateStatusMessageFrom()`) as an instance method with `this`.  

**Note:** because in this case we need a reference to a specific `this`, our `addTask` function is not an arrow function.

Let's break down the above code to understand what's going on:

```javascript
  events: {
    'click #add-new-task': "addTask"
  },
```

We're adding an events object to our TaskListView, just like how we added an events object to our TaskView previously. Here, we're defining an event for Backbone to match on. In this case, we want to match on a 'click' event on the selector '.add-task'. The value of this is going to be the name of a callback as a string, and we're passing in "addTask", which is going to be defined in this view next after we close `events`.

```javascript
  addTask: function(event) {
    event.preventDefault();
    const taskData ={};
    ['task_name', 'assignee'].forEach( (field) => {
      const val = this.$(`#add-task-form input[name=${field}]`).val();
      if (val != '') {
        taskData[field] = val;
      }
    });
    const newTask = new Task(taskData);

    if (newTask.isValid()) {
      this.model.add(newTask);
      this.updateStatusMessageWith(`New task added: ${newTask.get('task_name')}`);
    } else {
      this.updateStatusMessageFrom(newTask.validationError);
    }
    this.model.add(newTask);
  },
```

This is our callback for our event, which we've named `addTask`. The implementation is almost exactly what we already had in `app.js` for adding a new task, but now we can move it to the more appropriate location of a Backbone View. (Remember [MV*](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/11-Backbonejs/Introduction-to-Backbonejs.md#backbone-mv)?)

The parts that **did** change are important to note:
1. We need to change our jQuery call to scope it to just this view: `const val = this.$(`#add-task-form input[name=${field}]`).val();`.
1. Instead of using the reference to a `taskList` that was defined in `app.js`, we can just use the Backbone Collection stored in this View as `this.model`.
1. We want to bring over our helper methods `updateStatusMessageWith` and `updateStatusMessageFrom`. We'll define those within our view next. Since we know we're going to make those helpers right now, we can call them with `this.updateStatusMessageWith( ... )` and `this.updateStatusMessageFrom( ... )`

```javascript
  updateStatusMessageFrom: (messageHash) => {
    const statusMessagesEl = this.$('#status-messages');
    statusMessagesEl.empty();
    _.each(messageHash, (messageType) => {
      messageType.forEach((message) => {
        statusMessagesEl.append(`<li>${message}</li>`);
      })
    });
    statusMessagesEl.show();
  },
  updateStatusMessageWith: (message) => {
    const statusMessagesEl = this.$('#status-messages');
    statusMessagesEl.empty();
    statusMessagesEl.append(`<li>${message}</li>`);
    statusMessagesEl.show();
  }
  ...
```

Now we're bringing over our helper methods that help us update the status message element. We made one crucial update: instead of calling jQuery directly, we used `this.$`. We also took this opportunity to refactor the code by pull out the selector into the local variable `statusMessagesEl` to make it more readable.

Take some time to delete the original event handlers in `app.js` and make sure everything is still working.

## Adding a Backbone Event Listener

With a little bit of digging, we can find that the delete and add buttons are doing what they're supposed to: tasks are getting added and removed from the collection. The problem is we're not re-rendering the updated list.

If we add an event listener to the collection, we can call render when the collection is updated.  

![Backbone Delete Events](images/BackboneCustomEvent.png)

Similar to `on`, we can use the method called `listenTo` to add an event listener for our collection.  We will do so in the `initialize` method of the view.

```javascript
// /views/task_list_view.js
  initialize: function(params) {
    this.template = params.template;

    this.listenTo(this.model, 'update', this.render);
  },
```

Adding this to our view's `initialize` will allow us to delete the following line that we had previously in our `app.js` file in `$(document.ready())`
```javascript
taskList.on('update', renderList, taskList);
```

## Summary

So now we have a solution which displays our list of tasks, lets us toggle them complete or incomplete,  and deletes and creates tasks.  The view acts as a coordinator which handles events and coordinates the response with the template & the model.  


## What Did We Accomplish?
- Created a basic Backbone view to display a Collection (TaskList). It had one function:
  - `initialize()` is run once to set everything up
  - `render()` generates HTML, and may be run many times
- Use the underscore templating engine to separate concerns and clean up our rendering code.
- Added event handler methods to respond to click events.
- Create a more complex Backbone view to manage our whole collection

## Additional Resources
- [Backbone View Documentation](http://backbonejs.org/#View)
- [Underscore documentation](http://underscorejs.org/)
