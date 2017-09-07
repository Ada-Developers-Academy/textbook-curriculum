# Layout: Floats

## Sample Code
For this lecture, we'll be modifying a silly but plausible website! Go ahead and fork/clone the code that goes along with these lecture notes in your calendar.

## Learning Goals 📚
- Use the *float* property to lay out web pages
- Avoid the pitfalls that can come with floats

## Motivation
- __block elements__ start on a new line, and extend as far to the left and right as possible.
  - `<p>`, `<h1>`, `<ul>`
- __inline elements__ "inline" horizontally, but expand the line vertically
  - `<strong>`, `<img>`

What if you want to have multiple block elements side-by-side?

Or wrap text around an image?

Example: [New York Times](http://www.nytimes.com/)

## Float
The answer is with the float property.

Content will *flow* around a floated element.

```css
img {
  float: left;
}
```

Possible values include `left`, `right` and `none` (the default).

Notice that if the page width is shrunk, the text will flow around the images.

## Clearing the Float
Notice how the images gum up one after the other, and the second article continues the float pattern of the first. In order to force the article to appear on a new line *after* the end of the float, we use __float__'s counterpoint: __clear__.

```css
img {
  float: left;
  clear: both;
}

article {
  clear: both;
}
```

Possible values include `left`, `right`, `both` and `none` (the default).

## Displaying Two Articles
### Setup
Alright, now for something a little more interesting. Since we've two articles, lets put one on the left and one on the right. We'll also keep the image floating we did previously.

**Question:** We'll need to apply different styles to the two different articles. How should we select them?

We'll need to add a `max-width` property to the articles. As block elements, they'll attempt to fill up the whole screen unless they're limited. Let's say 70% and 25%.

Finally, remove the `clear: both` description from `article`. Since `none` is the default you can just delete it, but I've left it in for clarity.

```css
article {
  clear: none;
}

article:nth-of-type(odd) {
  float: left;
  max-width: 70%;
}

article:nth-of-type(even) {
  float: right;
  max-width: 25%;
}
```

### The Collapse
Well, that didn't do what we want. But something definitely happened...

Turns out a floated element doesn't count toward the size of its parent element. That's how the articles were able to creep up on each other earlier. When all the elements in the main section are floated, then *nothing* contributes to its size, which collapses to zero.

To fix this, we'll tell our `footer` to clear the floated elements.

```css
footer {
  clear: both;
}
```

If you don't have a convenient `footer` you could add an empty `div`, but then your document will contain tags without any semantic meaning, making our HTML less POSH.

Another option is to set `overflow: hidden` on the parent element (`main` in this case). This will force the parent to expand to encompass its children. This method can have side effects however, for example an unwanted scrollbar, so use it with caution.

[Read more about this oddity of HTML/CSS](https://css-tricks.com/all-about-floats/#article-header-id-4)

### Aside: 70% + 30% != 100%
Be aware that if you increase that 25% to 30%, the two articles won't sit side-by-side. What's going on?

This is a strange quirk of HTML/CSS - the whitespace between the two articles takes up some space, which makes the total more than 100% and bumps the second article.

[Read more here](http://stackoverflow.com/questions/6871996/css-two-inline-block-width-50-elements-dont-stack).

## Vocab
- float
- clear
- collapse

## Key Takeaway
- The __float__ property is used to make your website flow around a given element
- To stop flowing, use the __clear__ property
- If all the children of an element are floated, that element will __collapse__

### Additional Resources
- [All About Floats](https://css-tricks.com/all-about-floats/)
- [Float Theory: Things you should know](https://www.smashingmagazine.com/2007/05/css-float-theory-things-you-should-know/)
