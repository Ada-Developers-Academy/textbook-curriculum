# Cascade & Inheritance


## 📚 Learning Goals 📚
- Understand how styles are applied

## What is Cascading?

Other than being the C in the acronym CSS, the fact that style sheets are described as “cascading” is an important, if complex, part of the way styles are applied to the elements in a document. It’s called the CSS cascade, because style declarations cascade down to elements from many origins.

This is especially important as our stylesheets become more long, complicated and even split between many different stylesheets.


## Sources of Cascading
Three main sources of style information form a cascade. They are:

- The browser's default styles for the markup language.
- Styles specified by a user who is reading the document.
- The styles linked to the document by its author. These can be specified in three places:
  - In an external file: this tutorial primarily discusses this method of defining styles.
  - In a definition at the beginning of the document: use this method only for styles that are used only on that page.
  - On a specific element in the body of the document: this is the least maintainable method, but can be used for testing.

For example:
```html
  <p> Eeny, Meeny, Miny, <strong>MOE</strong>!</p>
```

  ```css
    p {
      font-family: helvetica;
     }

     strong {
       color: red
     }
  ```
Based on the code above, when you open your sample document in your browser, the <strong> elements are bolder than the rest of the text. This comes from the browser's default style for HTML.

The <strong> elements are red. This comes from our custom styling.

The <strong> elements also inherit much of the <p> element's style, because they are its children. In the same way, the <p> element inherits much of the <body> element's style.

## Specificity

Multiple rules may have selectors that each match the same element. If a property is given in only one rule, there is no conflict and the property is set on the element.

If more than one rule applies to an element and sets the same property, then **CSS gives priority to the rule that has the more specific selector**.

Some selectors are more specific than others. For example, the class and ID selectors are more specific than simple HTML element selectors. When two rules select the same element and the properties contradict one another, the rule with the more specific selector takes precedence.

### Specificity Hierarchy
Every selector has its place in the specificity hierarchy. There are four distinct categories which define the specificity level of a given selector:
1. Inline styles (Presence of style in document).
An inline style lives within your XHTML document. It is attached directly to the element to be styled. E.g. <h1 style="color: #fff;">
2. IDs (# of ID selectors)
ID is an identifier for your page elements, such as #div.
3. Classes, attributes and pseudo-classes (# of class selectors).
This group includes .classes, [attributes] and pseudo-classes such as :hover, :focus etc.
4. Elements and pseudo-elements (# of Element (type) selectors).
Including for instance :before and :after.


## Continue Learning
Understanding CSS selector's specificity can be one of the most difficult parts. It is something that will take practice! Fortunately for us, there are great articles that breakdown this complex topic, such as Smashing Magazine's [*CSS Specificity: Things You Should Know*](https://www.smashingmagazine.com/2007/07/css-specificity-things-you-should-know/) Article.

And for you visual learners and/or Star Wars fans, there is [this](https://stuffandnonsense.co.uk/archives/images/specificitywars-05v2.jpg). *(Each character (selector) is given its own Sith power (specificity value) depending on how powerful they are in the ways of the Dark Side. A storm trooper is less powerful than Vader who is in turn less powerful than the Emperor.)*

## Vocab ✅
  -


## 🔑 Key Takeaway


### Additional Resources

[MDN Cascade and Inheritance](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started/Cascading_and_inheritance)
