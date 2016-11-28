# Intro to Backbone Models

## Learning Goals

By the end of this lesson you should be able to:

- Explain what a Backbone Model is
- Create your own Backbone Model
- Instantiate your Backbone Model and assign attributes
- Use some basic Backbone Model methods

## What is a Backbone Model
So far, all our views have been built around raw data. This works fine when the data is simple and static, but will start to become very messy as the things we do with our data get more complex.

This is where Backbone models come in. Models in Backbone fill the same role they do in Rails: keeping track of your data. Things you can do with a model in Backbone include:

- Setting default values for new data
- Validating changes to the data
- Reading data from and writing it to an API
- Abstracting away complex bits of business logic
- Keeping track of a collection of data
- Triggering events when the data changes

Organizing all this functionality ourselves would be a giant pain in the butt, so let's add a model to our task list!

## Adding a Model
In this first section, we will add a model to our task list without adding any new functionality. Later we'll take advantage of the model to add some new features that would be much more difficult without a model.

### Defining the Model
The first thing we need to do is create the model itself. Just like with views, we'll call `extend()`, this time on `Backbone.Model`. Our model will get its own file: `src/app/models/task.js`.

```javascript
// src/app/models/task.js
import Backbone from 'backbone';

var Task = Backbone.Model.extend({
  defaults: {
    title: "Unknown Task",
    description: "placeholder description"
  },
  initialize: function() {
    console.log("Created new task with title " + this.title);
  }
});

export default Task;
```

I lied when I said we weren't going to add any new functionality. We've provided two properties in our call to `extends()`, both of which get us something new.

The first property is an object called `defaults`, which sets default values for our model's attribute. When a new model is created, any attributes that aren't provided will be filled in from here. The `defaults` object is not required, nor are you required to provide a default for every attribute.

The second property is one we've seen before in our views: `initialize()`. This function is called once when the model is created, and can be used to set up anything special. Right now we just log to the console.

### Using the Model
Now that we've defined a model, we need to use it in our application.

#### TaskListView
Most of the work will be in `TaskListView`. We're going to be making a bunch of changes, so it might make sense to [consult this diff](https://gist.github.com/droberts-ada/78472d66dbdb3b02fde52ea6cfc3a674/revisions?diff=split).

Since the `Task` model is defined in a separate file, we need to import it:

```javascript
import Task from 'app/models/task';
```

There are two more changes we'll need to make, each in two places. First, we need to change the way we store tasks. Instead of an array of raw JavaScript objects, we'll store an array of `Task` models. Second, we need to build our `TaskViews` around `Task`s, rather than around raw objects. We'll need to make these changes everywhere a task is added, that is, in both `initialize()` and `createTask()`.

As we noticed at the end of the last lecture, the process of adding a card is similar enough in both places to warrant a separate function. Since we're messing with this anyway, now is a good time. We'll call our new function `addTask()`.

```javascript
// Turn a raw task into a Task model, add it to our list of tasks,
// create a card for it, and add that card to our list of cards.
addTask: function(rawTask) {
  // Create a Task from this raw data
  var task = new Task(rawTask);

  // Add the new task model to our list
  this.modelList.push(task);

  // Create a card for the new task
  var card = new TaskView({
    model: task,
    template: this.taskTemplate
  });

  // Add the card to our card list
  this.cardList.push(card);
},
```

And now update `initialize()` and `createTask()` to use our new function:

```javascript
initialize: function(options) {
  // Compile a template to be shared between the individual tasks
  this.taskTemplate = _.template($('#task-template').html());

  // Keep track of the <ul> element
  this.listElement = this.$('.task-list');

  // We'll keep track of a list of task models and a list
  // of task views.
  this.modelList = [];
  this.cardList = [];

  // Process each task
  options.taskData.forEach(function(task) {
    this.addTask(task);
  }, this); // bind `this` so it's available inside forEach

  // Keep track of our form input fields
  this.input = {
    title: this.$('.new-task input[name="title"]'),
    description: this.$('.new-task input[name="description"]')
  };
},

// ...

createTask: function(event) {
  // Normally a form submission will refresh the page.
  // Suppress that behavior.
  event.preventDefault();

  // Get the input data from the form and turn it into a task
  var task = this.getInput();

  // Keep track of this task
  this.addTask(task);

  // Re-render the whole list, now including the new card
  this.render();

  // Clear the input form so the user can add another task
  this.clearInput();
},
```

#### TaskView
One more thing to do: make our `TaskView` wrap the model. Like `el`, `model` is a Backbone thing which means we don't need to store it ourselves.

```javascript
// src/app/views/task_view.js
var TaskView = Backbone.View.extend({
  initialize: function(options) {
    this.template = options.template;
  },

  render: function() {
    var html = this.template({task: this.model.attributes})
    this.$el.html(html);

    // Enable chained calls
    return this;
  }
});
```

