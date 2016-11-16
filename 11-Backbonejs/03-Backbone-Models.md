
# Intro to Backbonejs Models

##Learning Goals

By the end of this lesson you should be able to:

- Explain what a Backbone Model is
- Create your own Backbone Model
- Instantiate an instance of a Backbone Model and assign attributes.
- Use some basic Backbone Model methods

## Creating a Backbone Model

You create your own Model classes by extending the Backbone.Model class:

```javascript
var Person = Backbone.Model.extend( {
  
});

```

Then you can create your own instances of this Person model:

```javascript
var ada = new Person();
```

## Constructors & Initialize

Just like with Ruby, you can create constructors to initialize attributes and set up your Model.  

The initialize function runs, when a new instance is created.

```javascript
var Person = Backbone.Model.extend( {
    initialize: function() {
    console.log("A new person has been instantiated.");
  	}
});

var ada = new Person();
```

So if the script above is run the console will result in:

```console
A new person has been instantiated.
```

The defaults property lets you set default values to attributes for your model.  You can then retrieve attribute values with the `get` function.  

```javascript
var Person = Backbone.Model.extend( {
  defaults: {
      name: "Ada",
      age: 21
  },
  initialize: function() {
    console.log("Person has been Created");
  }
});

var ada = new Person();
console.log("The person is named " + ada.get("name"));
```

Results in:

```console
Person has been Created
The person is named Ada
```

You can also pass in attributes to a model at instantiation via a JSON object in the parameters to new.

```javascript
var babbage = new Person({name: "Charles Babbage", age: 65, skills: "Hardware Design, Mathematics, Flower Arrangement."});
```

## Get, Set & Unset

Once you have an instance of your Model you can use get & set methods to set it's attributes.

```javascript
ada.set("skills", "Programming, Mathematics, Mountain Climbing.");
ada.set("phone", "(444) 465-9122");

// prints '(444) 465 9122'
console.log(ada.get("phone"));
// prints 'Programming, Mathematics, Mountain Climbing.'
console.log(ada.get("skills"));

```

You can use `unset` to remove an attribute.
```javascript
ada.unset("skills");

// prints undefined
console.log(ada.get("skills"));
```

## Adding Additional Methods to a Model

You can add additional models to a method like other attributes:

```javascript
var Person = Backbone.Model.extend( {
  defaults: {
      name: "Ada",
      age: 21
  },
  initialize: function() {
    console.log("Person has been Created");
  },
  sayhi: function() {
    console.log(this.get("name") + " says HI!");
  }
});

var myPerson = new Person();

// Will cause 'Ada says HI!' to print to the console.
myPerson.sayHi();
```

## TODO - Demonstrate Rendering a model

## Resources
- [Backbone Model & View Documentation](http://backbonejs.org/#Model-View-separation)
-  [An Intro to Backbone Models & Collections](http://liquidmedia.org/blog/2011/01/backbone-js-part-1/)
-  [Backbone Fundamentals, Models Chapter](https://addyosmani.com/backbone-fundamentals/#models-1)


  