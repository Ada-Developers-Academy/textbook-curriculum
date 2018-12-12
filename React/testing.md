# Testing React Components

Here we will try to ensure that individual components work predictably by testing for unexpected changes to UI and how users interact with our components.  We will introduce two forms of testing unlike any we have done with Ruby, Snapshot testing & testing user interfaces.

## Learning Goals
By the end of this lesson you should be able to:
- Explain the terms _Snapshot Test_, and _shallow_ and _deep_ rendering
- Write tests to verify components exist and have not changed

## Getting Started

In this lesson we will be learning testing through the React pets project we worked on earlier.

You can clone [our implementation of the ada-pets project](https://github.com/AdaGold/react-pets), and switch to the `solution` branch, if needed.

Once you have cloned the repository remember to run `npm install` to install the project dependencies.

### Installing Enzyme & React Test Renderer

Enzyme is a handy library which will make it easier to manipulate, traverse and make assertions on our React components.  It's made to work similar to jQuery for selecting, rendering and manipulating the DOM.

To install enzyme for testing your application, execute from the terminal:

```bash
npm i --save-dev enzyme enzyme-adapter-react-16 enzyme-to-json
```

**Note** This will install enzyme and an adapter or version 16 of React.  You can expect a new adapter for later versions of React.

Next we need to tell Jest how to serialize enzyme data. Open up `package.json` and add the following object:

```json
"jest": {
  "snapshotSerializers": ["enzyme-to-json/serializer"]
}
```

Finally, tell Jest how to configure enzyme and use the adapter.  Create the file `src/setupTests.js` and add the following content.

```javascript
// src/setupTests.js
import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });
```

This file is run when you start testing with create-react-app and allows us to tell enzyme which adapter to use.  If you have tests running you will need to exit and restart Jest.

**You will need to follow these steps for every new React project you create.**

### Test Files

We will use the following pattern for our test files:

- Create a new folder `src/components/test`
- Each component `src/components/X.js` gets a test file `src/components/test/X.test.js`
- Jest should be able to automatically find and run any file ending in `.test.js` without us having to do any extra work

Run `mkdir src/components/test` now to create this folder.

## How to Run Tests

Create-react-app comes with Jest testing built in and in fact provides an initial test.  To run the test type:  `npm test` and you will get a screen like this:

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

## Snapshot Testing

### What is it?

With React we often want to ensure that a component is rendering properly.  For our `NewPetForm` component we could write tests ensure that all the fields are rendering through tests that:

1.  Ensure that the component renders 4 input fields.
2.  Each field is labeled properly.
3.  Ensure there is a submit button
4.  and more and more and more...

However these tests are pretty fragile, easy to break when you make minor changes to the form and tedious to update for UI refactoring.

Instead we can:
1.  Convert the rendered html of the component into JSON with the JSON holding the most significant features of the component.
2.  Save that JSON to a "Snapshot" file.
3.  Compare future runs of the test to that snapshot and alert the user to any changes.

When a component changes, we can be alerted and make corrections, or update the snapshot for future test runs.

**Question:** Can you do TDD with a Snapshot test?

**Question:** When would a snapshot test be useful?

### Creating our First Snapshot

Let's create a snapshot test for one of our untested components, `NewPetForm`.

First create `src/components/test/NewPetForm.test.js`

```javascript
// src/components/test/NewPetForm.test.js
import React from 'react';
import NewPetForm from '../NewPetForm';
import { shallow } from 'enzyme';

describe('NewPetForm', () => {
  test('that it matches an existing snapshot', () => {
    // First Mount the Component in the testing DOM
    // Arrange
    const wrapper = shallow( <NewPetForm addPetCallback={() => {} } />);

    // Assert that it looks like the last snapshot
    expect(wrapper).toMatchSnapshot();
  });
});
```

In the above example we used Enzyme's `shallow` function to create the snapshot.  You can read about `shallow` [in Enzyme's documentation](https://airbnb.io/enzyme/docs/api/mount.html).  The word `shallow` indicates that we will render this component but not any of its child components.  This is good, because it means that a problem with a child component will not cause the tests for the parent component to break.

Now let's break the test, to make sure it's actually testing something.  Modify the `NewPetForm` component by adding a class attribute to one of the elements.  You should see something like this:

![Failed Snapshot](./images/failedSnapShot.png)

This is called a shapshot diff.  Notice the added content are highlighted in red with a `+` sign. In a real development scenario, this might indicate a bug, in which case you should go fix your code!

In our case the change to the rendered HTML is expected, which means we need to update the snapshot. You can do so snapshot with the `u` key. Update the snapshot now.

**Question:** After updating the snapshot take out the class name.  What does the snapshot diff look like now?

**Exercise** Create a test file and a test for the `Pet` component.

You can see a solution on the testing branch of the repository.

### Snapshots Files

You may wonder, "Where are these snapshots saved?"  You can see the snapshot file in your components folder.

![Snashot folder](./images/snapshotFolder.png)

**Question** What does the snapshot file look like?

Notice that the snapshot file looks a lot like the JSX rendered by the component, but it's a generated JSON file making it easier to compare to new snapshots.  You generally won't need to look at these files directly, but looking at the snapshot file should help you understand how Jest compares the current snapshot to the rendered content from the test.

## Creating a Deep Snapshot

Sometimes you need to test the interaction of a component with its child components. In this case a shallow mount won't do, because it only renders one level of component. Instead we'll need to mount the entire tree. We can do so with Enzyme's `mount` function.

Enzyme has two methods of rendering a component for testing. Add the following two tests and look at the resulting Snapshot files.

```javascript
// src/App.test.js
import React from 'react';
import ReactDOM from 'react-dom';
import { mount, shallow } from 'enzyme';
import App from './App';

describe('<App />', () => {  
  test('that it renders App with shallow rendering', () => {
    const wrapper = shallow(<App />);
    expect(wrapper).toMatchSnapshot();
  });

  test('will match the last snapshot with deep rendering', () => {
    const wrapper = mount(<App />);
    expect(wrapper).toMatchSnapshot();

    // Remove the component from the DOM (save memory and prevent side effects).
    wrapper.unmount();
  });
});
```

**Question** Run the above two tests.  What do you notice about the differences in the two Snapshots?

The `mount` function fully mounts a component and all subcomponents in the DOM. This makes the test more fragile, but also more powerful.

Notice also that we call `wrapper.unmount()` at the end of our deep snapshot test. This is because `mount` modifies some global variables in the test environment, and we need to undo this work to avoid side effects and make our tests independent from one another. **Whenever you write a deep snapshot test with `.mount`, you _must_ include a corresponding `.unmount`.**

Use `mount` when you need to test the interaction between a container and child component.  Otherwise for unit testing use `shallow` almost exclusively.  You should **avoid** using `mount` for snapshot testing unless you need it.

| Enzyme Function | Used for |  Description |
| ------ | ------ | ----- |
|  mount  |  Deep Rendering | Renders the entire component and subcomponent to test their interactions  |
|  shallow  |  shallow rendering  | Used for tests on a single component in isolation.

## Event Handling

Enzyme also allows you to write tests for user interaction, using a jQuery-like syntax to simulate events. We won't cover that in this class, but if that sounds interesting to you you can [read more about simulating events here](https://airbnb.io/enzyme/docs/api/ReactWrapper/simulate.html).

## Summary

- Jest is included with React by default
- Enzyme is a library that provides more convenient testing syntax, as well as some advanced functionality
- Snapshot testing allows you to detect when your component changes
- Enzyme has two methods for rendering components: `shallow` and `mount`
  - `shallow` renders only the component you specify, and should be the default choice
  - `mount` renders a component and all its children, and should be used only when you need to test cross-component interactions

## Resources
- [Tutorial on Testing React](https://medium.com/tribalscale/tutorial-on-testing-react-part-1-2c587e39114d)
- [The Right way to test React Components](https://medium.freecodecamp.org/the-right-way-to-test-react-components-548a4736ab22)
- [Jest Documentation - Testing React Apps](https://facebook.github.io/jest/docs/en/tutorial-react.html)
- [Using Jest with enzyme](https://github.com/airbnb/enzyme/blob/master/docs/guides/jest.md)
