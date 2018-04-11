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

#### Overview
- Can be assigned to any variable name you want
- Can contain any object or function you would like

#### Examples
**Syntax**

Component A's `render` function contains the following JSX:
`<ComponentB varName='value goes here'/>`

From within Component B, you can now access this data using the `this.props.varName` variable.

**More Complex**

To add code to the value of the variable, use the JSX syntax for including code with the `{}`.

A fairly common thing to do is to utilize `props` to pass an event handler from a parent component to a child component. In the parent component, we could pass this function within a prop as follows:
`<ComponentB onChange={this.handleChange}`.

Then, within the child component, whenever that event needs to be triggered you could use `this.props.onChange`. *Note:* it is the name of the variable not the name of the function from the parent component.

## `state`
State is managed **within a given component**. State can be accessed using `this.state` and it can be modified using `this.setState()`.

#### Overview
- Can be assigned to any object key you want
- `setState` will always take an object as the parameter
- `setState` will merge any params passed in with the existing state data, it won't overwrite it
- We often set the initial state in the constructor function

A really important aspect of state is that whenever the state of a component is changed, it will be **updated**, calling the `render` function. For now, you can think of `setState` as doing the `setState` operation PLUS the `render` _automatically_. We'll learn even more about what else our component does when it is updated later on.

#### Examples

**Syntax**

Commonly, initial state is set in a component's constructor function. This is set using variable assignment (the equals sign).
```javascript
constructor() {
  super();
  this.state = {
    varNameOne: '',
    varNameTwo: false
  };
}
```

Once the initial state is set, we can then make changes  using the `setState` function. (**Note:** `setState` will work even if that state variable was not included in the initial `state` object.) This function will merge this object with the existing state object, overriding any existing values on the same variables.

```JavaScript
this.setState({ varNameOne: 'value goes here'});
```

When you need to use `state`, you use `this.state.varNameOne` to access the value. (**Note:** You cannot set a state variable using the `=` directly)

## With our powers combined...

Oftentimes `props` and `state` can be used to support each other. If data is stored in a parent component in `state`, the parent component can render the child component by passing in the `state` value as a prop. Then, the child component will have access to the relevant data but not be concerned with how that data is managed.

**Example**

In the parent component, pass a state value into the child component as a prop when it is rendered.

`<ComponentB myVariable={this.state.theVariable}`.

Then, within the child component, access that value using `this.props.myVariable`.


## Changing `props` and `state`
Here is a helpful chart to assist you in determining whether data belongs in `props` or `state`. For any line item that has "Yes" for both, it means you need to make that decision based on the context of the problem you are trying to solve.

 -     | props     | state
 :------------- | :------------- |:-------------
Can get initial value from parent component?       | Yes   | Yes
Can be changed by parent component? | Yes | No
Can change inside component? | No | Yes
Can set initial value for a child component? | Yes | Yes
Can change in a child component? | Yes | No 

## Key Takeaway
- sample

## Additional Resources
- [sample]()
