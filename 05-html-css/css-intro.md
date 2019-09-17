# CSS {  display: intro; }

## 📚 Learning Goals 📚
- Identify parts of CSS Syntax
- Apply CSS styles to HTML
- Use selectors to target specific elements to add custom style

## CSS adds the style to a website

**CSS** stands for **Cascading Style Sheets**. It is the language for specifying how documents (such as HTML) are presented to users. We will use CSS to define styles for our documents, including the design, layout and variations in display for different devices and screen sizes.

## Styling to CSS Mentality

As designers and developers, we usually think about our design by thinking, "I want this part of the website to look like this."

CSS will force us to shift those thoughts into the format, "I want _these specific HTML elements_ to look like _this specific style_."

## CSS Syntax

All CSS is defined as a series of CSS rule-sets in files with the `.css` extension.

This is a **CSS rule-set** with a declaration block. This declaration block has two declarations on lines 2 & 3:
```css
selector {
  property: value;
  property: value;
}
```
- **selector**: *what* you want to change
- **property**: *what part* you want to change
- **value**: *how* you want to change it

The **declaration** is the property and value combined. The **rule-set** is the entire selector with the entire declaration block.

Let's look at an example:

```css
h1 {
  color: orange;
  font-family: helvetica, sans-serif;
}

p {
 color: gray;
 text-align: justify;
}
```

Right now, our **selectors** are the name of any HTML element that we want to target our styling.

The following is also true:
  - What determines what **properties** we can change with CSS? The available properties that will work on any given element is determined by W3C.
  - What determines the **values** for each property that we are styling? The valid values and the syntax for how to declare them is different based on each property.

**Exercise:** What does the above CSS example do?

<details>

<summary>
  Check your answers!
</summary>

1. The first rule-set selects all `h1` elements on the page. It says that their color (text color) should be orange. It says that their typeface is Helvetica, or a sans-serif typeface if Helvetica is not available. (Details for this are determined by the `font-family` property)
2. The second rule-set selects all `p` elements on the page. It says that their text color should be gray. It says that all of the text inside of these elements should be justify-aligned.

</details>

### Code Style

- Each **rule-set** is separated by a line break
- Each **declaration** is indented
- There is a space after the **selector** before the curly brace `{`
- Each closing curly brace `}` is on its own line

**Note**: After coming from programming that can throw runtime errors, HTML and CSS can be difficult as it never throws errors, even if there is a syntax error. Instead, the browser just won't do what you want it to. We will learn some debugging strategies throughout the week.

## Adding CSS to a Website

There are a few different ways to include CSS in your website. One is to put them directly into your HTML, also known as _inline styles_. The best way is to reference external style sheet(s). We are only going to use external style sheets to maintain an organized code base.

An **external style sheet** has many advantages over inline styles. Keeping the styles separate from your HTML content:
- Helps avoid duplication
- Makes maintenance easier
- Allows you to make a site-wide change in one place

When we make our external style sheets, we need to use syntax to tell our HTML pages to load our CSS files.

In the `head` tag of our HTML document, use a [`link`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link) tag.

It should have the following attributes:
- `href`, with a value of the _relative path to your CSS file_ in double-quotes
- `rel`, with a value of `"stylesheet"`

```html
  <head>
    <meta charset="UTF-8">
    <title>Some Title</title>
    <!-- Link to Style Sheet -->
    <link href="styles/style.css" rel="stylesheet">
  </head>
```

### Best Practices

- We will tend to create a CSS file called `style.css`. We can change this filename to anything else if we feel like it, like `index.css` or `styles.css` or `my-cool-webpage.css`
- We will tend to put our CSS files into a folder called `styles`. This is not mandatory, but a good way to organize our code

## Exercise: Create an External Style Sheet

1. Create a new project directory and `cd` into it
1. Create a new file `index.html`
1. In `index.html`, add the valid HTML document setup, and add into the `<body>` at least three paragraphs (using the `<p>` tag) with some text in each
1. In your project's directory, create a new folder called `styles`. Inside of your new directory, create a new file called `style.css`
1. In `style.css`, add a new rule-set that applies all the `p` elements in your HTML and makes the text align in the center. The property is `text-align` and the value is `center`
1. Open `index.html` in your browser
1. Observe that the styles are not applied
1. Change your HTML page so that it loads your external stylesheet. Make sure it is in the `<head>` tag, and not the `<body>`
1. Refresh your page and observe the styles being applied
1. If they are not applied, check the following with a neighbor:
    - The link tag in the head of the HTML file is going to the right relative path (where is your `index.html` located in relationship to your `style.css` file?)
    - Your CSS syntax is valid, and is targeting elements that exist

### Explore the Styles!

To get started, we will use MDN's documentation on Fundamental Font and Text styling to learn common properties and values. [Click here](https://developer.mozilla.org/en-US/docs/Learn/CSS/Styling_text/Fundamentals) to get started!

**Note**: CSS has A LOT of properties and even more values. It is not at all practical to memorize them all. Instead, looking up a kind of style you want to achieve will yield some code examples with properties and values to try.  

For example, I want to change my font to be larger. I could google 'css change font size'.


## Best Practices
- CSS should be in it's own .css file
- Declaration blocks should have a line break between declarations
- Keep all styles for a selector in one rule-set

## Vocab ✅
- Markup language
- Element
- Declaration
- Selector
- Property
- Rule-set

## 🔑 Key Takeaway
Use CSS to define styles for your documents. CSS declarations should always be kept in a separate file. In future discussions, we will explore how we can use CSS for layout modification.

### Additional Resources
[MDN CSS Syntax](https://developer.mozilla.org/en-US/docs/Web/CSS/Syntax)  
[MDN CSS Reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)
