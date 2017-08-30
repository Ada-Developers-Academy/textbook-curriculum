# Semantics, Best Practices, and Common HTML Elements

## Learning Goals
- Understand the importance of semantic markup
  - Be able to categorize elements as semantic or non-semantic
  - Know the difference between HTML and HTML5
- Gain basic awareness about web accessibility
- Understand the difference between block-level and inline elements
- Learn basic best practices
  - Overall
  - For specific elements


### A Few Words on Web Accessibility
Web accessibility is quickly garnering awareness among developers, many of whom are hadn't realized the importance, scope, or sheer number of folks who need it. What this means is that many developers don't know how to implement techniques for accessibility well or quickly. This in turn means it's easy to get set aside to do later, and then set aside for financial and time reasons.

However. Approximately 20% of Americans have a disability that could affect their ability to access many websites, and an accessible site benefits everyone.

Accessibility encompasses, but is not limited to:
- Low sight, blind, and color blind people
- Deaf and hard of hearing people
- Users with impaired motor skills
- Users with cognitive delays

### Semantics

Semantics in HTML is the practice of using valid HTML to give meaning to the webpage.
Semantic code describes what type of content is on the page. For example:

```html
<h1>The Best Names for Cats</h1>

<ol>
  <li>Pickles</li>
  <li>Raquel Welch's Grape Jam</li>
  <li>Biscuitina Turner</li>
  <li>Grand Lord Snugglewumps</li>
  <li>Thunderpaw the Destroyer</li>
  <li>Impurrator Curiosa (shamelessly stolen from twitter)</li>
  <li>Kitty Purry</li>
</ol>
```

The `<h1>` describes that the text "The Best Names for Cats" is a heading for this page. This designates it as the most important overall piece of information on the page.

The `<ol>` and `<li>` tags create an _ordered list_. The tags define both the structure and relationship of the content. From the markup alone, we understand that _Grand Lord Snugglewumps_ is a better name for a cat than _Kitty Purry_. More importantly, that distinction can be communicated to all users--sighted, visually impaired, or robotic.

Semantics are like going to Ikea.

#### Question: Why should we care about semantic markup?
- *Accessibility*. Many low sight or blind users rely on a screen reader to read pages to them. These programs cannot interpret pages very well unless they are clearly organized and communicated. Semantic code is critical to accessibility.
- *Search Engine Optimization*. Search engines need to understand what your content is about in order to rank you properly on search engines. Semantic code improves your placement on search engines, as it is easier for the "search engine spiders" to understand.
- *Readability*. Your code will be easier to read by others and future you if you very explicit about the structure and intent of your content.

#### Nesting as Semantics

In the kitty names code example, you may notice that the list item elements are indented. This is called __nesting__, and it communicates that these elements belong to that ordered list. Or, in HTML parlance, the ordered list is the __parent element__ and the list items are its __children__.

Nesting is crucial in denoting the relationship between different parts of your content.

#### HTML5 vs. HTML
They're both HTML, but HTML5 is the latest version of it. There is a working group called w3c (stands for World Wide Web Consortium) which decides on the specifications for HTML and CSS - what elements are supported or deprecated, and what new elements to introduce.

HTML5 adds a number of semantic elements like `<nav>, <aside>, <article>, <footer>, <address>` and a number of elements to better handle multimedia content.


#### Block Level vs. Inline elements
Block-level elements occupy the entire space of its parent element (container), thereby creating a "block."

Inline elements occupy only the space bounded by the tags that define the inline element.

For example:
```html
<p style="background-color:red;">This paragraph is a block-level element; its background has been colored to display the paragraph's parent element. Also, you should never do inline styles like Utah is doing.</p>

<p>This <span style="background-color:red;">span</span> is an inline element. Note the background color only applies to the area contained in the `span`.</p>
```

<p style="background-color:red;">This paragraph is a block-level element; its background has been colored to display the paragraph's parent element.</p>

<p>This <span style="background-color:red;">span</span> is an inline element. Note the background color only applies to the area contained in the `span`.</p>


### Common Elements

#### Headings

Headings are block level elements that communicate the priority and page flow of your site. Headings should be used in order of importance (1-6) to create an accurate outline of your content.

```html
<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>
<h5>Heading 5</h5>
<h6>Heading 6</h6>
```

There should only be one `<h1>` element, and it should be used for the primary heading on the page.

Don't use headings to just make the text bigger or bold. Use them to add meaning and structure to the page, as you would structure an outline of a paper.

```html
<h1>The Best Marvel Comics Characters</h1>
<h2>Jessica Jones</h2>
<h2>Black Widow</h2>
```

<h1>The Best Marvel Comics Characters</h1>
<h2>Jessica Jones</h2>
<h2>Black Widow</h2>


```html
<h1>The Best Marvel Comics Characters</h1>
<h2>Jessica Jones</h2>
<h3>Got her powers in a chemical spill</h3>
<h3>Doesn't wear fancy outfit</h3>
<h2>Black Widow</h2>
<h3>Trained as a super spy in Russia from a young age</h3>
<h3>No super powers, but she can punch and kick real good
<h4>In mid-air</h4>
<h4>On moving vehicles</h4>
<h3>No super powers
```

<h1>The Best Marvel Comics Characters</h1>
<h2>Jessica Jones</h2>
<h3>Got her powers in a chemical spill</h3>
<h3>Doesn't wear fancy outfit</h3>
<h2>Black Widow</h2>
<h3>Trained as a super spy in Russia from a young age</h3>
<h3>No super powers, but she can punch and kick real good
<h4>In mid-air</h4>
<h4>On moving vehicles</h4>
<h3>No super powers


#### Other Semantic Elements
- `<p>`: Block level paragraph element. Used for chunks of text, often following a header element.
- `<header>`: Used as an element to hold page header information (logo, navigation, heading)
- `<nav>`: Used as a container for navigational links
- `<article>`: Used to distinguish text as self-contained content on some topic. Think the body of a blog post.
- `<aside>`: Used for "side" content such as sidebars, notes, or inserts.
- `<section>`: Used to identify a thematic grouping of content, often including a heading. Also used for trolling Jeremy.
- `<footer>`: Identifies the content at the end of the page
- `<figure>`: Specifies self-contained content, like illustrations, diagrams, photos, code listings, etc.
- `<figcaption>`: Defines a caption for a `<figure>` element.

```html
<figure>
  <img src="nonexistent-img.jpg" alt="Utah is lazy sometimes">
  <figcaption>Fig1. - This is not a picture because Utah, but usually it would be.</figcaption>
</figure>
```

#### A Few Non-Semantic Elements


`div`, and `span` are purely for building the structure of the site, they don't have any semantic meaning. `div` tags are for content that really doesn't have a semantic counterpart. Avoid relying on divs. `span` tags are used to highlight/emphasize or otherwise identify small, inline pieces of content.
```html
<div>I'm a division</div>
<span>I'm a span!</span>
```

#### One Example of Semantic v. Non-Semantic Code


- `<b>`: Inline level element to make text bold.`</b>`
- `<i>`: Inline element to make text italic.`</i>`
- `<strong>`: Inline level element to imply that text is important.`</strong>`
- `<em>`: Inline level element to emphasize text.`</em>`


- <b> Inline level element to make text bold.</b>
- <i> Inline element to make text italic.</i>
- <strong> Inline level element to imply that text is important.</strong>
- <em> Inline level element to emphasize text.</em>
