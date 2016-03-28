# Semantics, Best Practices, and Common HTML Elements

## Learning Goals
- Understand the importance of semantic markup
  - Be able to categorize elements as semantic or non-semantic
  - Know the difference between HTML and HTML5
- Gain context and awareness about web accessibility
- Understand the difference between block-level and inline elements
- Learn basic best practices
  - Overall
  - For specific elements
  - For accessibility

###A Few Words on Web Accessibility
Web accessibility is quickly garnering awareness among developers, many of whom are hadn't realized the importance, scope, or sheer number of folks who need it. What this means is that many developers don't know how to implement techniques for accessibility well or quickly. This in turn means it's easy to get set aside to do later, and then set aside for financial and time reasons.

However. Approximately 20% of Americans have a disability that could affect their ability to access many websites, and an accessible site benefits everyone.

Accessiblity encompasses, but is not limited to:
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


####Block Level vs. Inline elements
Block-level elements occupy the entire space of its parent element (container), thereby creating a "block."

Inline elements occupy only the space bounded by the tags that define the inline element.


### Common Elements

#### Headings

Headings are block level elements that communicate the priority and page flow of your site. Headings should be used in order of importance (1-6) to create an accurate outline of your content.

There should only be one `<h1>` element, and it should be used for the primary heading on the page.

Don't use headings to just make the text bigger or bold. Use them to add meaning and structure to the page, as you would structure an outline of a paper.


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



