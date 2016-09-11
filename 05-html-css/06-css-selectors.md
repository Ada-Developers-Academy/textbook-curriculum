# CSS Selectors

## Learning Goals 📚
- Know a variety of ways of targeting elements with Selectors
- Identify how to properly use each kind of selector

## Basic Selectors
So far we been targeting specific html elements with:
- Tag Selectors
- ID Selectors
- Class Selectors

## Attribute Selectors
Class and ID are two examples of Attribute Selectors. They have their own special selector syntax. Other attributes can be used as selectors using the syntax below.

 There are many other attributes we haven't covered that can be used as selectors in our CSS, but for now we'll use one we are familiar with in the example below:

```html
<a href="http://www.github.com"> Github </a>
```

```css
a[href="http://www.github.com"] { color: olive; }
```

Another snazzy way of using this selector is with an asterisk before the equal sign. This selects any elements that have at least part of content in the quotes.

In this example, any a tag that has "github" somewhere in it's href will be modified by this rule-set
```css
a[href*="github"] { color: teal; }
```

Attribute selectors can get more specific, read [this article](https://css-tricks.com/attribute-selectors/) to see it's capabilities!

## Multiple Selectors



## Combinators



## Pseudo-classes & Pseudo-elements



## Practice!
[CSS Diner](http://flukeout.github.io/)

## Vocab ✅
  -


## 🔑 Key Takeaway


### Additional Resources
[MDN CSS Selectors](https://developer.mozilla.org/en-US/docs/Learn/CSS/Introduction_to_CSS/Selectors)
