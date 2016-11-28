# Backbone Collections

## Learning Goals

At the end of this you should:
- Be able to explain what a Backbone collection is
- Be able to place Models into a collection
- Be able to manipulate models in a collection
- Be able to filter models within a collection

## Collection Introduction

In Backbone a Collection is a type of Model that has other Model instances inside it.  You can think of it as similar to an Array, as an ordered collection of Models.  

Collections are useful for storing and manipulating a group of models.

## Creating a Collection

To create a Backbone Collection you will need to extend Backbone.Collection.  As shown below you can also add models into the collection when you instantiate it.  

```javascript
var TaskList = Backbone.Collection.extend({

});

// Instantiating a People collection and starting it with some models.
var myJobs = new TaskList([
					new Task({title: 'Mow the lawn', 
							description: 'Must be finished before BBQ on Sat afternoon'}),
					new Task({title: 'Clean the Grill', 
							description: 'Must be finished before the weeds swallow the dog.'}),
					new Task({title: 'Wash the car', 
							description: 'Due after the rain stops'}),
					new Task({title: 'Buy the Soda', 
							description: 'Must be at least 1/2 Dr. Pepper'})
					]);

// Adding a Task via the add method.
myJobs.add( new Task( {title: "Make my list", description: "Create a shopping list"} ) );
```

Looking at the model in the console we can see the Models are stored in the collection under the models attribute, an array, and each instance has an index number.  They also have an attribute called a `cid` which is an id that Backbone assigns to each Model instance.  Models synched with a server also have a persistent `id` assigned by the server.

![Client Server](images/modelconsole.png)


## Getting At Our Models!

You can retrieve a model from a Backbone collection via the `get` method which will take either the index number of the model and the Collection's `at` attribute, or via it's cid.

```javascript
// will print a model
console.log(myJobs.at(0));
var task1 = myJobs.at(0);

// Will retrieve the model with cid equal to "c1" from the collection, if it exists.
console.log(myJobs.get("c1"));

var task2 = myJobs.get("c1");
```


## Removing Models

You can remove models in Backbone via it's `remove` method.

```javascript
var taskToRemove = myJobs.at(3);
myJobs.remove(taskToRemove);
```



## Looping Through a Collection

You can loop through a collection, known as iterating, using the `each` method.  This method takes an anonymous function and applies it to each model in turn.  The models are passed into the function one at a time as a parameter.


```javascript

// Causes each title to print
myJobs.each(function(task) {
  console.log(task.get("title"));
});
```

## Filtering Models

You can also get a collection of filtered results with the `where` method.  The `where` method finds array of Models matching the given attributes.

```javascript
var jobs = myJobs.where( { title: "Wash the car" });

for (var i = 0; i < jobs.length; i++) {
  console.log(jobs[i].get("description");
}
```

If you only want to find the first occurrence of the matching condition then you can use the the `findWhere` method.  The `findWhere` method returns the first matching model in the collection.  

```javascript
// Returns the model with {title: 'Mow the lawn', description: 'Must be finished before BBQ on Sat afternoon'}
var matchingInstructor = myPeople.findWhere( {title: 'Mow the lawn', description: 'Must be finished before BBQ on Sat afternoon'} );
```

## Pushing & Popping 

Backbone Collections also have the `push` and `pop` methods which add an element to the rear and take an element off the rear of the collection.  

```javascript
// Returns the first Task Model and takes it off the collection
var popped = myJobs.pop();

var newJob = new Task({title: "Hire new Dev", description: "Need a React Dev for project X"});
myJobs.push(newJob);
```


## Backbone Collections in Our Todo App

So Backbone Collections can store groups of Models, but how does that apply to my webpage.  Often you wan to render collections of Models not Models 1-by-1.  So you can build a View for a collection.

We will use the following collection to match our Task-list application.  We can create a new file in `src/app/collections/TaskList.js`

```javascript
// src/app/collections/TaskList.js
import Task from 'app/models/Task';

var TaskList = Backbone.Collection.extend({
  initialize: function() {
    // Event listeners go here
  },
  model: Task
});

export default TaskList;
```

Then we can edit the `src/app/views/TaskListView.js` file to enable it to use our new Backbone Collection.  We only need to edit the initialize function to use the model's `.each` function instead of the Array `.forEach` function.  

```javascript
initialize: function(options) {
	// Set the input buttons for events.
  this.input = {
          title: $('#title'),
          description: $('#description')
  };
  // Store a the full list of tasks
  this.taskData = options.taskData;

  // Compile a template to be shared between the individual tasks
  this.taskTemplate = _.template($('#task-template').html());

  // Keep track of the <ul> element
  this.listElement = this.$('.task-list');

  // Create a TaskView for each task
  this.cardList = [];
  
	// notice that we are using the Collection .each function
  this.taskData.each(function(task) {
    var card = new TaskView({
      task: task,
      template: this.taskTemplate
    });
    this.cardList.push(card);
  }, this); // bind `this` so it's available inside forEach
},
```

And now we can edit `app.js` to use a Collection to store the Model data.  

```javascript
$(document).ready(function() {
	// Create a Collection
  var taskList = new TaskList([]);
  for (var i = 0; i < taskData.length; i++) {
    taskList.add(new Task(taskData[i]));
  }
  
	// Create a TaskListView
  var taskListView = new TaskListView({
    el: $('#application'),
    model: taskList
  });
  
	// Render the view
  taskListView.render();
});
```

So it works now, but we're not really using the Power of a Collection.   Backbone Collections can provide events to communicate changes to the collection.  In the next unit we will see how to add events to our TaskList and enable them to communicate.  


## Resources
- [CNDJS - What is a Collection](https://cdnjs.com/libraries/backbone.js/tutorials/what-is-a-collection)

