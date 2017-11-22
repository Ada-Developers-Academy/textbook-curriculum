# Structuring Data with Models

As we've worked with JavaScript, up until this point all our data in has been stored as arrays of objects. This is fine for simple programs, but for more complex applications we'll need a more robust way to organize things. In the Backbone framework, this problem is solved through Models and Collections.

## Learning Goals

By the end of this lesson, you should be able to...

- Explain what a Backbone Model is
- Define a Backbone Model
- Instantiate a Backbone Model
- Get and set Model attributes

## What are Models in Backbone?

Backbone Models are much like Rails Models. They keep track of your data and help in saving and loading information to and from your back end.

Models are also the building blocks of collections. This is the role where we'll see them first - today we need to learn the basics of models so that we can begin working with collections.

Later in the week we will return to models, and learn how to use some of their more interesting features:
- Setting default values for new data
- Validating changes to the data
- Reading data from and writing it to an API
- Abstracting away complex bits of business logic
- Triggering events when the data changes

Much like our exploration of models in Rails, it will take some time to uncover all these useful abilities. In the meantime there will be an upfront cost, as we learn the basic syntax of Backbone models. Be patient - the benefit of well-managed data will be worth this tax.

## Book

Our first step in organizing our data is to define the `Book` model.

### Defining The Model

1. Create a file `src/models/book.js`
1. Open that file in Atom, and add the following code:
    ```javascript
    import Backbone from 'backbone';

    const Book = Backbone.Model.extend({

    });

    export default Book;
    ```

The first and last lines are directives to Webpack. They say that we'll need access to Backbone, and that when this file is imported it should give access to the Book object.

The middle lines are the interesting part. Here we `extend` `Backbone.Model`, which you can think of as creating a subclass. Similar to how in Rails our model classes inherited most of their behavior from `ApplicationRecord`, by `extend`ing `Backbone.Model` we get much of the functionality we need for free.

As we've seen before, the `Book` that is created here is a function! In particular it is a constructor - when we invoke it via `new Book()`, we will get an instance of the model.

This inherited functionality is enough for us now. As with Rails, we'll start off with empty models that only do basic model things, and add more sophisticated custom behavior as we go.

One question you might ask is, why does Backbone build its own inheritance mechanism instead of using ES6 classes? The answer is that Backbone predates ES6 by several years, and there are millions of applications out there built on the old behavior. In this case, stability is far more important than immediately switching to the newest technology.

#### No Schema

One thing you might have noticed is that we haven't said what our attributes our `Book` model has. In Rails we had to build migrations that spelled out exactly what a model looked like, but with Backbone we have done no such thing.

Instead, Backbone models act much like JavaScript objects, taking on whatever properties you give them. While this may feel a little nerve-wracking, in practice it works well for the same reason that duck typing is effective.

Moreover, because our data will usually come from an API, we can rely on the server to define these types for us. To do otherwise would not be DRY.

### Working with Models

Before we move on to working with collections, let's investigate this Backbone Model we've created. The code we write here will be temporary, since we'll soon replace it with code that uses a collection. However, the techniques we demonstrate for working with models will apply just as well to models in a collection.

First we need to import our model. Open up `src/app.js` and add the following line to the import section at the top:

```javascript
import Book from './models/book'
```

Because the path begins with a `./`, Webpack will interpret this as a relative path, which should get us to `src/models/book.js`. It will load whatever that file `export`s, in this case the `Book` constructor, and make it available in an object called `Book`.

**Exercise:** Working with a whiteboard and the person next to you, write the code to define a `Cat` model.

#### Creating Instances

To create instances of `Book`, invoke the `Book` constructor with the `new` keyword. Pass in a hash with the attributes you want.

```javascript
let book = new Book({
  title: "Ancillary Justice",
  author: "Ann Leckie",
  publication_year: 2013,
});
```

Whenever an instance of a Backbone model is created, Backbone will assign it a globally unique "client ID" or `cid`. The `cid` is a property on the model itself, not an attribute, so you can access it directly on the model:

```javascript
console.log(book.cid);
// => c3
```

**Exercise:** On the whiteboard, create an instance of your `Cat` with the following fields: `name`, `age`, `breed`.

#### Getting and Setting Attributes

Unlike a regular JavaScript object, you can't modify the attributes of a Backbone model directly. This is good - it gives us more control over what happens when attributes are read and written, which will unlock a lot of functionality for us in the future.

However, it also means we need to introduce an extra bit of syntax. To get a value, call the `get` function with the attribute's name, and to set it call the `set` function with a name and a value.

```javascript
console.log(`Created book instance with title ${ book.get('title') }`);

book.set('publication_year', 1992);
```

Unfortunately JavaScript does not provide any way for Backbone to warn us when we forget to use the `get` and `set` methods:

```javascript
console.log(`Created book instance with title ${ book.title }`);
// => Created book instance with title undefined

book.publication_year = 1992;
// Sets a property on the book object, not a model attribute.
// Now book.publication_year will yield 1992, but
// book.get('publication_year') will still return 2013
```

To get all of a model's attributes as a read-only hash use `.attributes`.

```javascript
console.log(book.attributes);
// => { title: 'Ancillary Justice', author: 'Ann Leckie', publication_year: 2013 }
```

**Question:** How would we get the information in an instance of `Book` to show up in our web page?

```javascript
let bookHTML = bookTemplate(book.attributes);
console.log(bookHTML);
$('#book-list').append($(bookHTML));
```

**Question:** What of the above code needs to live in `$(document).ready`? Why?

**Exercise:** On the whiteboard, write code to add a new attribute, `human`, to your `Cat`. Write code to log a description of the `Cat` to the console.

## Summary

- Models in Backbone are the core unit of data management
- A model is defined using `Backbone.Model.extend`
    - Each model should be defined in its own file
    - What you get back from `extend` is a constructor function
    - There are many options you can set when defining a model, but for now we will stick with the default behavior
- A model can be instantiated with arbitrary data
- Use the `.get(key)` and `.set(key, value)` functions to read and write model attributes
- The `.attributes` property gives a read-only hash of a model's attributes
    - This is often useful when filling out an Underscore template

## Additional Resources

- [Backbone Model & View Documentation](http://backbonejs.org/#Model-View-separation)
- [An Intro to Backbone Models & Collections](http://liquidmedia.org/blog/2011/01/backbone-js-part-1/)
- [Backbone Fundamentals, Models Chapter](https://addyosmani.com/backbone-fundamentals/#models-1)
