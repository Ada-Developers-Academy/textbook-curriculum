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
- Property + value = __declaration__
- Declarations end in semicolons (;)
- Selector + declaration = __rule__

## Selectors

CSS selectors are used to "find" (or select) HTML elements. There are a few different ways that we can select elements using CSS:

1. __Elements__: `h1 { property: value; }`
1. __Classes__: classes are used in html to group elements. These are particularly helpful when you want to select only a subset of an element type (only first paragraphs, etc).
    * In HTML, add a class to an element: `<p class="intro">words</p>`
    * In CSS, select elements with a given class: `.intro {background-color: yellow;}`
1. __IDs__: IDs are used in html to identify a specific element. IDs are *globally unique*, meaning each ID can be used only once in an HTML document. Because IDs can't be reused, they often lead to extra clutter in your style sheet, and should be used sparingly.
    * In HTML, add an ID to an element: `<p id="second-p">more words</p>`.
    * In CSS, select the element with a given ID: `#second-p {background-color: blue;}`
1. __Pseudoclasses__: A pseudoclass is used to define styles on a special state of an element. You can select these on an element without designating it in the HTML. The most common of these are hover, visited, and focus.
```css
p:hover {color: red;}
p:visited {color: purple;}
p:focus {border-color: pink;}
```

## The Cascade and Precedence
Within CSS, all styles __cascade__ from the top of a style sheet to the bottom, allowing different styles to be added or overwritten as the style sheet progresses. The cascade also works with properties inside individual selectors. Two examples:
```css
  .intro {
    background-color: yellow;
    background-color: brown;
  }
```

```css
  .intro {
    background-color: yellow;
  }

  .intro {
    background-color: brown;
  }
```
In both cases `background-color: brown;` overwrites `background-color: yellow;`

Specificity: The __specificity__ of your selector can clash with the cascade.
```css
  .intro {
    background-color: brown;
  }

  p {
    background-color: yellow;
  }
```
In this case, the `.intro` style will _not_ be overridden by the `p` style, even though the `p` comes after `.intro`. This is because a class is more specific than an element. Element < Class < ID.

## Combining Selectors:
You are not limited to a single selector at a time. You have a number of options that allow you be a little more specific.
- `.class p` - This selects any paragraphs that are _children_ of the class. Notice that there is a space between `.class` and `p`. This is important because this is what defines that we're selecting only `p` elements that are children of `.class`.
- `p.class` - This selects any `p` that _also_ has that class assigned to it.
- `.class > p` - This selects any paragraphs that are _direct_ children of the class.
We are using a class and an element in this example, but you can use combinations of elements, classes, or IDs.
Combining selectors can be very useful, but you should be careful not to go overboard. The selectors we combine, the more specific we get; The more specific we get, the more likely you are to run into trouble.

## Grouping Selectors:
If you have some styles that apply to multiple selectors, you can consolidate these. Instead of using a separate rule for each selector, you can group these selectors. This eliminates redundancy.
```css
p {background-color: yellow;}
li {background-color: yellow;}
footer {background-color: yellow;}
```
Group selectors like so:
```css
p, li, footer {background-color: yellow;}
```

## Units
Many properties require some measure of size (font-size, width, etc). There are a number of common units:
- __px__ - Pixels are an absolute unit, meaning their size does not change with screen size. This is very common, but has some shortcomings. For instance, if you use pixels, and your user zooms in, your layout is likely to break.
- __em__ - This is a relative unit. Not to be confused with the `<em>` tag. Em is a proportion of the parent's value. This requires more math and can be more difficult to implement than...
- __rem__ - Rems are also a relative unit, proportional to a base value, but rems are proportional to the _root_ value of a property for the whole document. This means you can more easily predict the effects. Rems are great for almost every situation.
- __%__ - This is a unit relative to its containing block.


## Common Properties

### Font Properties

- font-size: a number followed by a measurement of how tall the element's text is, usually in ems (em) or pixels (px)
- font-family: the name of a typeface, or typefaces
- font-style: italic
- font-weight: bold | values of bold!
- line-height: a number followed by a
measurement of how tall the element's line of is,
usually in ems (em) or pixels (px)

### Text Properties

- text-align: left | right | center | justify
- text-transform: capitalize | uppercase | lowercase | some others
- text-decoration: underline | overline | line-through | some others
- Note: A lot of properties will take a value of none

### Colors

- To set text colors, the property is color
- To set background colors, the property is background-color
- The value can be done a few ways:
  - Hex: #ff0000
  - RGB: rgb(255,0,0)
  - RGBA: rgb(255,0,0,0)
  - Also possible but not preferred: red

A large list of [common CSS properties here](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Properties_Reference)
