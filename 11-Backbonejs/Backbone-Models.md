# Intro to Backbone Models

## Learning Goals

By the end of this lesson you should be able to:

- Explain what a Backbone Model is
- Create your own Backbone Model
- Instantiate your Backbone Model and assign attributes
- Use some basic Backbone Model methods
- Listen to Backbone Model events

## What is a Backbone Model
Backbone Models are much like Rails Models.  They keep track of your data and help in saving and loading information to and from your back end.

Things you can do with a model in Backbone include:
- Setting default values for new data
- Validating changes to the data
- Reading data from and writing it to an API
- Abstracting away complex bits of business logic
- Keeping track of a collection of data
- Triggering events when the data changes

Organizing all this functionality ourselves would be a giant pain in the butt, so let's create a model for our Todo items!

## Adding Models
In this first section, we will create a model to represent a single task. We will add this model to our application without adding any new functionality. Later we'll take advantage of the model to add some new features that would be much more difficult without it.

### Defining the Task Model
The first thing we need to do is create the model itself. Just like with views, we'll call `extend()`, this time on `Backbone.Model`. Our model will get its own file: `src/app/models/task.js`.

```javascript
// src/app/models/task.js
import Backbone from 'backbone';

var Task = Backbone.Model.extend({ });

export default Task;
```

In the code segment above we created a new type of model, `Task` which extends or inherits from `Backbone.Model` and we exported the type for any file which imports `src/app/models/task.js`.  

So now in our `src/app.js` file we can add.

```javascript
// src/app.js
import $ from 'jquery';
import _ from 'underscore';

// code You are adding
import Task from 'app/models/task';

var my_task = new Task({
  title: "Create a model",
  completed: true
});

console.log(my_task.get("title") +  " is completed: " + my_task.get("completed"));
// end of added code
// ...
```

What did this get us?  We now have a new `Task` type of object which can store information, in this case `title` and `completed`.  Then just to test it we created one instance of `Task` and logged it to the console.  

We can check to see if it works by launching the site with `$  npm start` and viewing http://localhost:8081

![console log for the code above](images/backbone-model1.png)


#### Check-in Point

Check with your SeatSquad and verify that you have the working output.  

**Question**:  What's that `.get` method?

Great question o'hypothetical student!

### Get & Set Methods

We created our task with two fields, `title` and `completed`.  We can access these fields with the `get` method.  You may have noticed how `.get` was used above in our initial logging of things to the console.

For example:

```javascript
// src/app.js
import $ from 'jquery';
import _ from 'underscore';

import Task from 'app/models/task';

var my_task = new Task({
  title: "Create a model",
  completed: true
});
  // prints "Title:  Create a model"
console.log("Title: " + my_task.get("title") );
  // prints "Complete:  true"
console.log("Complete: " + my_task.get("completed") );
```

The `set` method allows you to change the attributes of a Model by either passing it a key and value or by passing `set` a JSON object.

```javascript
import $ from 'jquery';
import _ from 'underscore';

import Task from 'app/models/task';

var my_task = new Task({
  title: "Create a model",
  completed: true
});

  // key & value example
my_task.set("title", "Test the `set` method.");
  // prints "Title:  Test the `set` method."
console.log("Title: " + my_task.get("title") );

  // using an object
my_task.set({title: "Run a hash of object"});
  // prints "Title:  Create a model"
console.log("Title: " + my_task.get("title") );
  // prints "Complete:  true"
console.log("Complete: " + my_task.get("completed") );
```

That's... great, but lets get something output to the webpage.

### Creating An Underscore Template

Lets use our fabulous underscore library to create a template to render, or draw our task item.  

```html
<!-- build/index.html -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
</head>
<body>
  <!-- Where the main content of our page will go -->
  <main>
  </main>
  <div id="test-area">
  </div>
  <script id="taskItemTemplate" type="text/template">
    <section class="task-item">
      <h1><strong>Title:</strong> <%= title %></h1>
      <h3><strong>Completed:</strong> <%= completed %></h3>
    </section>
  </script>

  <script src="/app.bundle.js" charset="utf-8"></script>
</body>
</html>

```

Note inside the `body` element is an underscore template.  Next we'll use the template to add content.  

