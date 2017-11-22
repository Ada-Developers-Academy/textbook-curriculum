# Using Backbone With an API

## Learning Goals
By the end of this lesson you should be able to...

- Use Backbone to retrieve and render data from an API
- Use Backbone to send data to an API
- Write custom parsers and formatters to match API data and Backbone Models

## Introduction

Our BackBooks app has a lot of features so far, but it's also got one major problem: the list of books is not persistent. Every time we reload the page, we get the same old static data, without any of our changes.

In order to add persistence, we'll need to make our app talk to an external API. The [BackBooks API](https://github.com/AdaGold/backbooks-rails-api) ought to do nicely. Follow the instructions in the README to run the server locally, and take a few minutes to familiarize yourself with the API.

Note that these instructions will work just as well for a deployed API - just change the URL.

**Question:** How might you make your app talk to an API? Which Backbone components ought to be responsible for this behavior?

**Question:** How is this similar to what we've done in Rails?

![Backbone JS Architecture from http://www.slideshare.net/ronreiter/writing-html5-web-apps-using-backbonejs-and-gae](images/backbonejs-architecture.jpg)

## Reading Data From an API

### Configuring Backbone for Our API

Backbone doesn't just magically know where our API is or how it works - we have to tell it. Open up `src/collections/book_list.js`.

First we need to tell Backbone the URL of our API. Note that this `url` property is specifically for the data retrieval.

```javascript
const BookList = Backbone.Collection.extend({
  model: Book,
  url: 'http://localhost:3000/books'
});
```

Second we need to tell Backbone how to interpret the data it gets back. We can do so by implementing the `parse()` function, which Backbone calls on the data it gets back from the API. `parse()` should return an array of JavaScript objects representing books, in the same data format our static data was in.

**Question:** What does the data we get back from the API look like? How can we turn it into what we want?

```javascript
const BookList = Backbone.Collection.extend({
  model: Book,
  url: 'http://localhost:3000/books',
  parse: function(response) {
    return response['books'];
  }
});
```

This is the first time we've defined a method for one of our Backbone components. Note that we've used a traditional function (using the `function` keyword), not an arrow function.

**Question:** Why didn't we use an arrow function here?

Note that you only need a `parse()` function if the data sent by your API doesn't match what Backbone expects (an array of objects). If that is the format, you can omit `parse()`.

### Removing Static Data

Now that we are configured to read our data from an API, that means we don't need to keep any static data in our JavaScript files. Go into `src/app.js` and delete `rawBookData`.

Since we're not getting data locally, we need to tell Backbone to read it from the remote server which we have configured. To do so, add a call to `bookList.fetch()` once you've initialized the collection. The end result will look like this:

```javascript
let bookList = new BookList();
bookList.fetch();
```

Backbone knows that when `fetch()` is called, it should look for the appropriate configuration in the collection to load the data. Since the use of an API for data retrieval is so common, this can feel a bit like "magic".

**Question:** A bit of experimenting will show that you can also delete the call to `render()` in `$(document).ready()`. What do you think is going on here? How would you find out more?

**Question:** What does this tell us about where the call to `bookList.fetch()` should go within `app.js`?

Your code should now match [the `api-read-only` branch](https://github.com/AdaGold/backbooks-client/tree/api-read-only).

## Writing Data To an API

Our original goal was to make our data persistent: if we make changes, the next time we load the page we should see them. We're not quite there yet - if you add a book and then reload the page the changes will be gone. The reason is we haven't told Backbone to **write** those changes to the API, we are currently only **reading**.

Spend a few minutes reading the Backbone documentation, and try to come up with a plan for how this might work. This will be good practice for capstones and internships, when you'll have to read the docs without an instructor for backup.

### Saving Books

The key here is the Backbone Model method `save`. From the Backbone documentation:

> **save** `model.save([attributes], [options])`
>
> Save a model to your database... a complete representation of the resource will be sent to the server... If the model `isNew`, the save will be a `"create"` (HTTP `POST`), if the model already exists on the server, the save will be an `"update"` (HTTP `PUT`).

Sounds like exactly what we want! We need to call `.save()` on our new model instances. There's just a few more details to clear up.

First, what about that `url` property we specified on the collection? Do we need to add it to the model as well?

Turns out that most APIs follow a predictable pattern, and Backbone is tuned into this. When you `add` a model to a collection that is configured with the `url` property, Backbone guesses that the create URL matches the collection's URL, and an individual model's `url` will be `<collection-url>/<id>`. In our case, that correctly matches the way we've set up the routes in our API. This means that creating (or updating, or deleting) a model will work without us manually specifying the model's `url`.

Second, where do we actually call `.save()`? The best place is probably in the callback for the `submit` DOM event. Change that code to read:

```javascript
$('#add-book-form').on('submit', (event) => {
  event.preventDefault();
  let bookData = readForm();
  let book = bookList.add(bookData);
  book.save();
});
```

The final result should match the [code on the `api-no-error-handling` branch](https://github.com/AdaGold/backbooks-client/blob/api-no-error-handling/src/app.js).

### Error Handling

From our reading of the API earlier we know that the Rails `Book` model has validations, which means our API call will fail if the user sends bad data. We know from experience how important it is to report errors to the user in a polite and actionable way. This will both improve the user experience and make developing the application much less painful.

Fortunately, Backbone allows you to define success and error callbacks in the arguments to `.save()` (and `.fetch()`).

One tricky bit of syntax: the JavaScript object specifying these callbacks must be the second argument to `.save()`. The first is reserved for if you want to specify which attributes to send. If you don't specify them Backbone will send everything, which is what we want, so add an empty hash as the first argument.

```javascript
book.save({}, {
  success: successCallback,
  error: errorCallback
});
```

Of course, you'll have to define those callbacks somewhere. Work with the person next to you to come up with a plan for how to display errors to the user.

This error handling is one of the more complex pieces of code we've built so far, and it's not really even Backbone code! One approach is demonstrated on [the `api-error-handling` branch](https://github.com/AdaGold/backbooks-client/blob/api-error-handling/src/app.js).

### Matching Backbone to Non-standard APIs

Not all APIs follow the standard RESTful convention. Fortunately, Backbone's API integration is flexible enough to fit most any oddly-shaped web service.

We saw an example of this above, when we implemented `parse()` in our Collection. Other ways to customize include overriding the `toJSON()` methods in the Model and Collection, and the `url()` function in the Model. Read the docs for more info!

## Summary
- Remove all that gross static data from our javascript file
- Load data into Backbone dynamically from an API
- Write Backbone data back to an API

## Additional Resources
- [Backbone docs on API integration](http://backbonejs.org/#API-integration)
- [MDN on Cross-Origin Resource Sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS)
