# BackBone Views Rendering Models

## Learning Goals
By the end of this document you should be:
-  Able to explain what a view is in Backbone
-  Be able to create a view to render a particular model

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
// views/todo.js
TodoView = Backbone.View.extend( {
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

And lastly to put them together in our `app.js` file.
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
### Collections and Views

**TODO:  Requires more clarity**  
You can also pass a View a Collection of Models.  In the example below pay **very** close attention to how `self` is used.  We have to use `self` to append each view to the larger collection's view because of the nature of the nested methods.  The anonymous function, `function(person)` is a function being applied to each model in the collection and if we want to append the view's results to the `PeopleView` then we need to have saved a reference to it as we did with self.

```

// Create a type of view for a collection of People Models

var TodoListView = Backbone.View.extend({
  render: function() {
  	// We save "this" in the self method.
    self = this;
    
	// iterate through the collection
    this.model.each(function(todo) {
    
      // Create a new PersonView for each Person
      var todoView = new TodoView({model: todo});


     
      // Then Append the new view to the HTML for the Collection's view
      self.$el.append(todoView.render().$el);
    });
    // return "this" so we can chain the method if needed.
    return this;
  }
});

var tasks = new TodoListView([
  new Todo({description: "Kari told me to do this", title: "Ada Lead Instructor"}),
  new Todo({description: "Kari told me to do this", title: "Ada Instructor"}),
  new Todo({description: "Dan  demanded I do this", title: "Ada Instructor"}),
  new Todo({description : "Chris asked me to do this", title: "Ada Instructor"}),
]);

var myPeopleView = new PeopleView({el: "#person", model: people});
myPeopleView.render();

```




## Responding to DOM & Model Events

## Templates
