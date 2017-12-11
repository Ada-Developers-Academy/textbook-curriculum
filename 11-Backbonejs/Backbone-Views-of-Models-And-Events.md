# Backbone Views and Events

## Learning Goals
By the end of this lesson you should be able to:

- Explain what Backbone views are and why they're useful
- Create a view around a Backbone Model
- Render HTML using a view & an Underscore Template

## Context for backbone-tasklist
For this week, we'll be working with a codebase around making a task list. Our task list will feature a list of tasks that have some task name and some assignee. We'll be able to toggle completion, add a new one, delete existing ones, and eventually edit them.

We've provided some starter code. The starter code is located in your cohort's Github org in the repo named `backbone-tasklist`.

Clone the repo (no need to fork) and open it.

As always, run the following commands to get it going:
```
npm install
npm start
```

Take some time to look through the code. What code is already there? What displays on the browser?

Our goal will be to take this code and make it take advantage of Backbone Views, which will also help us handle events.

Note: While your instructor will be working and pushing their progress into branches on your specific cohort's repo, you can follow along with a generalized solution on the branches found on [this repo](https://github.com/AdaGold/backbone-tasklist).

## What is a View?
Backbone views are kind of middle-managers in the Backbone world, filling a similar role to controllers in Rails. A view's job is to coordinate between the data and the DOM. When a DOM event happens, it's the view's job to handle it and update the data as needed, and when the data changes it's the view's job to modify the DOM to match.

You may have noticed in the previous lectures, we have a jumble of functions handling events, and drawing to the browser etc. This could quickly become a mess. It's time for some structure!

For backbone-tasklist, we will create two views: one for a single task item and, later, a second view for the collection of Tasks.  Each view is responsible for rendering a specific section of the page, and for handling DOM events coming from that section. Larger views can delegate responsibility for a sub-section within its purview to another view. In backbone-tasklist, we will create this structure by having the collection view delegate responsibility to multiple task views that each handle a single entry within the collection.

![Backbone Views](images/backbone-views.png)

## Creating a View for a Task (a TaskView)
A TaskView will handle drawing an individual task item and responding to events that concern just that task.  To start, we create a file in `src/views/task_view.js`.  Each TaskView will only be concerned with rendering a specific task and dealing with events on that task.

```javascript
import Backbone from 'backbone';
import Task from '../models/task';

const TaskView = Backbone.View.extend({
  initialize(params) {
    this.template = params.template;
  },
  render() {
    const compiledTemplate = this.template(this.model.toJSON());
    this.$el.html(compiledTemplate);
    return this;
  },
});

export default TaskView;
```

### Important Parts of a View

