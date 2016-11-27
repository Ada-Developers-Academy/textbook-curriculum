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

```javascript
var task = {
  assignee: "Dan",
  task:     "Do work",
  due_date: "01/01/2017"
};

_.extend(task, Backbone.Events);

task.on("astDue", function(message) {
    $("#content").append("<h2>Your Task <span class='red'>" + this.task + "</span> is " + message.msg + ".</h2> <p> Current Date: " + message.date.toLocaleDateString('en-US') + "</p>")
});

task.trigger("Past_Due", {msg: "past due",
							date: new Date()						
});
```

You can play with this in action [here:](http://codepen.io/CheezItMan/pen/JbyrOG)

When you fire an event with the `.trigger` function the function takes 2 parameters.  The first is the name of the event to trigger, while the second is an optional parameter to send to the function handling the event.  In the case above it was a simple message about the task being overdue.  Like above, when you need to pass multiple parameters you can simply pass a JavaScript object as the second parameter.   

### Events: on, off & trigger

You can have objects start and stop listening to events by using the `on` and `off` functions.  

The `on` function lets the browser know that the given function is listening for the given event and to call it when that event occurs.  

The `off` function causes the object to stop all or a single specific callback 'listening' to the event.  Think of it as unsubscribing to the event.  You can see it in action [here](http://codepen.io/CheezItMan/pen/bBroxm).  It's important to know that if you call off like `task.off("pastDue")` with only the name of the Event passed as an argument you will unsubscribe **all** callbacks listening to the Event.  If you want to only unsubscribe a single callback that function must be passed as the 2nd argument.  For example: `task.off("pastDue", sampleFunction);`

The `trigger` function causes all callbacks to the given Event to run.  You can specify an argument to pass to the callback function as a 2nd argument.  In the example above we did so here:  `task.trigger("Past_Due", {msg: "past due",
                            date: new Date()                        
});`.

#### Word Of Caution:

Sometimes you may have a View listening for events on a particular Model.  If you remove the View in the course of your program without removing the corresponding Model and without turning off any event listening this will cause the View to hang around in memory as the Model still thinks it has to notify the 'ghost view' about events, even though the View has been removed from the the program.  This is a common form of 'memory leak' in Backbone.  



## Adding Events To A View

There are two types of Events a View can listen for in Backbone.  The first are DOM events like we've dealt with using jQuery.  The second are custom events using Backbone's Event API like we've seen above.  

DOM events are bound using the View's `events` property or using `jQuery.on()`.  Look at [this CodePen](http://codepen.io/CheezItMan/pen/GNvMVG?editors=1010).  In this CodePen we have created a view for a Todo item and added an event when the view is clicked on.

Dom Events are added as an Object property of the view with the name of the event as the "key" and the value being the name of the function which serves as the callback function for the event.  

```javascript
var TodoView = Backbone.View.extend({
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

If you wanted to listen for a specific item within the view you could, just like with jQuery specify the item with a CSS Selector.  For example if there was a block within the view with a class `title` and you wanted to listen for clicks on that block, you could put this line into the events hash `"click .title": "onTitleClick"`.  This would cause the View to listen for clicks on any element within the view and with the `title` class.  When any sub-element with that class is clicked on the `onTitleClick` event handler will run.


Backbone API Events can be added with the `.on` method as you saw earlier.  This lets you create custom events that can be triggered in your Models or Views to update other objects when something occurs, a change in status, user interaction etc.  

Looking at the TodoViews in the Codepen, we can see when a task is clicked on using a DOM event.  However it would be REALLY useful if we could update another view when a Todo item is clicked on, for example to show more details on the selected Todo item.  Thus we return to the Backbone Events API and the idea of an Event Bus.   

## An Event Bus

When we want different objects, Views, Models, & Collections to communicate with each-other without tightly integrating them we can construct something called an Event Bus.

In our Todo Example CodePen we want the main section to display details about the most recently clicked on Task.  So to do that we can create an object to respond to events.

```javascript
var bus = {};
bus = _.extend(bus, Backbone.Events);
```
Now our `bus` object can trigger and subscribe to Backbone Events.  

Then we can pass this object as a shared resource between each of the views.

```javascript
var listView = new TodoListView({model: myList, bus: bus});
```
And
```javascript
var currentTaskView = new CurrentTaskView({bus: bus});
```

We will also need to create an `initialize` method in the views to keep a reference to our bus object.

```javascript
var TodoListView = Backbone.View.extend({
  tagName: 'ul',
  id: 'todo-list',
  initialize: function(options) {
    this.bus = options.bus
  },
  render: function() {
    var that = this;
    this.model.each( function(item) {
      var view = new TodoView({model: item, bus: that.bus});
      that.$el.append(view.render().$el);
    });
    return this;
  }
});
```

Notice that the TodoListView sends a copy of the Bus to each TodoView created when rendering the collection.  So we also need to add an initialize method to TodoView.  

```javascript
var TodoView = Backbone.View.extend({
  tagName: "li",
  events: {
    "click": "onClick"
  },
  initialize: function(options) {
    this.bus = options.bus;
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

What did this do for us?  Now each of the TodoViews and the CurrentTaskView have a reference to the same bus object, which will let them communicate.  

#### Adding an Event to the Bus

Now we can create an Event in the Bus and let the TodoView trigger that event to publish information about that particular task.  

In the CurrentTaskView we can specify an Event on the Bus that we want to listen to.  In the initialize method: 

```javascript
  	initialize: function(options) {
    	this.bus = options.bus;
    	var that = this;
    	bus.on('taskSelected', function(model) {
    	if (model) {
   			that.model = model;
   			that.render();
    	}
  	});
  },
```

And we can set the TodoView to trigger this event in it's click Event Handler.

```javascript
  onClick: function() {
    this.bus.trigger("taskSelected", this.model)
  },
```

#### So what have we seen here?

The TodoView registered a `click` event and when that event occurs it triggers an event on the bus which causes any callbacks on that event to run.  

TodoView-Click Event --> Bus --> CurrentItemView

So the Bus is really simply a shared object which can register Events and callbacks and acts as a common line of communication.  You can see the working version [here:](http://codepen.io/CheezItMan/pen/XNazpN)  

When we want to establish events on one view which trigger actions in another, we can use this 'bus' technique to let them communicate.  


## Resources
- [Backbone.js Basics: Bringing an App to Life with Events](https://www.sitepoint.com/backbone-basics-events/)
-  [12 Listening to DOM Events Examples](http://codebeerstartups.com/2012/12/12-listening-to-dom-events-in-backbone-js-learning-backbone-js/)