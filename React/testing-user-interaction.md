# Testing - Selecting Content & Simulating User Interaction

In the previous lesson we wrote tests to ensure that content is rendering for a component and snapshot tests to alert us to changes in the rendered DOM.  Now we will write tests to verify that our components respond to user interaction properly.  

To do so we will learn how to select DOM elements, trigger events on them and test that the component responds properly.

## Learning Goals

By the end of this lesson you should be able to:

- Use the testing library's methods to select rendered DOM elements
- Simulate User interactions like click and change events
- Write tests to ensure that callback functions are called correctly

## Selecting and Testing Rendered Content

Often we want to ensure specific content is rendered in a React component.  We want to find a specific element and verify that the content is set properly.  Maybe that it has the proper class, or that the text inside an element is correct.  Our testing library has a number of selectors we can use to find elements in our rendered component.  Each of these selectors will return an [HTML Element object](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement).

### Queries

| Method Name          | Example                                       | What it does                                                                                                                                                                                 |
| -------------------- | --------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| getByLabelText       | `getBy(container, 'Name')`                    | Searches for the label which matches the given text  and returns the element associated with the given label.  In `NewStudentForm` this would be the input associated with the "Name" label. |
| getByPlaceholderText | `getByPlaceholderText(container, 'password')` | Searches for the first element with a placeholder element equal to the given value.                                                                                                          |
| getByText            | `getByText(container, /Select/i)`             | Searches for the first element with text content matching the string or regular expression given.                                                                                            |
| getByAltText         | `getByAltText(container, 'kitty pic')`        | Searches for the first element with an `alt` attribute equal to the given string or regex.                                                                                                   |
| getByTitle           | `getByTitle(container, /Select/i)`            | Searches for the first element with a `title` attribute like `<span title="Select" id="2"></span>` equal to the given value.                                                                 |
| getByDisplayValue    | `getByDisplayValue(container, /Ada/)`         | Searches for the first `input`, `select` or `textarea` with the given display value.                                                                                                         |
| getByRole            | `getByRole(container, 'dialog')`              | Searches for the first element with a `role` attribute equal to the given value like: `<div role="dialog"></div>`                                                                            |
| ByTestId             | `getByTestId(container, 'name-input')`        | Searches for an HTML element with a `data-testid` attribute equal to the given value such as `<input name="name" id="name" data-testid="name-input" />`                                      |

There are also other variations of the above query methods which can select all matching elements and can either return an empty array or raise an error if no matches are found.  

For our `Student` component we could write a test to verify that the student name is displayed properly.

```javascript
  // src/components/test/Student.test.js
  import { render, cleanup } from '@testing-library/react'

  // ... Other tests and imports

  test('The fullName field renders properly', () => {

    const { getByText } = render(<Student
      fullName="Ada Lovelace"
      email="Ada@adadev.org"
      birthday="10 December 1815"
      present={true}
      onUpdateStudent={() => { }}
    />);

    const element = getByText(/Ada Lovelace/i);
    expect(element).toBeInTheDocument();
  });
```

This test above simply verifies that "Ada Lovelace" appears somewhere in the rendered HTML.  We could be more specific with our selector if we want to ensure that the element with this text has specific values or attributes.  If the library can't find the text, it will throw an exception.

**Exercise**

The selectors in the testing library return HTML elements.  Look at the [MDN documentation](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement) for HTMLElement and identify:

1.  What are some methods that look useful when testing user interaction?
2.  What events can an HTML Element respond to?
3.  Are there any other useful properties?


<details>
  <summary>Try to write a test to verify that the tag enclosing the Student's birthdate must have the className "Student--footer".</summary>

  You can do so with:  
  ```javascript
  expect(container.getByText(/10 December 1815/).classList).toContain('Student--footer');
  ```
</details>

So far we have only used the `getByText` function, but we could use any of the earlier queries to find elements in our rendered component.  For example we could add an attribute called `data-testid` to a button in the React component and then select that element using our testing library's `getByTestId` query function.

## Event Handling

We can also write a test to verify that the callback functions are called when a button is clicked.

