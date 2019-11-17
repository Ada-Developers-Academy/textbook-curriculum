# Making `POST` Requests using `axios` in JavaScript

Setup notes: This lesson will make use of the [Ada Trip Reserving Service™ Trip API™™™](https://github.com/AdaGold/trip-api), so make sure it's running.

This lesson will use Postman, a text editor, and terminal.

## Learning Goals
- Review exploring APIs by reading documentation and using Postman
- Use axios to make AJAX POST requests
- Anticipate how to apply making asynchronous HTTP requests in fuller JavaScript programs

## Introduction

Just like we used axios and AJAX to send GET requests, we can also use it to send POST requests.

Answer the following questions:

- What are the big differences between POST and GET?
- What did we use POST requests for in Rails?
- What kinds of specific actions did users do in order to trigger POST requests in our Rails apps?

## Our Example Today: Trip API

The **Ada Trip Reserving Service™** is a service that does two things very well:

1. helps tour guides create Trip packages catered to global travelers
2. helps travelers find Trip packages that fit their needs, and make a reservation for that trip

Today, we will use the [Ada Trip Reserving Service™ Trip API™™™](https://github.com/AdaGold/trip-api) to create new Trip packages.

Take 3 minutes with a neighbor to explore the API documentation. Use Postman to experiment. Answer the following questions:

1. What is the API call that lists all existing Trip packages?
2. Make that API call and see the list of all existing Trip packages. How many are there? What are their IDs?
3. What is the API call that creates a new Trip package?
4. What is the verb and URL of that request?
5. What are the required query parameters? What are the optional query parameters?

<details>

  <summary>
    Check your answers here!
  </summary>

  1. `get` `https://trektravel.herokuapp.com/trips`
  2. Depends, but it's good to remember to note the trip ID for this exercise
  3. `post` `https://trektravel.herokuapp.com/trips`
  4. post, and `https://trektravel.herokuapp.com/trips`
  5. Required: `name`, `continent`, `category`, `weeks`, and `cost`. Optional: `about`

</details>

## Making a `POST` request in axios

The syntax for making a POST request is very similar to making a GET request, but we will use the `post()` function instead.

The `post()` function takes in the same two parameters: URL first, and an optional params object second.

```js
const axios = require('axios');

const tripData = {
  name: 'Dee\'s Chill Trip to Chicago',
  continent: 'North America',
  about: 'A tour around good architecture and hot dogs.',
  category: 'casual',
  weeks: 1,
  cost: 180,
};

axios.post('https://trektravel.herokuapp.com/trips', tripData)
  .then((response) => {
    console.log('RESPONSE:', response);
    console.log('RESPONSE DATA:', response.data);
    console.log('plums!');
  })
  .catch((error) => {
    console.log('ERROR:', error);
    console.log('ERROR RESPONSE:', error.response);
    console.log('mangos!');
  })
  .finally(() => {
    console.log('finally done!');
  });
```

Confirm your understanding of the code by answering these questions (use the [axios documentation](https://github.com/axios/axios) to supplement):

1. Did we need to re-install axios for this using `$ npm install`? Why or why not?
2. Did we need to "load" axios into this file? If so, how?
3. What line of code **makes** the POST request?
4. What is the first parameter to `post()`?
5. What is the value of the second parameter to `post()`? What does it represent? Where is it declared and assigned? Why is it `const`?
6. `post()` also expects the structure of chaining `then()`, `catch()`, and `finally()`. What do we do if the response comes back successfully?
7. What do we do if the response comes back unsuccessfully?
8. Does the `post()` function have support for `finally()` to be chained?

<details>

  <summary>
    Check your answers here.
  </summary>

  1. We did not need to re-install axios, because previously we installed axios onto our machine globally. If we had a new JavaScript project that had its own dependencies managed in a `package.json` file (much like a Ruby project with its own `Gemfile` file), we may need to run `$ npm install`
  2. Yes, we loaded axios with `const axios = require('axios');`
  3. The line of code that makes the POST request is `axios.post('https://trektravel.herokuapp.com/trips', tripData)`
  4. The first parameter is the URL/API endpoint, which is `'https://trektravel.herokuapp.com/trips'`
  5. The second parameter is the data we are sending with the POST request. We are sending `tripData`, which is an object that has the name/value pairs that match what the API is expecting, and our own Trip information. We make `tripData` a `const` variable because we don't expect it to ever be re-assigned.
  6. When the response comes back successfully, we print to the terminal the response, response data, and the word "plums!"
  7. When the response comes back successfully, we print to the terminal the error, error response, and the word "mangos!"
  8. The `post()` function does support `finally()`

</details>

#### By the way, we could inline `tripData`

<details>

  <summary>
    If you were curious, we absolutely could sidestep the `tripData` variable, if that is your own preferred style
  </summary>

  ```js
  // ...

  axios.post('https://trektravel.herokuapp.com/trips', {
      name: 'Dee\'s Chill Trip to Chicago',
      continent: 'North America',
      about: 'A tour around good architecture and hot dogs.',
      category: 'casual',
      weeks: 1,
      cost: 180,
    })
    .then( ... )
    .catch( ... )
  ```

</details>

### Let's Run This Code Together And Look at the Response

When we run this code together and it responds with success:

1. What kind of information does axios give us back about the response in the `response` object (made available in `then()`)?
2. What kind of data does the Trips API™™™ give us back in the `response.data` object (made available in `then()`)?

<details>

  <summary>
    Check your answers here.
  </summary>

  1. We can view the status code, headers, response data, etc.
  2. We should have been able to get back data that looks similar to this:

  ```js
  {
    id: 136,
    name: "Dee's Chill Trip to Chicago",
    continent: 'North America',
    about: 'A tour around good architecture and hot dogs.',
    category: 'casual',
    weeks: 1,
    cost: 180
  }
  ```
</details>

Let's change the code to this, and run it together. Note that the trip data has been turned into `badTripData`, which has a blank `name`, so it should not be a successful call, and get into the `catch`.

```js
const axios = require('axios');

const badTripData = {
  name: '',
  continent: 'North America',
  about: 'A tour around good architecture and hot dogs.',
  category: 'casual',
  weeks: 1,
  cost: 180,
};

axios.post('https://trektravel.herokuapp.com/trips', badTripData)
  .then((response) => {
    // 
  })
  .catch((error) => {
    console.log('ERROR:', error);
    console.log('ERROR RESPONSE:', error.response);
    console.log('error.response.data', error.response.data);
  });
```

1. What kind of information does axios give us back about the error in the `error` object (made available in `catch()`)?
2. What kind of data does the Trips API™™™ give us back in the `error.response.data` object (made available in `catch()`)?

<details>

  <summary>
    Check your answers here.
  </summary>

  1. We can view the status code, headers, response data, etc.
  2. We should have been able to get back data that looks similar to this:

  ```js
  { errors: { name: [ "can't be blank" ] } }
  ```
</details>

## Exercise: Make Your Own Trip

Using the code samples above as an example, and write a `.js` file that creates your own Trip package!

Write, iterate, and run the file, until you get your own Trip package successfully created. **Note down the ID of your newly created Trip** because we'll use it soon in this lesson.

## Exercise: Reserve a Ticket On Your Own Trip

Utilizing the [Ada Trip Reserving Service™ Trip API™™™](https://github.com/AdaGold/trip-api) and what you know about the `post()` syntax now, write a JS script that does the following:

1. Makes an object in `const tripReservationData`, with all of the correct name/value pairs that the API specifies
1. Creates a POST request to the right endpoint for specifically your own new Trip package that you created in the previous exercise, and that uses `tripReservationData`
1. If the response comes back as success, our program prints `'Trip reserved successfully.'`, and then prints the value of the response's data
1. If the response comes back as not success, our program prints `'Error occurred.'`, and then prints the value of the error response's data

<details>

  <summary>
    Once you're finished, compare your code to our sample solution
  </summary>

  ```js
  const axios = require('axios');

  const tripId = 136;

  const tripReservationData = {
    name: 'dee',
    email: 'dee@deemail.dev',
  };

  axios.post(`https://trektravel.herokuapp.com/trips/${tripId}/reservations`, tripReservationData)
    .then((response) => {
      console.log('Trip reserved successfully.')
      console.log('The response came back', response.data);
    })
    .catch((error) => {
      console.log('Error occurred.');
      console.log('The error came back', error.response.data);
    });
  ```

</details>

## Brainstorm Applications

Great work! We have some solid examples and exercises that show making HTTP requests with JavaScript. Let's brainstorm applications.

With a neighbor, brainstorm a possible user-flow for a CLI program. The CLI program should allow a user to list trip packages, see details for one trip package, and reserve a ticket for one trip package.

Then, write **pseudocode** for a JS script for that program.

Skip over the pseudocode details for getting user input, and make assumptions about the user input.

### Asynchronous Code Requires Different Patterns

When we got to writing pseudocode, we should have observed the following things:

1. In some ways, writing the API calls in JavaScript should feel straightforward
1. Before we can make an API call to reserve a ticket on a Trip, we needed to make sure we had a value for the `tripId` that the API call requires. However, because our code is asynchronous, we need to make sure we call `axios.post()` to the Trip Reserve endpoint **after** we get a response from making our Trip using the Trip Create endpoint, which gives us our Trip ID.

Our big question that follows is: **How** do we make sure our POST request to Trip Reserve happens after we get a response from Trip Create?

We have a few options:
- Make the API call to Trip Reserve in the function **inside** of `then()` chained to the Trip Create call
- Depending on our depth of knowledge in JavaScript, approach this from a different design pattern
- Depending on different tools/libraries available, approach this from a different design pattern

When we write JavaScript and we **only** want to use axios and the limited JavaScript we know, we will tend to put a lot of functionality in `then()` and `catch()` blocks, and practice our knowledge of functions, and callback functions.

When we introduce other tools, libraries, and programming paradigms, we will approach this from a different angle.

## Conclusion

As in Ruby, the difficult part of working with an API in JavaScript is not so much making the request, as figuring out what request to make, and what to do after. Though the setting is different, our work will follow a similar pattern:

1. Explore the API using the documentation, Postman, and other tools
    - How do you need to format your data
    - How does the API respond
    - What does an error response look like?
1. Write code to interact with the API
    - Hard-coded data for input
    - Logging to the console as output

## Additional Resources
- [axios documentation](https://github.com/axios/axios)
