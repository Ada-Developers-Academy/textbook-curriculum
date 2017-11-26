
# Enhancing the Model

## Learning Goals
-  Setup default values for model attributes
-  Write Custom methods in a model

## Introduction

Backbone provides a wide variety of built-in functionality for models. So far we haven't tapped into much of this - our application has been simple enough that we haven't needed it. Let's start looking at some of these features.

Today we'll explore:
- Setting default values
- Defining custom methods
- Overriding template methods

Every piece of functionality we add to the model will be added to the object we pass to `Backbone.Model.extend()`, similar to the way we added `url` and `parse()` to `Backbone.Collection.extend()` in the lesson on APIs.

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

### Form Input

**Question:** As we've written it, will our validations be applied to new books created through the form?

No! Turns out when a form field is empty, calling `.val()` gives the empty string, `''`. According to Backbone this is a perfectly valid value for an attribute, so it will _not_ apply the default value.

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

Now books created from our form should have the defaults applied as expected.

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

## Template Methods

There are a few special methods that Backbone allows you to override. These are [template methods](https://en.wikipedia.org/wiki/Template_method_pattern), following the pattern discussed in Metz ch 6. Backbone provides a reasonable default behavior for each of these, but if you override the function your version will be used instead.

We'll look at three of these template methods in this lesson:
- `initialize(attributes)`
- `parse(response)`
- `toJSON()`

### Initialize

The `initialize(attributes)` method is a constructor. It is called whenever a new model is instantiated.

The parameter `attributes` is what you passed into `new Book`.

```javascript
// src/models/book.js

const Book = Backbone.Model.extend({
  defaults: {
    author: 'Unknown'
  },
  initialize: function(attributes) {
    console.log(`Book initialized: ${ this.get('title') } by ${ this.get('author') }`);
    // just to see what attributes looks like
    console.log(attributes);
  }
});
```

```javascript
const poodr = new Book({
  title: 'POODR',
  publication_year: 2012
});
// => Book initialized: POODR by Unknown
// => { title: 'POODR', publication_year: 2012 }
```

A couple of observations we can make:

- Values from `attributes` have already been saved
- Default values have been filled in
- The `attributes` parameter contains exactly what we passed in, without defaults.

Because Backbone does much of the setup for us, most of the time we won't need to define `initialize` ourselves. Use it for debugging or if there's some complex state you need to set up.

### Parse and toJSON

`.parse(serverData)` and `.toJSON()` are template methods for working with an API. As you might expect from the names, `parse` is for _reading_ data from an API, whereas `toJSON` is for _writing_ data to an API.

We've already seen `parse` in the context of collections. It allowed us to modify the data sent by the server so it looked like what Backbone was expecting. In a model it fills the same role. `parse` will be called for every element in a collection when `.fetch()` is called.

`toJSON` does exactly the opposite: it should turn the model's current state into a JavaScript object so it can be sent to the server. The default implementation uses the `attributes` property, but if you've added anything extra this is how you would encode it.

While it's important to know they're there, neither of these functions will be very useful to us for our BackBooks project. Reimplementing `.parse(serverData)` and `.toJSON()` is most useful if you're trying to do something complex and non-RESTful, or if you're communication with an API you don't control.

## Summary

- Any property passed in to `Backbone.Model.extend()` will be part of the model's prototype
- Use `defaults` to set default values for attributes
- Custom methods can be defined here as well
- Backbone provides many _template methods_ to let you further customize behavior
  - `initialize(attributes)` acts as a constructor
  - `parse(serverData)` and `toJSON()` facilitate working with a non-standard API

## Resources
-  [What is a model?](https://cdnjs.com/libraries/backbone.js/tutorials/what-is-a-model)
-  [Defining Models in Backbonejs](http://codebeerstartups.com/2012/12/3-defining-models-in-backbone-js-learning-backbone-js/)
