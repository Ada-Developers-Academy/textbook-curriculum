
# Enhancing the Model

## Learning Goals
-  Setup default values for model attributes
-  Write Custom methods in a model

## Introduction

Backbone provides a wide variety of built-in functionality for models. So far we haven't tapped into much of this - our application has been simple enough that we haven't needed it. Let's start looking at some of these features.

Today we'll explore:
- Default values
- Model constructors
- Custom methods
- Client-side validations

Every piece of functionality we add to the model will be added to the object we pass to `Backbone.Model.extend()`, similar to the way we added `url` and `toJson()` to `Backbone.Collection.extend()` in the lesson on APIs.

## Default Values

To set default values for model attributes, add an object called `defaults` to `Backbone.Model.extend()`. For example, this code will make the default author for a book `'Unknown'`.

```javascript
// src/app/models/book.js
import Backbone from 'backbone';

const Book = Backbone.Model.extend({
  defaults: {
    author: 'Unknown',
  }
});

export default Book;
```

Now any book created without an author will have the author set to `'Unknown'`:

```javascript
const poodr = new Book({
  title: 'Practical Object-Oriented Development in Ruby'
});

console.log(poodr.get('author'));
// => 'Unknown'
```

One important thing to be aware of: the empty string is a perfectly valid value! This means that if the `add-book` form is empty, we will _not_ get `'Unknown'` as our author:

```javascript
const bookData = readForm();
console.log(bookData['author']);
// => ''
const book = new Book(bookData);
console.log(book.get('author'));
// => ''
```

To take advantage of this default value, we'll need to modify our `readForm()` method to skip fields that are empty:

```javascript
const readForm = () => {
  let bookData = {};
  BOOK_FIELDS.forEach((field) => {
    // Use jQuery to select the field in the form
    const inputElement = $(`#add-book-form input[name="${ field }"]`);

    // Grab the field's current value
    const value = inputElement.val();

    // Ignore if the field is empty
    if (value != '') {
      bookData[field] = value;
    }

    // Clear the field
    inputElement.val('');
  });

  return bookData;
};
```

## Custom Methods

Backbone allows you to add custom functions to your models. These are attached to the object prototype, which means they act like instance methods in Ruby. This is useful if you have some complex business logic you want to add to your model.

For example, here we add a custom function to calculate a `Book`'s age.

```javascript
// src/app/models/book.js
import Backbone from 'backbone';

const Book = Backbone.Model.extend({
  defaults: {
    author: 'Unknown',
  },
  age: function() {
    const currentYear = (new Date()).getFullYear();
    return currentYear - this.get('publication_year');
  }
});

export default Book;
```

Now you can call `.age()` on any instance of `Book`

```javascript
const poodr = new Book({
  title: 'Practical Object-Oriented Design in Ruby',
  author: 'Sandi Metz',
  publication_year: 2012
});

console.log(poodr.age());
// => 5
```

### Exercise

Write a `toString` function for our `Book` model. As we've seen previously, [`toString` is the function that JavaScript calls automatically when asked to string interpolate an object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString#Examples), so overriding it can be very handy.

### Initialize and Parse

There are two special

Just like with a Rails Model you can create an `initialize` method and it will be called each time a new model is instantiated with `new`.

```javascript
// src/app/models/book.js
//...

const Book = Backbone.Model.extend({
  defaults: {
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

## Client-Side Validations

You've done validation before in Rails. These validations are done on the **server-side**. This works, but it means we need a full request-response cycle in order to see whether what the user typed was valid. This has a couple of downsides:
- The user has to wait for the server's response to get feedback
- We might waste a bunch of network bandwidth sending bad data

A more user-friendly approach is **client-side validation**. The core idea is we should validate as much of the user's data as possible in the browser before it is sent. With client-side validation, the users gets immediate feedback because they do not have to wait for an entire request-cycle to complete. This makes the application feel more responsive and improves the user experience.

It's worth noting that **we still need to write validations on the server**, for two reasons:
- Some of the validations might require data the client doesn't have (e.g. uniqueness constraints)
- Because we can't trust the client, we have no guarantee the client-side validations were actually run

Even with these constraints client-side validation is an extremely useful technique.

### Validations in Backbone

To add validations to your model, create a `validate` function in your model. The method should return `false` if the model is valid and a truthy value if the model is invalid.

```javascript
// src/models/book.js
const Book = Backbone.Model.extend({
  defaults: {
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

When a `Book` instance is saved with `.save()`, the model's `validate` function is called. The model will not post to the API if `validate` returns a truthy value, and you can access validation errors with the `validationError` property.

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
In the above example, we read in the form's fields and used the collection's `create` method to create a book model and added it to the collection, as well as saving it to the API. The function `create` returns the new model instance and we can check validation errors with the `validationError` property.

Now this kind of validation works, but it won't report to the user **all** the validations which failed. Instead we can collect all the validation failures and return an object containing them.

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

So after all that, why bother doing server-side validations, if we have them on the client-side?  Server-side validations are expensive, but as we've seen with Postman and other apps, submissions to our API are not guaranteed to come from our front-end, and in larger teams, there's no guarantee that every front-end's validations are perfect. Think of validations as layers of protections for your database. On the outer layer are client-side validations providing quick feedback to users when they make a mistake. Beyond that are server-side validations which provide an additional layer of protection. Lastly the database can have restrictions on data as well and provides a final layer of protection.

## Summary

In this lesson we have examined models in more depth. We discovered how to set default values for attributes and add custom methods. Lastly we added a special custom method `validate` which is called to validate a model. We used `validate` to display any validation errors encountered when we created new Books.

## Resources
-  [What is a model?](https://cdnjs.com/libraries/backbone.js/tutorials/what-is-a-model)
-  [Defining Models in Backbonejs](http://codebeerstartups.com/2012/12/3-defining-models-in-backbone-js-learning-backbone-js/)
