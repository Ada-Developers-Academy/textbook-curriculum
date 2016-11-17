# Backbone Collections

## Learning Goals

At the end of this you should:
- Be able to explain what a Backbone Collection is
- Be able to place Models into a collection
- Be able to manipulate models in a collection
- Be able to filter models within a collection

## Collection Introduction

In Backbone a Collection is really a type of Model, one that has other model instances inside it.  You can think of it as similar to an Array, an ordered collection of Models.  

Collections are useful for storing and manipulating a group of models.

## Creating a Collection

To create a Backbone Collection you will need to extend Backbone.Collection.  As shown below you can also add models into the collection when you instantiate it.  

```javascript
var People = Backbone.Collection.extend({

});

// Instantiating a People collection and starting it with some models.
var myPeople = new People([
					new Person({name: "Kari", title: "Ada Lead Instructor"}),
					new Person({name: "Dan", title: "Ada Instructor"}),
					new Person({name: "Jamie", title: "Ada Instructor"}),
					new Person({name: "Chris", title: "Ada Instructor"}),
					new Person({name: "Crystal", title: "Program Director"}),
					new Person({name: "Cynthia", title: "Executive Director"})
]);

// Adding a Person via the add method.
myPeople.add( new Person( {name: "Korica", title: "Program Coordinator"} ) );
```

Looking at the model in the console we can see the Models are stored in the collection under the models attribute, an array, and each instance has an index number.  They also have an attribute called a `cid` which is an id that Backbone assigns to each Model instance.  Models synched with a server also have a persistent ID assigned by the server.

![Client Server](images/modelconsole.png)




## Getting At Our Models!

You can retrieve a model from a Backbone collection via the `get` method which will take either the index number of the model and the Collection's `at` attribute, or via it's cid.

```javascript
// will print Kari's model
console.log(myPeople.at(0) );
var kari = myPeople.at(0);

// Will retrieve the model with cid equal to "c3" from the collection, if it exists.
console.log(myPeople.get("c1"));

var dan = myPeople.get("c1");

```


## Removing Models

You can remove models in Backbone via it's `remove` method.

```javascript
var personToRemove = myPeople.at(3);
myPeople.remove(personToRemove);
```



## Looping Through a Collection

You can loop through a collection, known as iterating, using the `each` method.  This method takes an anonymous function and applies it to each model in turn.  The models are passed into the function one at a time as a parameter. 


```javascript

// Causes 
myPeople.each(function(person) {
  person.sayhi();
});
```

## Filtering Models

You can also get a collection of filtered results with the `where` method.  The `where` method finds array of Models matching the given attributes.

```javascript
// Results in Dan, Jamie, Chris
var adaInstructors = myPeople.where( { title: "Ada Instructor" });

for (var i = 0; i < adaInstructors.length; i++) {
  console.log(adaInstructors[i].get("name")
}
```

If you only want to find the first occurrence of the matching condition then you can use the the `findWhere` method.  The findWhere method returns the first matching model in the collection.  

```Javascript
// Returns the model with { name: "Cynthia", title: "Executive Director" }
var matchingInstructor = myPeople.findWhere( { name: "Cynthia" } );
```

## Pushing and Popping 

Backbone Collections also have the `push` and pop methods which add an element to the rear and take an element off the rear of the collection.  

```javascript
// Takes Cynthia off the collection
var popped = myPeople.pop();

var newPerson = new Person({name: "Uma", title: "Community Engagement Manager" });
// Put Uma into the list at the rear.
myPeople.push(newPerson);
```


## TODO Rendering Backbone Collections


