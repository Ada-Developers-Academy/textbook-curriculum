# Component Design

## Learning Goals
- Examine design patterns used by React developers
- Use the functional stateless components design pattern
- Use the container components with presentational components pattern

## Functional Stateless Components
- No lifecycle methods, only rendering
- Can utilize `props` but not `state`

These are used to simplify a component when designed so that its only purpose is to render HTML (or other components). These components can use a simplified arrow-function syntax since they don't need to be a fully functional `class`.

```JavaScript
const MyFunctionalComponent = (props) => {
  return <h1>This is just a header with this name: {props.name}</h1>;
}
```

Notice in the above example we can still pass in props into this component, but we access that variable directly from the variable passed in, rather than through `this` like we would with a class-based React component.

## Container Components with Presentational Components
We can utilize container components which will manage the flow of data to presentational components. Oftentimes presentation components are the same as functional stateless components.

![stateful components using stateless components](images/stateful-stateless-components.png)
<!-- https://drive.google.com/a/adadevelopersacademy.org/file/d/15lodApvgPRHN-aE5io1lYJgpdpWu9SuP/view?usp=sharing -->

## Vocabulary
| Term     | Definition     |
| :------------- | :------------- |
| Item One       | Item Two       |

## Key Takeaway
Description of one or two sentences with key takeaway.

## Additional Resources
- [Container Components](https://medium.com/@learnreact/container-components-c0e67432e005)
