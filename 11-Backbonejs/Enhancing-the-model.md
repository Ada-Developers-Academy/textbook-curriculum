
# Enhancing the Model

There are a lot of other things we can add to our Backbone models.  They can be constructed running a special `initialize` method.  They can be set up with default attribute values.  They can also, like our Rails models, be set up with methods to hold business logic.

## Learning Goals
-  Setup default values for model attributes
-  Write Custom methods in a model

## Default Values

We can edit the Book model by adding a hash of attributes to initialize.  For example below we can set default values for attributes:

```javascript
// src/app/models/book.js
import Backbone from 'backbone';

const Book = Backbone.Model.extend({
  defaults: {
    title: '',
    author: 'Unknown',
  }
});

export default Book;
```

Then any books created like `let poodr = new Book({title: "Practical Object-Oriented Programming in Ruby" });` will automatically have a field named `author` set to 'Unknown'.  


## Custom Methods

This is also how you can add custom methods (including business logic) to your model. For example we've done a lot of printing the title & completion status of our Book to the console, a `logStatus` method might be handy.

```javascript
// src/app/models/book.js
import Backbone from 'backbone';

const Book = Backbone.Model.extend({
  defaults: {
    title: '',
    author: 'Unknown',
  },
  logStatus: function() {
    console.log("Title: " + this.get("title"));
    console.log("Author: " + this.get("author"));
  }
});

export default Book;
```

Then in our `app.js` we can simply print out the status of our book with:  `poodr.logStatus();`

### Initialize

Just like with a Rails Model you can create an `initialize` method and it will be called each time a new model is instantiated with `new`.

```javascript
// src/app/models/book.js
//...

const Book = Backbone.Model.extend({
  defaults: {
    title: '',
    author: 'Unknown',
  },
  initialize: function(params) {
    console.log("Book initialized: " + this.get("title"));
    // just to see what params looks like
    console.log(params);
  }
});
```

Take a look at the code in the example and examine what `params` in initialize looks like.

TODO:  CM - Update image for Ada books
![params in the Dev Tools console](images/params.png)

The parameter to initialize is a JavaScript object containing the argument given when the Model is constructed with `new`.  

Later on we will use this method in our views.

#### Exercise

TODO:  CM - Practice making a custom method

## Validations

TODO:  CM - Add some validations

## Summary

TODO:  CM - Summary of learning

## Resources
-  [What is a model?](https://cdnjs.com/libraries/backbone.js/tutorials/what-is-a-model)
-  [Defining Models in Backbonejs](http://codebeerstartups.com/2012/12/3-defining-models-in-backbone-js-learning-backbone-js/)
