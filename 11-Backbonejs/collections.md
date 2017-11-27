# Organizing Data with Collections

We've seen how Backbone Models can be used to organize our data, similar to ActiveRecord models in Rails. However, in any interesting application we are going to have more than one instance of a given Model, so we will also need a way to manage groups of those instances. We could use standard JavaScript arrays, as we have been doing so far, but Backbone provides us another option: Collections.

## Learning Goals

By the end of this lesson, you should be able to...

- Explain what a Backbone Collection is
- Define and instantiate a Backbone Collection
- Add models to a collection
- Retrieve models from a collection
- Iterate through models in a collection

## What are Collections in Backbone?

Collections are a specific type of model that keep track of a set of related objects, rather than one individual piece of data. The relationship between Collections and Models is like the one between arrays and objects.

Thinking back to Rails and ActiveRecord, a Backbone Collection contains things that would be class methods for an AR Model: built-in methods similar to `.all`, `.find` and `.order`, as well as any custom functions that operate on a group of objects.

## BookList

Now that we've defined our `Book` Model, it's time to build a Collection to contain it. We will call this Collection `BookList`.

### Defining The Collection

1. Create a file `src/collections/book_list.js`
1. Open that file in Atom, and add the following code:
    ```javascript
    import Backbone from 'backbone';
    import Book from '../models/book';

    const BookList = Backbone.Collection.extend({
      model: Book
    });

    export default BookList;
    ```

This one has a little more going on than the model definition. The key observation here is that the collection needs to know what sort of thing it collects. To give it this information, we need to `import` the `Book` object we just created, and set it as the `model` property on the collection.

Similar to the model, the `BookList` we've defined here is a constructor function. When invoked with `new` it will produce an instance of `BookList`.

As with the model, most of the behavior we need is gained through `extend`ing `Backbone.Collection`. In the future we'll add more functionality here, but this will do for now.

**Exercise:** On the whiteboard, write code to define a `CatList` collection.

### Working with Collections

As before, we'll need to import our newly defined collection into `app.js`:

```javascript
import BookList from './collections/book_list';
```

#### Creating a Collection

To create an instance of `BookList`, use `new BookList()`. If you pass in no arguments, the list will be created empty of books.

A `BookList` can also be created with books. If you pass an array to `new BookList`, Backbone will attempt to create a model instance from each element in the array, using whatever model you specified when you defined the collection. For this we can use the `rawBookData` variable that is already defined.

```javascript
const bookList = new BookList(rawBookData);
```

One interesting thing to note is that in Backbone you can have more than one of a given collection. How does this compare to Rails? When might this be useful?

**Exercise:** On the whiteboard, create a new `CatList` with two cats.

#### Adding Books

You can also add models to an existing collection. There are two ways to do so.

If you already have a model, you can use the `.add` function to add it to a collection:

```javascript
const book = new Book({
  title: 'Ancillary Justice',
  author: 'Ann Leckie',
  publication_year: 2013,
});

bookList.add(book);
```

Alternately, if you pass a raw JavaScript object in to `.add`, Backbone will attempt to convert it to a model instance first, just like when we first created the list.

```javascript
// This code does exactly the same thing as above in fewer lines
bookList.add({
  title: 'Ancillary Justice',
  author: 'Ann Leckie',
  publication_year: 2013,
});
```

**Exercise:** Add a `Cat` to your `CatList`.

#### Retrieving Books

There are two ways to pull an individual model out of a collection. The first is using `.at(index)`. This is just like using array indexing, and the index refers to the order in which models are currently stored in the array.

```javascript
bookList.at(0);  // retrieve the first book, POODR
bookList.at(2);  // third book, The Left Hand of Darkness
bookList.at(-1); // last book, Ancillary Justice
```

The other way to pull out an individual model is using the `.get(cid)` method, which takes the model's cid. This is typically less useful, but does come up occasionally. This method is similar to using ActiveRecord's `.find` or `.find_by(id: )` methods.

#### Iterating Through Elements

Backbone Collections provide a large number of methods to iterate through their elements. For the most part these look similar to the ES6 array iteration functions you already know and love. For example, `forEach`, `map`, `filter` and `reduce` are all included.

```javascript
// Log a description of each book
bookList.forEach((book) => {
  console.log(`${ book.get('title') } by ${ book.get('author') }`);
});

// Get a subset of books matching a condition (similar to Ruby's select)
const recentBooks = bookList.filter(book => book.get('publication_year') > 1990);
```

Note that collections implement several iterators that ES6 arrays do not, that most of the iterators have an alias (`forEach` -> `each`, `reduce` -> `collect`, etc.) and that the names on some of the more obscure iterators may differ. [You can find a complete list in the Backbone documentation](http://backbonejs.org/#Collection-Underscore-Methods).

This discrepancy exists because Backbone predates ES6 by several years. In fact Underscore's iteration functions (which Backbone uses) were a big part of the inspiration for ES6.

**Exercise:** Write code to log information about each `Cat` to the console.

## Rendering The BookList

You should now have all the pieces you need to build the list of books and render it in the DOM. Spend a few minutes attempting this with a partner, then we'll come together as a class and check our work.

Once you're done, `app.js` should look like [what's on the `collection` branch](https://github.com/AdaGold/backbooks-client/blob/collection/src/app.js).


**Question:** Note the call to `bookListElement.empty()`.
- What would happen if we removed this line?
    - _Hint:_ what happens if you call `render()` twice?
- [What is the vocab word for the property this gives our `render()` function](https://en.wikipedia.org/wiki/Idempotence)?

This property may not seem to matter yet, because `render()` is only ever called once in our application. As we add more complicated functionality being able to call `render()` multiple times will become quite important, as we'll see in the next lecture.

## Summary

- A Backbone collection is a special type of model that stores a list of other models
- Like models, collections are defined using `Backbone.Collection.extend`
    - Each collection gets its own file
    - As with models, `extend` gives you a constructor function
    - A collection needs to know what kind of model it contains
    - Collections can be defined with many other options set, but for now we will stick with the default behavior
- When a collection is instantiated from an array, Backbone will attempt to turn each element in the array into a model of the appropriate type
- The `.add` method adds elements to a collection
    - It can take a raw JavaScript object or an existing model
- Use `.at` to retrieve values by index, and `.get` to retrieve by `cid`
- Collections provide have many useful enumeration methods

## Additional Resources

- [Backbone docs on Collections](http://backbonejs.org/#Collection)
- [cdnjs on Collections](https://cdnjs.com/libraries/backbone.js/tutorials/what-is-a-collection)
