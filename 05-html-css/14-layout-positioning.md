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

![alt text](https://github.com/droberts-ada/textbook-curriculum/blob/positioning/05-html-css/imgs/relative_position.png "Rendering Relative Positions")

## Vocab ✅


## Key Takeaway


### Additional Resources
