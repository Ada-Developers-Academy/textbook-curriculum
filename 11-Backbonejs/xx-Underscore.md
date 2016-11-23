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

There are three steps to Underscore templating:
- Define the template in your HTML file
- Compile the template once in your JavaScript
- Invoke the compiled template to generate HTML

### Defining a Template
Template definitions live in your HTML. They're wrapped in a `<script>` tag that looks something like this:

```html
<script id="my-template" type="text/template">
</script>
```

The `<script>` tag has two attributes. First is `id` - this is what we'll use to find the template later. Second is `type`, which is set to `text/template`. Turns out `text/template` is just a made up thing - the browser doesn't know what to do with it, so it just ignores it. This suits us perfectly, since we don't want the template to render until we're ready.

## What We've Accomplished

## Additional Resources
- [Underscore documentation](http://underscorejs.org/)
- [SitePoint Underscore tutorial](https://www.sitepoint.com/getting-started-with-underscore-js/)
