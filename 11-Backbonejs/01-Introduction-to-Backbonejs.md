# Intro to Backbone.js

## Learning Goals

By the end of this lesson you should be able to:

- Explain what Backbone provides for you as a developer
- Explain the MV* structure of Backbone

## What Is Backbone?

Pure JavaScript & jQuery can quickly become unstructured and messy.  It's very easy to build a single-page-application using JavaScript & jQuery as a collection of function calls, nested jQuery callbacks all tied to DOM elements in your HTML.  

Backbone provides structure to your application by breaking things into our now familiar MVC framework, separating concerns and allowing your app to communicate with the server with a RESTful set of API calls.  

So in short Backbone:
-  Enforces structure to make your code more maintainable and readable.
-  Enforces good practices in how your JavaScript interacts with external resources.

### Aside: Libraries and Frameworks
The benefits of Backbone should look somewhat familiar - they're some of the same reasons we learned Rails rather than writing a custom web server in pure Ruby. However, there's a major philosophical difference between Backbone and Rails, down to the very core of their designs: Backbone is a library, while Rails is a framework.

#### Libraries
A library, like jQuery or the Ruby CSV gem, is a toolbox, from which you select the function or class that you need. The library accomplishes specific tasks, but ultimately your code is what's in charge. Examples of JavaScript libraries include:
- jQuery
- Backbone
- Underscore

#### Frameworks
A framework, like Rails, is just the opposite. You write some code (like a controller action) which is called by the framework. The framework is in charge; it's running the show. The vocab word for this is _inversion of control_. Frameworks tend to be much more structured than libraries, and they impose that structure on your program (this is not necessarily a bad thing!). Example of JavaScript frameworks include:
- React
- Angular
- Ember

#### So Why Backbone?
There are a lot of opinions about which is better, and oftentimes even opinions about whether there's really a meaningful difference between the two. That then raises the question: in this class, why learn a library like Backbone instead of a framework like Angular or Ember, which solves the same problems in a different way? Here are a few reasons:
- Backbone is a lot smaller and simpler than a massive framework like React, which means we're more likely to be able to get a good handle on it in just a few weeks.
- Backbone does a lot less for you, forcing a better understanding of the way the whole program flows.
- We've already learned a framework (Rails), so let's see what working with a library is like.

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

![Backbone JS Architecture from http://www.slideshare.net/ronreiter/writing-html5-web-apps-using-backbonejs-and-gae](images/backbonejs-architecture.jpg)


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
