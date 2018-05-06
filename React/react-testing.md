# Testing In React

Create React App is designed with testing in mind.  It comes bundled with Jest configured to automatically run files ending with, `.spec.js`, `.test.js` or files in a `__test__` directory.  

## The Structuring of Test Files

There are a **lot** of opinions out there about where to put your test files and how to structure testing.  

## Snapshot Testing

You may remember that one reason that JavaScript is more complicated to test involves how JavaScript manipulates the DOM.  Because React centers around creating user interfaces it is important to test and verify that the components are rendered correctly.  Create React App uses an approximation of the browser DOM in a Node environment and a technique called snapshoting to handle these complications. Jest to create images or **snapshots** of the resulting DOM element which it uses as references to verify that the component has not changed.  This has the advantages that it's faster to test components as everything is run in Node

If you want to learn how to run tests in specific browser environments


## Enzyme - Shallow testing of components

To get started with Enzyme you need to install it with npm.

```bash
npm install --save enzyme enzyme-adapter-react-16 react-test-renderer
```

And create a `src/setupTests.js` file to import Enzyme and it's React 16 adapter.  Like `test_helper.rb` from Rails this file will be run before Jest runs your tests.   

```javascript
import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });
```

## Resources
- [React Testing Cookbook Video Course](https://egghead.io/courses/react-testing-cookbook)
- [An Overview of JavaScript Testing in 2018](https://medium.com/welldone-software/an-overview-of-javascript-testing-in-2018-f68950900bc3)
