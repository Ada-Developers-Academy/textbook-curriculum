# useEffect & The React Lifecycle

## Learning Goals

By the end of this lesson you should be able to:

- Describe the lifecycle stages of a React component
- Use the `useEffect` hook to load content after a component has mounted
- Use the `useEffect` hook to run a callback function after state has changed

## Stages in React Lifecycle

Traditionally the lifecycle of a React component can be described by this drawing.

![React Lifecycle simplified](lifecycle-phase-diagram-06-2018-simplified.png)
<!-- Source: http://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/ -->

The lifecycle of a component has three stages.

1.  **Mounting** - When the component gets added to the DOM the first time.
1.  **Updating** - When props or state changes and the component must be re-rendered.
1.  **Unmounting** - When the component is removed from the DOM.

### Mounting

When a component is first added to the DOM, it is constructed, an instance is created, and it's function is called.  Then React uses the rendered JSX to update the HTML.  At that point a we often want to do setup work in a stage called `componentDidMount` to do things like load data from an external source like an API.

**Question**:  Why not load data from the API directly in our component's main function?  

<details>
  <summary>Our answer</summary>

  We could, but then the API or other request would run **every** time our function was called.  Further the API call might delay the rendering of our component leading to the app "hanging," and not responding to the user.  

  It is much more advantageous to make any API calls asychronously after the app is fully rendered on the screen.  The user gets immediate feedback that the page is loaded and data can appear as it is retrieved.
</details>

We can provide React a function to run when it is in the `componentDidMount` stage by using the `useEffect` hook as follows.

```javascript
useEffect( /* Function to run when the component is mounted */  () => {  
    // Code to run upon mount
  },
    [] /* Empty Array indicates to run this once when the component is mounted. */
);
```

### Updating

When props or state changes the component is re-rendered on the screen.  We can watch for props or state variables and when they change we can use the `useEffect` hook to run a function when those variables change.  

So if we wanted to run a function when our `students` state variable changes we could do:

```javascript
useEffect( /* Function to run when the `students` change */  () => {  
    // Code to run when it changes
  },
    [students] /* List of variables to watch and run the callback when they change. */
);
```

### Unmounting

When a component is unmounted or removed from the DOM, sometimes you want to do operations like:

1.  Save information to an external resource prior to exit
1.  Cancel any pending API requests that haven't returned yet

To provide a cleaup method for unmounting your `useEffect` callback function should return a function to call when the component is unmounted.

```javascript
useEffect( /* Function to run when the component is mounted */  () => {  
    // Code to run upon mount

    return /* Function to run on unmount */ () => {
      // Cleanup code here

    };
  },
    [] /* Empty Array indicates to run this once when the component is mounted. */
);
```

## useEffect with LocalStorage

Currently every time our application restarts any students we add dissapear.  This is because we are not storing the list of students in any database or other long-term storage.  We can use a feature of the browser called [localStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage).  Localstorage allows us to save key-value pairs in the browser to access when the JavaScript application restarts.

### Loading Data from Local Storage

We want to check localstorage for a list of students when our application starts up.  So we can use the `useEffect` hook.

First we will import the `useEffect` hook.

```javascript
import React, { useState, useEffect } from 'react';
```

Instead of pulling the information from a static array we can use localStorage.  The code below will, after App is initially rendered access local storage and try to find a key `studentList`, if that key is found it converts the value into an array with `JSON.parse` and updates the state.  If the key does not exist, it uses the initial array.

```javascript
// src/App.js
// ...

const App = () => {
  console.log('rendering');
  const [studentList, setStudentList] = useState([]);

  useEffect(() => {
    // get the studentList from localstorage
    const jsonStudentList = localStorage.getItem('studentList');
    // Convert the json into an Array, if it's null use the students array.
    const startingStudents = JSON.parse(jsonStudentList) || students;

    // Use the local storage to update state
    setStudentList(startingStudents);
  }, []);

  // ...
```

Notice above that the 2nd parameter to `useEffect` is an empty array `[]`.  This indicates that the callback function will be run **once** after the component is first mounted and rendered.  We will see a way to make the function run every time the component updates next.

### Saving Data to local storage

We can also set up a similar hook to execute every time the `studentList` is updated and save the results to local storage.  Notice below that the 2nd parameter to `useEffect` is an array with `studentList` inside it.   That tells React to call the function whenever `studentList` changes.  This field has to be a prop or state variable, something which could cause the component to re-render.

```javascript
  useEffect(() => {
    localStorage.setItem('studentList', JSON.stringify(studentList));
  }, [studentList]);
```

So the function above runs on the `update` stage whenever the `studentList` state variable changes.  We could even add the functionality to remove studnets from the list and this hook would automatically remove the students from localstorage as well.

**Question** Open the app in a different browser.  Do you see the same list?  Why or why not?

<details>
  <summary>Answer</summary>

  By saving data into local storage we are saving the information into the **current browser's** local storage.  The information saved is specific to that browser.  If we want to save data for other browswers and people to access, we will need to use an API.
</details>

## Cleanup Actions

We do not, for now have a good example of this, but if you want to execute a function when the component is unmounted, you can add a return value to your `useEffect` callback functions.

For example if we wanted to save to localStorage when the App component is removed from the DOM.

```javascript
// src/App.js
// ...

const App = () => {
  console.log('rendering');
  const [studentList, setStudentList] = useState([]);

  useEffect(() => {
    // get the studentList from localstorage
    const jsonStudentList = localStorage.getItem('studentList');
    // Convert the json into an Array, if it's null use the students array.
    const startingStudents = JSON.parse(jsonStudentList) || students;

    // Use the local storage to update state
    setStudentList(startingStudents);

    // Cleanup function
    return () => {
      // cleanup actions here

      localStorage.setItem('studentList', JSON.stringify(studentList));
    }
  }, []);

  // ...
```

This cleanup function could be used to cancel any actions, like a call to `setIterval` to stop any running actions/routines as the component is removed.

## Summary

The `useEffect` hook allows us to specify a function to run 

## Resources

- [Using the Effect Hook](https://reactjs.org/docs/hooks-effect.html)
- [JavaScript in Plain English _React Hooks: How to use useEffect()_](https://medium.com/javascript-in-plain-english/react-hooks-how-to-use-useeffect-ecea3e90d84f)
