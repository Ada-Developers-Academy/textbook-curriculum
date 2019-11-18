# DOM Manipulation the Old Way: Live-code Notes

## Running JavaScript on Websites

Obviously we don't expect users to type out all their own JavaScript by hand. How do we get a website to connect to a JavaScript file? We'll add a link to our JavaScript file in our HTML, similar to the way we included CSS before.

When our user goes to a website using their browser, the browser will make a request for an HTML page. This HTML page contains references to our CSS and JavaScript files. Then, these files will be loaded into the browser.

1. Create a new directory called `browser-js`, with two files: `index.html` and `index.js`:

1. Add this basic HTML to `index.html`:

    ```html
    <!-- index.html -->
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <title>JavaScript Test Page</title>
      </head>
      <body>
        <h1>Test page for JavaScript in the Browser</h1>

        <div id="js-lecture-target">This is text that lives inside a div element with an id "js-lecture-target"!</div>
      </body>
    </html>
    ```

1. And finally, add this JavaScript to `index.js`:

    ```javascript
    // index.js
    console.log('This is a test');
    ```

1. Modify your HTML page `index.html` by adding this `<script>` tag at the end of `<body>`, RIGHT before the closing `</body>` tag:

    ```html
    <!-- index.html -->
    ...
    <body>
      ...

      <script src="index.js" type="text/javascript"></script>
    </body>
    ```

1. Ensure all files are saved
1. Open up the Chrome Dev Tools and switch to the Console tab
1. Reload the page (refresh the page)
1. Observe that the test text `This is a test` from the JavaScript prints out!

There are a lot of ways to load, then run JS scripts from a static webpage:
`<script>` in head
`<script>` in body

Where Should `<script>` Go?

Believe it or not, people have a lot of opinions on this topic.

<details>

  <summary>
    In this class we'll always load our scripts at the end of the body. If you'd like to learn more, click here to expand and see our thoughts.
  </summary>

The reason why JS loading is so contentious is, when the browser encounters a `<script>` tag, it stops loading the HTML document. It goes and downloads your _entire_ script, which might be quite large and hosted halfway across the internet. Only once the script has finished downloading does it continue rendering the page. That means if you put your `<script>` tags before your content, the user gets to look at an empty white screen for a while while your scripts load. Not a great user experience.

The easiest way to deal with this is to always place your scripts at the bottom of your `<body>` section. That way, the browser renders the whole page first, then goes and gets your scripts.

Out in the wild you'll see other techniques, like downloading the scripts asynchronously and not running them until the page has finished loading. This is cool, and you should definitely know that it's a thing, but it takes some work to set up.

</details>

### Side Note: About `<script>`

Just like CSS links, you can include multiple `<script>`s in your page, and they'll be loaded in order.


console.log
alert
getElementById()


We will find and practice methods for DOM manipulation that will allow us to do things like:
- add a node (element) to the DOM
- remove a node (element) from the DOM
- change attributes of a node
- enable interactions from a user, such as clicking a node (element)



#### Finding an Existing Node and Modifying It

We can find an existing node on the DOM in a sleuth of ways. We will explore one way:

1. In the Dev Tools Console, enter into the console `document.getElementById('');` What do you get?
1. In the Dev Tools Console, enter into the console `document.getElementById('js-lecture-target');` What do you get? What details do you see? What does it represent?
1. Where is an element with the id `js-lecture-target` defined?

Now let's try looking at these details and manipulating them.

1. In the Dev Tools Console, enter in the following line:
    ```javascript
    document.getElementById('js-lecture-target').innerHTML;
    ```

    What do you get back? What does it represent? Does it have the tags included?
1. In the Dev Tools Console, enter in the following line:
    ```javascript
    document.getElementById('js-lecture-target').innerHTML = 'I can change website text with JavaScript!';
    ```

    What do you get back? What do you see on the website (HTML)?
1. Refresh the page. Do you continue to see the changes that you made?

Now that we've tried it in the console, let's update our `index.js` to use this new knowledge.

Replace the contents of your `index.js` file with the following:

```javascript
// index.js
console.log('This is a test');

const target = document.getElementById('js-lecture-target');  // Find the HTML element where the ID is js-lecture-target
target.innerHTML = '<p>I give you... content!</p>'; // Put this HTML inside the div we retrieved above
```

Now that all of the files are saved, reload your HTML page. When your HTML page loads, as the browser reads through the HTML, it comes across the `<script>` tag, which loads and runs the appropriate JavaScript code in `index.js`. Therefore, when everything is all finished loading and executing, we already see that the JS has run!

## Conclusion

We have modified the DOM using JavaScript code! We should be able to extend this knowledge and imagine the possibilities of what we can do with DOM manipulation:

- If we select the correct elements, we can change how something looks dynamically
- If we select the correct elements, we can define new behaviors for our website