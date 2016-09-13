# Box Model


## Learning Goals 📚
-
-

## What is the Box Model

** Every element on a page is a rectangular box. **

In a document, each element is represented as a rectangular box. Understanding the structure of an elements box is essential in setting it's size and the position.

In CSS, each of these rectangular boxes is described using the standard box model. This model describes the content of the space taken by an element. Each box has four edges: the margin edge, border edge, padding edge, and content edge.

![Box Model Diagram](imgs/css-box-model.jpg)
[Image source](http://www.slideshare.net/niciuzza/css-box-model-25142045)

Adding the following code to the top of your CSS file uses

```css
  * {
    border: black 1px solid;
  }
```


## Altering an Element's Box Model

There are several properties that determine the size of that box. The core of the box is defined by the width and height of an element, which may be determined by the display property, by the contents of the element, or by specified width and height properties.

Padding and then border expand the dimensions of the box outward from the element’s width and height. Lastly, any margin we have specified will follow the border.


### Block Elements vs Inline-Block Elements
** Block Elements **
examples: h1..h6, p, ul

** Inline Elements **
examples: a, , li

## Measurements

You site may be viewed on a wide range of devices, from mobile phones to 50" smart TV's.

### Absolute Measurements

**Pixels**

### Relative Measurements

** Percentages **


** em or rem **

### It all Adds Up!

According to the box model, the total width of an element can be calculated using the following formula:
margin-right + border-right + padding-right + width + padding-left + border-left + margin-left

And this formula for the height:
margin-top + border-top + padding-top + height + padding-bottom + border-bottom + margin-bottom

This is important to consider when setting an element's width. Even if you have two elements with a width of 50%, they will not show up side by side if there is any padding, margin or border adding to the widths.

** Note ** A lot of front-end developers prefer to set the width or height to *include* the padding and border along with the content, but not the margin. [This article](http://www.paulirish.com/2012/box-sizing-border-box-ftw/), written by a google chrome developer, demonstrates how to do so!


## Use DevTools to View an Element's Box-Model


## Vocab ✅
- margin
- border
- padding

## 🔑 Key Takeaway
Understanding an elements box-model is essential to positioning elements in more complex layouts.

### Additional Resources
- [DevTools Documentation](https://developers.google.com/web/tools/chrome-devtools/iterate/inspect-styles/?utm_source=dcc&utm_medium=redirect&utm_campaign=2016q3)
- [Opening the Box Model Lesson](http://learn.shayhowe.com/html-css/opening-the-box-model/)
