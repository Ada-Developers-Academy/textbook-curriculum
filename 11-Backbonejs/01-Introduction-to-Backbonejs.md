# Intro to Backbone.js

## Learning Goals

By the end of this lesson you should be able to:

- Explain what Backbone provides for you as a developer
- Explain the MV* structure of Backbone

## What is Backbone

Pure JavaScript & jQuery can quickly become unstructured and messy.  It's very easy to build a single-page-application using JavaScript & jQuery as a collection of Function calls, nested jQuery callbacks all tied to DOM elements in your HTML.  

Backbone provides structure to your application by breaking things into our now familiar MVC framework separating concerns and allowing your app to communicate with the server with a RESTful set of API calls.  

### So in short Backbone:
-  Enforces structure to make your code more maintainable and readable.
-  Enforces good practices in how your JavaScript interacts with external resources.  

## Single Page Applications

Backbone is typically used to create *Single Page Applications*.  In a Single Page Application the page is loaded in a single page load.  From that point on any data needed is loaded dynamically using Ajax without needing to reload the page.  

A good example of a Single Page Application is Gmail.  In Gmail new e-mails are loaded dynamically and when you send e-mail the page sends the information to the server without reloading the page.  This is an example of an asynchronous application.

## Backbone MV*

Backbone implements the familiar MVC architecture that we learned in Rails in a slightly different way. In Backbone the views & controllers are combined, thus Backbone is called an MV* architecture.  

### Backbone has 5 Components

1.  **Events**:  Events are a module that can be mixed in to any object, giving the object the ability to bind and trigger custom named events.  
1.  **Models**:  These include the application data and business logic.  These are similar to Rails models.
	- Models:
		- Organize data and business logic.  
		- Load and save data from and to the server.   
		- Emit events when data changes.  
1.  **Collections**:  These are ordered sets of models
1.  **Views**:  These render the models and listen for DOM/Model events.  Views can be used to render a single model to render or a collection.  
1.  **Routers**:  Used for Single Page Applications, routers let you add paths to the URL so that you can maintain history and allow users to jump to a specific state in your single-page-application.  A router always contains at least one route and a function to map that particular route to.  

![Backbone JS Architecture from https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwiknZLWnrDQAhULrVQKHdKdDtsQjxwIAw&url=http%3A%2F%2Fwww.slideshare.net%2Fronreiter%2Fwriting-html5-web-apps-using-backbonejs-and-gae&psig=AFQjCNHvjo7n-Xt_eytdroPc3zdRUVQY7g&ust=1479487463101423](images/backbonejs-architecture.jpg)


## Installing Backbone

To install Backbone you will need 3 JavaScript Libraries
- **jQuery**, which we use to interact with the DOM.
	- We will use jQuery 3.1.1
- **Underscore**, which allows us to prepare templates which we can render in our views.
	- We will use Underscore 1.8.3
- **Backbone**, which is the Backbone library.  
	- We will use Backbone 1.3.3

You can find these files [here](resources/backbonejs.zip)

## Resources
- [Underscore Documentation](http://underscorejs.org/)
- [Backbone Documentation](http://backbonejs.org/)
- [jQuery Documentation](http://api.jquery.com/)
