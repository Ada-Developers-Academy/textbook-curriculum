# Common HTML Elements and Best Practices

## Learning Goals
- Understand the difference between block-level and inline elements
- Be able to categorize elements as semantic or non-semantic
- Know the difference between HTML and HTML5
- Learn basic best practices
  - Overall
  - For specific elements
  - For accessibility

####A Few Word on Web Accessibility
Web accessibility is quickly garnering awareness among developers, many of whom are hadn't realized the importance, scope, or sheer number of folks who need it. What this means is that many developers don't know how to implement techniques for accessibility well or quickly. This in turn means it's easy to get set aside to do later, and then set aside for financial and time reasons.

However. Approximately 20% of Americans have a disability that could affect their ability to access many websites, and an accessible site benefits everyone.

Accessiblity encompasses, but is not limited to:
- Low sight, blind, and color blind people
- Deaf and hard of hearing people
- Users with impaired motor skills
- Users with cognitive delays

####Block Level vs. Inline elements
Block level elements mean...
Inline elements mean...
We care because...

#### HTML5 vs. HTML
They're both HTML, but HTML5 is the latest version of it. There is a working group called w3c (stands for ...) which decides on the specifications for HTML and CSS - what elements are supported or deprecated, and what new elements to introduce (hopefully to solve a problem in the previous spec).

What is noteworthy about HTML5 is that it adds a number of semantic elements like `<nav>, <aside>, <article>, <footer>, <address> (is that true?)` and a number of elements to better handle multimedia content.


### Common Elements

##### Headings

```html
<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>
<h5>Heading 5</h5>
<h6>Heading 6</h6>
```
***screen shot of how this looks in a browser w/o styles

Headings are block level elements that communicate the priority and page flow of your site. Headings should be used in order of importance (1-6) to create an accurate outline of your content.

There should only be one `<h1>` element, and it should be used for the primary heading on the page.

Don't use headings to just make the text bigger or bold. Use them to add meaning and structure to the page, as you would structure an outline of a paper.


For example:

```html
<h1>The Best Marvel Comics Characters</h1>
<h2>Jessica Jones</h2>
<h2>Black Widow</h2>
<h2>Captain America</h2>
<h2>Daredevil</h2>
```

Then:

```html (might have to screen cap something for this bc markdown is the worst)
<h1>The Best Marvel Comics Characters</h1>
<h2>Jessica Jones</h2>
  <h3>Got her powers from a chemical spill</h3>
  <h3>Doesn't wear a fancy outfit</h3>
<h2>Black Widow</h2>
  <h3>Trained as a super spy in Russia from a young age</h3>
  <h3>No super powers, but she can punch and kick real good
    <h4>In mid-air</h4>
    <h4>On moving vehicles</h4>
    <h4>Against people with knives</h4>
  <h3>No super powers
<h2>Captain America</h2>
  <h3>Super soldier created by US gov't</h3>
  <h3>Throws a big shield around</h3>
```



###Other Semantic Elements
- `<p>`: Block level paragraph element. Used for chunks of text, often following a header element.
- `<header>`: Used as an element to hold page header information (logo, navigation, heading)
- `<nav>`: Used as a container for navigational links
- `<article>`: Used to distinguish text as self-contained content on some topic. Think the body of a blog post.
- `<aside>`: Used for "side" content such as sidebars, notes, or inserts.
- `<footer>`: Identifies the content at the end of the page

```html
<div>I'm a division</div>
<section>I'm a section! Jeremy has really strong opinions about when to use me!</section>
<span>I'm a span!</span>
```






`div`, `section`, and `span` are purely for building the structure of the site, they don't have any semantic meaning. `div` and `section` are largely interchangeable and are used to divide content into related chunks. `span` tags are used to highlight/emphsize or otherwise identify or callout small, inline pieces of content.


- `<b>`: Inline level element to make text bold. I really don't like this tag.
- `<i>`: Inline element to make text italic. I don't like this tag either. Ask me why!
- `<strong>`: Inline level element to imply that text is important.
- `<em>`: Inline level element to emphasize text.


a + alt text, with some discussion on good alt text
img


hw or activity: write a html doc with 15 different kinds of elements. At least half should be ones you haven't tried before and/or ones we didn't use in class. Try out some multimedia elements, perhaps. Give a resource(s) for diff elements, as well as for deprecated tags.

live code: making a doc (doctype, head, title, meta, etc), generate code to a basic mock up, placekitten, bacon ipsum. view source.
