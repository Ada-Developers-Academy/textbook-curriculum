# Intro to Layout with CSS Grid

## Learning Goals

## History

[Designing on a grid is not a new concept](https://en.wikipedia.org/wiki/Grid_%28graphic_design%29), and in fact grid theory is a well-known practice in many schools of design. However, historically, web designers did not apply these ideas, and CSS did not have available good ways to practice them anyway. It is only until recently that web design has been pushing using a grid for layout.

CSS Grid Layout is a way to determine page layout along a two-dimensional grid (with X and Y axes) with major browser support "out of the box."

CSS Grid has the following advantages:
1. More applicable than teaching a specific CSS library
1. Browser compatibility
1. Promotes responsive design/relative units for layout

Other solutions to layout include:
- Proprietary implementations of grids in CSS
  - Bootstrap
  - Foundation
- Using combinations of other CSS properties
  - [Layouts using Display](archived/layout-display.md)
  - [Layouts using Floats](archived/layout-floats.md)
  - [Layouts using Positioning](archived/layout-positioning.md)

## Rules for Setting Up CSS Grid

  CSS Grid solves the following problem: **How do I define rules for the layout of many elements, specifically across rows and columns?** Therefore, to use CSS Grid, we set up our CSS Grid with these rules:

  1. There is one large container for these elements, and it is called **the grid container**. We designate it as the grid container by giving it the CSS rule `display: grid;`
  1. The "many elements" that we are trying to put in a layout are called the grid items. The grid items **must** be and will only be the **direct children** of the grid container
      - these grid items may have children inside of them, but will not be affected by this grid container
  1. We can define the "rules" for the grid system in many ways
      - The grid container may have CSS that determine a "template" for how all the grid items span across rows and columns
      - The grid item may have CSS applied to it that determines how it specifically spans across rows and columns

  Note: The grid items of a specific grid container do not have to be all the same kind of element.

### Counting on CSS Grid

CSS Grid does not begin with index 0, and instead count starting at 1.

![Grid Image](./imgs/grid_lines.png)

### Observe

Let's say we've received this wireframe for a website to create. What are the rows? What are the columns? What is the grid container? What is each grid item, and how many rows and columns do each one span?

...

Let's take a look at one way we'd likely make write this HTML, and its accompanying CSS to set it up to use CSS Grid.

...

We've set up CSS Grid, but we don't see it in work yet.

## Grid Template

### Defining Grid Template

...

### The `fr` fractional unit

...

## Grid Item Span

### Using Start and End

...

### Using `span`

...


## Subjects Not Covered In This Lecture

- Gutters

## About Browser Compatibility

CSS Grid was introduced only in the past few years. Even so, *every modern browser supports CSS Grid*.

Internet Explorer 11 requires specifying the browser prefix `-ms-display: grid;`.

A lot of information and advice on the Internet uses CSS that does not use CSS Grid, even if CSS Grid may be a better solution for that problem.

## Conclusion

...

## Resources

...
