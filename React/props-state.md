# `props` & `state`

## Learning Goals
- Examine how React allow components to manage data
- Use `props` between components
- Use `state` within a component
- Impacts of both to component rendering

## Overview
Props & State are the two ways that React components manage and share their data.

## `props`
Props are **passed from the outside of the component** into the component itself. Props are accessible using `this.props` within a component. Props cannot be changed from within the component who received the prop values.

Overview:
- Can be assigned to any variable name you want
- Can contain any object or function you would like

## `state`
State is managed **within a given component**. State can be accessed using `this.state` and it can be modified using `this.setState()`.

Overview:
- Can be assigned to any object key you want
- `setState` will always take an object as the parameter
- `setState` will merge any params passed in with the existing state data, it won't overwrite it
- We often set the initial state in the constructor function

A really important aspect of state is that whenever the state of a component is changed, it will be **updated**, calling the `render` function. For now, you can think of `setState` as doing the `setState` operation PLUS the `render` _automatically_. We'll learn even more about what else our component does when it is updated later on.

## With our powers combined...

Oftentimes `props` and `state` can be used to complement each other. If data is stored in a parent component as `state`, the parent component can render the child component by passing in the `state` value as a prop. Then, the child component will have access to the relevant data but not be concerned with how that data is managed.

<!-- Diagram here of that example -->

## Vocabulary
| Term     | Definition     |
| :------------- | :------------- |
| Item One       | Item Two       |

## Key Takeaways
- sample

## Additional Resources
- [sample]()
