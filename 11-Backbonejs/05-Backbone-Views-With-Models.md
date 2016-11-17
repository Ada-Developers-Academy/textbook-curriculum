# BackBone Views Rendering Models

## Learning Goals
By the end of this document you should be:
-  Able to explain what a view is in Backbone
-  Be able to create a view to render a particular model

## Views Overview
In Backbone a view is a specific kind of Object who's job it is to render the display in the HTML document and respond to events.  It's kind of a mix between a controller and a view in Rails.  

## Creating a View

All Backbone Views extend the Backbone.View class and must be passed a render function to tell the View how it needs to be drawn on the screen.

```javascript
var PersonView = Backbone.View.extend( {
		render: function() {
				this.$el.html("Hello Adies!");
				return this;
		}
});


var myPersonView = new PersonView({ el: "#person"});
myPersonView.render();
```

This example creates a `PersonView` which will write "Hello Adies!" in the browser.   When I created an instance of the view with:  `var myPersonView = new PersonView({ el: "#person"});` I used the `el` property which is a JQuery selector and set it to the element in the HTML with the `id` property "person".  So when the view is told to render it will select the element in the DOM with the matching id an insert inside the text "Hello Adies!"



## Passing Data to Views

Normally, but not always a Backbone View is tied to a Model object and renders data from the Model.  In the example below I create a Person Model and redefine my PersonView to use the view's model with:  `this.model`.  I will then set the html to be "Hello `MODEL_NAME`" where `MODEL_NAME` is whatever is stored in the model's `name` attribute.  

Then when I create an instance of the view I give the DOM element I want to change (with id="person") and the model I have created.  

In this example it should say, **"Hello Kari!"**

```javascript
// Create an instance of the Person Model
var myPerson = new Person({name: "Kari", title: "Ada Lead Instructor"});

// Create a View
var PersonView = Backbone.View.extend( {
		render: function() {
				this.$el.html("Hello " + this.model.get("name") + "!");
				return this;
		}
});


// Create an instance of the view bound to the myPerson model
var myPersonView = new PersonView({ el: "#person", model: myPerson});
// Tell Backbone to render the model.  
myPersonView.render();
```

### Collections and Views

**TODO:  Requires more clarity**  
You can also pass a View a Collection of Models.  In the example below pay **very** close attention to how `self` is used.  We have to use `self` to append each view to the larger collection's view because of the nature of the nested methods.  The anonymous function, `function(person)` is a function being applied to each model in the collection and if we want to append the view's results to the `PeopleView` then we need to have saved a reference to it as we did with self.

```

// Create a type of view for a collection of People Models

var PeopleView = Backbone.View.extend({
  render: function() {
  	// We save "this" in the self method.
    self = this;
    
	// iterate through the collection
    this.model.each(function(person) {
    
      // Create a new PersonView for each Person
      var personView = new PersonView({model: person});


     
      // Then Append the new view to the HTML for the Collection's view
      self.$el.append(personView.render().$el);
    });
    // return "this" so we can chain the method if needed.
    return this;
  }
});

var people = new People([
  new Person({name: "Kari", title: "Ada Lead Instructor"}),
  new Person({name: "Kari", title: "Ada Instructor"}),
  new Person({name: "Dan", title: "Ada Instructor"}),
  new Person({name: "Chris", title: "Ada Instructor"}),
]);

var myPeopleView = new PeopleView({el: "#person", model: people});
myPeopleView.render();

```




## Responding to DOM & Model Events

## Templates
