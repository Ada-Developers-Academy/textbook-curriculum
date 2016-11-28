# An Event Bus

When we want different objects, Views, Models, & Collections to communicate with each-other without tightly integrating them we can construct something called an Event Bus.

In our TaskList Example CodePen we want the main section to display details about the most recently clicked on Task.  So to do that we can create an object to respond to events.

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

