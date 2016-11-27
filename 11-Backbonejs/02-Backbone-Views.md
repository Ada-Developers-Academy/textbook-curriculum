
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
<main class="row">
  <section class="small-12 columns">
    <h1>Task List</h1>
  </section>

  <ul id="task-list" class="small-12 large-6 columns end">
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
var taskView = new TaskView();
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
  var taskView = new TaskView({task: taskData[0]});
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
  this.$el.html($(html));

  // Enable chained calls
  return this;
}
```

Then in `$(document).ready()`, call `render()`.

```javascript
$(document).ready(function() {
  var taskListElement = $('#task-list');
  var taskView = new TaskView({task: taskData[0]});
  taskListElement.append(taskView.render().$el);
});
```

Notice that we use jQuery to select the task list in the DOM, and call `append()` to make our generated HTML show up. Notice also that, because we return `this` from `render()`, we can combine the call to `render()` and the call to `append()` in one line. This isn't strictly necessary - we could just as easily have said

```javascript
taskView.render();
taskListElement.append(taskView.$el);
```

Chaining on `render()` is a very common thing in Backbone, and much of the code you'll find on the internet assumes you're using it. It will be much less painful to get into the habit of always returning `this` from `render()` now.

#### Many Views
One last step remains. Right now we're only viewing one task, but we want to see all of them. This can be solved with a quick loop:

```javascript
$(document).ready(function() {
  var taskListElement = $('#task-list');
  var taskViews = []
  taskData.forEach(function(task) {
      var taskView = new TaskView({task: task});
      taskViews.push(taskView);
      taskListElement.append(taskView.render().$el);
  });
});
```

**Check-in Point:** Right now, your `app.js` should look [like this](https://gist.github.com/droberts-ada/41c26e15772b2c6986a765d002a25e82).

### Templating


So how do Underscore templates play into this?

Rendering raw html in the render function is both time consuming and painful to do.  Instead we can use a template attribute into our view.

First we'll add an underscore template to our view:

```html
    <script type="text/template" id="tpl-person">
      <h2>Welcome to Backbone <%- name %> </h2>
      <p><strong>Age: </strong> <%- age %></p>
    </script>
```

Next we'll add another attribute to the view, `template: _.template('#tpl-person').html()`.  So we are binding the template to an HTML element and then

Next we can determine the data we want to render with a JSON object as another attribute.  
```javascript
model: {
	title: "Eat Mod Pizza",
	description: "Because I'm SOOOOO hungry",
	completed: false
}
```

And in our render method we can then render the template with the data.

```javascript
this.$el.html(this.template(this.model));
```

With the resulting JavaScript Code:

```javascript
var TodoView = Backbone.View.extend({

  el: $('#todo'),
  initialize: function(){
  		// render immediately upon creation.
      this.render();

   },
   		// bind the underscore template & compile the HTML
   template: _.template($('#tpl-todo').html()),
   		// render the template inside the `el` element.  
   render: function(){
      this.$el.html(this.template(this.model));
    }
});


$(document).ready(function(){
		// Create a Todo with data.
    var todoView = new PersonView({
    model: {
      title: "Slack Kari",
      description: "I need to ask her for more homework!",
      completed: false
    }
    });

});
```



## Resources
- [Backbonejs View Documentation](http://backbonejs.org/#View)
- [Backbone.js Applications Intro to Views](https://addyosmani.com/backbone-fundamentals/#views-1)
