# Passing data using `props`

## Learning Goals
- Examine how React allow components to manage data
- Use `props` between components
- Examine how `props` impact component rendering

## Overview
Props is one of the two ways that React components manage and share their data.

## `props`
Props are **passed from the outside of the component** into the component itself. Props are accessible using `this.props` within a component. Props cannot be changed from within the component. The closest parallel that we can see for `props` is constructor method parameters - props act like parameters being sent into Components when they are created.

#### Overview
- Can be assigned to any variable name you want
- Can contain any object or function you would like

#### Examples
**Syntax**

Component A's `render` function contains the following JSX:
`<ComponentB varName='value goes here'/>`
```javascript
// ComponentA.js
import React, { Component } from 'React';
import ComponentB from './components/ComponentB.js';

class ComponentA extends React.Component {
  render() {
    return (
      <ComponentB varName='value goes here'/>
    );
  }
}
```

From within Component B, you can now access this data using the `this.props.varName` variable.
```javascript
// ComponentB.js
class ComponentB extends React.Component {
  render() {
    return (
      <div>
        The data from props is: { this.props.vaName }
      </div>
    );
  }
}
```

**More Complex**

A fairly common thing to do is to utilize `props` to pass an event handler from a parent component to a child component. We'll see this in later examples.

## Key Takeaway
Using `props` within your React application is one necessary ways to manage and share data.

## Additional Resources
- [React Docs: Components and props](https://reactjs.org/docs/components-and-props.html)
