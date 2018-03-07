# Intro to Alignment and Positioning with Flexbox

## Learning Goals
- Understand the historical context of flexbox compared to other methods of aligning and positioning with CSS
- Review how the browser uses _flow_ to place elements on the page
- Change how elements flow on the page using CSS's `display: flex` property
- Change how elements align on the page using CSS's `display: flex` property
- Know browser compatibility for flexbox

## Before We Begin: Review Display

When rendering, the browser _flows_ from left to right, placing things in a single line. The line is as tall as the tallest element, and all the things are lined up with its bottom. If a thing would go off the edge of the screen, the browser wraps around and starts a new line, completely below the current one.

By default, every HTML tag comes with a `display` property value of `inline` or `block`. The `display` property determines how elements flow on the page. As a general rule, flow has only be left to right, and top to bottom.

Elements that are by `inline` elements align themselves left-to-right as many items that can fit into the container. Examples of these elements are `a`, `span`, and `img`.

Elements that are `block` elements interrupt flow and start and end with a line break. Examples of these elements are `div`, `p`, and `h1`.

Also, by default every element aligns the baseline of itself to the other baselines of surrounding elements.

## History

Historically, _aligning_ items while working with page flow using CSS has been difficult. CSS has never had a great way to align an item within along one dimension (vertically or horizontally). Vertical alignment in CSS is notoriously complex.

In comes _flexbox_ (stylistically lowercase, sometimes "flex-box", short for Flexible Box Module)!

Flexbox has the following advantages:
1. More intuitive attributes for aligning compared to older CSS solutions (like vertical alignment or evenly spacing elements inside of a container)
1. More relevant solutions to modern web layouts
1. Built for responsive design
1. Promotes thinking about alignment on websites agnostic of language direction

If you choose to not use flexbox as your main way of aligning elements along one dimension, Ada has archived lectures on other ways to do layouts in CSS:
1. [Layouts using Display](archived/layout-display.md)
1. [Layouts using Floats](archived/layout-floats.md)
1. [Layouts using Positioning](archived/layout-positioning.md)

**Note:** Flexbox is fairly new, and adoption for using flexbox isn't widespread. A lot of information and advice on the Internet uses CSS that does not use flexbox, even if flexbox may be a better solution for that problem.

## Rules for Setting Up Flexbox

Flexbox solves the following problem: **How do I define rules for aligning many small elements in one larger container element?** Therefore, to use flexbox, we set up our flexbox with these rules:

1. The "one larger container element" is called **the flex container**. We designate it as the flex container by giving it the CSS rule `display: flex;`
1. The "many small elements" that we are trying to align are called the flex items. The flex items **must** be and will only be the **direct children** of the flex container
  - these flex items may have children inside of them. Note: the rules of a flex container do not apply to the children of flex items
1. The "rules" we want to define for aligning the flex items will be additional properties on the flex container

Note: The flex items of a specific flex container do not have to be all the same kind of element.

### Observe

Let's say we've received this wireframe for a website to create. What are the flex items? What is the flex container?

Let's take a look at one way we'd likely write this HTML, and its accompanying CSS to set it up to use flexbox.

We've set up flexbox, but we don't see it in work yet.

## Controlling Flow

To best observe controlling flow with flexbox, it's best to set up an example where there is a large flex container, and flex items are small enough that many of them will fit on one "row" in the flex container, and flex items are numerous enough that it will "overflow" onto the next "row."

Flexbox defines some specific vocabulary that applies to flow.

In flexbox, there is a **main axis**. This axis runs **along** the direction that inline items flow. You can determine the direction of the main axis with the property `flex-direction`.

`flex-direction` has the following properties:
- `row` (default)
- `row-reverse`
- `column`
- `column-reverse`

There is also the **cross axis**. This axis runs **perpendicular** to the main axis.

## Controlling Alignment

To control alignment of flex items within the flex container, we have two main properties: `justify-content` and `align-items`.

`justify-content` determines alignment along the main axis. Its possible values are:
- `stretch`
- `flex-start`
- `flex-end`
- `center`
- `space-around`
- `space-between`
- `space-evenly`

`align-items` determines alignment along the cross axis. Its possible values are:
- `stretch`
- `flex-start`
- `flex-end`
- `center`

## Activity: Check for Responsive Design


## Some Tips

Because flex items must be the direct children of the flex container, it is tempting to make alter your HTML so it employs semantic HTML less. Resist that urge!

## About Browser Compatibility

flexbox was introduced only in the past few years. *Every modern browser supports flexbox*, but that didn't happen until 2015.

Internet Explorer 10 requires specifying the browser prefix `-ms-display: flex;`.

## Conclusion

It's entirely possible to customize flow and alignment of elements using CSS without flexbox. To do so, you will want to check out how to use `display` and `position` and `float`.

However, flexbox provides deep solutions for flow and alignment in a way that promotes better, more responsive layouts.

To use flexbox, you will determine a flex container whose direct children are the flex items. From there, you can use properties to determine the main axis and cross axis with `flex-direction`, and so much more from there!

## Resources
- [MDN with Basic Overview on flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox)
- [MDN on Techniques for Aligning in flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Aligning_Items_in_a_Flex_Container)
- [MDN on Browser Compatibility for flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Backwards_Compatibility_of_Flexbox)
