# React Hello World

## Learning Goals
- Create a new React application
- Create a basic React component
- Introduction to JSX & CSS in React

### Setup
The React developers have created a nice tool to help you get started with creating a new React application. Since most React applications require the same npm packages and information, this tool that we'll use will install each of these for us by default.

Let's install the package we'll use to create our new React application:
`npm install -g create-react-app`

Although not the same, we'll use `create-react-app` in a similar way to the way we used `rails new`.

```bash
create-react-app hello-world
cd hello-world
```

#### What's Included?
Let's go ahead and open this project up in Atom to examine the files that have been created for us. We'll start in the `src` folder.

Take a look at the `index.js` file that was created. Some questions for you as you check out this code:
- What looks familiar?
- What looks new?
- Is there anything used here that you want to explore further?

Next, take a look at the `App.js` file that was created. Some questions for you as you check out this code:
- What do you think this code is doing?
- How is this code related to the code you looked at in `index.js`?

Now that we've examined the code that was generated for us, we can go ahead and run our web server for this application by running `npm start` from our terminal. This command is set up to start our application and then open the browser where the server is running.

**Question**: With your neighbor, figure out where the HTML that is displayed on the web page is coming from?

#### Component's `render` function
The `App.js` file contains our first (auto-generated) component. How exciting!

Now let's examine the pieces of code within the `render` function and identify the key pieces.
```javascript
render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
      </div>
    );
  }
```

Here are some important things to note about this function:
- Every component has a `render` function
- The `render` function must return a *single* element
  - In this case, it is the outermost `div`. Every other element in the function is contained within that outermost `div`.

####
1. Make a `components` folder within the `src` folder

## Additional Resources
- [`create-react-app`](https://github.com/facebookincubator/create-react-app)
