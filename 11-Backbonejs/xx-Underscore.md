# Underscore for HTML Generation

## Motivation
- One of the best things about Rails was using ERB to generate HTML.
- Underscore provides similar functionality for JavaScript.
- Backbone relies on Underscore, and the two libraries are often mixed together. Learning Underscore first will help us understand which is which.

## Learning Goals
- Use Underscore templates to generate HTML in JavaScript
- Compare and contrast Underscore templating and ERB

## Underscore
Underscore is a nifty utility library that provides a lot of functionality missing from core JavaScript. It has a lot of features, but today we'll be focusing on only one: templating.

Think back to Rails, and ERB. ERB gave us a straightforward way to generate complex HTML structures, by embedding Ruby code right in the document. This helped keep our view code DRY, and kept us from generating tons of HTML by hand in our controllers. Underscore gives us similar functionality in JavaScript.

Similar to jQuery's `$`, all Underscore functions are accessed through the global `_` object.

There are three steps to Underscore templating:
- Define the template in your HTML file
- Compile the template once in your JavaScript
- Invoke the compiled template to generate HTML

### Running Example
The data we'll be working with is a TODO list. Here is some sample data:

```javascript
var todoData = [
  {
    title: 'Mow the lawn',
    description: 'Must be finished before BBQ on Sat afternoon',
    assignedTo: ['Kari', 'Charles']
  }, {
    title: 'Go to the Bank',
    description: 'Need to make a transfer'
    assignedTo: ['Dan', 'Jamie', 'Chris']
  }
]
```

Our goal is to have an easy way to generate the HTML for one of these tasks, something like:

```html
<section>
  <p>
    <strong>Title:</strong>
    Mow the lawn
  </p>
  <p>
    <strong>Description:</strong>
    Must be finished before BBQ on Sat afternoon
  </p>
  <p>
    <strong>Assigned To:</strong>
    Kari Charles
  </p>
</section>
```

### Defining a Template
Template definitions live in your HTML. They're wrapped in a `<script>` tag that looks something like this:

```html
<script id="my-template" type="text/template">
</script>
```

The `<script>` tag has two attributes. First is `id` - this is what we'll use to find the template later. Second is `type`, which is set to `text/template`. Turns out `text/template` is just a made up type. the browser doesn't know what to do with it, so it just ignores it. This suits us perfectly, since we don't want the template to render until we're ready.

Right now our template is empty, so our next step is to add some contents. Underscore's syntax is inspired by ERB, so this ought to look familiar.

```html
<script id="my-template" type="text/template">
  <section>
    <p>
      <strong>Title:</strong>
      <%- data.title %>
    </p>
    <p>
      <strong>Description:</strong>
      <%- data.description %>
    </p>
    <p>
      <strong>Assigned To:</strong>
      <% for (var i = 0; i < data.assignedTo.length; i++) { %>
        <%- data.assignedTo[i] %>
      <% } %>
    </p>
  </section>
</script>
```

Like ERB, freestanding HTML and text will be copied verbatim. Several different special tags can be used to wrap JavaScript:
- `<%= %>` Execute whatever JavaScript is inside the tags, turn the result into a string, and insert it into the HTML
- `<% %>`  Executes JavaScript without adding anything to the HTML
- `<%- %>` Acts like `<%=`, except the string is HTML-escaped before being inserted

What's the difference between `<%=` and `<%-`? Consider the following template:

```javascript
<%= "<em>italic?</em>" %>
<%- "<em>italic?</em>" %>
```

For the first line, the string will be inserted into the document as-is, so that the browser will render it as "_italic?_".

For the second line, the string is HTML-escaped before being added, which means things like angle brackets will print out. The browser would render it as `<em>italic?</em>`.

**Question:** Which should you make a habit of using, and why?



## What We've Accomplished

## Additional Resources
- [Underscore documentation](http://underscorejs.org/)
- [SitePoint Underscore tutorial](https://www.sitepoint.com/getting-started-with-underscore-js/)
