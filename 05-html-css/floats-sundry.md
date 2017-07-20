# Intro To Position: Floats

But first, a couple of sundries.

## Colors

CSS colors are all made by mixing different levels of red, green, and blue, though there are multiple ways to represent this.

- The value can be done a few ways:

  ###Hex
  `p {color: #ff0000}`

    - Hex color starts with `#` and has 3 or 6 characters. These characters represent the red, green, and blue channels.
    - Heximal is base 16, meaning all characters used are either 0-9 or a-f, representing an amount of red, green, or blue. 0 means no color (black), f means the most color (white).
    - The first two characters correspond to red, the middle to to green, and the last to to blue.

  ###RGB
  `p {color: rgba(255,0,0);}`

    - RGB accepts three comma-separated values, each of which is an integer from 0 to 255. 0 is pure black, 255 is white.

  ###RGBA
  `p {color: rgba(255,0,0,0);}`
    - Same as RGB, except it adds opacity.
    - The fourth value is between 0 and 1, with 0 being transparent and 1 being fully opaque.

  ###Keyword Colors###
  `p {color:red;}`
    - Keyword colors map to a specific color in the CSS spec
    - Easy to use, but limited, so not used as frequently

There are a number of color pickers online for hex and rgb colors, as well as sites that will convert color values.

## The Box Model
Every element on the page is a rectangular box and many properties determine its size: size of the core box, padding, border, and margin.

![css box model](https://developer.apple.com/library/mac/documentation/AppleApplications/Conceptual/Safari_Developer_Guide/Art/box_model_metrics_2x.png)

Important: The sizes of padding, border, and margin _add to_ the defined size of the core box. You can use the `box-sizing` property to get around this.

```css
*, *:before, *:after {
  box-sizing: border-box;
}
```


## Positioning With Floats

### What Floats Do
- Floating an object takes it out of the normal flow of the HTML.
- Elements can only be floated left or right, and cannot be centered with floats.
- Floated boxes will move to the left or right until their outer edge touches the containing block edge or the outer edge of another float.
- The elements after the floating element will flow around it.
- The elements before the floating element will not be affected.

#### Syntax
`selector {float: value;}`
Possible values are `left`, `right`, `none`.


### Clearing Floats
When you want other content from flowing around the floated items, apply the `clear` property to the element you want to not flow around floated items.


#### Syntax
`selector {clear: value;}`
Possible values are `left`, `right`, `both`, or `none`.

__Float resources:__

https://css-tricks.com/all-about-floats/

https://www.smashingmagazine.com/2007/05/css-float-theory-things-you-should-know/


### Clearfix

When a container box has only floated elements in it, the container height collapses to zero. Since floated boxes are taken out of the flow and don’t affect the parent box, there is nothing to give height to the container. If you want a border or background around your floated elements, this will cause problems.

The workaround for this is called a clearfix. This small block of css applies a tiny bit of hidden content after the parent element. This clears the float and allows the container to expand. To implement it, add a `clearfix` class to the parent element, and add the following to your stylesheet.

```css
.clearfix:after {
content: "";
display: block;
clear: both;
}
```