```javascript
// src/components/test/Student.test.js
test('The "onUpdateStudent" prop function is called when the `Mark Absent` button is clicked on', () => {

    // Arrange
    // Create a mock callback function
    const markAbsent = jest.fn();

    // Render a Student
    //   note the markAbsent callback function
    const container = render(<Student
      fullName="Ada Lovelace"
      email="Ada@adadev.org"
      birthday="10 December 1815"
      present={true}
      onUpdateStudent={markAbsent}
    />);

    // Act
    // Find the Mark Absent Button
    const button = container.getByText(/Mark Absent/i);

    // Trigger a click event
    button.click();

    // Assert
    // Verify that the callback function was called
    expect(markAbsent).toHaveBeenCalled();
  });
```

In the code above we:

1. First created a mock, callback function called `markAbsent` using Jest.  This is a function that Jest can create for us which will track the number of times it has been called.  
   - You can read more about these in the [Jest Documentation](https://jestjs.io/docs/en/mock-functions). 
2. Second rendered a new `Student` component and passed in the `markAbsent` function as the `onUpdateStudent` prop.
3. Third Triggered a click event on the `select` button.
4. Lastly verified that the callback function was called.

**Exercise**

Write another, very similar, test to verify that changing the fullName input will trigger `onUpdateStudent`.

## NewStudentForm

We can build a set of tests for user interaction with a nice helper method called `setup`.

```javascript
describe('User Interaction', () => {
    // render the form and get the inputs & button
    const setup = () => {
      const addStudentCallbackMock = jest.fn(() => { });
      const utils = render(<NewStudentForm addStudentCallback={addStudentCallbackMock} />);
      const fullNameInput = utils.getByLabelText('Name:');
      const emailInput = utils.getByLabelText('Email:')
      const submitButton = utils.getByText('Add Student');

      return {
        ...utils,
        addStudentCallbackMock,
        fullNameInput,
        emailInput,
        submitButton,
      }
    }

    // ... tests below
});
```

The `setup` method above renders the `NewStudentForm` component and returns an object with the testing functions (findByText etc), the callback function for when the form is submitted, and the form elements.

Then we can use that method in a test to make sure the `fullName` input responds correctly.

```javascript
    test('Typing on the fullName field changes the input', () => {
      // Arrange
      const formData = setup();
      const simulatedEvent = {
        target: {
          value: 'Grace Hopper',
        },
      };

      // Act
      // put 'Grace Hopper' in the input field
      fireEvent.change(formData.fullNameInput, simulatedEvent);

      // Assert
      expect(formData.fullNameInput.value).toBe('Grace Hopper');
    });
```

**Exercise** Write a test to make sure the callback function is called when the form is filled out.  To make it easier you can add a `data-testid` attribute to the form.

```jsx
    <form
      className="new-student-form"
      onSubmit={onFormSubmit}
      data-testid="NewStudentForm--form"
    >
```

Then you can select the form with `getByTestId('NewStudentForm--form')`.

<details>
  <summary>When you are ready you can see our example</summary>

  ```javascript
    test('The callback function is called correctly when the form is submitted', () => {
      // Arrange
      const formData = setup();

      // Acting
      fireEvent.change(formData.fullNameInput, { target: { value: 'Grace Hopper', }, })
      fireEvent.change(formData.emailInput, { target: { value: 'grace@hopper.com', }, })
      fireEvent.click(formData.submitButton);

      expect(formData.addStudentCallbackMock).toHaveBeenCalled();
      expect(formData.fullNameInput.value).toBe('');
      expect(formData.emailInput.value).toBe('');
    });
  ```
</details>

## Summary

In this lesson we looked at how you can select elements in the DOM and then simulate user interaction by triggering events such as `click` and `change`.  We could then verify that the contents of DOM nodes changed and that callback functions are called properly.  

If this seems a complicated and difficult topic.  YES it is.  Testing, however, can be a worthwhile exercise to gain confidence in the performance of your code and an understanding of how the tested code performs.

## Resources

- [Youtube: React unit testing with Jest & React-testing-library](https://www.youtube.com/watch?v=3e1GHCA3GP0)
- [React Testing Library Docs](https://testing-library.com/docs/react-testing-library/intro)
- [CSS Tricks: Getting Started with React Testing Library](https://css-tricks.com/getting-started-with-react-testing-library/)
