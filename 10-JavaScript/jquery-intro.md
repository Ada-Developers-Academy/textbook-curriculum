# jQuery

## Motivation
- Manipulating the DOM by hand is clunky and gross
- Every browser implements the DOM in a slightly different way
- Wouldn't it be swell if there was a library that fixed all that for us?

## Learning Goals
- Set up your web page to include jQuery
- See how jQuery syntax is different than plain JS
- Utilize jQuery selectors to manipulate the DOM

## What Is jQuery?
jQuery is a JavaScript library for DOM (web page) manipulation and cross-browser script compatibility. jQuery does most of it's magic through a global function that it defines in the '$' variable.

### Selectors

You can use the jQuery function ($) to grab and manipulate elements of your web page. jQuery uses CSS selectors to find the elements on the page.

```javascript
$("body");     // returns the body element
$(".content"); // returns an array of elements with the "content" class
$("#someId");  // returns the element with id == "someId"
```

### DOM Manipulation

Here's [an example](http://codepen.io/kariabancroft/pen/JbYmMR) on CodePen.

Let's start by looking at the HTML and CSS.

Play with the example:

* Change the document structure and where the classes are applied
* Change the CSS

#### What Is This Example Doing?
Let's walk through the JavaScript together. We see some sort of jQuery thing on the very first line:

```javascript
$(document).ready(function() { ... })
```

This line waits for the HTML document to be completely loaded by the browser, then runs the function. This is important because if you start manipulating the DOM before it's finished loading, all sorts of crazy things might happen. You can do setup work outside of `$(document).ready`, but anything that touches the DOM needs to be in (or called by) that callback.

Next we've got a regular old JavaScript for loop. You already know all about those.

Inside the for loop, we have two lines that both work with jQuery. The first,

```javascript
let listItem = $('<li>' + i + '</li>');
```

creates a jQuery representation of an HTML element, in this case a list item. At this point the element hasn't been added to our document yet - it only exists in our JavaScript variable.

The second line,

```javascript
$('.dynamic-list').append(listItem);
```

finds all elements with the class `dynamic-list`, and adds our new jQuery list element to their contained HTML.

Note that in this example, there is only one element with the `dynamic-list` class. What happens when we add another?

### jQuery Documentation

The many splendors of jQuery are explained in great detail here:

[http://api.jquery.com/](http://api.jquery.com/)

The following functions are of practical value. Look 'em up!

* .append()
* .prepend()
* .css()
* .html()
* .click()
* .submit()

## Getting jQuery Into Your Web Page
In the CodePen example above, we used the `$` and things just worked. This is because jQuery is so ubiquitous, CodePen just includes it for us without us even asking.

Getting jQuery to work in a web page you've published is a little more work, but not that much.

### Adding a JavaScript Library
The fist step is to add an extra `<script>` tag to our HTML document. Make sure you put it ahead of the `<script>` tag for your custom JavaScript - this ensures that jQuery will be loaded first, and our script will be able to use it.

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

    <div id="js-lecture-target"></div>

    <script src="jquery or something?" type="text/javascript"></script>
    <script src="index.js" type="text/javascript"></script>
  </body>
</html>
```

The second step is to figure out the source of our script (`"jquery or something?"` in the above code). You've got two options:
* [Download `jQuery.js`](http://jquery.com/download/), put it in your project folder, and link it directly like any other script
* Use the version of the library hosted on a CDN

#### CDNs

A _CDN_, or Content Delivery Network, is an external server that hosts common libraries. Using a CDN has two advantages:
* If a browser has already downloaded that library from that CDN for another, they can just reuse the library rather than downloading it again
* When the browser does download it, they're downloading from the CDN, not from you! This means they're not using up your bandwidth (and bandwidth is $$$$)

On the other hand, hosting the file yourself gives you more control, and makes you less dependent on an outside source.

In this class, we'll be CDNs for jQuery (and other libraries we encounter later).

Usually the owner of a library will give instructions for how to include it via CDN. From the [jquery website](https://code.jquery.com/), the `<script>` tag to include jquery should look something like this:

```html
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
```

Pro tip: Foundation can also be sourced from a CDN.

## Exercise: Rendering Data with jQuery
This exercise should be completed on your own computer, with Atom and Chrome. CodePen is great, but we want to practice including jQuery.

Your task is to take following data, and dynamically render it in a table:

```javascript
let pets = [
  { name: 'kylo', species: 'dog', human: 'kari', mammal: true },
  { name: 'gecky', species: 'lizard', human: 'dan', mammal: false },
  { name: 'hedwig', species: 'owl', human: 'harry', mammal: false },
  { name: 'crookshanks', species: 'cat', human: 'hermione', mammal: true },
  { name: 'scabbers', species: 'rat', human: 'ron', mammal: true }
]
```

Once you've got that going, add some CSS. Format your table so that rows for mammals are colored blue, and rows for non-mammals are colored orange. You might need to [read the docs](https://api.jquery.com/) a bit - maybe something about adding a class to an element?

Then, figure out how to link against Foundation via CDN! (and then figure out how to fix your table formatting)

## What Have We Accomplished?
- Experiment with the basics of jQuery
- Figure out how to include the jQuery library on our site

## Additional Resources
- [jQuery API](http://api.jquery.com/)
- [What is $(document).ready](https://learn.jquery.com/using-jquery-core/document-ready/)
