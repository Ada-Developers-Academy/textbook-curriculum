# React Hello World

## Learning Goals
- Create a new React application
- Read through a basic React component
- Introduction to JSX & CSS in React

### Setup
The React developers have created a nice tool to help you get started with creating a new React application. Since most React applications require the same npm packages and information, this tool that we'll use will install each of these for us by default.

Let's install the package we'll use to create our new React application:
`npm install -g create-react-app`

Although it is not the same, we'll use `create-react-app` in a similar way to the way we used `rails new`.

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

**Question**: Where is the HTML that is displayed on the web page coming from? Figure out with your neighbor.

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
- The pieces that look like HTML are **JSX**
- Every component is a class, and gets its own file
- Every component has a `render` function
- The `render` function must return a *single* element
  - In this case, it is the outermost `div`. Every other element in the function is contained within that outermost `div`.

**Try It!** Change something about the `render` function above and see how it immediately affects the page.

#### What is JSX?
JSX is a pre-processor (similar to ERB in Rails) that adds XML syntax to JavaScript. JSX and React can technically be used independently, but you almost always see them together. JSX looks a lot like HTML though there are a few important differences.

**Adding Classes**

Since JSX is within our JavaScript code, we cannot use the `class` keyword the way we would directly in our HTML. Instead, we must use `className` to avoid the reserved word. You'll notice this in several lines of the `render` function that we were examining above.

**Making it Dynamic**

Take a look at the code above and see if you can identify a location within the `render` function that is rendered dynamically. HINT: You'll be able to identify it because the syntax looks a bit different.

In ERB, we were familiar with using the `<%` and `<%=` elements to dynamically generate content for our views. In JSX, we utilize `{}` to pass in code that we'll use to dynamically generate view data.

**Important Notes**

- JSX cannot contain if-statements. If you need to include logic within your render function, you can do so _before_ the return statement.
- The `render` function must return a **single element**. This does not mean that there can't be more complicated JSX in the `return`, but it does mean that all elements must be contained within **one** outermost element.

## Key Takeaway
- We can use `create-react-app` to create a new boilerplate React application.
- Once our React application is created, we can run `npm start` in the terminal to start it up.
- JSX is the pre-processor associated with React that we will utilize to generate dynamic HTML.

## Additional Resources
- [`create-react-app`](https://github.com/facebookincubator/create-react-app)
- [JSX Tutorial](http://buildwithreact.com/tutorial/jsx)
