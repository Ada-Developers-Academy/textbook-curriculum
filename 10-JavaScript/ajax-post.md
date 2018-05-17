# JavaScript: AJAX Post

## Learning Goals
- Use axios to make AJAX POST requests
- Use JavaScript to read form data
- Handle API errors gracefully in a JavaScript SPA

## Introduction

Just like we used axios and AJAX to send GET requests, we can also use it to send POST requests.

**Question:** Thinking back to our previous work with APIs in Ruby, what are the big differences between POST and GET?

## Making a POST request

Let's get right to it! We will make a POST request to add a pet to the list. Read through the [API documentation on GitHub](https://github.com/AdaGold/pets_api/blob/master/README.md), and answer the following questions:

- What endpoint should we use?
- What information can we send?
- What information **must** we send?
- How do we need to structure the data we send?

### The POST itself

We'll start out with hard-coded data, and later on we'll expand our code to read values from a form.

First, a button to click:

```html
<!-- Inside the <body> of index.html -->
<button id="send-pet-data">Send it!</button>
```

Next, some jQuery to make the button do something.

```javascript
// Inside $(document).ready() in index.js
$('#send-pet-data').click(createPet);
```

And finally, the `createPet` method.

```javascript
// Above $(document).ready() in index.js
const createPet = () {
  const petData = {
    name: 'Socks',
    age: 7,
    owner: 'Bill'
  };

  reportStatus('Sending pet data...');

  axios.post(URL, petData)
    .then((response) => {
      console.log(response);
      reportStatus('Successfully added a pet!');
    })
    .catch((error) => {
      console.log(error.response);
      reportStatus(`Encountered an error: ${error.message}`);
    });
};
```

There are a few things to pay attention to here:
- The `post` method looks very similar to the `get` we saw previously
  - It's still got `URL`, `.then` and `.catch`
  - The only difference is we've added `petData`
- axios is automatically translating our JavaScript object `petData` into JSON to send on the wire
- We reuse the `reportStatus` method we defined in the last lesson
  - Letting the user (or yourself) know what's going on is always important!

To test it, open up the developer tools and switch to the `Network` tab, then click the button. You should see a request going out, and the status section of our page should be updated. If you were to reload the list of pets, you would see ours at the bottom. Good work!

**Question:** What information does the server send back to us? Can we use this somehow?

```javascript
axios.post(URL, petData)
  .then((response) => {
    console.log(response);
    reportStatus(`Successfully added a pet with ID ${response.data.id}!`);
  })
  // ... .catch ...
```

### Error Handling

We've tried out the success case and it seems to work well. Now let's try the error case and see if it results in a good user experience.

**Question:** How can we adjust our hard-coded data to make the API give us an error?

Removing the `name` should do nicely. Sending this request, we see that the app tells us there was a 400 error, but not why. Looking at the console output reveals that the server sends error results back in our familiar format: a hash mapping fields to lists of problems.

```javascript
{
  errors: {
    name: ["can't be blank"]
  }
}
```

Let's write a helper method to parse these error messages:

```javascript
// index.js, under reportStatus
const reportError = (message, errors) => {
  let content = `<p>${message}</p>`
  content += "<ul>";
  for (const field in errors) {
    for (const problem of errors[field]) {
      content += `<li>${field}: ${problem}</li>`;
    }
  }
  content += "</ul>";
  reportStatus(content);
};
```

And then use it in our error handling code:

```javascript
// index.js, attached to the axios.post call in createPet
.catch((error) => {
  console.log(error.response);
  // Make sure the server actually sent us errors. If
  // there's a different problem, like a typo in the URL
  // or a network error, the response won't be filled in.
  if (error.response.data && error.response.data.errors) {
    // User our new helper method
    reportError(
      `Encountered an error: ${error.message}`,
      error.response.data.errors
    );
  } else {
    // This is what we had before
    reportStatus(`Encountered an error: ${error.message}`);
  }
});
```

The steps we've followed here are:
1. Send a bad request and use the console to find out what the server sends back
1. Add code to detect and parse the server's error response
1. Write a helpful error message to the screen

The details of error handling will be different for every API we work with. Figuring out what the server sends back requires some investigation, and the specific message you present will depend on what went wrong. However, this general strategy will apply in most situations.

## Reading Data from a Form

While hard-coded data is great for prototyping, we should really give the user a way to specify what data to send. To do so, we'll use an HTML form.

### Infrastructure

First, the form itself. We'll add it to the `<body>` of our HTML document, along with some semantic HTML to keep things organized:

