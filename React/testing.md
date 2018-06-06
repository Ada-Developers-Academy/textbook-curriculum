# Testing React Components

One of the goals of react is to make reliable autonomous components that serve a single purpose, much like classes in Ruby so that they can be used like lego blocks to construct sophisticated applications.

Here we will try to ensure that individual components work predictably by testing our components how users work with them.

## Learning Goals
By the end of this lesson you should be able to:
- Explain the terms _Snapshot Test_ and _Mocking_
- Write a test to verify component actions perform as expected

## Overview





## Snapshot Testing



### Installing Enzyme

Enzyme is a handy library which will make it easier to manipulate, traverse and make assertions on our React components.  It's made to work similar to jQuery for selecting and manipulating the DOM.

To install enzyme for your application execute from the terminal:

```bash
npm i --save-dev enzyme enzyme-adapter-react-16
```

**Note** This will install enzyme and an adapter or version 16 of React.  You can expect a new adapter for version 17.

Next tell Jest how to configure enzyme and use the adapter.  Create the file `src/setupTests.js` and add the following content.

```javascript
import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });
```

This file is run when you start testing with create-react-app and allows us to tell enzyme which adapter to use.

### Shallow Rendering

```javascript
import React from 'react';
import ReactDOM from 'react-dom';
import { shallow } from 'enzyme';
import App from './App';

describe('<App />', () => {
  test('that it renders App', () => {
    const wrapper = shallow(<App />);
    console.log(wrapper.debug());
  })
});
```

## Testing For Child Elements

## Testing User Interaction

## Testing Asynchronous Code


## Resources
- [Tutorial on Testing React](https://medium.com/tribalscale/tutorial-on-testing-react-part-1-2c587e39114d)
- [The Right way to test React Components](https://medium.freecodecamp.org/the-right-way-to-test-react-components-548a4736ab22)
- [Jest Documentation - Testing React Apps](https://facebook.github.io/jest/docs/en/tutorial-react.html)
- [Using Jest with enzyme](https://github.com/airbnb/enzyme/blob/master/docs/guides/jest.md)