#### Check-in Point
Your site should now be functioning again. We haven't added any new functionality, but you should be able to see the 3 initial tasks and add new ones. Your code should look [like this](https://gist.github.com/droberts-ada/269a7dd0d809a5c8aab5e44891499d27).

## Creating a Backbone Model

You create your own Model classes by extending the `Backbone.Model` class:

```javascript
var Person = Backbone.Model.extend( {

});
```

Then you can create your own instances of this `Person` model:

```javascript
var ada = new Person();
```

Note that we use a capital letter for our Backbone model to indicate that this is a Model object.

## Constructors & Initialize

Just like with Ruby, you can create constructors to initialize attributes and set up your Model.  

The `initialize` function runs, when a new instance is created. We specify the `initialize` as an object that we pass into the `extend` function.

```javascript
var Person = Backbone.Model.extend( {
  initialize: function() {
    console.log("A new person has been instantiated.");
	}
});

var ada = new Person();
```

So if the script above is run the console will result in:

```console
A new person has been instantiated.
```

The defaults property lets you set default values to **attributes** for your model.  You can then retrieve those attribute values with the `get` function. We can also provide other properties to the model by including them in the object we pass to `extend`.

```javascript
var Person = Backbone.Model.extend( {
  defaults: {
      name: "Ada",
      age: 21
  },
  initialize: function() {
    console.log("Person has been Created");
  }
});

var ada = new Person();
console.log("The person is named " + ada.get("name"));
```

Results in:
```console
Person has been Created
The person is named Ada
```

You can also pass in **attributes** to a model at instantiation via a JSON object in the parameters to new.

```javascript
var babbage = new Person({name: "Charles Babbage", age: 65, skills: "Hardware Design, Mathematics, Flower Arrangement."});
```

These attributes do not necessarily need to have default values specified, or really be specified in any way. In the example above, we've provided two of the fields that we decided to set defaults for, and added another, `skills`.

## Get, Set & Unset

Once you have an instance of your Model you can use `get` & `set` functions to set its attributes. For the `set` function you may pass two arguments, an attribute name and the attribute's value. Or you may pass an object containing multiple attributes to be set on the model.

Setting **each key/value**:
```javascript
ada.set("skills", "Programming, Mathematics, Mountain Climbing.");
ada.set("phone", "(444) 465-9122");
```

Setting using an **object**:
```javascript
ada.set({
  skills: "Programming, Mathematics, Mountain Climbing.",
  phone: "(444) 465-9122"
});
```

```javascript
console.log(ada.get("phone")); // '(444) 465 9122'
console.log(ada.get("skills")); // 'Programming, Mathematics, Mountain Climbing.'
```

You can use `unset` to remove an attribute.
```javascript
ada.unset("skills");

console.log(ada.get("skills")); // undefined
```

## Adding Additional Functions to a Model

You can add additional functions to a Model like other properties:

```javascript
var Person = Backbone.Model.extend( {
  defaults: {
      name: "Ada",
      age: 21
  },
  initialize: function() {
    console.log("Person has been Created");
  },
  sayHi: function() {
    console.log(this.get("name") + " says HI!");
  }
});

var myPerson = new Person();

myPerson.sayHi(); // 'Ada says HI!'
```

## Rendering a Model

So we've demonstrated how to create a Model, but we've not bound it to a view to be rendered in the browser.  We can look at how to do this now.

We can set up a new Model for a Todo List, to go with the View we created at the end of lesson 2.  

```javascript
TodoManager.Models.Todo = Backbone.Model.extend( {
  defaults: {
    title: "Something to do",
    description: "",
    completed: false
  }
});

```

Now in our view we want it to actually render the Backbone Model instead of a generic JavaScript Object.  So we will use the model and call it's `.toJSON()` function.  

```javascript
// app/views/todo.js
TodoManager.Views.Todo = Backbone.View.extend( {
  tagName: 'section',
  className: 'media no-bullet column',
  template: _.template($('#tpl-todo').html()),
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

And lastly to put them together in our `app/js/app.js` file.
```javascript
window.TodoManager = {
  Models: {},
  Collections: {},
  Views: {}

};
$(function() {
    // create a new Model object
  var myTodo = new TodoManager.Models.Todo({
      title: "Learn Backbone!",
      description: "Structure my code!",
      completed: false
  });
    // create a new View with the Model attribute set.
  var todoView = new TodoManager.Views.Todo({
    model: myTodo
    });
    $('#todocontainer').append(todoView.render().$el);
});
```

## Resources
- [Backbone Model & View Documentation](http://backbonejs.org/#Model-View-separation)
-  [An Intro to Backbone Models & Collections](http://liquidmedia.org/blog/2011/01/backbone-js-part-1/)
-  [Backbone Fundamentals, Models Chapter](https://addyosmani.com/backbone-fundamentals/#models-1)
