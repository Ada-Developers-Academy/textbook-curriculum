# Intro to AJAX



## Learning Goals
- Request data from a sever to render client-side using JavaScript
- Render data from server without reloading a page




Single page applications (SPA) have gained popularity in recent years for
Learning AJAX is a stepping stone to understand how the dynamic, single page web applications we know today work.

### You have used AJAX before
Like, a lot.  

When you scroll through Facebook, Instagram or Pintrest and you see the page loading more content as you continue to endless scroll and procrastinate. That's AJAX.

When you want to upvote a post on reddit or StackOverflow. That's AJAX.

Let's procrastinate a bit and hop on Pintrest. While browsing, if I open my console in Chrome, and right-click to select 'Log XMLHTTPRequests', I can SEE AJAX HAPPENING!


So this is cool, right?! But now let's make our own magic happen!

## So How does it work?

Back in '95, Microsoft first implement AJAX into Internet Explorer. So it's been around. It originally went by the name of XMLHTTPRequest Object, or XHR.  

AJAX stands for 'Asynchronous JavaScript And XML'
  - **Asynchronous** means that you can do many things at once. With AJAX, that means you can still interact with a web page while waiting for a request/response. Your page won't freeze and with for the response to come back. Even better, you can send multiple AJAX requests at a time!
  - JavaScript is the programming language that is used to make AJAX do it thing.
  - XML was originally the format responses were preferred to be sent in. However, nowadays, JSON has taken over as the preferred response format.

![ajax](https://cms-assets.tutsplus.com/uploads%2Fusers%2F30%2Fposts%2F25099%2Fimage-1453383492163.png)

A request is made to the server. The server processes that request and sends a response back to the client. Nothing new there. However, with AJAX, we use JavaScript to only change the parts of a page that need to be, instead of reloading a whole new page.

When we make a request with AJAX, we are also not asking for the entire pages's content, like we have been doing. Instead our request is only asking for


## Let's Make an AJAX call!


Note that in order for AJAX to work, we must make requests to a running server. It can be local or online, however we cannot make requests to a file on our computer.

[ highlight callback functions ]
[ Using Vanilla JS first]

```html
<button id="load" onclick="getPet()"> Fetch! </button>
 <div class="pet">

 </div>
```



```javascript
// Setting up AJAX request (create a new one for each request)
 var request = new XMLHTTPRequest();


 // Create a callback function
 request.onreadystatechange = function () {
   if (request.readyState === 4) {
     document.getElementByID('pet').innerHTML = response.responseText;
   }
};

// Prepare the request with the HTTP METHOD (GET and POST most common) and
response.open('GET', 'localhost:3000/pets/1');

// Create a function to send the request, in response to an event (button onClick)
function getPet(){
  request.send();
};

```


A callback function is...
In AJAX a callback function is used when you send your request, the browser knows not to execute the code that is in a callback until a response from the server has arrived. This allows a user to still interact with the webpage and use other JavaScript features until that response has come back.

## Best Practices



## Vocab
- Asynchronous
- Callback Function


## Key Takeaway
Now that we are comfortable making web applications, we can focus on making them more efficient. By only loading what is needed, our client does not need to make as many requests or process as many responses. This results is much faster and more responsive applications our users can more seamlessly use... and procrastinate with.


## Additional Resources
- [AJAX for Front-End Designers](https://webdesign.tutsplus.com/series/ajax-for-front-end-designers--cms-967)
