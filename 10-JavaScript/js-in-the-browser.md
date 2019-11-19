# JavaScript in the Browser

## Learning Goals

- Practice evaluating JavaScript in the Chrome Dev Tools console
- Navigate between different tabs within the Chrome Dev Tools
- Know that browsers turn HTML documents into DOM trees
- Know the definition of the event-driven programming paradigm
- Know some default events that the browser triggers
- Know some ways to do basic manipulation of the DOM in JavaScript

## Browsers Can Run JS

By the late 80s, software engineering was already a huge industry full of research, money, and interest. However, most of the money in consumer/enterprise software was in dedicated applications/programs.

However, the early 90s brought the beginning of the web. What happens when you combine all of the following factors?

- A set of emerging browser technologies around the web that caused major interest and competition between large companies
- A lack of standards, process of standardization, or regulation around web technologies

Events in the 90s led to the major browser, Netscape, and thus its competitors to adopt support for JavaScript. Meaning, **since early in the history of web, browsers became environments that could read and execute JavaScript code.**

The development and evolution of browsers, browser features, and JavaScript's language and utilities have been intertwined. Browsers, by necessity, support and run JavaScript, and evolve to do so in nicer and more efficient ways.

This should feel special to us because browsers do not run other languages like this "out of the box" (without special tools, libraries, or circumstances). Our Rails web apps never asked _the browser_ to run any Ruby code; it was always our servers (or our machines/computers that acted as web servers) that needed to execute Ruby. Our servers simply **gave responses with website/HTML data,** which our browsers are very good at doing.

JavaScript is now:
- **The** programming language for modern web
- Standardized and open
- An evolved language with many more features

### Exploring Chrome Dev Tools

Let's prove to ourselves that JavaScript can run in the browser by executing JavaScript in the browser. We can do this with Chrome Dev Tools's console (it only runs JavaScript code).

Go to **any** webpage, such as Github.com. Note that we are not asking "how do we install Javascript?"

Open Chrome Dev Tools. Note the following tabs on the top (as of 2019):

| Tab Name | Description |
| --- | --- |
| Elements | details on the rendered HTML elements
| Console | The JavaScript console that the current page has access to
| Sources | details on static resources (HTML, CSS, and JS) loaded by the current page
| Network | details on HTTP requests and responses that occur, in real-time
| Performance | recording and testing the performance of rendering
| Memory | details on memory usage and allocation, and tracking memory leaks
| Application | details on things like local storage, cookies, cache, etc.

... and more!

Navigate to the console, either through the tab, or through other means (such as the Elements tab).

Within it, play around with it as a REPL and execute JavaScript in it:

- `2 + 3`
- `const fruit = 'apples'`
- `let color = 'red'`
- <code>\`${color} ${fruit}`</code>
- `color = 'pink'`
- `fruit = 'dragonfruit'`
- `const helloWorld = () => 'foo'`
- `helloWorld()`

Now try to execute Ruby in it:

- `[1, 2, 3].sample`
- `def hello_world`

And we should see that Ruby can't run in the browser.

## Browsers Listen for User Events

