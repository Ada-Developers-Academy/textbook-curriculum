# React

## Week 1

1.  [Intro to React](intro-to-react.md)
1.  [Hello World](react-hello-world.md)
    - [Exercise](exercises/intro-to-react.md)
1.  [Creating Components](creating-components.md)
    - [Exercise: Identifying Components](exercises/identifying-components.md)
    - [Worksheet: Building Basic and Nested Components](exercises/components-worksheet.md)
1.  [`props`](props.md)
1.  [Styling](styling.md)
1.  [Prop-Types](prop-types.md)
1.  [Class Components](class-components.md)
1.  [`state`](state.md)
1.  [Event Handling](events.md)
1.  [Event Handling with Nested Components](nested-event-handling.md)

## Week 2

1.  [Forms](forms.md)
    - [Exercise: controlled forms](exercises/forms-worksheet.md)
1.  [Advanced Forms](forms-advanced.md)
1.  [Testing](testing.md)
1.  [APIs: Get](apis-get.md)
1.  [APIs: Post](apis-post.md)

## Naming and Organization Conventions

Situation       | Rule | Example
---             | ---  | ---
Component names | PascalCase | `StudentCollection`
Component files | Each component gets its own file. The file should have the same name as the component. | `components/StudentCollection.js`
Styles          | The top-level element in the component gets a class that matches the component name. All styles for that component should reference that class | `<div className="student-collection">`
CSS files       | Each component gets a separate stylesheet, in the same directory as the component, with the `.css` extension | `components/StudentCollection.css`
Test files      | Each component gets a separate test file, in the same directory as the component, with the `.test.js` extension | `components/StudentCollection.test.js`
Function to modify state | Instance method (arrow function), named based on the business logic it performs | `addStudent`, `markPresent`
Callback passed into props | Same name as the original with `Callback` appended | `addStudentCallback`, `markPresentCallback`
Handler for a DOM event | Instance method (arrow function) on the corresponding component, with a name that indicates DOM element and event name | `onFormSubmit`, `onPresentButtonClick`
