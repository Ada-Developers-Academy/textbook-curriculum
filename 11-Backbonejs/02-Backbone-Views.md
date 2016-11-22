
# Intro to Backbonejs Views

## Learning Goals

By the end of this lesson you should be able to:

-  Explain a Backbone.js views and how to create them.
-  Be able to render a view into an underscore.js template.  

## What is a View?

Backbone views are kind of middle-people in the Backbone world.  They coordinate between your data, usually stored in Models and the DOM which displays them.  They also listen for events and respond to them as desired.  They can also plug into a Javascript templating library to determine how the information is displayed.  We will stick with Underscore.js' templating library.  

## Creating a View

Views can be created by extending Backbone.View.

```javascript
var PersonView = Backbone.View.extend( { 
  initialize: function() {
    this.name = "Theon Greyjoy";
  }
});

  // The initialize function is called when you make a new Backbone View.
var myPersonView = new PersonView();
```

Inside the curly braces `{}` you place properties for the View object.  One of the most important properties is the `el` property.  The `el` property refers to a DOM object created by the browser.  If you do not define an `el` property  Backbone creates one for you which is an empty `div` element.  

Below we set the the `el` property to a specific div in the DOM.

```html
    <div id="person">
    </div>
	
	<script>
		var PersonView = Backbone.View.extend( { 
  			initialize: function() {
  			  this.render();
  			},

		});

		var myPersonView = new PersonView({ el: $("#person") });
	</script>
```

### Your 1st Full View!


Drawing the view is done in the `render` function which sets how the view appears in the DOM.  Below the 


```javascript
var PersonView = Backbone.View.extend({

  initialize: function(){
      this.name = "Ada Lovelace";
      this.render();
   },
   render: function(){
      $(this.el).append("<ul> <li>Welcome to Backbone" + this.name "!</li> </ul>");
      return this;
    }
});



$(document).ready(function(){
	var myPersonView = new PersonView({ el: $("#person") });
});
```

This will display in the browser:

```
Welcome to Backbone Ada Lovelace!
```

## Templates

Rails views are awesome!  They are written in an HTMLish format with special handles `<% %>` to mark areas where code goes in.  Backbone doesn't have a similar method to create formatted HTML output.  

### Underscorejs

That's where [Underscorejs](http://underscorejs.org/) comes in.  Underscore is a Javascript library with tons of useful helper functions.  One of the primary uses for Underscore however is in templating.  With Underscore you can build a template in your HTML like this:

```html
    <script type="text/template" id="tpl-person">
      <div class="media-heading">
        <h3>
          Name:  <%= name %> </h3>
          <p>  Age:  <%= age %>
        </p>
      </div>
      <hr>
    </script>
```
Notice the `<%= %>` handles.  Like in Rails, this takes the output from the given expression or variable into the template.  You can identify this as a template by the script tag and the type identifying it as a template.  

Underscore supports the following kinds of templates:
-  `<%= %>` Interpolates the given expression into the surrounding HTML.  
- `<% %>`   Executes the given Javascript expression 
- `<%- %>`  Interpolates the value and makes it HTML escaped, meaning it allows the Javascript output as HTML.

In your Javascript code you can build an underscore object and use jQuery to render the object.

```javascript
    $(document).ready(function(){
      var person =  {
        name: "Ada",
        age: 300
      }

      var template =  _.template($('#tpl-person').html());
      $('#person').html(template(person));
    });
```

The `$(document).ready` function executes the provided anonymous function when the document is fully loaded.  Then we create a Javascript object with the properties the template expects `name` and `age`.  Then we can use the template to set the HTML inside the `#person` div.  

Underscore template make a handy way to setup the presentation of your views.  However you can use other templating engines to render your views.

## Underscore with a View

So we have seen how to create a view & how to create a template, now we'll build a Todo Item view with an Underscore template.

### Creating the View

To get Started we'll define a new View in an `app/views/todo.js` file.


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
    this.$el.html(this.template(this.model));
    return this;
  }
});
```

In the above code we extend the Backbone.View object and make the Todo render a <section> element and give it some CSS classes.  Then we set the template for the object.

Lastly we create a render function which will set this view's HTML 

Next we will create a `app/js/app.js` file and setup the global environment for Backbone.  

```javascript
// app/js/app.js
window.TodoManager = {
  Models: {},
  Collections: {},
  Views: {}
};
```

The above sets up a namespace (like a module) for JavaScript to avoid any name conflicts.  Then you can make the view render with the following:

```javascript
// app/js/app.js
$(function() {
  var todoView = new TodoManager.Views.Todo({
    model: {
        title: "Learn Backbone",
        description: "I REALLY need to learn Backbone",
        completed: false,
        id: 37
    }
    });
    $('#todocontainer').append(todoView.render().$el);
});
```

So we've bound a view to a Template, but the data, or Model is coming from a generic JavaScript Object.   Next we will create a Backbone Model and use it to store the data for our Todo List.

## Resources
-  [Underscore Documentation](http://underscorejs.org/)
-  [Backbonejs View Documentation](http://backbonejs.org/#View)
-  [Backbone.js Applications Intro to Views](https://addyosmani.com/backbone-fundamentals/#views-1)
-  [Handlebars an alternative templating engine](http://handlebarsjs.com/) 

  