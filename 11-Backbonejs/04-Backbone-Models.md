
# Intro to Backbone Models

##Learning Goals

By the end of this lesson you should be able to:

- Explain what a Backbone Model is
- Create your own Backbone Model
- Instantiate your Backbone Model and assign attributes
- Use some basic Backbone Model methods

## Creating a Backbone Model

You create your own Model classes by extending the `Backbone.Model` class:

```javascript
var Task = Backbone.Model.extend( {

});
```

Then you can create your own instances of this `Task` model:

```javascript
var doThis = new Task();
```

Note that we use a capital letter for our Backbone model to indicate that this is a Model object.

## Constructors & Initialize

Just like with Ruby, you can initialize attributes and set up your Model in an initialize function.  

The `initialize` function runs, when a new instance is created. We specify the `initialize` as an object that we pass into the `extend` function.

```javascript
var Task = Backbone.Model.extend( {
  initialize: function() {
    console.log("A new task has been instantiated.");
	}
});

var doThis = new Task();
```

So if the script above is run the console will result in:

```console
A new task has been instantiated.
```

### Default Property

The defaults property lets you set default values to **attributes** for your model.  You can then retrieve those attribute values with the `get` function. We can also provide other properties to the model by including them in the object we pass to `extend`.

```javascript
var Task = Backbone.Model.extend( {
  defaults: {
      title: "Another task to perform",
      description: "Gotta get it done!",
      completed: false
  },
  initialize: function() {
    console.log("Task has been Created");
  }
});

var job = new Task();
console.log("The task has a title of " + ada.get("title"));
```

Results in:
```console
Task has been Created
The task has a title of Another task to perform
```

You can also pass in **attributes** to a model at instantiation via a JSON object in the parameters to new.

```javascript
var danTask = new Task({title: "Proofread Chris' work!", description: "Make sure he knows his stuff!", skillsToCheck: "Model Creation, method syntax, jQuery & AJAX"});
```

These attributes do not necessarily need to have default values specified, or really be specified in any way. In the example above, we've provided two of the fields that we decided to set defaults for, and added another, `skillsToCheck`.

## Get, Set & Unset

Once you have an instance of your Model you can use `get` & `set` functions to set its attributes. For the `set` function you may pass two arguments, an attribute name and the attribute's value. Or you may pass an object containing multiple attributes to be set on the model.

Setting **each key/value**:
```javascript
danTask.set("skillsToCheck", "Programming, Mathematics, Mountain Climbing.");
danTask.set("priority", "URGENT");
```

Setting using an **object**:
```javascript
danTask.set({
  skillsToCheck: "Programming, Mathematics, Mountain Climbing.",
  priority: "Super Urgent!"
});
```

```javascript
console.log(ada.get("priority")); // 'Super Urgent'
console.log(ada.get("skillsToCheck")); // 'Programming, Mathematics, Mountain Climbing.'
```

You can use `unset` to remove an attribute.
```javascript
ada.unset("skillsToCheck");

console.log(ada.get("skillsToCheck")); // undefined
```

## Adding Additional Functions to a Model

You can add additional functions to a Model like other properties:

```javascript
var Task = Backbone.Model.extend( {
  defaults: {
      title: "Study more Backbone!",
      description: "Because it's an awesome Library!",
      completed: false
  },
  initialize: function() {
    console.log("Task has been Created");
  },
  // If the task was complete mark it incomplete.
  // If the task was incomplete mark it complete.  
  toggleComplete: function() {
  	var status = this.get("complete");
  	this.set("complete", !status);
  }
});

var myTask = new Task();

mytask.finished(); // 'Study more Backbone! is NOT completed!'
```

## Rendering a Model

So we've demonstrated how to create a Model, but we've not bound it to a view to be rendered in the browser.  We can look at how to do this now.

We can set up a new Model for a Task List, to go with the View we created at the end of lesson 2.  

```javascript
Task = Backbone.Model.extend( {
  defaults: {
    title: "Something to do",
    description: "",
    completed: false
  }
});
```

Now in our view we want it to actually render the Backbone Model instead of a generic JavaScript Object.  So we will use the model and call it's `.attributes` property.  The `attributes` property is a generic JavaScript object with our Task's properties title & description.    


```javascript
  // The render function from TaskView
  render: function() {
  			// Notice that we've added .attributes
    var html = this.template({task: this.task.attributes});
    this.$el.html(html);

    // Enable chained calls
    return this;
  }
```
You will also need to update the TaskListView `getInput` function to use a Task model.

```javascript
  getInput: function() {
    var task = new Task({
      title: this.input.title.val(),
      description: this.input.description.val()
    });
    return task;
  },
```

And lastly to use our Models in the main Application.  


```javascript
$(document).ready(function() {
  var taskList = [];

  for (var i = 0; i < taskData.length; i++) {
  		// Create each task with a title & description
    var task = new Task(taskData[i]);
    taskList.push(task);
  }

  var template = _.template($('#task-template').html());

  var myTaskListView = new TaskListView({taskData: taskList, template: template, el: $('#application')});
  myTaskListView.render();
});
```

### Check-in Point

Your code at this point should look like [this:](https://gist.github.com/CheezItMan/733e901802f3915d2387a6509a59ac3d)  


## Resources
- [Backbone Model & View Documentation](http://backbonejs.org/#Model-View-separation)
-  [An Intro to Backbone Models & Collections](http://liquidmedia.org/blog/2011/01/backbone-js-part-1/)
-  [Backbone Fundamentals, Models Chapter](https://addyosmani.com/backbone-fundamentals/#models-1)
