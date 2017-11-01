# Intro to AJAX

## Learning Goals
- Request data from a sever to render client-side using JavaScript
- Render data from server without reloading a page
- Use jQuery to make AJAX requests
- Can use GET method with AJAX


Single page applications (SPA) have gained popularity in recent years for many reasons, one being that they require less *things* to load at once.

Learning AJAX is a stepping stone to understand how the dynamic, single page web applications we know today work.

### You have used AJAX before
Like, a lot.  

When you scroll through Facebook, Instagram or Pinterest and you see the page loading more content as you continue to endless scroll and procrastinate. That's AJAX.

When you want to upvote a post on reddit or StackOverflow. That's AJAX.

Let's procrastinate a bit and hop on Pinterest. While browsing, if we open our consoles in Chrome, and right-click to select 'Log XMLHTTPRequests', we can SEE AJAX HAPPENING!


So this is cool, right?! But now let's make our own magic happen!

## So How does it work?

Back in '95, Microsoft first implement AJAX into Internet Explorer. So it's been around. It originally went by the name of XMLHTTPRequest Object, or XHR.  

**AJAX** stands for **'Asynchronous JavaScript And XML'**
  - **Asynchronous** means that you can do many things at once. With AJAX, that means you can still interact with a web page while waiting for a request/response. Your page won't freeze and with for the response to come back. Even better, you can send multiple AJAX requests at a time!
  - JavaScript is the programming language that is used to make AJAX do it's thing.
  - XML was originally the format responses were preferred to be sent in. However, nowadays, JSON has taken over as the preferred response format.

![ajax](https://cms-assets.tutsplus.com/uploads%2Fusers%2F30%2Fposts%2F25099%2Fimage-1453383492163.png)

A request is made to the server. The server processes that request and sends a response back to the client. Nothing new there. However, with AJAX, we use **JavaScript** to change the parts of a page that need to be changed, instead of reloading a whole new page.

When we make a request with AJAX, we are not asking for the entire pages's content. Instead our request is only asking for the relevant parts which we want to update.


## Let's Make an AJAX call!

Note that in order for AJAX to work, we must make requests to a running server. It can be local or online, however we cannot make requests to a file on our computer.


This is how to do it using vanilla JavaScript:

```html
<button id="load"> Fetch! </button>
<div id="pets"></div>
```

```javascript
// Setting up AJAX request (create a new one for each request)

let request = new XMLHttpRequest();

// Create a callback function, with event handler
request.onreadystatechange =  () => {
if (request.readyState === 4) {
  if (request.status === 200) {
    let pets = JSON.parse(request.responseText);
    let petsHTML = '';
    for (let i = 0; i < pets.length; i += 1){
      petsHTML += '<h3>' + pets[i].name + '</h3>'
    }
    document.getElementById('pets').innerHTML = petsHTML;
  } else if (request.status == 404) {
      // display message for user if file not found
  } else if (request.status == 500) {
      // display message for user if Server had a problem
  }
}
};
// Prepare the request with the HTTP METHOD (GET and POST most common) and
request.open('GET', 'https://petdibs.herokuapp.com/pets');

// Create a function to send the request, in response to an event (button onClick)
function getPets(){
request.send();
};

let loadItem = document.getElementById("load");
loadItem.onclick = getPets();
```
Let's have a look at all of the moving parts.


The Callback Function:
In AJAX a callback function is used when you send your request, the browser knows not to execute the code that is in a callback until a response from the server has arrived. This allows a user to still interact with the webpage and use other JavaScript features until that response has come back.

Writing this in plain JS is rather tedious.

## AJAX with jQuery

When it comes to AJAX, jQuery _really_ likes to make our lives easier.

### `get`
```javascript
// Which URL do we want to 'get'?
let url = 'https://petdibs.herokuapp.com/pets';

// What do we want to happen when we get our response?
let successCallback =  response => {
  console.log('success!');
};


$.get(url, successCallback);
```

Oftentimes, you'll see the above collapsed into one function call:
```javascript
$.get('https://petdibs.herokuapp.com/pets',
  response => {
    console.log('success!');
  });
```

### Other Tools
A similar way we can do the same thing (in this context) is by using the `$.getJSON` functionality. See more about that [here](http://api.jquery.com/jquery.getjson/).

In addition, `$.get` is just a simplification of the overall `$.ajax` that jQuery provides for all HTTP verbs. See more about that [here](http://api.jquery.com/jquery.ajax/).

### Callback functions
As we have learned as experienced programmers, things don't always go according to plan. jQuery has provided us with  some callbacks on our AJAX calls to ensure we have appropriate places to handle these situations.

- `.success`  
  This is the function that we are implicitly including in the example above. If we do not specify any other function explicitly, success is the one that is provided. Will be called upon receiving 200 - Success code.

- `.done`  
  When provided along with `.success` this acts as a _second_ success function.

- `.fail`  
  Allows you to handle unexpected or expected errors.

- `.always`  
  Will always execute, whether success or failure has occurred.

jQuery handles the response and the callback function(s) will run when the request is complete and one of the corresponding success or error scenarios have occurred.

#### Let's add callbacks to our `get` example above
The syntax gets a bit weird, so let's see how it looks. We add the callbacks as _chained functions_ after the initial `$.get` function.
```javascript
$.get('https://petdibs.herokuapp.com/pets',
  response => {
    console.log('success!');
    console.log(response);
  })
    .fail(function(){
      console.log('failure');
    })
    .always(function(){
      console.log('always even if we have success or failure');
    }); // Note that this is where the semi-colon ends up
```

### Exercise: Let's Finish This Off
Let's complete our Pet's SPA!

With the person sitting near you:  
- Update your `success` function to iterate through the response and create new DOM elements to display each pet's name, breed and age.

- Update your `fail` function to create a new DOM element that shows the user that an error has occurred.

- Leave the `always` function as-is since we don't have a good context for updating this right now

- Add the **"show"** action for each individual pet. Each "show" action should send a new AJAX request.


## Best Practices
- Keep your JavaScript organized and easy to read. If one block is doing too much, split into functions.
- Code should be within `$(document).ready(function() { };`


## Vocab
- Asynchronous
- Callback Function
- Single Page Application

## Key Takeaway
Now that we are comfortable making web applications, we can focus on making them more efficient. By only loading what is needed, our client does not need to make as many requests or process as many responses. This results is much faster and more responsive applications our users can more seamlessly use... and procrastinate with.


## Additional Resources
- [AJAX for Front-End Designers](https://webdesign.tutsplus.com/series/ajax-for-front-end-designers--cms-967)
- [MDN AJAX Guide](https://developer.mozilla.org/en-US/docs/AJAX/Getting_Started)
- [jQuery AJAX GET Documentation]()
- [jQuery AJAX Documentation](http://api.jquery.com/jquery.ajax/)
