# Passing data using `props`

## Learning Goals
- Examine how React allows components to manage data
- Use `props` between components
- Examine how `props` impact component rendering

## Overview
Props is one of the two ways that React components manage and share their data. `props` is short for _properties_.

Props are **passed from the outside of the component** into the component as an argument. Props cannot be changed from within the component. The closest parallel that we can see for `props` is constructor method parameters - props act like parameters being sent into Components when they are created.

In short, props:
- Can be assigned to any variable name you want
- Can contain any object or function you would like

### Syntax

Component A's `render` function contains the following JSX:
`<ComponentB varName='value goes here'/>`
```javascript
// ComponentA.js
import React, { Component } from 'React';
import ComponentB from './components/ComponentB.js';

const ComponentA = () => {
    return (
      <ComponentB varName='value goes here'/>
    );
};
```

From within Component B, you can now access this data using the `props.varName` variable.
```javascript
// ComponentB.js
const ComponentB = (props) => {
  return (
    <div>
      The data from props is: { props.varName }
    </div>
  );
};
```

**More Complex**

A fairly common thing to do is to utilize `props` to pass an event handler from a parent component to a child component. We'll see this in later examples.

## Try it!

### One Component
First, we want to use the `Student` component we already created, but we want to allow this to load data dynamically.

To do this, we will pass in the data from the `App` component to the `Student` component. Within the `Student` component, we will use the code tags to pull in the data that was passed in.

1. Locate the spot where the `Student` component is rendered from the `App` component.

1. Update the component rendering to include two new parameters by adding them in like this:  
    - `<Student fullName="Improved Ada" email="improved-ada@ada.co" />`
    - This shouldn't change anything yet in our application, so save the file and refresh the browser to verify that the data still looks like the original hard-coded data.

1. Update the `Student` component function to take one argument, called `props`:
    ```js
    const Student = (props) => {
      // ...
    }
    ```
    All the data we passed in from the parent component will be stored inside the `props` argument

1. Update the JSX returned by the `Student` function to replace the hard-coded values with code tags `{ }` which contains the `prop` that came in from the parent component.  
    - It should now contain `{ props.fullName }` and `{ props.email }`
    - Verify that the content displayed is now coming from the values in the `App` component


If we identify each individual piece of the component rendered, we'll see:

![component prop breakdown](images/component-prop-breakdown.png)

Prop names can be any variable you want them to be. In this particular case, we chose `fullName` and `email` to store our values.

Once the prop names are **passed in** to the component, we can then use them within the component. That's where `props` comes in!

### Many Components

#### Adding an Intermediate Component

One student is great and all, but ideally our app should be able to manage our whole list of students. We'd also like to do this _outside_ of the `App` component, because what if our application also tracks Teachers, or Assignments?

To achieve this _separation of concerns_, we'll create a new component called `StudentCollection` that will live between the existing  `App` and `Student` components. When we're done, this new component will manage the full list of students. To start, we'll make it render a "list" of only one student.

**This diagram will drive our overall approach for accomplishing this goal:**
![nested components](images/nested-components.png)
<!-- https://drive.google.com/open?id=1xq5jaCrI7FGp6PG1gr-bYE1ZTvPb5PxZ -->

1. Spend a few minutes now going back to the [creating components](creating-components.md) notes to see how to create a new component
    - What should the file be called?
    - What needs to be imported and exported?
    - What should the component function return?
    - Does the component function need any props?

1. Move the code that renders a `Student` from `App` to `StudentCollection`
    - Render the `Student` in an `<li>` inside a `<ul>` element
    - You will also need to move and update the `import` statement

1. Import and render `StudentCollection` in the `App` component
    - You will need to add an import statement

When you're finished, your `StudentCollection` component should look like this:

```js
// src/components/StudentCollection.js
import React from 'react';

import Student from './Student';

const StudentCollection = () => {
  return (
    <ul className="student-collection">
      <li>
        <Student fullName="Improved Ada" email="improved-ada@ada.co" />
      </li>
    </ul>
  );
};

export default StudentCollection;
```

At this point your app should look almost exactly the same as it did before, except the student info will be behind a bullet point.

#### Rendering a List of Students

Now instead of one student, we will render information about a whole list of students. We will keep the information about the students in an array in our `StudentCollection` component, and render a `Student` component for each element in the array.

In our `StudentCollection` component, we'll create an array of student data like this:

```javascript
// src/components/StudentCollection.js
const StudentCollection = () => {
  const students = [
    {
      fullName: "Ada Lovelace",
      email: "ada@lovelace.uk",
    },
    {
      fullName: "Katherine Johnson",
      email: "kat@nasa.gov",
    },
  ];
  // ... the return statement and JSX that was here before ...
};
```

Then we are going to use the JavaScript `map` function to create a new component for each element within the array. Note: This is not a React-specific thing, you can use `map` in any JS code you want!

```javascript
// src/components/StudentCollection.js
const StudentCollection = () => {
  const students // ... array ...

  const studentComponents = students.map((student, i) => {
    return (
      <li key={i}>
        <Student fullName={ student.fullName } email={ student.email } />
      </li>
    );
  });

  return // ... JSX ...
};
```

**Take a moment** to review this code with your neighbor to understand what it is doing. Question: what would this code look like if we used `forEach` instead of `map`?

One thing to watch out for: we've given our `<li>` element a new prop, `key`. This is a React thing: whenever you have an array of several components like this, you need to give each a unique key. The `key` prop is not visible in our child component; React eats it. For now the index in the array (`i`) will work fine.

Lastly, we must put this new collection of `Student` components in our `render` function in order to see the results.

Replace `<Student fullName="Improved Ada" email="improved-ada@ada.co" />` with the variable `studentComponents` and examine the result. Use Chrome's dev tools to inspect the generated HTML. Does it look like you expected?

## Key Takeaway

Using `props` within your React application allows you to pass data from a parent component into a child component.

## Additional Resources
- [React Docs: Components and props](https://reactjs.org/docs/components-and-props.html)
- [MDN: JS map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
