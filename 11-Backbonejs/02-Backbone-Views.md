
# Intro to Backbone Views

## Learning Goals

By the end of this lesson you should be able to:

-  Explain Backbone views and how to create them.
-  Be able to render a view as an underscore.js template.  

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

Inside the curly braces `{}` you place properties for the View object.  One of the most important properties is the `el` property.  The `el` property refers to a DOM object created by the browser.  If you do not define an `el` property Backbone creates one for you which is an empty `div` element.  

Below we set the the `el` property to a specific div in the DOM.

```html
<div id="person">
</div>
```
```javascript
var PersonView = Backbone.View.extend( {
  initialize: function() {
    this.render();
  }
});

var myPersonView = new PersonView({ el: $("#person") });
```

### Your First Full View!

Drawing the view is done in the `render` function which determines how the view displays in the DOM.  Below the

```javascript
var PersonView = Backbone.View.extend({
  initialize: function(){
    this.name = "Ada Lovelace";
    this.render();
  },
  render: function(){
    $(this.el).append("<ul> <li>Welcome to Backbone " + this.name "!</li> </ul>");
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

## What About Underscore Templates?

So how do Underscore templates play into this? 

Rendering raw html in the render function is both time consuming and painful to do.  Instead we can use a template attribute into our view.

First we'll add an underscore template to our view:

```html
    <script type="text/template" id="tpl-person">
      <h2>Welcome to Backbone <%- name %> </h2>
      <p><strong>Age: </strong> <%- age %></p>
    </script>
```

Next we'll add another attribute to the view, `template: _.template('#tpl-person').html()`.  So we are binding the template to an HTML element and then 

Next we can determine the data we want to render with a JSON object as another attribute.  
```javascript
model: {
	name: "Ada Lovelace",
	age: 300
}
```
 
And in our render method we can then render the template with the data.

```javascript
this.$el.html(this.template(this.model));
```

With the resulting JavaScript Code:

```javascript
var PersonView = Backbone.View.extend({

  el: $('#person'),
  initialize: function(){
  		// render immediately upon creation.
      this.render();

   },
   		// bind the underscore template & compile the HTML
   template: _.template($('#tpl-person').html()),
   		// render the template inside the `el` element.  
   render: function(){
      this.$el.html(this.template(this.model));
    }
});


$(document).ready(function(){
		// Create a person with data.
    var personView = new PersonView({
    model: {
      name: "Ada",
      age: 300
    }
    });

});
```



## Resources
- [Backbonejs View Documentation](http://backbonejs.org/#View)
- [Backbone.js Applications Intro to Views](https://addyosmani.com/backbone-fundamentals/#views-1)
