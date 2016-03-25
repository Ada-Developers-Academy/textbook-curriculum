# HTML

## Learning Goals
- Learn the purpose and scope of HTML
- Become familiar with anatomy and vocabulary of HTML
- Understand the importance of semantic markup
- Gain exposure to common HTML tags


## Origins of HTML

Tim Berners-Lee wrote the original specification for HTML around 1990. He also built the first web server and browser capable of parsing and displaying HTML. This is him:

![Tim Berners-Lee](networking/tim-berners-lee.png)


## The Purpose Structure of HTML

HTML (HyperText Markup Language) defines the structure of a website, and the relationship and purpose of different kinds of information. All the websites use it.

HTML accomplishes this by defining sections with the use of *tags*, which look like `<tagname>content</tagname>`.

To break that down into parts:
`<tagname>content</tagname>` in its entirety is an __element__.
`<tagname></tagname>` is the tag, which contains some kind of content.
`<tagname>` is the opening tag, `</tagname>` is the closing tag.

Here's an example you might see in the wild:

```html
  <h1>Karaoke Resume</h1>
  <p>I am highly skilled at singing pop songs of the 80s, with particular expertise in love songs and hair bands such as Bon Jovi, White Lion, and Def Leppard.</p>
```

Some elements give some extra information called __attributes__, and these attributes have a __value__. This follows the format `<tagname attribute="value">content</tagname>`. Here's an example:

```html
  <a href="www.kittenwar.com">Vote for the cutest kittens!</a>
  <img src="assets/images/meowmeow.png" alt="kitten lying upside down">
```


## Semantics


Semantics in HTML is the practice of using valid HTML to give meaning to the webpage.
Semantic code describes what type of content is on the page. For example:

```html
<h1>The Best Names for Cats</h1>

<ol>
  <li>Pickles</li>
  <li>Raquel Welch's Grape Jam</li>
  <li>The Biscuitina Turner</li>
  <li>Grand Lord Snugglewumps</li>
  <li>Thunderpaw the Destroyer</li>
  <li>Impurrator Curiosa (shamelessly stolen from twitter)</li>
  <li>Kitty Purry</li>
</ol>
```

The `<h1>` describes that the text "The Best Names for Cats" is a heading for this page. This designates it as the most important overall piece of information on the page.

The `<ol>` and `<li>` tags create an _ordered list_. The tags define both the structure and relationship of the content. From the markup alone, we understand that _Grand Lord Snugglewumps_ is a better name for a cat than _Kitty Purry_. More importantly, that distinction can be communicated to all users--sighted, visually impaired, or robotic.

#### Question: Why should we care about semantic markup?
- *Accessibility*. Many low sight or blind users rely on a screen reader to read pages to them. These programs cannot interpret pages very well unless they are clearly explained. In other words semantic code is critical to accessibility
- *Search Engine Optimization*. Search engines need to understand what your content is about in order to rank you properly on search engines. Semantic code improves your placement on search engines, as it is easier for the "search engine spiders" to understand.
- *Readability*. Your code will be easier to read by others and future you if you very explicit about the structure and intent of your content.

#### Nesting as Semantics

In the above code example, you may notice that the list item elements are indented. This is called __nesting__, and it communicates that these elements belong to that ordered list. Or, in HTML parlance, the ordered list is the __parent element__ and the list items are its __children__.

Nesting is crucial in denoting the relationship between different parts of your content.

