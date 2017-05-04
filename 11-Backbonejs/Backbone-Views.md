
# Intro to Backbone Views

## Learning Goals
By the end of this lesson you should be able to:

- Explain what Backbone views are and why they're useful
- Create a view around a Backbone Model
- Render HTML using a view & an Underscore Template
- Create a view for a Backbone Collection
- Render a collection

## What is a View?
Backbone views are kind of middle-managers in the Backbone world, filling a similar role to controllers in Rails. A view's job is to coordinate between the data and the DOM. When a DOM event happens, it's the view's job to handle it and update the data as needed, and when the data changes it's the view's job to modify the DOM to match.

You may have noticed in the, previous lectures, we have a jumble (technical term) of functions handling events, and drawing the tasklist to the browser etc.  This could quickly become a mess.  It's time for some structure!

We will first create two views, one for a single task item and a second for the collection of Tasks.  Each view will handle drawing and event handling for it's specific domain, and the view for the collection will utilize the smaller TaskView.  

## Creating A TaskView

A TaskView will handle drawing an individual task item and responding to events that concern just that task.  To start we create a file in `app/views/task_view.js`

```JavaScript
import Backbone from 'backbone';
import _ from 'underscore';
import $ from 'jquery';
import Task from 'app/models/task.js';

var TaskView = Backbone.View.extend({
  initialize: function(params) {
    this.template = params.template;
  },
  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});

export default TaskView;
```

Just like Models and Collections a view extends `Backbone.View`.  This model has 4 important properties, `initialize`, `render` `el`, & `model`.
-  `initialize` is a function, like in a Ruby class, called immediately when a new Backbone object is created, View, Model or Collection.    Here we choose use it to save the View's Underscore Template.  
-  `el` is an HTML DOM element that, by default, is an empty `div`.  We use `el` to insert our view into the page when it is rendered.  
	- There is also a corresponding property `$el` which is a jQuery selection of `el`, and you can use jQuery functions on it.  With `$el` you can run jQuery selections for HTML elements inside, and only inside the view.  For example, `$el('button.delete')` is a button with the class `delete` inside the view.
- `model` is the Backbone model which provides the data for the view.  The view's `model` can be a Backbone Model or Collection.  Each View should, in general, have **one** `model`.
- `render` is a function called to draw (or redraw) the view.  By convention the render function always returns `this` so that it can be chained with other methods.

## Adding our view to `app.js`

We can then modify our application code to use our view by creating a new `TaskView` in our event handler.

```JavaScript
// Replacing the taskList.on("update") event handler
taskList.on("update", function() {
      $('main').empty();
      taskList.each(function(task) {
        var taskView = new TaskView({
          model: task,
          template: _.template( $('#taskItemTemplate').html())
        });
        $('main').append(taskView.render().el);
      });
    });
```

In the code above we first cleared out the `main` element in the `html` and then for each Task model, created a new TaskView.  Then we rendered the View and appended the resulting element (`el`) to `main`.  Notice that we could execute `task view.render().el` because the `render()` function returns `this`.  

The view now renders, but the buttons no longer work.  Next we will introduce event handling in Views and get the Toggle button working.  

### Check-In

You & your SeatSquad member should now have the basic TaskList displaying and the buttons should no longer function.  Check & verify that you both have it working.  

