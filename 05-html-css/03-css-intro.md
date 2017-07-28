# CSS {  display: intro; }

## 📚 Learning Goals 📚
- Identify parts of CSS Syntax
- Apply CSS styles to HTML
- Use selectors to target specific elements to add custom style

## CSS adds the style to a website

**CSS** stands for **Cascading Style Sheets**. It is the language for specifying how documents (such as HTML) are presented to users. We will use CSS to define styles for our documents, including the design, layout and variations in display for different devices and screen sizes.


**Note:** if you want to make a front-end developer cringe, tell them how CSS makes a website 'pretty'. They'll love it.

## CSS Syntax Structure

This is a **CSS rule-set** with a declaration block. The declaration block has two declarations on lines 2 & 3:
```css
selector {
  property: value;
  property: value;
}
```
- **selector**: *what* you want to change
- **property**: *what part* you want to change
- **value**: is *how* you want to change it.

The **declaration** is the property and value combined. The **rule-set** is the selector with the declaration block.

Example:
```css
h1 {
  color: orange;
  font-family: helvetica;
}

p {
 color: gray;
 text-align: justify;
}
```
What does the above code do?

A few notes about **code style**:
- Each **rule-set** is separated by a link break
- Each **declaration** is indented
- There is a space after the **selector** before the curly brace `{`
- Each closing curly brace `}` is on its own line

**Note**: After coming from backend programming, HTML and CSS can be difficult as it never throws errors if there is a syntax error. Instead it just won't do what you want it to. We will learn some debugging strategies throughout the week.

## Adding CSS to a Website
There are a few different ways to include CSS in your website. One is to put them directly into your HTML, also known as _inline styles_. The other is to reference external style sheet(s). We are only going to use external style sheets to maintain an organized code base.

An **external style sheet** has many advantages over inline styles. Keeping the styles separate from your HTML content:
- Helps avoid duplication
- Makes maintenance easier
- Allows you to make a site-wide change in one place


### HTML & CSS In Action
Let's try this out!

#### Create a new CSS Style Sheet Document

1. In your project's directory, create a new folder called `styles`. Inside of your new directory, create a new file called `style.css`.
1. Add a new rule-set, changing all the `h1` elements in your HTML.
1. Preview the site in the browser. Did it work?

It doesn't work because we didn't *link* the CSS to the HTML document. Right now the two files have no idea each other exist.

#### Link CSS to HTML
For CSS to be applied on HTML element, we will need to go back to our HTML document and link our CSS.

In the `head` tag of our HTML document, use a [`link`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link) tag to provide the relative path to your stylesheet.
```html
  <head>
    <meta charset="UTF-8">
    <title> This site should have a title! </title>
    <!-- Link to Style Sheet -->
    <link href="styles/style.css" rel="stylesheet">
  </head>
```

The `href` attribute should contain the relative path to your stylesheet file. The `link` tag can have different uses, but for now, the `rel` attribute will always be `stylesheet`. If you have multiple stylesheets, you will need to include multiple `link` tags.

Now preview you webpage, and voila! 🎉

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
