
# Intro to Backbone Views

## Learning Goals
By the end of this lesson you should be able to:

- Explain what Backbone views are and why they're useful
- Create a view around some data
- Render HTML using a view
- Use underscore.js templates to simplify and DRY up rendering

## What is a View?
Backbone views are kind of middle-people in the Backbone world, filling a similar role to controllers in Rails. A view's job is to coordinate between the data and the DOM. When a DOM event happens, it's the controller's job to handle it and update the data as needed, and when the data changes it's the view's job to modify the DOM to match.

### Initial Setup
Take a look at `src/app.js` in the project directory. You should see some sample data that looks like this:

```javascript
var taskData = [
  {
    title: 'Mow the lawn',
    description: 'Must be finished before BBQ on Sat afternoon'
  },
  // ...
];
```

Just like before we knew about Backbone, in order to display our data we'll need somewhere in our page to put it. In `build/index.html`, replace the `<div>` with the following HTML:

```html
<main class="row" id="application">
  <section class="small-12 columns">
    <h1>Task List</h1>
  </section>

  <ul class="task-list small-12 large-6 columns end">
  </ul>
</main>
```

We'll render our tasks as `<li>`s in the `<ul>`.

Finally, we need to include Backbone in our project. To do so, add the following line at the top of `app.js`:

```javascript
import Backbone from 'backbone';
```

For the moment, all our JavaScript will go in `src/app.js`. Later on we'll do some organizing, but not yet.

### Adding a View
Views are created calling `Backbone.View.extend()`. `extend()` is a Backbone thing, and it returns a constructor function we'll use to instantiate our views. If we were in Ruby we'd say we're making a class that inherits from `Backbone.View`. We'll see `extend()` many times in the coming weeks. The only argument to `extend()` is a JavaScript object containing all the extra things we want our view to have.

Backbone can recognize many things in the argument to `extend`, but the two most important for a view are two functions: `initialize()` and `render()`. Let's see what that looks like.

```javascript
var TaskView = Backbone.View.extend({
  initialize: function(options) {
  },

  render: function() {
    // Enable chained calls
    // This is important enough that we'll leave it in, but
    // we wont talk about it until later.
    return this;
  }
});
```

#### Initialize
Let's start with `initialize()`. This function will be run once when the view is first created. Its job is to get everything ready to go. It takes one argument, `options`, which contains all the stuff the view was created with.

Views are created with the familiar `new` keyword. It will look something like this:

```javascript
var card = new TaskView();
```

Right now our view isn't doing anything, so let's give it some data to keep track of. We'll create each view around one of the tasks in our list.

```javascript
var TaskView = Backbone.View.extend({
  initialize: function(options) {
    this.task = options.task;
  },

  render: function() {
    // Enable chained calls
    return this;
  }
});

$(document).ready(function() {
  var card = new TaskView({task: taskData[0]});
});
```

#### Render
On to `render()`. This will be called whenever the DOM needs to be updated, and its role is to re-generate all the HTML associated with this view. The way to do this is by using `this.$el`, a jQuery element associated with this view. Update `render()` so it looks like this:

```javascript
render: function() {
  var html = '<li class="task">';
  html += '<h2>' + this.task.title + '</h2>';
  html += '<p>' + this.task.description + '</p>';
  html += '</li>';
  this.$el.html(html);

  // Enable chained calls
  return this;
}
```

Then in `$(document).ready()`, call `render()`.

```javascript
$(document).ready(function() {
  var taskListElement = $('.task-list');
  var card = new TaskView({task: taskData[0]});
  taskListElement.append(card.render().$el);
});
```

Notice that we use jQuery to select the task list in the DOM, and call `append()` to make our generated HTML show up. Notice also that, because we return `this` from `render()`, we can combine the call to `render()` and the call to `append()` in one line. This isn't strictly necessary - we could just as easily have said

```javascript
card.render();
taskListElement.append(card.$el);
```

Chaining on `render()` is a very common thing in Backbone, and much of the code you'll find on the internet assumes you're using it. It will be much less painful to get into the habit of always returning `this` from `render()` now.

#### Many Views
One last step remains. Right now we're only viewing one task, but we want to see all of them. This can be solved with a quick loop:

```javascript
$(document).ready(function() {
  var taskListElement = $('.task-list');
  var cardList = []
  taskData.forEach(function(task) {
      var card = new TaskView({task: task});
      cardList.push(card);
      taskListElement.append(card.render().$el);
  });
});
```

