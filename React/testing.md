# Testing React Components

Here we will try to ensure that individual components work predictably by testing for unexpected changes to UI and how users interact with our components.  We will introduce two forms of testing unlike any we have done with Ruby, Snapshot testing & testing user interfaces.

## Learning Goals

By the end of this lesson you should be able to:

- Explain the terms _Snapshot Test_, and _shallow_ and _deep_ rendering
- Write tests to verify components exist and have not changed
- Write tests to verify callback functions are called on the correct events

## Getting Started

In this lesson we will be learning testing through the Ada Students project we worked on earlier.

You can clone [our implementation of the ada-students project](https://github.com/AdaGold/ada-students/tree/9-testing-before), if needed.  Make sure to run

```bash
$ git checkout 9-testing-before
```

To check out the solution branch.

Once you have cloned the repository remember to run `npm install` to install the project dependencies, and to verify it with `npm start` to start the application.

### Installing the React Testing Library

We will use the [React Testing Library](https://testing-library.com/docs/react-testing-library/intro), which is part of a larger testing framework for JavaScript called, creatively, [Testing Library](https://testing-library.com/).  This is a testing library that tries to simulate how end-users see the React App.  It is a library which is growing in popularity with the React and larger JavaScript community.

In fact, in the past we had to install the testing library separately every time we created a new project with `create-react-app`, but now it comes bundled with `create-react-app`!  We will need to install watchman to run tests in guard mode (like Guard with Ruby).

To run tests in React in guard-mode we'll need to first install watchman with `brew`.

```bash
$ brew install watchman
```

### Test Files

We will use the following pattern for our test files:

- Create a new folder `src/components/test`
- Each component `src/components/X.js` gets a test file `src/components/test/X.test.js`
- Jest should be able to automatically find and run any file ending in `.test.js` without us having to do any extra work

Run `mkdir src/components/test` now to create this folder.

## How to Run Tests

Create-react-app comes with Jest testing built in and in fact provides an initial test.  To run the test type:  `npm run test` and you will get a screen like this:

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
 ... big error message

Test Suites: 1 failed, 1 total
Tests:       1 failed, 1 total
Snapshots:   0 total
Time:        3.34s
Ran all test suites.

Watch Usage: Press w to show more.
```

**OMG!!!** We're already failing a test!   That test file is `src/App.test.js`.

Open that file:

```javascript
// src/App.test.js

import React from 'react';
import { render } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  const { getByText } = render(<App />);
  const linkElement = getByText(/learn react/i);
  expect(linkElement).toBeInTheDocument();
});
```

The test manually renders the `App` component and then tries to get some text with the words "learn react".

Hmmm... we deleted that text...  

**Question**  What do you notice?  What do you think is happening here?

<details>
  <summary>Walkthrough</summary>
1.  The default test in `App.test.js` first renders an instance of the `App` component in a simulated DOM.  
2.  Once the component is rendered it returns a `RenderResult` object which has a bunch of properties.
3.  We pull the `getByText` function from the `RenderResult` by using [destructuring](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment).
4.  Then we try to find an element inside the `App` component with the regular expression `/learn react/i`.
5.  Lastly we have an expectation that element exists... but it doesn't
</details>

Modify the test so that it searches for text which we **have** added to the App component.

## Snapshot Testing

### What is it?

With React we often want to ensure that a component is rendering properly.  For our `NewStudentForm` component we could write tests ensure that all the fields are rendering through tests that:

1.  Ensure that the component renders 2 input fields.
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

Let's create a snapshot test for one of our untested components, `NewStudentForm`.

First create `src/components/test/NewStudentForm.test.js`

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

Now let's break the test, to make sure it's actually testing something.  Modify the `NewStudentForm` component by adding a class attribute to one of the elements.  You should see something like this:

![Failed Snapshot](./images/failedSnapShot.png)

This is called a shapshot diff.  Notice the added content are highlighted in red with a `+` sign. In a real development scenario, this might indicate a bug, in which case you should go fix your code!

In our case the change to the rendered HTML is expected, which means we need to update the snapshot. You can do so snapshot with the `u` key. Update the snapshot now.

**Question:** After updating the snapshot take out the class name.  What does the snapshot diff look like now?

**Exercise** Create a test file and a test for the `Student` component.  Write a snapshot test for it.

You can see a solution on the [testing branch of the repository](https://github.com/AdaGold/ada-students/tree/9-testing-after).

<details>
  <summary>
  Take a look at the [library's documentation](https://testing-library.com/docs/react-testing-library/api#cleanup).  What is "cleanup();" doing?  Is there a better way to use it?  If so, how?
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

## Summary

- Jest is included with React by default
- The React Testing Library is a library that provides more convenient testing syntax, as well as some advanced functionality.
  - This advanced functionality includes:
    - Rendering components for testing
    - Selecting elements in a rendered component.
    - Verifying that components contain specific content
    - Verifying that callback functions are called
- Snapshot testing allows you to detect when your component changes, but can lead to a number of false-positives

In the next lesson we will look at how to test how a react component responds to user input.

## Resources

- [React Testing Library Documentation](https://testing-library.com/docs/react-testing-library/intro)
- [Create-react-app docs on testing with react testing library](https://create-react-app.dev/docs/running-tests/#option-2-react-testing-library)
- [FreeCodeCamp React Testing with Jest](https://medium.com/p/b71c27b0a795#54c3)
