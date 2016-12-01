# Adding Custom Events

## Learning Goals
By the end of this document you should be able:
-   to explain how the Backbone Event API works
-   to add custom events to Backbone Views, Collections & Models.
-   to explain the concept of an Event Bus
-   to use an Event Bus to enable Backbone objects to communicate.  

## Adding An Event To An Object

In Backbone Models contain information and business logic and Views render model data.  Events are how Views & Models communicate.  

You've seen jQuery Events like below:

```html
<button id="sample-button">Press Me</button>

<script>
$('#sample-button').on('click', function() {
  alert("You Pressed it");
})
</script>
```

In this we added a jQuery Event to the button and caused an alert to 'fire' when the button was pressed.  Similarly we can use the Backbone.Events module to give any object the ability to register and 'trigger' events.  

Below we have created a generic JavaScript object and then used Underscore to mix-in the Backbone.Events module into the object.  Then we add an event called, "Past_Due" to the object and Triggered the event with the `.trigger` function.  

Notice the `_.extend(task, Backbone.Events)` line.  The authors of Backbone have created a way to define custom events with an Object called Events, similar to the DOM events we have used earlier.  Events provides a few functions (`on()` and `listenTo()`) for event handlers to subscribe to events and a single function to "trigger" an event (named `trigger`).  

