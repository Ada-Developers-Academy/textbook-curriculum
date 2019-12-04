# Using CSS in React Components

## Learning Goals

- See options for how to include CSS in React components
- Show how to use `const`s and `style` directly in component files to store CSS data
- Use and load external CSS files to store CSS data

## How to include CSS

There are a few ways we can write CSS and use those styles for our React components:

- Inline CSS using the `style` attribute
- Using CSS defined in an external stylesheet and setting it in the `className` attribute

### Inline CSS using `style`

The first way is to define CSS styles inline using the built in `style` attribute.

The `style` attribute takes in a JavaScript object, whose properties are _camelCase_.

Take a look at the following example:

```javascript
import React from 'react';

const Link = (props) => {
  const linkStyle = {
    color: 'purple',
    fontFamily: 'monospace',
  };

  return (
    <div style={linkStyle}>
      Link: <a href={props.url}>{props.text}</a>
    </div>
  );
};

export default Link;
```

In this example, we see that in our `Link` component, we declare a `const` var `linkStyle`, which is a JavaScript object. We use `linkStyle` in the JSX we return, in `<div style={linkStyle}>`.

If we look at the actually rendered page that renders this component, we see that it really did turn into inline styles in the HTML:

```html
<div style="color: purple; font-family: monospace;">
  Link: <a href="about:blank">Goes to nowhere</a>
</div>
```

Now that we've seen an example, note the following things:

- `linkStyle` is a `const` var
- the value of `linkStyle` is an object, so items are comma-separated
- the names of CSS properties are camelCase here, so in JavaScript it's `fontFamily` and turns into the CSS `font-family`
- the values of the properties are strings of what the CSS values should be: in CSS we may have written `color: purple;` but in JS we write `color: 'purple',`.

This method of adding styles is commonly written online (particularly in documentation and tutorials) because it's convenient to condense the code in this way.

However, just as we learned to not accept inline styles in regular HTML, we actively discourage inline styles in React components. Instead, put the CSS in an external sheet.

### External Stylesheets in React and using `className`

At Ada, we recommend using CSS defined in external stylesheets, particularly in the following style:

- Create a new `.css` file per Component
- This file should be named the name of the Component (case-sensitive)
- This file should be in the same directory as the Component's `.js` file
- You should `import` the CSS file within the Component's `.js` file (case-sensitive)
- Styles should be set using the attribute `className`

Following the first three steps, we should make a new file `Link.css` in the same directory as `Link.js`, and its contents should be the following:

```css
.link-container {
  color: purple;
  font-family: monospace;
}
```

Here we've made a new class `link-container` that we hope to use in our component.

Now we can refactor our `Link` Component from above to use our external stylesheet:

```javascript
import React from 'react';

import './Link.css';

const Link = (props) => {
  return (
    <div className='link-container'>
      <a href={props.url}>{props.text}</a>
    </div>
  );
};

export default Link;
```

We made the following changes:

- We used the line `import './Link.css'` as the relative path to our CSS file
- Instead of using the `style` attr, we use the `className` attr to provide a class. This class will be used for CSS class selection as we know it
- We removed the unnecessary `const` var `linkStyle` that had our inline styles

### How far can we go?

What else can we do? How far can we extend this? Everything else about JavaScript, React, and CSS still applies:

- You can add a `className` to any element
- You can add as many classes as you want. If you want a div to have the two classes "content" and "profile", you can say `<div className='content profile'></div>`
- You can make the value of `className` to be a variable. If you have a variable `let myClass = 'my-cool-class'`, you can say `<div className={myClass}></div>`
- If you need to conditionally set some styles, you can do that through conditionally modifying a string! You'll have to set a variable to the correct value before returning JSX, because you can't do conditional logic in JSX

## Key Takeaway

While you may see some examples using the `style` attribute directly on components, we are going to continue putting our styles in external style sheets and loading them into components where necessary.

## Additional Resources

- [React docs: style attribute](https://reactjs.org/docs/dom-elements.html#style)
- [React docs: style FAQ](https://reactjs.org/docs/faq-styling.html)
- [You don't need CSS in JS - Why I use stylesheets](https://medium.com/dailyjs/you-dont-need-css-in-js-why-i-use-stylesheets-74a6e264e010)