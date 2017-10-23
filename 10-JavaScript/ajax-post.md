# JavaScript: AJAX Post

## Learning Goals
- Use jQuery to make AJAX POST requests

Just like we used AJAX to send GET requests, we can also use it to send POST requests. Based on our knowledge of POST requests, what would you say is the main thing we would add to a POST request that we did not include in a GET request? YES! Data!

### POST request
POST requests are set up very similar to GET requests.
```javascript
let url = 'https://petdibs.herokuapp.com/pets';
let data = {
  name: 'Chestnut',
  age: 17
};
let callback = function(){
  console.log('success!');
}

$.post(url, data, callback);
```

As we saw previously, `$.get` is a shorthand version of `$.ajax` and `$.post` is also a shorthand version of `$.ajax`. (If you would like a reminder on the $.ajax syntax, visit [here](http://api.jquery.com/jquery.ajax/))

The main difference here is that along with a POST request, we want to pass some sort of data. In addition, the response should look different than with our GET request, since most likely we'll just be looking for success rather than any specific data returned.

We can also see the alternate syntax of providing all of the `$.post` parameters in one single function call:
```javascript
$.post('https://petdibs.herokuapp.com/pets',
  { name: 'Chestnut',
    age: 17 },
  function(response){
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
$('form').submit(function(e) {
  // By default, the form will attempt to do it's own local POST so we want to prevent that default behavior
  e.preventDefault();

  let url = $(this).attr("action"); // Retrieve the action from the form
  let formData = $(this).serialize();

  $.post(url, formData, function(response){
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
$.post(url, formData, function(response){
  $('#message').html('<p> Pet added! </p>');

  // What do we get in the response?
  console.log(response);
})
  .fail(function(){
    $('#message').html('<p>Adding Pet Failed</p>');
  });
```

## Key Takeaway
Once we understand the general way to use the jQuery AJAX functionality, we can apply it to any request/response we'd like to handle. We should be beginning to see how to expand upon the SPA concept that we discussed previously using only GETS. In addition, we should see how we can take all of our knowledge of HTTP Requests/Responses that we learned in Rails a step further using this jQuery functionality.

## Additional Resources
- [jQuery AJAX POST Documentation](https://api.jquery.com/jquery.post/)
- [jQuery AJAX Documentation](http://api.jquery.com/jquery.ajax/)