Remember [Ruby Mix-ins](https://www.tutorialspoint.com/ruby/ruby_modules.htm)?  In Ruby we can define a model and use include or extend to bring those methods into existing classes as static or instance methods.  By default JavaScript doesn't really do Mix-ins, but the wonderful developers of Underscore provides a way to **Mix-in** functions from one object into another.  So below we Rubyfy Javascript to add in the Mixin 

```javascript
// generic Javascript example

var task = {
  assignee: "Dan",
  task:     "Do work",
  due_date: "01/01/2017"
};

_.extend(task, Backbone.Events);

task.on("PastDue", function(message) {
    $("#content").append("<h2>Your Task <span class='red'>" + this.task + 
    	"</span> is " + message.msg + ".</h2> <p> Current Date: " +
    	 message.date.toLocaleDateString('en-US') + "</p>")
});

task.trigger("Past_Due", {msg: "past due",
							date: new Date()						
});
```

You can play with this in action [here:](http://codepen.io/CheezItMan/pen/JbyrOG).


When you fire an event with `.trigger`.  The function takes 2 parameters.  The first is the name of the event to trigger, while the second is an optional pargument to send to the function handling the event.  In the case above it was a simple message about the task being overdue.  Like above, when you need to pass multiple parameters you can simply pass a JavaScript object as the second parameter.   

### Events: on, off & trigger

You can have objects start and stop listening to events by using the `on()` and `off()` functions.  

The `on()` function lets the browser know that the given function is listening for the given event and to call it when that event occurs.  

The `off` function causes the object to stop all or a single specific callback 'listening' to the event.  Think of it as unsubscribing to the event.  You can see it in action [here](http://codepen.io/CheezItMan/pen/bBroxm).  It's important to know that if you call off like `task.off("pastDue")` with only the name of the Event passed as an argument you will unsubscribe **all** callbacks listening to the Event.  If you want to only unsubscribe a single callback that function must be passed as the 2nd argument.  For example: `task.off("pastDue", sampleFunction);`

The `trigger` function causes all callbacks to the given Event to run.  You can specify an argument to pass to the callback function as a 2nd argument.  In the example above we did so here:  `task.trigger("Past_Due", {msg: "past due",
                            date: new Date()                        
});`.



## Adding Events To A View

There are two types of Events a View can listen for in Backbone.  The first are DOM events like we've dealt with earlier.  The second are custom events using Backbone's Event API like we've seen above.  

DOM events are bound using the View's `events` property or using `jQuery.on()`.  Look at [this CodePen](http://codepen.io/CheezItMan/pen/GNvMVG?editors=1010).  In this CodePen we have created a view for a Task item and added an event when the view is clicked on.

Dom Events are added as an Object property of the view with the name of the event as the "key" and the value being the name of the function which serves as the callback function for the event.  

```javascript
// 'app/views/task.js'

var TaskView = Backbone.View.extend({
  tagName: "li",
  events: {
    "click": "onClick"
  },
  onClick: function() {
    console.log("Clicked!  Model:  " + this.model.get("title"));
  },
  render: function() {
    this.$el.html(this.model.get("title"));
    return this;
  }
});
``` 

If you wanted to listen for a specific item within the view you could, with jQuery, specify the item using a CSS Selector.  For example if there was a block within the view with a class `title` and you wanted to listen for clicks on that block, you could put this line into the events hash `"click .title": "onTitleClick"`.  This would cause the View to listen for clicks on any element within the view and with the `title` class.  When any sub-element with that class is clicked on the `onTitleClick` event handler will run.


Backbone Events API allows you to add event handlers with the `.on` method as you saw earlier.  This lets you create custom events that can be triggered in your Models or Views to update other objects when something occurs, a change in status, user interaction etc.  

Looking at the TodoViews in the Codepen, we can see when a task is clicked on using a DOM event.  However it would be REALLY useful if we could update another view when a Todo item is clicked on, for example to show more details on the selected Todo item.  Thus we will return to the Backbone Events API and the idea of an Event Bus later.

### listenTo 

Similar to the `.on` function, the `.listenTo()` method lets a Backbone object listen to an event that occurs on another object.  Look below and see how `listenTo()` differs from the `on()` function.  The main difference between the two is the context in which they add callbacks.  `on()` lets you directly add a callback function to another object.  `listenTo()` tells an object to listen for events on another object.  This allows the 'listener' to keep track of the objects for which it is listening.  

Here's another example:

```javascript
// A view listening to a Task Model's event.
this.listenTo(this.task, 'change:completed', this.filterOne);
this.task.on('change:completed', this.filterOne);
```

Notice that the `listenTo()` method has the listening object subscribe to another object's event.  The on method has the model, which generates the event remember to notify the callback function.  There's another difference between `listenTo()` and `on()`.  If you call another function `stopListening` any listeners added by `listenTo()` will be removed.  Similarly if a view is removed with the `remove` method all listeners using `listenTo()` will be removed.  Models behave the same way, models deleted with the `destroy` method will call `stopListening` on any subscribers using `listenTo()`  In the **old** days, the only way to subscribe to an event was with the `on()` function and back then when views or models were removed the listening callback functions remained and this lead to unnecessary memory usage and weird errors.  

The only advantage `on()` has is that with on, you can pass the context of the event.  In other words you can decide what `this` will be in the function.  By default, `this` in the callback function is the object that generated the event, the object who's on method you called.  However you can specify an alternative.  

You can do something like this where the last argument is the context of the event handler (what `this` will refer to in the event handler).  

```javascript
// in app/views/task_list_view

// prints the view to the console
this.model.on("update", function() {
  console.log("this is:  ", this);
}, this);  // <--- Note the "this" 3rd parameter.

// prints the view to the console
this.listenTo(this.model, "update", function() {
  console.log("listenTo this = ", this);
});

// prints the model to the console. 
this.model.on("update", function() {
  console.log("this is:  ", this);
});
```

Honestly it's something that will *almost* never be used.

So... when in doubt use `listenTo()`.  

One last example showing two uses of `on()` and `listenTo`.

```javascript
// Generic Example Javascript file

var myTask = new Task({title: "Study Ruby", description: "Learn about Procs"});
var myTaskView = new TaskView({model: model, template: template});
myTaskView.listenTo(myTask, 'change', function(event) {
	console.log('Task changed!');
});

myTask.on('change', function(event) {
	console.log('Task changed!');
}, this);
```

## Events & Collections

Collections also have a set of Events which are very handy when combined with Views.

Collection Events:
*  `add` - This event is triggered when a model is added to the collection.
*  `remove` - This event is triggered when a model is removed from the collection
*  `change` - This event is triggered when a model is changed in the collection.  


## Events in our TaskList App

Right now we can create, delete and view our Tasks, but what about editing?  Well we could Edit the cards by reusing the existing input fields.

So what we'll do:  

1.  Setup an event handler for when a task card is clicked on.  
1.  Then we can 'trigger' an event letting our TaskListView know that we want to edit this task.
1.  When the task Lists' listener 'hears' the event it can delete the card being edited, and put the title & description fields in the input tags.

There will be drawbacks, but we'll see how it works.

### First create an Event listener in TaskView for when the `<div>` in the template is clicked on:

```javascript
   // in app/views/task_view.js
  events: {
    'click .complete-button': 'completeHandler',
    'click .delete-button': 'deleteTask',
    'click div': 'editTask'
  },
  editTask: function() {
    // Trigger the editMe event
    this.trigger('editMe', this);
  },
```

Notice that above we are **triggering** an event called `editMe` and passing any listeners a copy of `this` object.  

TaskListView needs to listen to the event however, so we'll need to add a Listener to each 'card' in our view and define a callback function.  

```javascript
    // In app/views/task_list_view.js
addTask: function(task) {
    // Create a TaskView object
  var card = new TaskView({
    model: task,
    template: this.taskTemplate
  });
  
    // Add the object to the list of TaskViews  
  this.cardList.push(card);
  
    // Listen for the 'editMe' event.
  this.listenTo(card, "editMe", this.editCard);
},

  // EventListener
editCard: function(card) {
    // set the title to the selected Card's title
  this.input.title.val( card.model.get("title"));


    // set the description to the selected card's description
  this.input.description.val(card.model.get("description"));

    // remove the Task from the collection
  this.model.remove(card.model);
},
```

Now our TaskListView will listen for any TaskView it contains.  Further when the `editMe` event occurs our `editCard` function will run setting the form fields to the fields in the selected card's model.  Then we remove the card from our collection.  

Why don't we have to remove it from our `cardList` array?  

Further, if we click on cards randomly we end up deleting them...  How could we handle this better?  


## Check-in

At this point your views should look like [this:](https://gist.github.com/CheezItMan/14346e3bcf1cb25879341713a849015d)


#### Word Of Caution:

Sometimes you may have a View listening for events on a particular Model.  If you remove the View in the course of your program without removing the corresponding Model and without turning off any event listening this will cause the View to hang around in memory as the Model still thinks it has to notify the 'ghost view' about events, even though the View has been removed from the the program.  This is a common form of 'memory leak' in Backbone.  If you use `on()` you will need to make darn sure you stop listening to events manually before removing any listeners.  

A good reason to use `listenTo()`!


## Resources
- [Backbone.js Basics: Bringing an App to Life with Events](https://www.sitepoint.com/backbone-basics-events/)
-  [12 Listening to DOM Events Examples](http://codebeerstartups.com/2012/12/12-listening-to-dom-events-in-backbone-js-learning-backbone-js/)
