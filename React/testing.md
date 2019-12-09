# Testing React Components

Here we will try to ensure that individual components work predictably by testing for unexpected changes to UI and how users interact with our components.  We will introduce two forms of testing unlike any we have done with Ruby, Snapshot testing & testing user interfaces.

## Learning Goals

By the end of this lesson you should be able to:

- Explain the terms _Snapshot Test_, and _shallow_ and _deep_ rendering
- Write tests to verify components exist and have not changed
- Write tests to verify callback functions are called on the correct events

## Getting Started

In this lesson we will be learning testing through the React pets project we worked on earlier.

You can clone [our implementation of the ada-pets project](https://github.com/AdaGold/ada-pets-react/tree/solution), if needed.

Once you have cloned the repository remember to run `yarn` to install the project dependencies, and to verify it with `yarn start` to start the application.

### Installing the React Testing Library

We will use the [React Testing Library](https://testing-library.com/docs/react-testing-library/intro), which is part of a larger testing framework for JavaScript called, creatively, [Testing Library](https://testing-library.com/).  This is a testing library that tries to simulate how end-users see the React App.  It is a library which is growing in popularity with the React and larger JavaScript community.

To run tests in React in guard-mode we'll need to first install watchman with `brew`.

```bash
$ brew install watchman
```

Then you can install the testing library with  `yarn`:

```bash
$ yarn add @testing-library/react @testing-library/jest-dom
```

**You will need to install the testing library every new React project you create.**

### Test Files

We will use the following pattern for our test files:

- Create a new folder `src/components/test`
- Each component `src/components/X.js` gets a test file `src/components/test/X.test.js`
- Jest should be able to automatically find and run any file ending in `.test.js` without us having to do any extra work

Run `mkdir src/components/test` now to create this folder.

## How to Run Tests

Create-react-app comes with Jest testing built in and in fact provides an initial test.  To run the test type:  `yarn test` and you will get a screen like this:

```bash
No tests found related to files changed since last commit.
Press `a` to run all tests, or run Jest with `--watchAll`.

Watch Usage
 › Press a to run all tests.
 › Press p to filter by a filename regex pattern.
 › Press t to filter by a test name regex pattern.
 › Press q to quit watch mode.
 › Press Enter to trigger a test run.
 ```

The test-runner will automatically run tests which have changed since the last save.  As you develop a React application, you can leave the tests running in a terminal tab and the tests will re-execute when you save files.

  **Press `a` now** to manually re-run all the existing tests.

 You should get the following:
 ```bash
 PASS  src/App.test.js
 ✓ renders without crashing (25ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        1.074s
Ran all test suites.

Watch Usage: Press w to show more.
```

Notice it ran a test named `renders without crashing` in the `src/App.test.js` file.

Open that file:

```javascript
// src/App.test.js

import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<App />, div);
  ReactDOM.unmountComponentAtNode(div);
});
```

The test manually creates a `div` element and embeds the `App` component within it.

Add a `  console.log(div.innerHTML);` after the `ReactDOM.render` command and look at what is output in the test window.

**Question**  What do you notice?

The default test in `App.test.js` first creates a `div` element which is **not** embedded in any webpage and then embeds an instance of the App component inside the `div`.  In this way it tests that the component can be rendered at all.  Lastly `ReactDOM.unmountComponentAtNode` destroys the instance to save memory.

This test doesn't actually make any assertions, there are no `expect(div).toBe(y)` commands, but it ensures that the component will show up on the screen without crashing React.

All of this uses the built-in React & Jest libraries to test the application.  Next we will use the React Testing Library to render components and verify that they behave as expected.

## Snapshot Testing

### What is it?

With React we often want to ensure that a component is rendering properly.  For our `NewPetForm` component we could write tests ensure that all the fields are rendering through tests that:

1.  Ensure that the component renders 4 input fields.
2.  Each field is labeled properly.
3.  Ensure there is a submit button
4.  and more and more and more...

However these tests are pretty fragile, easy to break when you make minor changes to the form and tedious to update for UI refactoring.

Instead we can:

1.  Convert the rendered html of the component into a file with the file holding the most significant features of the component.
2.  Compare future runs of the test to that snapshot and alert the user to any changes.

When a component changes, we can be alerted and make corrections, or update the snapshot for future test runs.

**Question:** Can you do TDD with a Snapshot test?

**Question:** When would a snapshot test be useful?

### Creating our First Snapshot

Let's create a snapshot test for one of our untested components, `NewPetForm`.

First create `src/components/test/NewPetForm.test.js`

```javascript
// src/components/test/NewPetForm.test.js
import React from 'react';
import { render, cleanup } from '@testing-library/react'
import NewPetForm from '../NewPetForm';

describe('NewPetForm', () => {
  test('that it matches the existing snapshot', () => {
    // Arrange-Act
    const { asFragment } = render(
      <NewPetForm
        addPetCallback={() => { }}
      />
    );

    // Assert
    expect(asFragment()).toMatchSnapshot();
    cleanup();
  });
});
```

In the above example we used the testing library's `render` function to create the snapshot.  You can read about `render` [in the library's documentation](https://testing-library.com/docs/react-testing-library/api#render).  The `render` function take the component, renders the html into a DOM provided by Jest and appends the rendered html, by default, to document.body.  

Now let's break the test, to make sure it's actually testing something.  Modify the `NewPetForm` component by adding a class attribute to one of the elements.  You should see something like this:

![Failed Snapshot](./images/failedSnapShot.png)

This is called a shapshot diff.  Notice the added content are highlighted in red with a `+` sign. In a real development scenario, this might indicate a bug, in which case you should go fix your code!

In our case the change to the rendered HTML is expected, which means we need to update the snapshot. You can do so snapshot with the `u` key. Update the snapshot now.

**Question:** After updating the snapshot take out the class name.  What does the snapshot diff look like now?

**Exercise** Create a test file and a test for the `PetCard` component.  Write a snapshot test for it.

You can see a solution on the testing branch of the repository.

<details>
  <summary>
  Take a look at the library's documentation.  What is "cleanup();" doing?  Is there a better way to use it?  If so, how?
  </summary>

  The cleanup function removes any elements rendered into the DOM Jest creates for the test.  So it's a good idea to run cleanup after any test involving a render.  

  You can also put this line inside a describe and outside any test block to run the cleanup function after any test.

  ```javascript
  afterEach(cleanup);
  ```
</details>

### Snapshots Files

You may wonder, "Where are these snapshots saved?"  You can see the snapshot file in your components folder.

![Snashot folder](./images/snapshotFolder.png)

**Question** What does the snapshot file look like?

Notice that the snapshot file looks a lot like the JSX rendered by the component, but it's a generated text file making it easier to compare to new snapshots.  You generally won't need to look at these files directly, but looking at the snapshot file should help you understand how Jest compares the current snapshot to the rendered content from the test.  It can also help you understand how a component is being rendered into HTML.  You should commit these files to git, so that other developers can use your snapshots in their testing.

This is kind of like the VCR cassette files you created when consuming APIs in Ruby.  VCR recorded the API recorded the API interactions into text files and could then replay them on demand.

### The Downside of Snapshot Testing

Snapshot testing has a few disadvantages.  First, small changes to a component can often cause them to fail, and because it's very easy to update a snapshot without looking closely, it's easy to miss scenarios where they report a serious bug.  Essentially they give a lot of false, failures and so get discounted.  Think of [the little boy who cried wolf](http://www.storyarts.org/library/aesops/stories/boy.html).

That said, they can be very quick to write and useful for unit-testing functional components which you do not expect to change much.  They can also give you a clearer picture of the rendered html a component results in.

## Selecting and Testing Rendered Content

Often we want to ensure specific content is rendered in a React component.  We want to find a specific element and verify that the content is set properly.  Maybe that it has the proper class, or that the text inside an element is correct.  Our testing library has a number of selectors we can use to find elements in our rendered component.  Each of these selectors will return an HTML Element object.

### Queries

| Method Name | Example | What it does |
|--- |--- |--- |
| getByLabelText | `getBy(container, 'Name')` | Searches for the label which matches the given text  and returns the element associated with the given label.  In `NetPetForm` this would be the input associated with the "Name" label. |
| getByPlaceholderText | `getByPlaceholderText(container, 'password')` | Searches for the first element with a placeholder element equal to the given value. |
| getByText | `getByText(container, /Select/i)` | Searches for the first element with text content matching the string or regular expression given. |
| getByAltText | `getByAltText(container, 'kitty pic')` | Searches for the first element with an `alt` attribute equal to the given string or regex. |
| getByTitle | `getByTitle(container, /Select/i)` | Searches for the first element with a `title` attribute like `<span title="Select" id="2"></span>` equal to the given value. |
| getByDisplayValue | `getByDisplayValue(container, /Ada/)` | Searches for the first `input`, `select` or `textarea` with the given display value.|
| getByRole | `getByRole(container, 'dialog')` | Searches for the first element with a `role` attribute equal to the given value like: `<div role="dialog"></div>` |
| ByTestId | `getByTestId(container, 'name-input')` | Searches for an HTML element with a `data-testid` attribute equal to the given value such as `<input name="name" id="name" data-testid="name-input" />` |

There are also other variations of the above query methods which can select all matching elements and can either return an empty array or raise an error if no matches are found.  

For our `PetCard` component we could write a test to verify that the Pet name is displayed properly.

```javascript
  // src/components/test/PetCard.test.js
  import { render, cleanup } from '@testing-library/react'

  // ... Other tests and imports

  test('It will render the proper name for the pet', () => {
    // Arrange & Act
    const container = render(<PetCard
      id={1}
      name={"Samson"}
      species={"Cat"}
      about={"A very awesome cat!  Don't touch the hair!"}
      location={"Seattle, WA"}
      deletePetCallback={() => { }}
      selectPetCallback={() => { }}
    />);

    // Assert
    expect(container.getByText(/Samson/)).toBeDefined();
  });
```

This test above simply verifies that "Samson" appears somewhere in the rendered HTML.  We could be more specific with our selector if we want to ensure that the element with this text has specific values or attributes.  

**Exercise**

Use `console.log` to output the result of: `container.getByText(/Seattle, WA/))`.  What does this give you when you run the tests?  What methods are available.  You can use VS Code's intellisense to put a period after `container.getByText(/Seattle, WA/)` and get a list of the attributes and methods available to that HTML Element.

<details>
  <summary>Try to write a test to verify that the tag enclosing the pet's location must have the className "pet-card--footer".</summary>

  You can do so with:  
  ```javascript
  expect(container.getByText(/Seattle, WA/).classList).toContain('pet-card--footer');
  ```
</details>

So far we have only used the `getByText` function, but we could use any of the earlier queries to find elements in our rendered component.  For example we could add an attribute called `data-testid` to a button in the React component and then select that element using our testing library's `getByTestId` query function.

## Event Handling

We can also write a test to verify that the callback functions are called when a button is clicked.

```javascript
// src/components/test/PetCard.test.js
test('The "selectPetCallback" function is called when the `select` button is clicked on', () => {

    // Arrange
    // Create a mock callback function
    const selectPet = jest.fn();

    // Render a PetCard
    const container = render(<PetCard
      id={1}
      name={"Samson"}
      species={"Cat"}
      about={"A very awesome cat!  Dont' touch the hair"}
      location={"Seattle, WA"}
      deletePetCallback={() => { }}
      selectPetCallback={selectPet}
    />);

    // Act
    // Find the "Select" button
    const selectButton = container.getByText(/Select/);
    // Trigger a 'click' event
    selectButton.click();

    // Assert
    // Verify that the callback function was called.
    expect(selectPet).toHaveBeenCalled();
  });
```

In the code above we:

1. First created a mock, callback function called `selectPet` using Jest.  This is a function that Jest can create for us which will track the number of times it has been called.  
   - You can read more about these in the [Jest Documentation](https://jestjs.io/docs/en/mock-functions). 
2. Second rendered a new `PetCard` component and passed in the `selectPet` function as the `selectPetCallback` prop.
3. Third Triggered a click event on the `select` button.
4. Lastly verified that the callback function was called.

**Exercise**

Write another, very similar, test to verify that the other button also calls the `deletePetCallback` prop.

## Summary

- Jest is included with React by default
- The React Testing Library is a library that provides more convenient testing syntax, as well as some advanced functionality.
  - This advanced functionality includes:
    - Rendering components for testing
    - Selecting elements in a rendered component.
    - Verifying that components contain specific content
    - Verifying that callback functions are called
- Snapshot testing allows you to detect when your component changes

## Resources

- [React Testing Library Documentation](https://testing-library.com/docs/react-testing-library/intro)
- [FreeCodeCamp React Testing with Jest](https://medium.com/p/b71c27b0a795#54c3)
