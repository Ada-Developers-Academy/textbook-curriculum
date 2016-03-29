# CSS

CSS (Cascading Style Sheet) exists to style your HTML for web, print, and more!

We use CSS to add layout and design to our page. We can also use CSS to share styles across websites and pages.

- There are a *ton* of CSS properties
- We will not get anywhere close to
covering all of them
- Practice the basics before getting fancy

## Anatomy of CSS

`selector { property: value; }`

- __Selector__ is the thing you want to style
- __Property__ is what aspect you want to style
- __Value__ is how you want to style it
- __Property__ + value = declaration
- __Declarations__ end in semicolons (;)
- Selector + declaration = __rule__

## Selectors

CSS selectors are used to "find" (or select) HTML elements. There are a few different ways that we can select elements using CSS:
1) __Elements__: `h1 { property: value; }`
2) __Classes__: classes are used in html to group elements. These are particularly helpful when you want to select only a subset of an element type (only first paragraphs, etc).
In your html, classes appear like:
`<p class="intro">words</p>`
In CSS, you would select a class like:
`.intro {background-color: yellow;}`
3) __IDs__: IDs are used in html to identify a single instance of an element. There can only be one of a particular ID. Since these are so specific, they can't be reused, and can cause extra clutter in your stylesheet. Try to avoid these in general, but they are sometimes an appropriate choice.
In your html, IDs appear like: `<p id="second-p">more words</p>`.
In CSS, you would select an ID like: `#second-p {background-color: blue;}
4) __Pseudoclasses__: A pseudoclass is used to define styles on a special state of an element. You can select these on an element without designating it in the HTML. The most common of these are hover, visited, and focus.
`p:hover {color: red;}`
`p:visited {color: purple;}`
`p:focus {border-color: pink;}`

##The Cascade and Precedence
Within CSS, all styles __cascade__ from the top of a style sheet to the bottom, allowing different styles to be added or overwritten as the style sheet progresses. The cascade also works with properties inside individual selectors. Two examples:
```html
  .intro {
    background-color: yellow;
    background-color: brown;
  }
```

```html
  .intro {
    background-color: yellow;
  }

  .intro {
    background-color: brown;
  }
```
In both cases `background-color: brown;` overwrites `background-color: yellow;`

Specificity: The __specificity__ of your selector can clash with the cascade.
```html
  ```html
  .intro {
    background-color: brown;
  }

  p {
    background-color: yellow;
  }
```
In this case, the `.intro` style will not be overridden by the `p` style, even though the `p` comes after `.intro`. This is because a class is more specific than an element. Element < Class < ID.

## Common

**Font Properties**

- font-size: a number followed by a measurement of how tall the element's text is, usually in ems (em) or pixels (px)
- font-family: the name of a typeface, or typefaces
- font-style: italic
- font-weight: bold | values of bold!
- line-height: a number followed by a
measurement of how tall the element's line of is,
usually in ems (em) or pixels (px)

**Text Properties**

- text-align: left | right | center | justify
- text-transform: capitalize | uppercase | lowercase | some others
- text-decoration: underline | overline | line-through | some others
- Note: A lot of properties will take a value of none

**Colors**

- To set text colors, the property is color
- To set background colors, the property is background-color
- The value can be done a few ways:
  - Hex: #ff0000
  - RGB: rgb(255,0,0)
  - Also possible but not preferred: red

A large list of [common CSS properties here](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Properties_Reference)


## More Resources
- [Hex and RGB Colors](http://www.w3schools.com/tags/ref_colorpicker.asp)
- [Hex Colors](http://0to255.com)
- [Pseudo Classes](http://htmldog.com/guides/css/intermediate/pseudoclasses/)
- [HTML Validator](http://html5.validator.nu)
- [CSS Validator](http://jigsaw.w3.org/css-validator)