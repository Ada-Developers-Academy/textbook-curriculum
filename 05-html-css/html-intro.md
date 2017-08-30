# ❮ Intro to HTML ❯


## 📚 Learning Goals 📚
- Understand HTML syntax & vocabulary
- Can identify what tags are most appropriate for specific content
- Can view document in a browser
- Can link to other HTML files



## HTML is the foundation for EVERY website
HTML structures the content of a webpage. Its purpose is to organize content and **Every** website uses it! So it is worth getting to know very well!

HTML stands for Hypertext Markup Language. It is a markup language, meaning that it only is concerned about giving content structure. As opposed to a programming language that handles logic and functionality.

**Note:** HTML is not concerned about how the content *looks*. That job is left to CSS, which is a totally different language we will be learning later.

**Fun Tip** Add the [Web Developer](https://chrome.google.com/webstore/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm?hl=en-US) extension to chrome to see how sites look without any CSS!

![Web Developer Chrome Extension](imgs/web_developer.png)
After you add it, click on the extension's icon (it looks like a gear). A box will popup, click on the CSS tab towards the top left. Then click 'Disable All Styles' to disable CSS on any site your heart desires 💛. Have fun!


## HTML Syntax

Every part of a website's content is 'wrapped' by its own HTML element. Elements consist of an opening tag where the tag name is defined between the '<' and '>' symbols. The opening tag needs to be paired with a closing tag so the browser knows when to stop the formatting for that element. The closing tag will be the same as the opening but with a forward slash. Example:

```html
<tag>Content</tag>
```
Here is a real-life example of a heading for my social media site for cats. It is wrapped with an h1 header element:
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
Start to be mindful of the relationship between nested elements. It will become important as we progress in the week. In the example above, I wanted my site's heading to belong, or be part of, my nav (navigation) element.

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

Create a new directory for this site. Then create a new file called 'index.html'.


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
- [Head](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/head)
  - [charset](http://stackoverflow.com/questions/2241348/what-is-unicode-utf-8-utf-16)
  - [title]()
- [Body](http://htmldog.com/references/html/tags/body/)


## Common HTML Tags
```html
<!-- headers (h1..h6)-->
<h1></h1>
<h2></h2>
<h3></h3>

<!-- Paragraph -->
<p></p>

<!-- A Link  (and my favorite bit of advice.)-->
<a href="http://google.com">Google It.</a>

<!-- Image -->
<img src="http://www.fillmurray.com/1000/500">

<!-- An Unordered List with List Items -->
<ul>
  <li></li>
  <li></li>
  <li></li>
</ul>
```

## Organize the Content
Use lorem ipsum and placeholder photo generators to create and organize content for a page that has 3 blog posts.


## Validate your HTML
Validating Web documents is an important step which can help improve and ensure their quality. Use this link to see if your HTML is following proper HTML syntax: [Markup Validation Service](https://validator.w3.org/nu/#textarea)

## Best Practices

- **NEVER** use [inline styles](http://stackoverflow.com/questions/2612483/whats-so-bad-about-in-line-css).
- Use proper indentation
- All content should be wrapped by an element
- Use caution with [W3Schools](http://www.w3schools.com/) documentation.
  - [MDN](https://developer.mozilla.org/en-US/) is notably more reliable.

## Vocab ✅
- Markup language
- Element


## 🔑 Key Takeaway
HTML is only concerned about how content is structured. Nothing should be changing the appearance.

### Additional Resources
- [Learn to Code: HTML & CSS](http://learn.shayhowe.com/html-css/building-your-first-web-page/) ( Will be a good resource to reference throughout week.)
