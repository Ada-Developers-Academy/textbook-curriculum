# ❮ Intro to HTML ❯


## Learning Goals
- Understand HTML syntax & vocabulary
- Can identify what tags are most appropriate for specific content
- Can view document in a browser


## HTML is the foundation for EVERY website
HTML structures the content of a webpage. Its purpose is to organize content and **every** website uses it.

HTML stands for Hypertext Markup Language. We use HTML to describe and organize the content of a document (website) within the context of the document content itself.

HTML is not concerned about how the content *looks*. That job is left to CSS, which is a totally different language we will be learning later. HTML is concerned with the structure of *content*.

**Experiment:** Add the [Web Developer](https://chrome.google.com/webstore/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm?hl=en-US) extension to chrome to see how sites look without any CSS!

![Web Developer Chrome Extension](imgs/web_developer.png)
After you add it, click on the extension's icon (it looks like a gear). A box will popup, click on the CSS tab towards the top left. Then click 'Disable All Styles' to disable CSS on any site your heart desires 💛. Have fun!

You should be able to now observe what a site looks like with only its content. What do you notice? What does it look like? What is the typography? What are the sizes of things? Do some things go from top to bottom? Do some things fit next to each other from left to right?

Browsers apply default styles even for plain HTML with no definition for appearance. We'll do our best to ignore those default styles for this intro to HTML.

The best HTML creates a logical and readable document without any styles.

## HTML Syntax

Every piece of website content is 'wrapped' in an HTML element. Elements consist of an opening tag where the tag name is defined between the '<' and '>' symbols. The opening tag is paired with a closing tag, telling the browser when to stop the formatting for that element. The closing tag will be the same as the opening but with a forward slash. Example:

```html
<tag>Content</tag>
```
Here is a real-life example of a heading for my social media site for cats. It is wrapped with an [h1 header](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) element:
```html
<h1>Meowspace</h1>
```

### Nested Elements
Sometimes tags will be nested inside of other tags. To maintain readable code, the parent tags (the outer most ones) should each be on a new line with the nested element indented. Example:

```html
<nav>
  <h1>Meowspace</h1>
</nav>
```
Start to be mindful of the relationship between nested elements. It will become important as we progress in the week. In the example above, I wanted my site's heading to belong to, or be inside of, my nav (navigation) element.

### Self Closing Elements
Some elements are self closing. These elements do not 'wrap' around any content. For example, to display an image, use the self-closing img tag. It use the src attribute to link to the image's source.
```html
<img src="/imgs/kittens_in_a_basket.jpg">
```
### Commenting in an HTML Document
To comment within HTML, use `<!-- -->`. Example:  
```html
<!-- Your comment here -->
<h1>Meowspace</h1>
```
## Setup an HTML Document

Before we can start to organize our content into HTML elements, we must setup our HTML documents so that our code can be properly interpreted by browsers.

Create a new directory for this site. Then create a new file called `index.html`.

`index.html` is a special filename and it is convention that every website's main page is named `index.html`.


```html
<!-- index.html -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>This site should have a title!</title>
 </head>
  <body>
    <!-- Your code goes here! -->
 </body>
</html>
```
What do all these HTML tags mean?

- [DocType](http://stackoverflow.com/questions/414891/what-is-doctype)
- [HTML](http://stackoverflow.com/questions/3270615/why-we-use-html-tag-although-my-website-runs-perfect-without-html-tag)
- [`head`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/head) is a tag that holds all of the meta data of that page: things that the browser should know
  - [charset](http://stackoverflow.com/questions/2241348/what-is-unicode-utf-8-utf-16)
  - [title](https://www.w3schools.com/html/html_head.asp)
- [`body`](http://htmldog.com/references/html/tags/body/) is a container tag that will hold all of that page's content. If there is content that you expect to be shown on the page, it should be nested within the `body` tag.

## Try it
In your `index.html`, add the above code, save the file, and then open `index.html` in your browser (via clicking on it in a file system viewer like Finder or in command line running `open index.html`). Every time you make a change, you will have to refresh the open tab with index.html to view the changes.

You probably see nothing. Now, add some text about your favorite music after the opening `<body>` tag, but before the closing `</body>` tag.

## Common HTML Tags
```html
<!-- headers (h1..h6)-->
<h1></h1>
<h2></h2>
<h3></h3>

<!-- Paragraph -->
<p></p>

<!-- A Link -->
<a href="http://google.com">See if Google has an answer.</a>

<!-- Image -->
<img src="http://lorempixel.com/400/200/">

<!-- An Unordered List with List Items -->
<ul>
  <li></li>
  <li></li>
  <li></li>
</ul>

<!-- An Ordered List with List Items -->
<ol>
  <li></li>
  <li></li>
  <li></li>
</ol>

```

## Try it
Create a page that has links to 3 (imaginary) blog posts. Use lorem ipsum and placeholder photo generators to create and organize content. [(What is lorem ipsum?)](https://www.lipsum.com/)


## Validate your HTML
We can see that we can write broken HTML code and nothing will stop us from rendering it-- the browser will do its best to interpret any given HTML.

Validating web documents is an important step which can help improve and ensure their quality. Use this link to see if your HTML is following proper HTML syntax: [Markup Validation Service](https://validator.w3.org/nu/#textarea)

## Best Practices

- Use HTML to accurately describe the structure of content of a page, not presentation
<!-- - **NEVER** use [inline styles](http://stackoverflow.com/questions/2612483/whats-so-bad-about-in-line-css) -->
- Use proper indentation
- All content should be wrapped by an element

## Vocab
- Markup language
- Element
- HTML Tag
  - Opening tags, closing tags, self-closing elements
  - Nested tags

## Key Takeaway
HTML is concerned about structuring content. HTML does not have the responsibility to determine page style/appearance.

### Additional Resources
- [Learn to Code: HTML & CSS](http://learn.shayhowe.com/html-css/building-your-first-web-page/) ( Will be a good resource to reference throughout week.)
