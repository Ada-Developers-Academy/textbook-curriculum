
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
ada.unset("skillsToChek");

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
  finished: function() {
  	if (this.get("completed"))
    	console.log(this.get("title") + " is completed!");
    else
    	console.log(this.get("title") + " is NOT completed!");

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

Now in our view we want it to actually render the Backbone Model instead of a generic JavaScript Object.  So we will use the model and call it's `.toJSON()` function.  

```javascript
TaskView = Backbone.View.extend( {
  tagName: 'section',
  className: 'media no-bullet column',
  template: _.template($('#tpl-task').html()),
  initialize:  function() {
    // put event listeners here!
  },
  render: function() {
  						// convert the model to JSON for the template
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});
```

And lastly to put them together.
```javascript
$( document ).ready( function() {
    // create a new Model object
  var myTask = new Task({
      title: "Learn Backbone!",
      description: "Backbone will help me structure my code!",
      completed: false
  });
    // create a new View with the Model attribute set.
  var taskView = new TaskView({
    model: myTask
    });
    $('#container').append(taskView.render().$el);
});
```

## Resources
- [Backbone Model & View Documentation](http://backbonejs.org/#Model-View-separation)
-  [An Intro to Backbone Models & Collections](http://liquidmedia.org/blog/2011/01/backbone-js-part-1/)
-  [Backbone Fundamentals, Models Chapter](https://addyosmani.com/backbone-fundamentals/#models-1)
