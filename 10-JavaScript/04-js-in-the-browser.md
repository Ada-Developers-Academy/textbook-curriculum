# JavaScript in the Browser

## Motivation
* So far, we've only run JavaScript in the terminal
* JavaScript is the language of the web
  * It's chief advantage is that it's the one language every browser understands
* Let's get JavaScript running in the browser!

## Learning Goals
* Get JavaScript running in the browser
* Define the _DOM_
* Understand the basics of _DOM manipulation_

## Running JavaScript In the Browser
### Via the Developer Console
In your browser, open a new empty tab, and pull up your developer tools. Click on the `Console` tab. This is where calls to `console.log()` will end up. It's also where you'll see any errors that occur.

Notice also that there is something that looks like a command prompt. Let's see what it does.

```javascript
console.log('live, from the browser!');
```

Nice, there it is. OK, let's do something a little more interesting - a popup box.

```javascript
alert('four score and seven years ago...');
```

Pops right up! Can't do that in the terminal!

What happens if we make a mistake? Let's reference an undefined variable.

```javascript
console.log(doesNotExist);
```

OK, so that's what an error looks like. If you double click on the message or click on the `(...)`, it'll show you more details.

The Chrome console is kind of like the rails console. It gives you access to all the variables you've defined in your scripts, allowing you to write JavaScript live and see the effects immediately. Use it well.

### In a Real Web Site
Obviously we don't expect users to type out all their own JavaScript by hand. Instead, we'll add a link to our JavaScript file in our HTML, similar to the way we included CSS before.

Create a new directory called `browser-js`, with two files: `index.html` and `index.js`:
```bash
$ mkdir browser-js
$ touch index.html
$ touch index.js
$ cd browser-js
$ ls
    index.html
    index.js
```

Add some basic HTML to `index.html`:

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

    <div id="jsLectureTarget"></div>
  </body>
</html>
```

And finally, add some JavaScript to `index.js`:

```javascript
// index.js
console.log("This is a test");
```

#### Linking Them Together
To run your JavaScript file from your webpage, add a `<script>` tag at the end of `<body>`, before the closing `</body>` tag:

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

    <div id="jsLectureTarget"></div>

    <script src="index.js" type="text/javascript"></script>
  </body>
</html>
```

Just like CSS links, you can include multiple `<script>`s in your page, and they'll be loaded in order.

Reload your page, open up Chrome's developer tools, and click on the `Console` tab. You should see your test message there.

#### Side Note: Where Should `<script>` Go?
Believe it or not, people have lots of opinions on this topic.

The reason it's so contentious is, when the browser encounters a `<script>` tag, it stops loading the HTML document. It goes and downloads your _entire_ script, which might be quite large and hosted halfway across the internet. Only once the script has finished downloading does it continue rendering the page. That means if you put your `<script>` tags before your content, the user gets to look at an empty white screen for a while while your scripts load. Not a great user experience.

The easiest way to deal with this is to always place your scripts at the bottom of your `<body>` section. That way, the browser renders the whole page first, then goes and gets your scripts.

Out in the wild you'll see other techniques, like downloading the scripts asynchronously and not running them until the page has finished loading. This is cool, and you should definitely know that it's a thing, but it takes some work to set up.

To keep things simple, **in this class we'll always load our scripts at the end of the body.**

## Manipulating the DOM
Logging to the console is alright, but the true power of JavaScript is that it can dynamically change the contents of the webpage. The interface JavaScript provides for changing the way the page looks is called the _DOM_.

### What Is the DOM?
_DOM_ stands for Document Object Model. The document in question is our web page!

In JavaScript, the DOM is exposed through a set of objects and methods that provide access to the HTML structure of the webpage. These act sort of like the Ruby gems we've seen in the past, an extension rather than a core part of the language. The only difference is, when running JS in the browser, you get access to these DOM functions automatically - no `require`s necessary.

Before we go on, it's worth noting that the raw interface JavaScript provides for the DOM isn't great. It's clunky, and lots of pieces are slightly different in different browsers. In the next lecture, we'll talk about what to do about that.

### Changing the DOM From Our Script
The DOM is accessed through an object called `document`. Let's update our `index.js` to use it:

```javascript
// index.js
console.log("This is a test");

var target = document.getElementById('jsLectureTarget');
target.innerHTML = '<p>I give you... content!</p>';
```

And that's it. That is the only instance of direct DOM manipulation we'll ever do in this class. Now that you know that it _can_ be done, we'll skip right to a neat library called `jQuery` that smooths out many of the issues outlined above. But that is a subject for another lecture.

## What did we Accomplish?
* Run some JavaScript in the browser
* Use the DOM to change the content of our web page
* Understand that we'll never use the DOM directly again

## Additional Resources
* [MDN on the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)
* [StackOverflow on where to put your `<script>` tags](http://stackoverflow.com/questions/436411/where-is-the-best-place-to-put-script-tags-in-html-markup)