```html
<!-- index.html, inside the <body> tag -->
<section id="status-message"></section>

<main>
  <section class="current-pets">
    <h1>List-o-Pets</h1>
    <button id="load">Get pets!</button>
    <ul id="pet-list"></ul>
  </section>

  <section class="new-pet">
    <h1>Add a new pet</h1>
    <form id="pet-form">
      <div>
        <label for="name">Name</label>
        <input type="text" name="name" />
      </div>

      <div>
        <label for="age">Age</label>
        <input type="number" name="age" />
      </div>

      <div>
        <label for="human">Human</label>
        <input type="text" name="human" />
      </div>

      <input type="submit" name="add-pet" value="Add Pet" />
    </form>
  </section>
</main>
```

Next, modify the `createPet` function to call a function instead of using hard-coded data. We'll also adjust our jQuery glue code to listen for a `submit` event on the form.

```javascript
// index.js
const readFormData = () => {
  // TODO: read the form, return results as an object
};

const createPet = (event) => {
  // Note that createPet is now a handler for a `submit`
  // event, which means we need to call `preventDefault`
  // to avoid a page reload
  event.preventDefault();

  const petData = readFormData();
  console.log(petData);

  // The rest of this is the same as before
  reportStatus('Sending pet data...');

  axios.post(URL, petData)
    // .then, .catch are the same
};

$(document).ready(() => {
  $('#load').click(loadPets);
  $('#pet-form').submit(createPet);
});
```

### Reading the Form



# TODO REMOVE

POST requests are set up very similar to GET requests.
```javascript
const url = 'https://petdibs.herokuapp.com/pets';
const data = {
  name: 'Chestnut',
  age: 17,
};
const callback = function callback() {
  console.log('success!');
};

$.post(url, data, callback);
```

As we saw previously, `$.get` is a shorthand version of `$.ajax` and `$.post` is also a shorthand version of `$.ajax`. (If you would like a reminder on the $.ajax syntax, visit [here](http://api.jquery.com/jquery.ajax/))

The main difference here is that along with a POST request, we want to pass some sort of data. In addition, the response should look different than with our GET request, since most likely we'll just be looking for success rather than any specific data returned.

We can also see the alternate syntax of providing all of the `$.post` parameters in one single function call:
```javascript
$.post('https://petdibs.herokuapp.com/pets',
  {
    name: 'Chestnut',
    age: 17,
  }, (response) => {
    console.log('success!');
  }
);
```
### POST Request with Form Data
Most of the time, the request data is not hard-coded like the example above. Usually, we would want to take data from a form and include that in our POST request.

```html
<div id="message"></div>
<form action="https://petdibs.herokuapp.com/pets" method="post">
  <section>
    <label>Name</label>
    <input type="text" id="name" name="name"></input>
  </section>
  <section>
    <label>Age</label>
    <input type="text" id="age" name="age"></input>
  </section>

  <section class="button">
    <button type="submit">Add Pet</button>
  </section>
</form>
```

```javascript
$('form').submit( function(e) {
  // By default, the form will attempt to do it's own
  // local POST so we want to prevent that default
  // behavior
  e.preventDefault();

  const url = $(this).attr('action'); // Retrieve the action from the form
  const formData = $(this).serialize();

  $.post(url, formData, (response) => {
    $('#message').html('<p> Pet added! </p>');
    // What do we get in the response?
    console.log(response);
  });
});
```

But wait, this code doesn't handle any errors! How can we make sure our users know when something didn't respond successfully?

### Add Callbacks
We have the same status callbacks that we had for the `$.get` requests that we saw previously.

Let's update our previous example to add a callback to handle the failure scenario. We've condensed our example above to highlight only the `$.post` section that needs to be modified.
```javascript
$.post(url, formData, (response) => {
  $('#message').html('<p> Pet added! </p>');

  // What do we get in the response?
  console.log(response);
}).fail(() => {
  $('#message').html('<p>Adding Pet Failed</p>');
});
```

## Key Takeaway
Once we understand the general way to use the jQuery AJAX functionality, we can apply it to any request/response we'd like to handle. We should be beginning to see how to expand upon the SPA concept that we discussed previously using only GETS. In addition, we should see how we can take all of our knowledge of HTTP Requests/Responses that we learned in Rails a step further using this jQuery functionality.

## Additional Resources
- [jQuery AJAX POST Documentation](https://api.jquery.com/jquery.post/)
- [jQuery AJAX Documentation](http://api.jquery.com/jquery.ajax/)
