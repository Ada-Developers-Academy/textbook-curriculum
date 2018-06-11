# Lifecycle Methods

## Learning Goals
- Learn about the three phases: mount, update and unmount
- Learn each method within the three phases
- Practice utilizing a few common lifecycle methods in a React app

### Overview
React provides us with methods tied into the lifecycle of each component we use. We can use these to fully control what happens when each small portion of our application renders, before the component renders, after the component renders and once it has disappeared altogether.   

![Lifecycle Diagram](images/lifecycle-diagram.png)
[**Source**: Article Linked in Additional Resources Below]

### Methods within each phase

Overall Phase | Description
:------------ | :-----------
Mount | Initial component creation
Update | After a component is created, these methods will be called when React believes a component will be updated
Unmount | When your application no longer needs the component

The above diagram shows how each lifecycle method exists in flow with one another, but let's see another diagram that will map to the overall phase and show us how `render` also fits in.

![Lifecycle Phase Diagram](images/lifecycle-phase-diagram.png)
<!-- https://drive.google.com/file/d/1hcuLdozEUkJY6mc5cB-xzCqEDIar_SfV/view?usp=sharing -->

### `componentDidMount`
This is one of the most commonly used lifecycle methods in React, so we are going to explicitly try this out. We use this method to load in any external data from an API that we might need.

Though we aren't yet integrating with any APIs, let's add this method and some corresponding data retrieval within our student management application.

First, let's ask ourselves, **where is the data populated in our application?**

We'll find the initial state set in the `constructor` of our `StudentCollection` component. Let's remove this data, and instead use the `componentDidMount` lifecycle method to load in our data.

```javascript
// student_collection.js
...

constructor() {
  super();

  // now just set to default empty array
  this.state = { students: [] }
}

componentDidMount() {
  this.setState({ students: fetchStudents() }));
}

...

// this is just a placeholder for a real request
// make sure to put this OUTSIDE the component definition
const fetchStudents = () =>
  ([
    { name: "A Student", email: "4321@ada.org" },
    { name: "B Student", email: "1234@ada.org" }
  ]);

```

**Key Question**: Why do you think we use `componentDidMount` to load the data rather than `componentWillMount`? How is this working?

While this might not seem super useful yet, we'll see when we get to using APIs how we'll leverage the lifecycle to ensure we are loading our app and it's data efficiently.

## Vocabulary
| Term     | Definition     |
| :------------- | :------------- |
| Lifecycle Method       | A method that we can utilize within a React component which will trigger at certain points of the component lifecycle       |
| Mounting | Triggers when a component renders for the first time |
| Update | Triggers when a component will be updated |
| Unmounting |Triggers when a component will be removed from the DOM |

## Key Takeaway
- To further manage data within your components, you should utilize lifecycle methods in React to tie into the important events for a given component.

## Additional Resources
- [React Lifecycle Methods and When to Use Them](https://engineering.musefind.com/react-lifecycle-methods-how-and-when-to-use-them-2111a1b692b1)
- [React Docs: State and Lifecycle](https://reactjs.org/docs/state-and-lifecycle.html)
