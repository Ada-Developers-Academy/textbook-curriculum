# Views of Collections

We have created a view for an individual task.  However, views can also be built to manage a collection.  Therefore our next step is to create a TaskListView.  This view will manage everything we have on the site, including the form to add a new task to the list.

## Learning Goals
-  Create a view to manage the entire TaskList collection
-  Create event listeners to add new models to the collection
-  Create a `render` method which creates and renders a group of smaller views.  
-  Create event listeners for custom Backbone Events

## Getting Started

This view starts like `TaskView` with a file named `/src/views/task_list_view.js`.  We can move our renderList code into the view's render method and make a few adjustments.

// TODO: update to ES6
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

In the `render` method we clear the list using `this.$`.  The method `this.$` performs a jQuery selection for HTML inside `el`.  Using `this.$` we can ensure that our view does not interact with any code outside of it.  You should never use jQuery directly within a view.  Instead you should use `this.$` just as you would jQuery to avoid impacting the DOM outside your view.  


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

We create the TaskListView and set it's model to be our taskList collection and set the template attribute.  In this case we start off our View attached to an element in the DOM, in this case our `main` tag.

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
    'click .add-task': "addTask"
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
    const statusMessages = this.$('#status-messages');
    statusMessages.empty();
    _.each(messageHash, (messageType) => {
      messageType.forEach((message) => {
        statusMessages.append($(`<li>${message}</li>`));
      })
    });
    statusMessages.show();
  },
  updateStatusMessageWith: (message) => {
    const statusMessages = this.$('#status-messages');
    statusMessages.empty();
    statusMessages.append($(`<li>${message}</li>`));
    statusMessages.show();
  }
});

export default TaskListView;
```

Again, this looks very much like what we originally wrote in `app.js`  We did change the code to use `this.$` instead of direct jQuery, and we called any helper methods we defined (such as `updateStatusMessageFrom()`) as an instance method with `this`.  

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
- [Backbone Applications Intro to Views](https://addyosmani.com/backbone-fundamentals/#views-1)
- [Underscore documentation](http://underscorejs.org/)
- [SitePoint Underscore tutorial](https://www.sitepoint.com/getting-started-with-underscore-js/)
