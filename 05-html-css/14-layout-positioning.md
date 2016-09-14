# Layout: Positioning

## Learning Goals 📚
- Understand the purpose of the __position__ property
- Use `relative`, `absolute` and `fixed` positioned elements to lay out a website

## Positioning
The __position__ property is used to modify where an element appears on the screen. Like __float__, it can affect how other elements flow around it. However, __position__ provides a more fine-grained control over element placement.

There are 4 possible values for __position__: `static`, `relative`, `absolute` and `float`

### Static Positioning
`static` is the default position, applied to all the elements we've worked with so far. A statically positioned element is included normally in the flow of the website.

### Relative Positioning
An element with `relative` positioning is rendered at a point relative to where it would be placed statically. This means that space is made in the flow as if the element had `static` positioning.

```HTML
<!-- index.html -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Orange Boxes</title>
    <link href="styles.css" rel="stylesheet">
  </head>
  <body>
    <img src="imgs/orange_square.png">
    <img src="imgs/orange_square.png" id="relative-position">
    <img src="imgs/orange_square.png">
    <img src="imgs/orange_square.png">
  </body>
</html>
```

```css
/* styles.css */
#relative-position {
  position: relative;
  top: 30px;
  left: 50px;
}
img {
  border-style: solid;
  width: 100px;
}
```

![Rendering Relative Positions](https://github.com/droberts-ada/textbook-curriculum/blob/positioning/05-html-css/imgs/relative_position.png "Rendering Relative Positions")

(This example stolen more-or-less wholesale from the [https://developer.mozilla.org/en-US/docs/Web/CSS/position#Relative_positioning](MDN guide on position))

### Absolute Positioning
When an element has `absolute` positioning, it is rendered relative to the closest ancestor with a non-static position. If all its parents are static, it will be rendered relative to the whole page. Unlike with `relative` positioning, *no space is made in the flow* for the element.

As an example, lets put some text on top of an image.

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Memes 101</title>
    <link href="styles.css" rel="stylesheet">
  </head>
  <body>
    <div class="image-container">
      <img src="imgs/business-cat.jpg" height=332>
      <p class="top-text">IT'S TIME FOR YOUR</p>
      <p class="bottom-text">PURRRRFORMANCE REVIEW</p>
    </div>
  </body>
</html>
```

```css
div.image-container {
  display: inline-block;
  position: relative;
}
p.top-text {
  position: absolute;
  top: 0px;
}
p.bottom-text {
  position: absolute;
  bottom: 0px;
}

p {
  /* Line it up correctly within the div */
  padding: 20px 10px 20px 10px;
  width: 100%;
  text-align: center;
  margin: 0 auto;
  box-sizing: border-box;

  /* Make it look like meme text */
  color: white;
  font-family: impact, sans-serif;
  font-size: 40px;
  text-shadow: 2px 2px black,
               2px -2px black,
               -2px 2px black,
               -2px -2px black;
}
```

![Rendering Absolute Positions](https://github.com/droberts-ada/textbook-curriculum/blob/positioning/05-html-css/imgs/absolute_position.png "Rendering Absolute Positions")

### Fixed Positioning

## Vocab ✅


## Key Takeaway


### Additional Resources