The browsers provide a standard library of functions that enable JavaScript developers to manipulate websites. This standard library is called [the Web API](https://developer.mozilla.org/en-US/docs/Web/Reference/API).

As part of the Web API, browsers allow JavaScript to interact with **events** that happen on websites.

### What does that mean?

Events are named actions that can be triggered/fired/sent, and also listened to/handled/received.

Imagine a person sitting on a couch, at a laptop, and browsing Github.com using their fvaorite Internet browser.

Whenever **anything** happens in the browser, the browser can recognize it, and react to it.

For example:

| When a user... | Then... |
| --- | ---
| clicks on a button | the user goes to the home page
| submits a form | the user completes a purchase
| types the letter `V` | the character `V` should display, and the blinking text cursor should move
| hovers the cursor over an image | the alt text should display

### Event-Driven Programming

We can also write JavaScript to say, "whenever a certain event is fired, we should execute this JavaScript code."

What if our code could say, "when a user clicks on this button, then the website's theme changes"? Or "when the user submits this form, it sends it to Facebook, Twitter, and GitHub by making API calls?" Or "when the user scrolls, load more articles"?

In JavaScript:

1. Events have names, like `click` or `scroll`
1. Events always happen on an HTML element. For example, a `click` event happens on a `<button>`... or a `<section>`... or a `<body>`, but every event happens on at least one element.
1. Events need a way to be fired/triggered/activated at the time of the event
1. Events need a way to be listened to

With those facts in mind, when we do Event-Driven Programming, we keep these questions in mind:

- When does a specific element trigger a specific event?
  - What is the element? What is the event name?
- How is the event handled? We need a function that is listening for a specific event name on a specific element.

## HTML and the DOM

Something else that the Web API provides for us is [the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction). It as a representation of the site's content that the browser gives us.

_DOM_ stands for Document Object Model. The document in question is our web page! The "Object Model" part is for distinguishing the DOM approach from other ways of accessing a document (which are not available in the browser).

The DOM is effectively a tree, like the ones we've learned about in CS fundamentals. In general each node in the tree matches up to an individual HTML tag such as `div` or `img`.

![dom as represented as a tree](images/dom.gif)

Nodes in the DOM have properties that match the attributes set on them in the HTML (e.g. an `img` node might have `src` and `id` properties). DOM nodes also have children, which are all of the other nodes nested within them (e.g. a `div` node might have a `table` child node).

We will use the DOM and our JavaScript skills to dynamically changing the page's content, behavior, and appearance.

### Browsers give us `document`

Open Google Chrome Dev Tools, and switch to the console. In the console, run the simple statement `document`. What do you get?

The browser provides the global variable `document`. This variable represents the DOM.

## Browser-Supported Ways to Manipulate the DOM with JS

We will use Event-Driven programming, the DOM, and our JavaScript skills to dynamically changing the page's content, behavior, and appearance.

The following sections are abbreviated references.

### Default Events the Browser Listens for

[From MDN](https://developer.mozilla.org/en-US/docs/Web/Events)

| Event Name | Fired When
| --- | ---
| `keydown` | any key is pressed
| `keyup` | any key is released
| `click` |	A pointing device button (ANY button; soon to be primary button only) has been pressed and released on an element
| `dblclick` | 	A pointing device button is clicked twice on an element
| `mousemove` | 	A pointing device is moved over an element. (Fired continously as the mouse moves.)
| `mouseenter` | 	A pointing device is moved onto the element that has the listener attached
| `mouseleave` | 	A pointing device is moved off the element that has the listener attached
| `focus` | An element has received focus (does not bubble)
| `offline` | The browser has lost access to the network
| `online` | The browser has gained access to the network

### Default Functions to Manipulate the DOM

#### `document`

These are all methods that operate off of `document`. The browser provides the global variable `document`. This variable represents the DOM. Therefore, sample syntax would be,

```js
document.getElementById('content');
```

| Method | Description
| --- | ---
| `getElementById()` | Returns the element that has the ID attribute with the specified value
| `getElementsByClassName()` | Returns a NodeList containing all elements with the specified class name
| `getElementsByTagName()` | Returns a NodeList containing all elements with the specified tag name
| `hasFocus()` |Returns a Boolean value indicating whether the document has focus
| `createElement()` | Creates an Element node
| `addEventListener()` | Attaches an event handler to the document

#### Elements

These are all methods that operate off of single [Elements](https://www.w3schools.com/jsref/dom_obj_all.asp). (Many of the methods that `document` has are available for Elements, too.)

| Method | Description
| --- | ---
| `textContent` | Sets or returns the textual content of a node and its descendants
| `appendChild()` | Adds a new child node, to an element, as the last child node
| `className` | Sets or returns the value of the class attribute of an element
| `classList` | An element's list of classes as a space-delimited string via `element.className`. Read-only.
| `hasAttribute()` | Returns true if an element has the specified attribute, otherwise false
| `setAttribute()` | Sets or changes the specified attribute, to the specified value

## Conclusion

Single page applications (SPAs) have gained popularity in recent years for many reasons, one being that they can load data _dynamically_, rather than having to do it all up front.

SPAs are built utilizing Event-Driven programming, the DOM, and JavaScript to dynamically changing the page's content, behavior, and appearance.

## Additional Resources
* [MDN on the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)
<!-- *  [Slides on JS In the browser](https://docs.google.com/presentation/d/1GPTn6W0QeEyquCxBJFj-E9W-i-MgXsBytA4xtCCW6Q4/edit#slide=id.g195ed98213_0_86) -->
