# CSS Selectors

## Learning Goals 📚
- Know a variety of ways of targeting elements with Selectors
- Identify how to properly use each kind of selector

## Basic Selectors
So far we been targeting specific html elements with:
- Tag Selectors (the name of the tag)
- ID Selectors (a hashtag the given id name)
- Class Selectors (a period with given class name)


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


## Pseudo-classes & Pseudo-elements

### Pseudo-classes
A CSS pseudo-class is a keyword added to selectors that specifies a special state of the element to be selected.

[Here](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes) is an index of pseudo-classes.

A popular one is :hover. Test it out in [Codepen](http://codepen.io) to see how it works!
```css
h1:hover { color: teal; }
```
### Pseudo-elements
Pseudo-elements allow you to style certain parts of a document. A few common pseudo-elements are :after, :before and :first-letter. [Here](https://developer.mozilla.org/en-US/docs/Web/CSS/pseudo-elements) is an index of Pseudo-elements

- Note: Pseudo-elements use two colons, pseudo-classes use only one colon.

Try this out in [Codepen](http://codepen.io)
```css
h1::selection {
  color: yellow;
  background-color: black;
}
```


## Multiple Selectors
The same rule set can be applied to two different selectors by putting a comma in between selectors. Doing so can help keep your CSS stay DRY.

Examples:
```css
h1, h2, h3  {
  color: teal;
  font-family: helvetica;
}
```

*Any* combination of selectors can be used!

## Selectors Based on Relationships
Remember how we emphasized elements relationship with the sectioning elements lesson? Knowing relationships between elements gives us even more ways of selecting elements!

Here are common selectors based on relationships

| Selector      | Selects        
| ------------- |-------------|
| A E      | Any E element that is a descendant of an A element (that is: a child, or a child of a child, etc.) |
| A > E     | Any E element that is a child (i.e. direct descendant) of an A element     |  
| E:first-child | Any E element that is the first child of its parent    |  
| B + E | Any E element that is the next sibling of a B element (that is: the next child of the same parent)    |


## Practice!
[CSS Diner](http://flukeout.github.io/)

## Vocab ✅
  - Pseudo-Classe
  - Pseudo-Element


## 🔑 Key Takeaway
Pseudo-classes and pseudo-elements provide a more extensive set of options to select and manipulate html elements.

### Additional Resources
- [MDN CSS Introduction Selectors](https://developer.mozilla.org/en-US/docs/Learn/CSS/Introduction_to_CSS/Selectors)

- [MDN Selectors](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started/Selectors) *(more in depth)*

- [Smashing Magazine's Ultimate Guide to CSS Pseudo-Classes And Pseudo-Elements](https://www.smashingmagazine.com/2016/05/an-ultimate-guide-to-css-pseudo-classes-and-pseudo-elements/)
- [Khan Academy's Interactive Quiz](https://www.khanacademy.org/computing/computer-programming/html-css/more-css-selectors/e/quiz--css-specificity-rules)
