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


This lesson will continue to use the [HTML in the reference section](reference/axios/index.html). Notice the `<form>`. When the user submits that form, we'll want to read all the data and send a POST request to the API.

Let's start with some jQuery to make that connection.

```javascript
// Inside $(document).ready() in index.js
$('#pet-form').submit(createPet);
```

Next, we need to build the `createPet` method. We'll start out with hard-coded data, and later on we'll expand our code to read values from a form.

```javascript
// Above $(document).ready() in index.js
const createPet = (event) => {
  // Note that createPet is a handler for a `submit`
  // event, which means we need to call `preventDefault`
  // to avoid a page reload
  event.preventDefault();

  // Later we'll read these values from a form
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

**Question:** What would happen if we didn't have that call to `event.preventDefault()`?

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

## Error Handling

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

Note how similar this looks to our error handling code from Rails. The errors take the same form, so the way we process them is the same.

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
    - We could also have used Postman for this
1. Add code to detect and parse the server's error response
1. Write a helpful error message to the screen

The details of error handling will be different for every API we work with. Figuring out what the server sends back requires some investigation, and the specific message you present will depend on what went wrong. However, this general strategy will apply in most situations.

## Reading Data from a Form

While hard-coded data is great for prototyping, we should really give the user a way to specify what data to send. To do so, we'll use an HTML form.

Our strategy will be to implement a function called `readFormData()`. We will call this function from our `createPet()` function and save the results as `petData`, instead of using an object literal. `readFormData()` should get the value of each of the form fields, and return them in an object that looks like this:

```javascript
{
  name: 'Socks',
  age: 7,
  owner: 'Bill'
}
```

This is your job! The following questions might help you think about this problem:
- How do we select one of the form inputs with jQuery?
- How do we get the current value of a form input?
- What should we do if the input is empty?
- How can we DRY up this process?
- Do we need to clear the form inputs once we've read them?

Once you've got a solution you're happy with, you can see ours [here](reference/axios/index.js).

## Summary

As in Ruby, the difficult part of working with an API in JavaScript is not so much making the request, as figuring out what request to make, and what to do after. Though the setting is different, our work will follow a similar pattern:

1. Explore the API using the documentation, Postman, and other tools
    - How do you need to format your data
    - How does the API respond
    - What does an error response look like?
1. Write code to interact with the API
    - Hard-coded data for input
    - Logging to the console as output
1. Put together a user experience
    - Read a form to get data
    - Report progress and errors politely to the user via HTML

## Additional Resources
- [axios documentation](https://github.com/axios/axios)
- [jQuery `.submit()` event](https://api.jquery.com/submit/)
- See resources from [previous lesson](ajax-intro.md)
