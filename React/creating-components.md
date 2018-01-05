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

### Loading a Component into Another


### Customize our Component 

## Vocabulary
| Term     | Definition     |
| :------------- | :------------- |
| Item One       | Item Two       |

## Key Takeaway
Description of one or two sentences with key takeaway.

## Additional Resources
- [sample]()
