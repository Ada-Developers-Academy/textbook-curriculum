# Attributes, Classes & IDs!

Oh my!

## 📚 Learning Goals 📚

- Know what an Attribute is
- Differentiate between ID and Classes
- Identify when to use a Class or an ID

## What's an Attribute?

Attributes appear inside the opening tag and their values often sit inside double-quotation marks. They look something like:

```html
<tag attribute="value">Content</tag>
```

- An element can have zero, one, or many attributes.
- Multiple attributes are separated by a **space**.
- There are many different attributes that exist. Many are specific to certain HTML elements. Do not worry about knowing them all now. You will pick them up as your learn new tags.

Example: Here are the 'src' and 'alt' attributes inside of the `img` tag:

```html
<img src="https://picsum.photos/300/?image=475" alt="Some Lovely Mountains">
```

## The `class` and `id` Attributes

Turns out that you can add any kind of attribute-value pairs to any HTML tag. For example, you can write `<p apples="tacocat">`. However, the browser likely doesn't know by default what to do with `apples="tacocat"`.

CSS is _really_ good at looking for elements with a `class` attribute and reading their values... so much so, that it has shortcut syntax for it. Same with the `id` attribute: CSS is _really_ good at looking for elements with an `id` attribute-value pair.

Because CSS is well-suited to find elements, when we create a CSS rule-set, for the **selector**, we not only use the element name, but we can also use the **the value/name of a class attribute** or **the value/name of an id attribute**.

Each section should cover the following:

1. What this attribute represents to us as developers
1. How we use these attributes in HTML
1. How we use these attributes as CSS selectors

## Classes

Classes are useful when you have, or possibly will have in the future, more than one element that shares the same style.

Our typical naming convention for classes is to use kebab-case.

```html
<h1 class="page-title">Hello World!</h1>
```

In CSS, to select the class, use a **period** before the class name as the selector. Like so:

```css
.page-title {
  color: gray;
  font-size: 2.5rem;
}
```

What does this code do? It selects **every** element on the HTML page that has the **class** `page-title`, and it gives it a text color of gray and a text size of 2.5rem.

More precisely, this CSS selects any element that has `class="page-title"`.

<details>
  <summary>
    Note: Forgetting the period will break the CSS. Click here for an example.
  </summary>

  Read this CSS and determine what this does:

  ```css
  page-title {
    color: gray;
    font-size: 2.5rem;
  }
  ```

  It selects **every** element on the HTML page that **is a `<page-title>` element**, and it gives it a text color of gray and a text size of 2.5rem. If you didn't know, the `<page-title>` element doesn't exist... so it's likely that this CSS rule-set does nothing.

</details>

### Elements with Multiple Classes

HTML Elements can have multiple classes. To accomplish this, use the same class attribute and add a **space** in between the two class name values.

```html
<h1 class="page-title highlight">Hello World!</h1>
```

This `h1` element has two classes: one class is `page-title` and another is `highlight`.

Continue to write CSS using the correct syntax for selecting classes, and both of these CSS rule-sets will apply to the element.

```css
.page-title {
  font-family: helvetica;
  font-size: 5rem;
}

.highlight {
  background-color: yellow;
}
```

### Details on Using Classes

Classes are often used to define behavioral styles in addition to visual ones Examples of class names are: `tag`, `comment`, `toolbar-button`, `warning-message`, `category`, or `email`.

- You can use the same class on multiple elements.
- You can use multiple classes on the same element.

## IDs

Use the ID when you have a single unique element on the page that will take a unique style.

- Each element can have only one id
- Each page can have only one element with that id

To give an element an ID, go inside of it's opening tag, add `id=` and, in quotes, give your custom ID.

```html
<h1 id="home-page-title">Hello World!</h1>
```

In your CSS, use an **octothorpe (#)** in front of the ID name as a selector for your rule-set, like so:

```css
#home-page-title {
  color: teal;
  font-size: 4rem;
}
```

This CSS rule-set selects all elements (hopefully just one element) that has the `id` of the value `home-page-title`.

The naming convention for IDs will vary wildly from team to team, so for now we will recommend kebab-case or pascalCase.

## Combining Classes and IDs

An element can combine class and id attributes. Observe the following HTML and CSS code.

```html
<p id="feature-text" class="recipe-description special-promotion">Lorem ipsum ...</p>
```

```css
/* This selects all paragraph tags */
p {
  text-align: center;
}

/* This selects all elements with the id feature-text */
#feature-text {
  font-size: 2rem;
}

/* This selects all elements with the class recipe-description */
.recipe-description {
  color: #708090;
}

/* This selects all elements with the class special-promotion */
.special-promotion {
  background-color: #F6F293;
}
```

<details>
  <summary>
    Which CSS rule-sets apply to the HTML element defined above?
  </summary>

  All of them!
</details>

### Exercise

Read the CSS below, and then create the HTML tag that will have all styles applied to it.

```css
a {
  text-decoration: none;
}

.email-link {
  color: orange;
}

#admin-email {
  transform: rotate(20deg);
}

.info {
  font-family: serif;
}
```

<details>
  <summary>
    Check your answer against ours
  </summary>

  Your HTML may look like this (and might not include the `href` attribute or the "Some Link Text").

  The order of attributes does not matter.

  In this case, the order of classes does not matter.

  `<a id="admin-email" class="email-link info" href="mailto:admin@whoknows.com">Some Link Text</a>`
  
</details>

## 🔑 Key Takeaway

A class is a _type_ of item and the ID is the _unique name_ of an item on the page. Giving elements an ID or class allows you to target specific elements to style, while providing a semantic, meaningful name to for CSS rules.

### Additional Resources

- [HTML Dog Basic Overview](http://www.htmldog.com/guides/css/intermediate/classid/)
- [CSS Tricks The Difference Between ID and Class](https://css-tricks.com/the-difference-between-id-and-class/)