### Check-in Point
Right now, your `app.js` should look [like this](https://gist.github.com/droberts-ada/41c26e15772b2c6986a765d002a25e82), and your site should show three different tasks.

That's all the new functionality we'll add this lesson. There's still a lot of work to be done cleaning up our code, organizing it and preparing it for functionality added in future lessons, but the HTML that is rendered should stay the same.

## Templating
One of the most painful parts of working with JavaScript and jQuery so far has been generating HTML. Even for small structures like our `<li>` above it's unwieldy, and the thought of building large amounts of HTML using inline strings is enough to make even the bravest Adie tremble.

Enter Underscore templates. Underscore is a JavaScript utility library which (like jQuery) makes its functions available through a global `_` object. One of these functions is a templating library, which works a lot like ERB did with Rails.

To add Underscore to your project, add the following line to the top of your `app.js` file:

```javascript
import _ from 'underscore';
```

Without diving too deep into it, to use an underscore template you must do three things:

1. Define the template (once)
1. Compile the template (once)
1. Use the compiled template (every time you generate HTML)

### Defining a Template
To define the template, add the following to `build/index.html`, before the `<script src='/app.bundle.js'>` tag:

```html
<script type="text/template" id="task-template">
  <li class="task">
    <h2>
      <%- task.title %>
    </h2>
    <p>
      <%- task.description %>
    </p>
  </li>
</script>
```

If this looks a lot like ERB, it's no coincidence - Underscore's templating syntax was inspired by ERB.

### Compiling and Using a Template
Before a template can be used, it must be compiled. To do so, select the template using jQuery and pass it to the `_.template()` function:

```javascript
// app.js
$(document).ready(function() {
  var taskTemplate = _.template($('#task-template'));
});
```

The thing you get back from `_.template()` (`taskTemplate` in this case) is a function. When you invoke it, it generates a bunch of HTML. Unlike Rails, we don't have access to instance variables, so anything that we want our template to use we have to pass in manually:

```javascript
var generatedHtml = taskTemplate({task: taskData[0]});
```

Compiling a template is generally an expensive operation, but once compiled a template can be used many times. So for our task list, we should compile the template only once and share it between all the task views.

```javascript
$(document).ready(function() {
  var taskTemplate = _.template($('#task-template').html());
  var taskListElement = $('.task-list');
  var cardList = []
  taskData.forEach(function(task) {
      var card = new TaskView({
        task: task,
        template: taskTemplate
      });
      cardList.push(card);
      taskListElement.append(card.render().$el);
  });
});
```

And finally, use the template in our view:

```javascript
var TaskView = Backbone.View.extend({
  initialize: function(options) {
    this.task = options.task;
    this.template = options.template;
  },

  render: function() {
    var html = this.template({task: this.task})
    this.$el.html(html);

    // Enable chained calls
    return this;
  }
});
```

And that's it. If you open up the page, you should see the same thing as before. Now, however our concerns are separated, our JavaScript is beautiful, and our app is much more maintainable.

## The Application: A View of Views
Right now, all the code to drive our application lives in `$(document).ready()`. So far this has been fine, but as we begin to grow our app adding new features and functionality will become more and more difficult unless we impose some sort of structure. To provide this structure, let's create a view for the entire app, a `TaskListView`. Similar to our `TaskView`, it will have `initialize()` and `render()` functions, which set things up and modify the DOM.

```javascript
var TaskListView = Backbone.View.extend({
  initialize: function(options) {
  },
  render: function() {
    return this; // enable chained calls
  }
});
```

### Using a `TaskListView`
We will begin by discussing how our `TaskListView` ought to be used. In `$(document).ready()`, we initialize a `TaskListView` and call its `render()` function. The initialization takes two arguments. The first is our raw `taskData`, which will be rendered by the view. The second is something called `el`, which we've set to the result of a jQuery selection.

```javascript
$(document).ready(function() {
  var application = new TaskListView({
    el: $('#application'),
    taskData: taskData
  });
  application.render();
});
```

We've seen `el` before, in our `TaskView` - it's the element around which our view is wrapped. By passing it in to `initialize()`, we're telling Backbone to bind our view to an existing DOM element, rather than creating a new element that's not yet in the DOM. This has two main effects:
- When our view changes `this.$el`, the changes will immediately be reflected in the DOM
- Our view can do jQuery selections within its element by calling `this.$()`

We are, in essence, giving our view control over part of our web page, and giving it free reign to modify that section as it needs.

### Initialize
`TaskListView.initialize()` will be responsible for most of the things we did in `$(document).ready()` before: compiling an underscore template for tasks, keeping track of the DOM object where tasks should appear, and initializing the list of `TaskView`s.

```javascript
initialize: function(options) {
  // Store a the full list of tasks
  this.taskData = options.taskData;

  // Compile a template to be shared between the individual tasks
  this.taskTemplate = _.template($('#task-template').html());

  // Keep track of the <ul> element
  this.listElement = this.$('.task-list');

  // Create a TaskView for each task
  this.cardList = [];
  this.taskData.forEach(function(task) {
    var card = new TaskView({
      task: task,
      template: this.taskTemplate
    });
    this.cardList.push(card);
  }, this); // bind `this` so it's available inside forEach
},
```

Notice that we select the `listElement` using `this.$()`, which performs a jQuery search on the element that was passed in when the view was constructed.

Notice also that we don't need to save `el`. Because `el` is a Backbone thing, Backbone will keep track of it for us automatically.

### Render
In `TaskListView.render()`, we loop through the list of `TaskView`s, render each one and append the result to our DOM object.

```javascript
render: function() {
  // Make sure the list in the DOM is empty
  // before we start appending items
  this.listElement.empty();

  // Loop through the data assigned to this view
  this.cardList.forEach(function(card) {
    // Cause the task to render
    card.render();

    // Add that HTML to our task list
    this.listElement.append(card.$el);
  }, this);

  return this; // enable chained calls
}
```

Notice that we before we start looping, we call `empty()` on the DOM object. This is important because in the future `render()` might be called many times, and if we don't clear the element first we'll get the same `TaskView`'s HTML more than once.

### Check-in Point
Right now, your code should look [like this](https://gist.github.com/droberts-ada/c415d22e2f3ab68ad22eaffbf6522020). The functionality should be the same as after we finished `TaskView`: three different tasks rendered in a list.

## File Organization
We've written a lot of code so far in `app.js`, and if we keep down this path we're going to end up with a big gross mess. Lets take advantage of this fancy development environment to split our code into multiple files.

Before we continue, it's important to note that this has absolutely nothing to do with Backbone. However, doing this organization now will help us streamline the Backbone code we write next.

Much like in Rails, we're going to have each view live in a separate file. We've already got a folder for these files: `src/app/views`. Go ahead and create two files in there, `task_view.js` and `task_list_view.js`, and cut-paste the two views into those files.

### Imports and Exports
Remember how we had a bunch of lines like `import $ from 'jQuery';` at the top of app.js? You'll need similar lines at the top of your two new file. We don't need every library in every view, so try and be conservative about what you import.

Next, we need to link all of our files together. At the bottoms of `task_view.js` and `task_list_view.js` add the following lines:

```javascript
// task_view.js
export default TaskView;

// task_list_view.js
export default TaskListView;
```

Export makes something defined in this .js file available in another file. The 'default' keyword means that this is the "main" thing we're exporting from this file, and will make importing it easier.

Finally, we need to import our new files where they're needed. `TaskListView` depends on `TaskView`, so add the following line to the top of `task_list_view.js`:

```javascript
import TaskView from 'app/views/task_view';
```

And similarly, our application requires `TaskListView`, so add the following line to the top of `app.js`:

```javascript
import TaskListView from 'app/views/task_list_view';
```

Notice that import paths are relative to the `src` directory. Once we've written our imports and exports, webpack should take care of the rest - you should be able to head to chrome and see the same page as before.

## What Did We Accomplish?
- Create a basic Backbone view to display a task. It had two functions:
  - `initialize()` is run once to set everything up
  - `render()` generates HTML, and may be run many times
- Use the underscore templating engine to separate concerns and clean up our rendering code
- Create a more complex Backbone view to manage our whole application
- Organize our application into multiple files

## Additional Resources
- [Backbone View Documentation](http://backbonejs.org/#View)
- [Backbone Applications Intro to Views](https://addyosmani.com/backbone-fundamentals/#views-1)
- [Underscore documentation](http://underscorejs.org/)
- [SitePoint Underscore tutorial](https://www.sitepoint.com/getting-started-with-underscore-js/)