Just like Models and Collections, a view extends [`Backbone.View`](http://backbonejs.org/#View).  This view comes with these important properties: `initialize`, `render` `el`, `model`, and `$el`. `$el` is a cached jQuery object for the view's element, and we can reference it automatically, too.

|   Property	|   Description	|
|---	|---	|
|   `initialize`	|   A function, like in a Ruby class, called immediately when a new Backbone object is created, View, Model or Collection. 	|
|   `el`	|   An HTML DOM element that, by default, is an empty `div`.  We use `el` to insert our view into the page when it is rendered.  	|
|   `model`	|   The Backbone model which provides the data for the view.  The view's `model` can be a Backbone Model or Collection.  Each View should, in general, have **one** `model`.    	|
|   `render`	|   A function called to draw (or redraw) the view.  **By convention the render function always returns `this`** so that it can be chained with other methods.  |
|   `$el`	|   A jQuery selection of `el`, and you can use jQuery functions on it.  With `$el` you can run jQuery selections for HTML elements inside, and only inside the view.  For example, `$el.find('button.delete')` is jQuery selection of button with the class `delete` inside of `el` (the view). 	In other words `myView.$el` and `$(myView.el)` are equivalent.  |

In our `initialize()` method, we take in a parameter named `params`. `params` is an object that we pass into a new `TaskView` at the time of initialization that contains a set of standard values that Backbone expects, but can additionally include anything. In this case, we're making the assumption that `params` is going to have inside of it a `template` that will represent an Underscore template. In `initialize`, we store the template from params into our `TaskView` in its own property called `template`. We'll make sure to pass in the Underscore template when we make a TaskView, but for now let's focus on how we use `this.template` in render().

**Exercise:** Identify all of the ways we use these properties on our view in the code we just added for TaskView.

**Consider:** What is the difference between `el` and `$el`? When is it appropriate to use either?

#### A Note on Coding Style

Notice that we only used `$el` to select items inside a view.  **Views should never use jQuery (`$()`) directly, but rather use `$el` to ensure that we only select items within the view.**  We've even chosen to not import jQuery into our View.  Some developers make an exception for selecting templates.  We will be looking at even another way to select within the view when we make a view for a Collection.

## Adding our view to `app.js`

We can update our code to use the new view to draw each element.  

Let's add our view to `app.js` with the following steps:
1. Import our new `TaskView` into `app.js`
1. Instead of calling the `render` method we created in `app.js`, let's create a new TaskView with the given model & template.
1. Then let's render the template and append the resulting `$el` to the DOM.  

```javascript
// app.js
// imports etc...
import TaskView from './views/task_view';

const renderList = (taskList) => {
  // Clear the unordered list
  const $taskList = $('#todo-items');
  $taskList.empty();

  taskList.forEach((task) => {
    const taskView = new TaskView({
      model: task,
      template: _.template($('#task-template').html()),
      tagName: 'li',
      className: 'task',
    });

    $taskList.append(taskView.render().$el);
    ...
  });
};
```

Phew! That's a lot of code. Let's break it down:

```javascript
const renderList = (taskList) => {
  const $taskList = $('#todo-items');
  $taskList.empty();

  taskList.forEach((task) => {
```

The above section of the code is the same as the version of this code prior to using Backbone Views, and should be familiar from how we implemented the previous in-class project.

```javascript
    const taskView = new TaskView({
```

Instead of directly using the model data to update the DOM in this function, we are now creating a TaskView instance which will be responsible for changing the DOM based on the model data that we provide it.

```javascript
      model: task,
      tagName: 'li',
      className: 'task',
```

These three lines are defining standard Backbone View option:
* `model` should be an instance of a Backbone Model or Collection, you should always use the `model`.
* `tagName` should be the kind of HTML tag we want this View to control, if `tagName` is not specified the default is a `div` tag.
* `className` should be a string with a one or more CSS classes to put on the HTML tag.

```javascript
      template: _.template($('#task-template').html()),
    });
```

This line gives the View a non-standard param. In general when creating Views we can always include any extra parameters we want the View to have in its `initialize` function. In this case we're giving the compiled Underscore template that the View will use for rendering. In our View's initialize, we got this `template` through params and saved the `template` into a property in the View.

```javascript
    $taskList.append(taskView.render().$el);
  });
};
```

Finally, in this line we first call `render` on the View instance we created. This causes it to update the DOM _only_ for the page section that it controls. After that we grab the "root" DOM element for the View with `$el`, and we pass that to `$taskList.append` to actually place the rendered content onto the page.

The last thing we need to do, not included in this code example, is update the Underscore template in our HTML file. Right now it includes an `<li>` tag, but our Backbone View will actually create this tag for us so we should remove it from the template.

We are performing many of the same operations we performed in our `app.js` file's `render` function as we create the `TaskView` and render it.

Now that we've moved the rendering of a task to the TaskView, let's remove all references to `taskTemplate`, as they aren't being used anymore.

Also, let's comment out/delete the code in `renderList` about deleting and toggling completion. We're going to fix that now.

## DOM Events & Views

Switching to using views has rendered the delete button inoperative.  Backbone however provides a way to configure a View to respond to DOM events using a JavaScript object called `events`.  

The `events` object is structured like a Ruby hash with DOM events as the keys and event handler functions as the values.  When a DOM event occurs, like when the user clicks on a button, Backbone looks at `events` and tries to match the event with a key in the event object.  Below we create an events object with our click event and an event handling method.  

![DOM Events like the click for the delete button](images/backbone-views-delete.png)

Add the following code to `TaskView`:

```javascript
// task_view.js
}, // render
  events: {
    'click button.delete': 'deleteTask'
  },
  deleteTask: function(e) {
    this.model.destroy();
    this.remove();
  },
}};
```

When the user clicks a delete button inside the view for the task (a TaskView):
1.  Backbone will check the events object and match the event with an event handler function
1.  Then that function will execute, calling the model's `destroy()` function.  
1.  The model will then remove itself from all collections
1.  Once the model is removed from the collection, the Collection will trigger an "update" event
1.  Our event handler for "update" on that Collection causes our `app.js` file's `renderList` function to execute (see in `app.js` the line `taskList.on('update', renderList, taskList);`)

The line `this.remove();` removes the View from the DOM and also calls `stopListening()` which causes the view to stop listening to other objects, such as the model.

## Exercise

Now try to add another event yourself toggling the task between complete or incomplete using the model method you made earlier.  

You can see a working version [here](https://codepen.io/adadev/pen/GOVPOX?editors=1011).

## Backbone Events

Our view's `toggleComplete` function works, but it may not quite be in the Backbone way.  In Backbone events follow this pattern:

1.  A user performs an action
1.  A DOM event listener in the View responds to the action calling methods to change data in the Model.
1.  The Model emits a "change" event which the view is listening to.
1.  The view responds to the "change" event by redrawing the event.  

![Backbone Events](images/backbone-views.png)

Right now we have the Backbone View responding to DOM events and issuing commands to the Model.  It's also manually updating the DOM.  However, it's not listening for changes in the model.  

We can set up the View to listen for changes in the model by adjusting the `initialize` method.  

```javascript
// task_view.js
var TaskView = Backbone.View.extend({
  initialize: function(params) {
    this.template = params.template;

    // Listen to changes in the model and call render when they occur.
    this.listenTo(this.model, "change", this.render);
  },
```

The [`listenTo`](http://backbonejs.org/#Events-listenTo) method causes the Backbone object to listen for custom events emitted by a different Backbone object.  In this case our View is listening for change events from the model. This is a good practice so now we can be sure that the View will run `render` any time the model is updated.

Backbone Models emit custom events like "change" to allow other components to respond when data in the model changes.  

## Summary

We now have a solution which displays a task and lets us toggle it complete or incomplete.  This view acts as a coordinator handling events and coordinating the response with the template & the model.


## What Did We Accomplish?
- Create a basic Backbone view to display a task. It has the following functions:
  - `initialize()` is run once to set everything up
  - `render()` generates HTML, and may be run many times
- Use the underscore templating engine to separate concerns and clean up our rendering code.
- Added a DOM event handler methods to respond to click events.



## Additional Resources
- [Backbone View Documentation](http://backbonejs.org/#View)
- [Backbone Applications Intro to Views](https://addyosmani.com/backbone-fundamentals/#views-1)
- [Underscore documentation](http://underscorejs.org/)
- [SitePoint Underscore tutorial](https://www.sitepoint.com/getting-started-with-underscore-js/)
