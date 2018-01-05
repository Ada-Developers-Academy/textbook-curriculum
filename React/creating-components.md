# Creating Components

## Learning Goals
- Create our own component
- Link and render a component from an existing component

Now that we've gotten started with a basic React application, we want to be able to extend it with our own components.

### Overview
It is important to understand what is happening currently within the React application so we can model the same pattern with a custom component. Right now, our React application renders the `App` component from the `index.js` file, and puts it in the DOM element where the ID is "root". Then, our App component contains a render function will which render a `header` and a `p` using JSX syntax.

The powerful thing about React is that **any component can render any other component**. That is, we can (and should) nest our components within one another to create the most effective React application design.

### Create a new Component
React does not have a nice CLI interface like Rails to create new components for us. We will be creating these manually by creating new files, importing the necessary libraries, and adding the necessary component code.

1. Create a new folder called `components` where we'll store all of our custom components. This should be under the existing `src` directory.

1. Create a new file in this new folder called `list_component.js`

1. In this new file, import the React and Component libraries:
    ```javascript
    import React, { Component } from 'react';
    ```

1. Create the class definition with the name of the component you want to create. Note that this does not need to match the file name.
    ```JavaScript
    class ListComponent extends Component {

    }
    ```

1. Export the class at the bottom of the file. Note that whatever is exported here needs to match the name of the class created in the step above.
    ```JavaScript
    export default ListComponent;
    ```

1. **QUICK BREAK!** Check in with your seat squad to verify that they are at the same place in setting up their component file.

### Customize our Component

1. **EXERCISE:** With your seat squad, add some JSX elements to a `render()` function that you add to this component. We can't fully test it out quite yet, but you can make sure that your React application compiles and does not show you any errors in the browser as confirmation of success. For now, don't worry too much about what you are adding, just try anything!

### Loading a Component into Another
1. In our `app.js` file, we will load our new component. Add the file `import` to the top.
    ```JavaScript
    import ListComponent from './components/list_component';
    ```

1. Now we can render our `ListComponent` within our App component. Add `<ListComponent />` to the existing render function in the App component. Note that the render function can only return one outermost element, so the new component must be **nested within** that outermost element.

1. Verify! Take a look now at your React application running in the browser and ensure that you see the elements you added within your list component.


## Key Takeaway
Nesting components within one another is the most powerful construct of React. You will structure much of your applications using this paradigm, applying additional patterns and skills to it as you learn.

## Additional Resources
- [sample]()