You can see a working version [here:](https://gist.github.com/CheezItMan/745cbd2d5a7ec07c327be63c496ccf27)

## Handling jQuery Events Within a View

To respond to jQuery or other events in a Backbone View we need to add another property, `events`.  The `events` object matches jQuery events to functions.  In the example below the `events` object links the `click` event on any sub-element with the class of `toggle` to an event handler function called `toggle`.  Then in the `toggle` function we change the model's `complete` attribute and then re-render the view.

```Javascript
// src/app/views/task_view.js

import Backbone from 'backbone';
import _ from 'underscore';
import $ from 'jquery';
import Task from 'app/models/task.js';

var TaskView = Backbone.View.extend({
  render: function() {
    // Select the template using jQuery
    var template_text = $('#taskItemTemplate').html();
    // Get an underscore template object
    var template = _.template(template_text);

    this.$el.html(template(this.model.toJSON()));
    return this;
  },
  events: {
    'click .toggle': 'toggle'
  },
  toggle: function() {
    this.model.toggleComplete();
    this.render();
  }
});

export default TaskView;
```

**Question** What happens if you take out `this.render();` in function `toggle`?  Why is it needed?

### Check-In

Check & verify that your toggle button is working.  

You can see a working version [here:](https://gist.github.com/CheezItMan/f251985ec9c9c94a3975f4256ae6b170)

## Viewing a Collection of Tasks

We can create another view to manage a collection of Tasks. This view will store the Collection in the model property and the render function will create a `TaskView` object for each `Task` in the collection, render them and append the resulting html to `$el`.  

```JavaScript
// src/app/views/task_list_view.js
import Backbone from 'backbone';
import _ from 'underscore';
import $ from 'jquery';
import TaskView from 'app/views/task_view.js';


var TaskListView = Backbone.View.extend({
  initialize: function(params) {
    this.taskTemplate = params.taskTemplate;
  },
  render: function() {
    var collection = this.model;
    this.$el.find('main').empty();

    collection.each(function(task) {
      var taskView = new TaskView({model: task, template: this.taskTemplate});
      this.$el.find('main').append(taskView.render().$el);
    }, this);

    return this;
  }
});

export default TaskListView;
```

Then we can use the view in `app.js` to render the collection.

```JavaScript
// src/app.js
import $ from 'jquery';
import _ from 'underscore';

import Task from 'app/models/task';
import TaskList from 'app/collections/task_list';
import TaskView from 'app/views/task_view';
import TaskListView from 'app/views/task_list_view';

var taskData = [ {
  title: "Study JavaScript",
  completed: true
},
{
  title: "Learn Backbone Collections",
  completed: false
},
{
  title: "Take out the trash",
  completed: false
}];

var taskList = new TaskList(taskData);
var taskListView = new TaskListView({model: taskList, el: $('body')});


$(document).ready(function() {
  taskListView.render();
});
```

## Adding Event Handlers

Now we need to add an event handler for adding a new Task.

We can add the `events` object linking the `new-task` button to an event handler function.  

```JavaScript
  events: {
    'click #new-task': 'newTask'
  },
  newTask: function() {

    if (this.$el.find('#title').val() !== "") {
      var task = new Task({title: this.$el.find('#title').val(), completed: this.$el.find('#completed').prop("checked")});
      this.model.add(task);

      this.$el.find('#title').val("");
      this.$el.find('#completed').prop("checked", false);
    }
  }
```

In this we recreate the prior code into the `newTask` function.  We also can add another line to the function `initialize`.  We can use the `listenTo` method to call `render` when the `model` is updated, i.e. when an entry is added to the Collection.

```JavaScript
  // task_list_view.js
  initialize: function() {
    this.listenTo(this.model, "update", this.render);
  },
```

### Check-In

Check with your SeatSquad member and verify that you can both add tasks.  

You can see a working version [here:](https://gist.github.com/CheezItMan/88993b84529f12c9e3fdabe90f4e042e)  

## Deleting a Task

Deleting a model is a bit more complicated, the delete buttons are in the `TaskView`, but the `Tasks` need to be removed from Collection in the `TaskListView`.  Luckily Backbone has a nifty method, `destroy`, that allows a Model to tell a Collection to remove it.

```JavaScript
  events: {
    'click .toggle': 'toggle',
    'click .delete': 'deleteHandler'
  },
  deleteHandler: function() {
    this.model.destroy();
  }
```

Then you can listen for the, `remove` event in `TaskListView`.  

```JavaScript
  initialize: function() {
    this.listenTo(this.model, "update", this.render);
    this.listenTo(this.model, "remove", this.render);
  }
```

## Optimizations

What could we do to improve on this?  There are a few things we could change.  Noice we recreate all the `TaskView`s every time the `TaskListView` is rendered.  We could store them in an array to avoid recreating them.  

## Style Guide

Also notice that we only used `$el` to select items inside a view.  Views should never use jQuery directly `$()`, but rather use `$el` to ensure that we only select items within the view.  Some developers make an exception for selecting templates.  

## What Did We Accomplish?
- Create a basic Backbone view to display a task. It had one function:
  - `initialize()` is run once to set everything up
  - `render()` generates HTML, and may be run many times
- Use the underscore templating engine to separate concerns and clean up our rendering code
- Create a more complex Backbone view to manage our whole application

## Additional Resources
- [Backbone View Documentation](http://backbonejs.org/#View)
- [Backbone Applications Intro to Views](https://addyosmani.com/backbone-fundamentals/#views-1)
- [Underscore documentation](http://underscorejs.org/)
- [SitePoint Underscore tutorial](https://www.sitepoint.com/getting-started-with-underscore-js/)
