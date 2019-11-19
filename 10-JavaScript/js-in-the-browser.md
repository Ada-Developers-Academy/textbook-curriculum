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

Another way to think about building websites is "when this event happens, then this should should happen."

### Event-Driven Programming

- When does a specific element trigger a specific event?
  - What is the element? What is the event name?
- How is the event handled? We need a function that is listening for a specific event name on a specific element.

## HTML and the DOM

Browsers do a thing: They parse HTML documents as DOM trees

https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model

https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction

**The DOM** is the interface the browser provides for dynamically changing the page's content, behavior, and appearance. We can think of it as a representation of the site's content that the browser gives us.

_DOM_ stands for Document Object Model. The document in question is our web page! The "Object Model" part is for distinguishing the DOM approach from other ways of accessing a document (which are not available in the browser). You can see the DOM for any webpage your browser has loaded by opening the developer tools and selecting the Elements tab (in Chrome).

The DOM is effectively a tree, like the ones we've learned about in CS fundamentals. In general each node in the tree matches up to an individual HTML tag such as `div` or `img`.

![dom as represented as a tree](images/dom.gif)

Nodes in the DOM have properties that match the attributes set on them in the HTML (e.g. an `img` node might have `src` and `id` properties). DOM nodes also have children, which are all of the other nodes nested within them (e.g. a `div` node might have a `table` child node).

Run `document` in the console. What do you get?

## Browser-Supported Ways to Manipulate the DOM with JS

Logging to the console is alright, but the true power of JavaScript is that it can dynamically change the contents of the webpage.

Browsers have already defined a way (an interface) to represent, access, and modify the contents of a website. This interface is called **the DOM**. When we use this interface, we can dynamically change the page using JS.

Until now our web applications have rendered _static_ HTML which defines a webpage. They have then sent it to the browser which in turn "builds the DOM" from that HTML.

When we use JavaScript to manipulate the DOM, we do not change the original HTML that was sent to the browser, instead we change the browser's internal representation of that same webpage. An important consequence of this distinction is that all of our changes disappear as soon as the browser forgets about that webpage (e.g. if we close the tab or the whole browser).

Web API: https://developer.mozilla.org/en-US/docs/Web/API
Document API: https://developer.mozilla.org/en-US/docs/Web/API/Document

### Default Events the Browser Listens for

https://developer.mozilla.org/en-US/docs/Web/Events
Mouse events

### Default Functions to Manipulate the DOM

document.getElementById()

## Conclusion


## Additional Resources
* [MDN on the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)
* [StackOverflow on where to put your `<script>` tags](http://stackoverflow.com/questions/436411/where-is-the-best-place-to-put-script-tags-in-html-markup)
*  [Slides on JS In the browser](https://docs.google.com/presentation/d/1GPTn6W0QeEyquCxBJFj-E9W-i-MgXsBytA4xtCCW6Q4/edit#slide=id.g195ed98213_0_86)
