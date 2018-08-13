# Passing data using `props`

## Learning Goals
- Examine how React allows components to manage data
- Use `props` between components
- Examine how `props` impact component rendering

## Overview
Props is one of the two ways that React components manage and share their data. `props` is short for _properties_.

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
        The data from props is: { this.props.varName }
      </div>
    );
  }
}
```

**More Complex**

A fairly common thing to do is to utilize `props` to pass an event handler from a parent component to a child component. We'll see this in later examples.

## Try it!

### Part 1: One Component
First, we want to use the `Student` component we already created, but we want to allow this to load data dynamically.

To do this, we will pass in the data from the `App` component to the `Student` component. Within the `Student` component, we will use the code tags to pull in the data that was passed in.

1. Locate the spot where the `Student` component is rendered from the `App` component.

1. Update the component rendering to include two new parameters by adding them in like this:  
    - `<Student fullName="Improved Ada" email="improved-ada@ada.co" />`
    - This shouldn't change anything yet in our application, so save the file and refresh the browser to verify that the data still looks like the original hard-coded data.

1. Update the `render` function in the `Student` component to replace the hard-coded values with code tags `{ }` which contains the `prop` that came in from the parent component.  
    - It should now contain `{ this.props.fullName }` and `{ this.props.email }`
    - Verify that the content displayed is now coming from the values in the `App` component


If we identify each individual piece of the component rendered, we'll see:
![component prop breakdown](images/component-prop-breakdown.png)

Prop names can be any variable you want them to be. In this particular case, we chose `fullName` and `email` to store our values.

Once the prop names are **passed in** to the component, we can then use them within the component. That's where `this.props` comes in!

### Part 2: Many Components

Next what we want to do is take an array of student data and create the `Student` components for each student in the array.

In our `App` component, we'll start with an array of student data like this:
```javascript
// App.js
render() {
  const students = [
      {
        fullName: 'Ada Lovelace',
        email: 'ada@ada.co'
      },
      {
        fullName: 'Grace',
        email: 'grace@ada.co'
      }
    ];
  ...
}
```

Then we are going to use the JavaScript `map` function to create a new component for each element within the array. Note: This is not a React-specific thing, you can use `map` in any JS code you want!

```javascript
const studentComponents = students.map((student, i) => {
  return <Student key={ i } fullName={ student.fullName } email={ student.email } />
});
```

**Take a moment** to review this code with your neighbor to understand what it is doing.

One thing to watch out for: we've given our `Student` a new prop, `key`. This is a React thing: whenever you have an array of several components like this, you need to give each a unique key. The `key` prop is not visible in our child component; React eats it. For now the index in the array (`i`) will work fine.

Lastly, we must put this new collection of `Student` components in our `render` function in order to see the results.

Replace `<Student fullName="Improved Ada" email="improved-ada@ada.co" />` with the variable `studentComponents` and examine the result.

## Key Takeaway
Using `props` within your React application is one necessary ways to manage and share data.

## Additional Resources
- [React Docs: Components and props](https://reactjs.org/docs/components-and-props.html)
- [MDN: JS map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
