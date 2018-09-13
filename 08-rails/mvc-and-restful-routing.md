# MVC and Restful Routing

## Learning Goals
- Understand MVC architecture
- Recognize a REST API and identify its characteristics
- Be able to construct RESTful routes

## The MVC Pattern: Model View Controller

MVC was devised in '79 by the folks working on Smalltalk, which is one of the core influences of Ruby. What we call MVC today, especially in the realm of web stack, is pretty different than that original specification, but the core principles have held true.

Essentially, MVC is way to divide responsibilities to complete a task. It's especially well suited to object oriented programming because of the focus on messaging between objects.

### The Model
- Contains data for the application (often linked to a database)
- Contains state of the application (e.g. what orders a customer has)
- No knowledge of user interfaces, so it can be reused

### The View
- Generates the book interface which presents data to the user
- Passive, i.e. doesn’t do any processing
- Views work is done once the data is displayed to the user
- Many views can access the same model for different reasons

### The Controller
- Receive events from the outside world (usually from views)
- Interact with the model
- Determine the next step in the process flow
- Often responsible for notifying the View of state changes

We can think of each of these roles as the responsibility of an object, and use those responsibilities to organize a web service, like this:

![MVC in Rails](images/railsmvc.png)


## RESTful Routing

## Additional Resources
### MVC
- [Short YouTube overview of MVC Architecture from Lynda.com](https://www.youtube.com/watch?v=3mQjtk2YDkM)
- [Image: Rails Structure](http://docs.railsbridge.org/job-board/img/request-cycle.jpg)

### REST
- [Dr. Dobbs article by M. Vaqqas describing RESTful Web Services](http://www.drdobbs.com/web-development/restful-web-services-a-tutorial/240169069)
- [Fielding's original PhD dissertation - very dry, very long, but perhaps worth skimming, esp Chapter 5](http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm)

### Real world example of REST API
- [Twitter REST APIs](https://dev.twitter.com/rest/public)
