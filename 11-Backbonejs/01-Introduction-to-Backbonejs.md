
# Intro to Backbonejs

Learning Goals

By the end of this lesson you should be able to:

- Explain what Backbonejs provides for you as a developer
- Explain the MV* structure of Backbone

## What is Backbonejs

Pure Javascript & JQuery can quickly become unstructured and messy.  It's very easy to build a single-page-application using Javascript & JQuery as a collection of Function calls, nested JQuery callbacks all tied to DOM elements in your HTML.  

Backbone provides structure to your application by breaking things into our now familiar MVC framework separating concerns and it allows your app to communicate with the server with a RESTful set of API calls.  

So in short Backbonejs:
-  Enforces structure to make your code more maintainable and readable.
-  Enforces good practices in how your Javascript interacts with external resources.  

## Single Page Applications

Backbone is typically used to create *Single Page Applications*.  In a Single Page Application the page is loaded in a single page load.  From that point on any data needed is loaded dynamically using Ajax without needing to reload the page.  

A good example of a Single Page Application is GMail.  In Gmail new e-mails are loaded dynamically and when you send e-mail the page sends the information to the server without reloading the page.  This is an example of an asynchronous application.  

## Backbone MV*

Backbone implements the familiar MVC architecture from Rails in a slightly different way.  In Backbone the views & Controllers are combined, thus Rails is called an MV* architecture.  

Backbone has 5 Components

1.  Events:  These are used by components to publish content or subscribe to content.  
1.  Models:  These include the application data and business logic.  These are similar to Rails models.
1.  Collections:  These are ordered sets of models
1.  Views:  These render the models and listen for DOM/Model events.
1.  Routers:  Used for Single Page Applications


  