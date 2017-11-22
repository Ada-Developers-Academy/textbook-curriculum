
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
    console.log(`Book initialized: ${this.get("title")}`);
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

You've done validation before in Rails.  These validations are done on the **server-side**.  This is wasteful because you have **one** server doing all the work!  It's better to shift as much work as possible to the browser because it distributes the load among your clients.  In addition by doing the validation in the browser, the users gets immediate feedback because they do not have to wait for an entire request-cycle to complete.  This makes the application feel more responsive and improves the user experience.

To add validations to your model, create a `validate` function in your model.  The method should return `false` if the model is valid and a truthy value if the model is invalid.  

```javascript
// src/models/book.js
const Book = Backbone.Model.extend({
  defaults: {
    title: '',
    author: 'Unknown',
  },
  validate(attributes) {
    const errors = [];
    if (!attributes.title || attributes.title === '') {
      return 'Title is required';
    }

    if (!attributes.author) {
      return 'Books require an author';
    }

    if (!attributes.publication_year || isNaN(attributes.publication_year) ||
      (attributes.publication_year >= 1000 && attributes.publication_year <= (new Date()).getFullYear())) {
      return 'A publication year is required and must between 1000 and this year.';
    }

    return false;
  }
});
```

When a `Book` instance is saved with `.save()`, the model's `validate` function is called.  The model will not post to the API if `validate` returns a truthy value, and you can access validation errors with the `validationError` property.

```javascript
// src/app.js
const readForm = function() {
  const title = $('#title-field').val();
  const author = $('#author-field').val();
  const publication_year = $('#publication-year-field').val();
  $('#title-field').val('');
  $('#author-field').val('');
  $('#publication-year-field').val('');

  return {
    title,
    author,
    publication_year
  };
};
// ...
$('#add-book-form').on('submit', (event) => {
  event.preventDefault();
  let bookData = readForm();
  const book = bookList.create(bookData, {
      wait: true // Don't update the list until save completes
  });
  if (book.validationError) {
    $('#error-messages').append(`<li>${book.validationError}</li>`);
  }
});
```
In the above example, we read in the form's fields and used the collection's `create` method to create a book model and added it to the collection, as well as saving it to the API.  The function `create` returns the new model instance and we can check validation errors with the `validationError` property.  

Now this kind of validation works, but it won't report to the user **all** the validations which failed.  Instead we can collect all the validation failures and return an object containing them.

```javascript
// src/models/book.js
// ...
validate(attributes) {
    const errors = {};
    if (!attributes.title || attributes.title === '') {
      errors.title = 'Title is required';
    }

    if (!attributes.author) {
      errors.author = 'Books require an author';
    }

    if (!attributes.publication_year || isNaN(attributes.publication_year) ||
      attributes.publication_year < 1000 || attributes.publication_year > (new Date()).getFullYear()) {
      errors.publication_year = 'A publication year is required and must between 1000 and this year.';
    }

    return errors.length === 0 ? false : errors;
  }
// ...
```

And in our event handler we can display the validation errors with a loop.

```javascript
// src/app.js
// ...

$('#add-book-form').on('submit', (event) => {
    event.preventDefault();
    let bookData = readForm();

    const book = bookList.create(bookData, {
        success: function(model, response) { },
        error: function(model, response) { },
        wait: true // Don't update the list until save completes
    });
    if (book.validationError) {
      console.log(book.validationError);
      Object.keys(book.validationError).forEach( (key) => {
        $('#error-messages').append(`<li>${key}: ${book.validationError[key]}</li>`);
      });
    }
  });

// ...
```

So after all that, why bother doing server-side validations, if we have them on the client-side?  Server-side validations are expensive, but as we've seen with Postman and other apps, submissions to our API are not guaranteed to come from our front-end, and in larger teams, there's no guarantee that every front-end's validations are perfect.  Think of validations as layers of protections for your database.  On the outer layer are client-side validations providing quick feedback to users when they make a mistake.  Beyond that are server-side validations which provide an additional layer of protection.  Lastly the database can have restrictions on data as well and provides a final layer of protection.  

## Summary

In this lesson we have examined models in more depth.  We discovered how to set default values for attributes and add custom methods.  Lastly we added a special custom method `validate` which is called to validate a model.  We used `validate` to display any validation errors encountered when we created new Books.  

## Resources
-  [What is a model?](https://cdnjs.com/libraries/backbone.js/tutorials/what-is-a-model)
-  [Defining Models in Backbonejs](http://codebeerstartups.com/2012/12/3-defining-models-in-backbone-js-learning-backbone-js/)
