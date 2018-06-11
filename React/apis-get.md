# Integrating with an API in React

## Learning Goals
- Revisit `axios` as our API library
- Integrate a get API request in react lifecycle method

### Setup
So far, our pets app has been set up to pull static data from the `App` component and pass that into the `PetCollection` which handles the display. We're going to modify this to utilize the [pets API](https://petdibs.herokuapp.com/pets) instead.

1. First, let's find our pets app from earlier. Locate and navigate to the folder in the terminal.
1. Next, we'll install the axios package by running `npm install axios --save`.
1. Verify! Open `package.json` and ensure we see axios in the "dependencies" section.

Now we are set up to load axios library code within our React application using an `import` statement.

Let's update our pets app to remove the hard-coded data to start:
1. Remove the array from the `App` component
1. Remove the `prop` passed from the `App` component to the `PetCollection` component
1. Update the `PetCollection` constructor to no longer use the `props` passed in to the set the original state
1. Set the initial state of `pets` to an empty array

### Recall axios Structure
Recall the structure of the `axios` request from our earlier time using it with jQuery:
```javascript
axios.get('url')
  .then((response) => {
    // Load in the data
  })
  .catch((error) => {
    // Show an error
  })
```

We are going to use this same structure in our React applications within the `componentDidMount` lifecycle method. Recall that this method is regularly used to load in our external data.

### Integrate in Lifecycle

First, let's create the `componentDidMount` function without any content.

```javascript
// PetCollection.js
componentDidMount() {
  // API get request here
}
```

Next, let's consider how we want our axios request to be structured within this lifecycle method.

**Questions:**
1. What do you think should happen in the `then` block when the API request is successful? Where will we store this data?
1. What do you think should happen in the `catch` block when there is an error?

```javascript
// PetCollection.js
componentDidMount() {
  axios.get('')
    .then((response) => {

    })
    .catch((error) => {

    });
}
```

**Successful Response**

Next, we'll fill in the URL as well as the logic in the success callback to update the state of our application to store the data from the API. By using the `setState` function, we will be able to update our component once the data is sent back from the API.

```javascript
// PetCollection.js
componentDidMount() {
  axios.get('https://petdibs.herokuapp.com/pets')
    .then((response) => {
      this.setState({ pets: response.data });
    })
    .catch((error) => {
      // TODO
    });
}
```

**TEST IT!** Let's pause here for a moment because you should now be able to see your React app reloaded with data now coming from the API rather than the hard-coded array. If it isn't working, be sure to check the network tab in your dev tools to see if the API request was made and any errors that it might be returning.

**Unsuccessful Response**

Next, we need to figure out what we want to do when an error occurs. We can utilize the `error` object returned which contains a property called `message`. We can store this in our state to display an error message.

```javascript
// PetCollection.js
componentDidMount() {
  axios.get('https://petdibs.herokuapp.com/pets')
    .then((response) => {
      this.setState({ pets: response.data });
    })
    .catch((error) => {
      this.setState({ error: error.message });
    });
}
```

**Exercise**:

Now that we have some error handling updating `state`, we should use this in the rendering of our component. With your seat squad, figure out how you can conditionally display this error data if it exists in the `render` function.

## Key Takeaway
Using axios within our React application is very similar to the usage in our jQuery application. We use the `componentDidMount` function to load the API data within the component lifecycle and `state` to manage the retrieval and ultimately the display of the API data.

## Additional Resources
- [Using axios with React](https://alligator.io/react/axios-react/)
- [axios documentation](https://github.com/axios/axios)
- [Where to Integrate API calls in React](https://hackernoon.com/where-to-integrate-api-calls-in-reactjs-componentwillmount-vs-componentdidmount-710085dc05c3)
