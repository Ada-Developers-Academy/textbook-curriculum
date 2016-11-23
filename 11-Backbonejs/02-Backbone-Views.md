
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

### Underscore

That's where [Underscore](http://underscorejs.org/) comes in.  Underscore is a Javascript library with tons of useful helper functions.  One of the primary uses for Underscore however is in templating.  We are going to use Underscore in conjunction with Backbone, though Underscore can exist and be used independently.

With Underscore you can build a template in your HTML like this:

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
Notice the `<%= %>` handles.  Like in Rails, this will pre-process the result of the given expression or variable and put the result into the template.  You can identify this as a template by the script tag and the type attribute with the value of `text/template`.  

Underscore supports the following template functions:
- `<%= %>` Interpolates the given expression into the surrounding HTML
- `<% %>`   Executes the given Javascript expression
- `<%- %>`  Interpolates the value and makes it HTML escaped, meaning it allows the Javascript output as HTML

In your Javascript code you can build an underscore object and use jQuery to render the object.

```javascript
    $(document).ready(function(){
      var person =  {
        name: "Ada",
        age: 300
      };

      var template =  _.template($('#tpl-person').html());
      $('#person').html(template(person));
    });
```

The `$(document).ready` function executes the provided anonymous function when the document is fully loaded.  Then we create a Javascript object with the properties the template expects `name` and `age`.  Then we can use the template to set the HTML inside the `#person` div.  

Underscore template make a handy way to setup the presentation of your views.  However you can use other templating engines to render your views.


## Resources
-  [Underscore Documentation](http://underscorejs.org/)
-  [Backbonejs View Documentation](http://backbonejs.org/#View)
-  [Backbone.js Applications Intro to Views](https://addyosmani.com/backbone-fundamentals/#views-1)
-  [Handlebars: An alternative templating engine](http://handlebarsjs.com/)
