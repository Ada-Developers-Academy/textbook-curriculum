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
    .then(() => {
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

### Error Handling




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
