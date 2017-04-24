# Backbone Collections

## Learning Goals

At the end of this you should be able to:
- Explain what a Backbone collection is
- Place models into a collection
- Manipulate models in a collection
- Respond to events emitted by collections

## Introduction

In Backbone a Collection is a type of Model that has other Model instances inside it.  You can think of it as similar to an Array: an ordered collection of Models.  

Using a Collection instead of an Array will bring us similar benefits to using a Model instead of a raw JavaScript Object. Collections can abstract away complex bits of logic (like only selecting Models that match a condition), they're also really good at talking to APIs, and they emit events when they change.

In this lecture we will begin to scratch the surface of the Power of collections.  We will stop using arrays of Model objects and use Collections instead.  Then in the next lecture we will look at the Event model Backbone inherits from Underscore and how it applies to Collections & Models. 


## Adding a Collection
### Defining the Collection
The first thing we need to do is create the collection itself.  Our collection will get its own file: `app/collections/task_list.js`. As with models and views, we will call `extend()` on `Backbone.Collection`.

```javascript
// app/collections/task_list.js
import Backbone from 'backbone';
import Task from 'app/models/task';

var TaskList = Backbone.Collection.extend({
  model: Task
});

export default TaskList;
```

### Assembling the Collection
In `app.js`, we'll create a new instance of our Collection from our raw task data, and pass it to our View. First, import our new `TaskList` constructor:

```javascript
// app.js
import TaskList from 'app/collections/task_list';
```

Second, in `$(document).ready()`, instead of using an array of JavaScript objects, we'll use them to create a `TaskList` and use that instead.

```javascript
// src/app.js
import $ from 'jquery';
import _ from 'underscore';

import Task from 'app/models/task';
import TaskList from 'app/collections/task_list';

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

$(document).ready(function() {
  $('main').innerHTML = "";
  var taskList = new TaskList(taskData);
  // Select the template using jQuery
  var template_text = $('#taskItemTemplate').html();
  // Get an underscore template object
  var template = _.template(template_text);

  taskList.each(function(task) {
    $('main').append(template(task.toJSON()));
   });
});

```

Notice that just like you can create a Model from a raw JavaScript object, you can create a Collection from an array of raw JavaScript objects.  This works as long as the `model` property of the Collection is set.

Remember that a Collection is just a special type of Model. This means we can pass the Collection in under the `model` property, and Backbone will mostly know what to do. Using a Backbone Collection should reduce the code we need to write.

### Iterating Through A Collection

Another thing to notice is that we used the Collection's `.each` method to iterate through a collection with the Collection's `.each` method and replicate the output we obtained with an Array of Tasks.  

```JavaScript
  taskList.each(function(task) {
    $('main').append(template(task.toJSON()));
   });
```











#### Adding a Model to a Collection

We can add a model to a Collection with the `.add` method.

```Javascript
taskList.add({title: "Brush Teeth", completed: false});
```





## What Have We Accomplished?

- Replace the array of Models in our `TaskListView` with a proper Backbone Collection
- Listen to events on the Collection to know when to update our display
- Add the ability to delete a task from our task list

## Additional Resources
- [Backbone docs on Collections](http://backbonejs.org/#Collection)
- [cdnjs on Collections](https://cdnjs.com/libraries/backbone.js/tutorials/what-is-a-collection)
