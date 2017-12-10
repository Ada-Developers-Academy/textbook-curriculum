# Adding Custom Events

## Learning Goals
By the end of this document you should be able:
-   to explain how the Backbone Event API works
-   to add custom events to Backbone Views, Collections & Models.

## Adding An Event To An Object

In Backbone, Models contain information and business logic and Views render model data.  Events are how Views & Models communicate.  

You've seen jQuery Events like below:

```html
<button id="sample-button">Press Me</button>

<script>
$('#sample-button').on('click', function() {
  alert("You Pressed it");
})
</script>
```

In this we added a jQuery Event to the button and caused an alert to 'fire' when the button was pressed.  Similarly we can use the Backbone.Events module to give any object the ability to 'listen to' and 'trigger' events.  

## Enter Backbone Custom Events

Below we have created a generic JavaScript object and using the Backbone Events API.  

Notice the `_.extend(task, Backbone.Events)` line.  The authors of Backbone have created a way to define custom events with an Object called Events, similar to the DOM events we have used earlier.  Events provides a few functions (`on()` and `listenTo()`) for event handlers to subscribe to events and a single function to "trigger" an event (named `trigger`).  We're going to stick to using `listenTo()` & `trigger()` for the moment because `on()` can have unexpected consequences.  If you're burning to know why you can find out [here](http://stackoverflow.com/a/20675056/6840529).

Remember [Ruby Mix-ins](https://www.tutorialspoint.com/ruby/ruby_modules.htm)?  In Ruby we can define a module and use include or extend to bring those methods into existing classes as static or instance methods.  By default JavaScript doesn't really do Mix-ins, but the wonderful developers of Underscore provides a way to **Mix-in** functions from one object into another.  So below we "Rubyfy" Javascript to add in functionality in a mix-in fashion.  

```javascript
// generic Javascript example

const task = {
  assignee: "Dan",
  task_name: "Accomplish a thing",
  due_date: "01/01/2017"
};

_.extend(task, Backbone.Events);

task.listenTo(task, "past_due", function(message) {
  $("#content").append(`<h2>Your task <span class='red'> ${this.task_name} </span> is ${message.msg}.</h2> <p> Current Date: ${message.date.toLocaleDateString('en-US')} </p>`)
});

task.trigger("past_due", {
  msg: "past due",
  date: new Date()
});
```

You can play with this in action [here](https://codepen.io/adadev/pen/QOROxX).


When you fire an event with `.trigger`, we handle the event with `.listenTo`.  The `.listenTo` function takes 3 parameters.  

1.  The name of the object we are listening to.  In this simple case, the task is listening to itself.
1.  The name of the event to trigger, which can be any name you define, for a custom event.   
1.  The function handling the event.  That function can be sent an optional parameter.  In this case above it was a simple message about the task being overdue.  Notice that we had it sent a JavaScript object as a parameter as a sneaky way to send it multiple values.  


### Events: `listenTo()` & `trigger()`

The first parameter for `listenTo` is the object being listened to.  To keep the example short, I have task listening for it's own event, but you can have any object, with Events mixed in listen for another object's events.  This is a great way to get otherwise unrelated objects to communicate.  For example, in the context of a more fully-featured task list app, there may be also a separate view displaying a graph of "productivity statistics." If "productivity statistics" had its own view, you may want that ProductivityStatsView to listen for a custom event that is broadcasted when a task is marked complete. That ProductivityStatsView can define its own callback for updating its own view based on that event.

You can cancel a `listenTo()` with  `stopListening()`.   For example: `view.stopListening(model);`, The stopListening function takes an optional argument which tells the listener which object to stop listening to.  Otherwise the listener stops listening to **everything**.  


The `trigger()` function causes all callbacks to the given Event to run.  You can specify an argument to pass to the callback function as a 2nd argument.  In the example above we did so in the line:  `task.trigger("past_due", {msg: "past due", date: new Date()});`.


### Adding Events To A View

There are two types of Events a View can listen for in Backbone.  The first are DOM events like we've dealt with earlier.  The second are custom events using Backbone's Event API like we've seen above.  

DOM events are bound using the View's `events` property or using `jQuery.on()`.  Look at [this CodePen](http://codepen.io/CheezItMan/pen/GNvMVG?editors=1010).  In this CodePen we have created a view for a Task item and added an event when the view is clicked on.

Dom Events are added as an Object property of the view with the name of the event as the "key" and the value being the name of the function which serves as the callback function for the event.  

```javascript
// 'app/views/task.js'

const TaskView = Backbone.View.extend({
  tagName: "li",
  events: {
    // "click" is the name of the event, "onClick" is the event handler
    "click": "onClick"
  },
  onClick: function() {
    console.log("Clicked!  Model:  " + this.model.get("title"));
  },
  render: function() {
    this.$el.html(this.model.get("task_name"));
    return this;
  }
});
```

If you wanted to listen for a specific item within the view you could, with jQuery, specify the item using a CSS Selector.  For example if there was a block within the view with a class `title` and you wanted to listen for clicks on that block, you could put this line into the events object `"click .title": "onTitleClick"`.  This would cause the View to listen for clicks on any element within the view and with the `title` class.  When any sub-element with that class is clicked on the `onTitleClick` event handler will run.

**Exercise:** Add a small event listener inside of the `events` hash within a view that detects for "click" and takes in a selector. Create a callback function that runs `console.log()` with a message of happiness.


Backbone Events API allows you to add event handlers with the `.listenTo` method as you saw earlier.  This lets you create custom events that can be triggered in your Models or Views to update other objects when something occurs, a change in status, user interaction, etc.  

Looking at the TaskViews in the CodePen, we can see when a task is clicked on using a DOM event.  However it would be REALLY useful if we could update another view when a Task item is clicked on, for example to show more details on the selected Todo item.  Thus we will return to the Backbone Events API and the idea of an Event Bus later.


## Events & Collections

Collections also have a set of Events which are very handy when combined with Views.

Collection Events:
*  `add` - This event is triggered when a model is added to the collection.
*  `remove` - This event is triggered when a model is removed from the collection
*  `change` - This event is triggered when a model is changed in the collection.  

We *often* have our views listen for these events because when the data for the collection changes, we need to re-render our views.  We used this in our TaskList app.
```javascript
// in app/views/task_list_view.js
...
// in initialize()
// set a listener to call render when the collection is updated.
this.listenTo(this.model, "update", this.render);
...
```

## Events in our TaskList App

Right now we can create, and delete our Tasks, but what about editing?  Well we could edit the tasks by reusing the existing input fields. However, the edit button for a task is in one view, while the existing input fields on the task form is in another...

Here's what we'll do:

1.  Make a new edit button on a single task view.
1.  Setup an event handler for when the edit button on a task is clicked on.  **Question:** Where do events performed on a "task card" get handled?
1.  Then we can 'trigger' an event letting our TaskListView know that we want to edit this task.
1.  When the Task Lists' listener 'hears' the event, it can delete the card being edited, and put the title & description fields in the input tags.

There will be drawbacks, but we'll see how it works.

**Exercise:** Before we start, let's take a moment to diagram our flow of events (triggering and listening) and updating within our app.

Alright, let's begin!

### First add a new edit button to our task template

```
<script id="task-template" type="text/template">
    ...
    <div>
      <button type="button" class="button primary toggle-complete">Toggle Completion</button>
      <button type="button" class="button secondary edit">Edit</button>
      <button type="button" class="button alert delete">Delete Task</button>
    </div>
```

### Then create an Event listener in TaskView for when the edit button in the template is clicked on

```javascript
   // in app/views/task_view.js
  events: {
    'click button.delete': 'deleteTask',
    'click button.toggle-complete': 'toggleComplete',
    'click button.edit': 'editTask'
  },
```

### Third: Receive the event & `trigger` a custom Backbone Event when it occurs.

```javascript
// in app/views/task_view.js
editTask: function(e) {
  // Trigger the editMe event
  this.trigger('editMe', this);
},
```
Notice above that when we are **triggering** an event called `editMe`, we pass a copy of `this` object to the listeners.

### Lastly, Have `TaskListView` listen for the custom event

TaskListView needs to listen to the event, so we'll need to add a Listener to our view that listens to each taskView, and we'll need to define a callback function.  

```javascript
// In app/views/task_list_view.js
render() {
  ...
  this.model.each((task) => {
    const taskView = new TaskView({
      model: task,
      template: this.template,
      tagName: 'li',
      className: 'task',
    });
    this.listenTo(taskView, 'editMe', this.editTask);
    this.$('#todo-items').append(taskView.render().$el);
  });
  ...
}, //end of addTask
editTask: function(task) {
  this.$('#add-task-form [name=task_name]').val( task.model.get('task_name') );
  this.$('#add-task-form [name=assignee]').val( task.model.get('assignee') );
  this.model.remove(task.model);
},
```

**Note:** because in this case we need a reference to a specific `this`, our `addTask` function is not an arrow function.

Now our TaskListView will listen to any TaskView it contains.  Further when the `editMe` event occurs, our `editCard` function will run, setting the form fields to the fields in the selected card's model.  Then we remove the card from our collection.  


## Check-in

Take a minute to check with your neighbor on what each other's solutions look like. Review the diagram we made at the beginning of the lesson to talk through the entire chain of events, from the click to the final update on the DOM.

Check your solution against the original `backbone-tasklist` project on the branch `custom-events`.

## Summary

We can both **trigger** and **listen to** our own custom events. In our `backbone-tasklist` project, when we clicked on the Edit button that existed in the Task View, in the callback for that event, we triggered our custom event named "editMe". In our TaskList View, for every instance of TaskView we created, we told our TaskListView to listen to that instance of TaskView broadcasting the event named "editMe". From there, we defined another callback in `TaskListView`, which updated the DOM and model.

## What Did We Accomplish?
- Created a custom event
- Used `trigger()` and `listenTo()`
- Went over built-in events on Backbone.Collection (`add`, `remove`, and `change`)
- Triggered a custom event in one view, and registered a listener for that event in a second view


## Resources
- [Backbone.js Basics: Bringing an App to Life with Events](https://www.sitepoint.com/backbone-basics-events/)
-  [12 Listening to DOM Events Examples](http://codebeerstartups.com/2012/12/12-listening-to-dom-events-in-backbone-js-learning-backbone-js/)
