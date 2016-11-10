# jQuery

## Learning Goals
- See how jQuery syntax is different than plain JS
- Utilize jQuery selectors to manipulate the DOM

jQuery is a JavaScript library for DOM (web page) manipulation and
cross-browser script compatibility. jQuery does most of it's magic
through a global function that it defines in the '$' variable.

## Selectors

You can use the jQuery function ($) to grab and manipulate elements of
your web page. jQuery uses CSS selectors to find the elements on the
page.

```javascript
$("body");     // returns the body element
$(".content"); // returns an array of elements with the "content" class
$("#someId");  // returns the element with id == "someId"
```


## DOM Manipulation

Here's [an example](http://codepen.io/kariabancroft/pen/JbYmMR) on CodePen.

Let's start by looking at the HTML and CSS.

Play with the example:

* Change the document structure and where the classes are applied
* Change the CSS


## jQuery Documentation

The many splendors of jQuery are explained in great detail here:

[http://api.jquery.com/](http://api.jquery.com/)

The following functions are of practical value. Look 'em up!

* .append()
* .prepend()
* .css()
* .html()
* .click()
* .submit()