To use the jQuery template first we select the template text using jQuery.  Next we use the `_.template` method to get a template object by passing it the text of the template block.  The `<%= %>` handles tell underscore to insert a value in from the parameters passed to the object when it's called.  Lastly we append the compiled template to the contents of the `main` element using the fields in `my_task`.  

```javascript
// src/app.js
import $ from 'jquery';
import _ from 'underscore';

import Task from 'app/models/task';

var my_task = new Task({
  title: "Create a model",
  completed: true
});

// Added Code
  // Select the template using jQuery
var template_text = $('#taskItemTemplate').html();
  // Get an underscore template object
var template = _.template(template_text);
  // 
$('main').append(template(my_task.toJSON()));
// End of new code
// ...
```

### $(document).ready

We want to make sure that our code does not execute until the page is fully loaded.  We can ensure that by placing our code into an event handler called when the browser has the document ready (fully loaded).  So inside the event handler we create a task model and an underscore template then compile the template with the model and append the result to the `main` element.

```javascript
// src/app.js
import $ from 'jquery';
import _ from 'underscore';
import Task from 'app/models/task.js';

$(document).ready(function() {
  var my_task = new Task({
    title: "Create a model",
    completed: true
  });
    // Select the template using jQuery
  var template_text = $('#taskItemTemplate').html();
    // Get an underscore template object
  var template = _.template(template_text);
    // 
  $('main').append(template(my_task.toJSON()));
});
// ...
```

#### Check-In Point 

You should have the task displayed on the browser now.  With your SeatSquad member, first check and verify that you both have it working.  Then add a few more tasks to the display.  You can see one example [here:](https://gist.github.com/CheezItMan/33b342b9d47e345482ff2682b62938d0)


### Revisiting The Task Model

We can edit the Task model by adding a hash of attributes to initialize.  For example below we can set default values for attributes:

```javascript
// src/app/models/task.js
import Backbone from 'backbone';

var Task = Backbone.Model.extend({
  defaults: {
    title: '',
    completed: false
  }
});

export default Task;
```

Then any tasks created like `var my_other_task = new Task({title: "Study JavaScript" });` will automatically have a field named `completed` set to false.  This is also how you can add custom methods (including business logic) to your model. For example we've done a lot of printing the title & completion status of our Task to the console, a logStatus method might be handy. 

```javascript
// src/app/models/task.js
import Backbone from 'backbone';

var Task = Backbone.Model.extend({
  defaults: {
    title: '',
    completed: false
  },
  logStatus: function() {
    console.log("Title: " + this.get("title"));
    console.log("Completed: " + this.get("completed"));
  }
});

export default Task;
```

Then in our `app.js` we can simply print out the status of our task with:  `my_task.logStatus();`

#### Check-in Point

Add a `toggleComplete` method which marks a complete task to incomplete or an incomplete task to complete.  We'll try to use it later.

If you're stuck you can see a working solution [here:](https://gist.github.com/CheezItMan/5fea6abc8ceeda31e14a691ca0938159)

### A List of Models

Now that we have a model & a template we can output a list of tasks to the browser.  

```JavaScript
// src/app.js
import $ from 'jquery';
import _ from 'underscore';
import Task from 'app/models/task.js';

var taskData = [
  {
    title: 'Mow the lawn',
    description: 'Must be finished before BBQ on Sat afternoon'
  }, {
    title: 'Go to the Bank',
    description: 'Need to make a transfer'
  }, {
    title: 'Tune the Piano',
    description: 'High C is missing or something???'
  }
];
var tasks = [];

$(document).ready(function() {
  _.each(taskData, function(taskObj) {
    var task = new Task(taskObj);
    tasks.push(task);
    var template_text = $('#taskItemTemplate').html();
      // Get an underscore template object
    var template = _.template(template_text);
      //
    $('main').append(template(task.toJSON()));
  });
  $('#test-area').append($('<p>Hello World!</p>'));
});
```

Now using an Array, we can display any number of Tasks using the Underscore template on the screen.  

## What Have We Accomplished
- Create a basic Backbone model to represent a task
- Created a template to display this task in the browser

## Resources
- [Backbone Model & View Documentation](http://backbonejs.org/#Model-View-separation)
- [An Intro to Backbone Models & Collections](http://liquidmedia.org/blog/2011/01/backbone-js-part-1/)
- [Backbone Fundamentals, Models Chapter](https://addyosmani.com/backbone-fundamentals/#models-1)
