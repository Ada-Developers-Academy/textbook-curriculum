# Attributes, Classes & ID's!


## 📚 Learning Goals 📚
- Know what an Attribute is
- Differentiate between ID and Classes
- Identify when to use a Class or an ID




## What's an Attribute?
Attributes appear inside the opening tag and their values sit inside quotation marks. They look something like:
  ```html
  <tag attribute="value"> Content </tag>
  ```

An element can have none, one or many attributes.

A real-life example, the 'src' and 'alt' attributes inside of the img tag:
  ```html
  <img src="http://www.fillmurray.com/1000/500" alt="Bill Murray">
  ```

There are many different attributes that exist, some are specific to certain HTML elements. Do not worry about knowing them all now. You will pick them up as your learn new tags.

 This lesson is going to focus on the attributes 'class' and 'id'.


## Why Use Classes or ID's?
Giving Elements an ID or class allows you to target specific elements to style, while providing a semantic, meaningful name to css rules.

## Classes

 Classes are useful when you have, or possibly will have in the future, more than one element that shares the same style.


   ```html
   <h1 class="page-title"> Hello World! </h1>
   ```

In css, to select the class, use a **period** before the class name as the selector. Like so:
   ```css
    .page-title {
      color: gray;
      font-size: 2.5rem;
    }
   ```

 Classes are often used to define behavioral styles in addition to visual ones Examples of class names are: tag, comment, toolbar-button, warning-message, or email.

- You can use the same class on multiple elements.
- You can use multiple classes on the same element.

## ID's

Use the ID when you have a single element on the page that will take the style.

- Each element can have only one id
- Each page can have only one element with that id

To give an element an ID, go inside of it's opening tag, add 'id=' and, in quotes, give your custom ID
```html
<h1 id="home-page-title"> Hello World! </h1>
```

In your CSS, use a **hashtag** in front of the ID name as a selector for your rule-set, like so:
```css
#home-page-title {
  color: teal;
  font-size: 4rem;
}
```

## Elements with Multiple Classes
HTML Elements can have multiple classes. To accomplish this,
use the same class attribute and add a space in between the two class name values.

```html
<h1 class="page-title highlight"> Hello World! </h1>
```
Then, define your styles with css rule-sets exactly as you have already been.
```css
.page-title {
  font-family: helvetica;
  font-size: 5rem;
}

.highlight {
  background-color: yellow;
}
```

## 🔑 Key Takeaway
A class is a _type_ of item and the ID is the _unique name_ of an item on the page. Giving elements an ID or class allows you to target specific elements to style, while providing a semantic, meaningful name to for css rules.

### Additional Resources
- [HTML Dog Basic Overview](http://www.htmldog.com/guides/css/intermediate/classid/)

[CSS Tricks The Difference Between ID and Class](https://css-tricks.com/the-difference-between-id-and-class/)
