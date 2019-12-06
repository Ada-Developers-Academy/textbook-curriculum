# Integrating with an API in React

## Learning Goals

- Revisit `axios` as our API library
- Integrate a get API request in react lifecycle method

### Setup

So far, our pets app has been set up to pull static data from the `App` component and pass that into the `PetList` which handles the display. We're going to modify this to utilize an API instead.  For the purposes of learning we're going to use the [json-server](https://github.com/typicode/json-server) package which can take a json file and generate a sample REST server based on it.

1. First, let's find our pets app from earlier. Locate and navigate to the folder in the terminal.
2. Next check out the `ada-pets-api` branch with `git checkout ada-pets-api`.  This will load a version of Ada Pets which is already working, but using the imported json file.
3. Next, we'll install the axios package by running `npm install axios --save`.
4. Verify! Open `package.json` and ensure we see axios in the "dependencies" section.

### Review The Code

Now review the code and see how this application is structured it may work a little differently than your implementation.  Specifically the state data is all in the `App` component.

### Running the Server

We have the json-server package pre-installed and set up in our `package.json` file.  Open up `package.json` and look for the following section:

```json
"scripts": {
    "start": "react-scripts start",
    "server": "json-server --watch src/data/pets.json",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
```

Check out the `server` line.  This adds a command to start the json-server package on the port 3000.  The command is: `npm run server`.  You can open the api in the browser with [http://localhost:3000/pets](http://localhost:3000/pets).  You can do all the RESTful routes for a pets resource, listing showing, creating etc.  All these operations will update the pets.json file.  So `pets.json` will serve as an imitation API for us to learn with.

We have added a `.env` file to start React scripts on port 2999.

**Exercise**

With your neighbor, and using Postman, access the API to list and show several pets.  

Answer: 

- What is the URL to list all pets?
- What is the URL to list a single pet?
- What happens when you try to access a pet that does not exist?

### Replacing the Static Pets Data

Now we are set up to load axios library code within our React application using an `import` statement.

```javascript
// App.js
import axios from 'axios';
```

Let's update our pets app to remove the hard-coded data to start:
1. Remove the array from the `App` component
2. Set the initial state of `petList` to an empty array.

```javascript
// App.js
class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      petList: [],
      currentPet: undefined,
      originalPets: [],
    };
  }
```

### Recall axios Structure

Recall the structure of the `axios` request from our earlier time using it with Node:

```javascript
axios.get('url')
  .then((response) => {
    // Load in the data
    setResult(response.data) })
  })
  .catch((error) => {
    // Show an error
    setError('There was an error with this request!');
  })
```

We are going to use this same structure in our React applications within the `componentDidMount` lifecycle method. Recall that this method is regularly used to load in our external data.

### Integrate in Lifecycle

First, let's create the `componentDidMount` function without any content.

```javascript
// App.js
componentDidMount() {
  // API get request here
}
```

Next, let's consider how we want our axios request to be structured within this lifecycle method.

```javascript
// App.js
componentDidMount() {
  axios.get('')
    .then((response) => {

    })
    .catch((error) => {

    });
}
```

**Questions:**
1. What do you think should happen in the `then` block when the API request is successful? Where will we store this data?
2. What do you think should happen in the `catch` block when there is an error?

**Successful Response**

Next, we'll fill in the URL as well as the logic in the success callback to update the state of our application to store the data from the API. By using the `setState` function, we will be able to update our component once the data is sent back from the API.

```javascript
// App.js
componentDidMount () {
    axios.get('http://localhost:2999/pets')
      .then((response) => {
        this.setState({
          petList: response.data,
          originalPets: response.data,
        });
      })
      .catch((error) => {
        // TODO
      });
  }
```

**TEST IT!** Let's pause here for a moment because you should now be able to see your React app reloaded with data now coming from the API rather than the hard-coded array. If it isn't working, be sure to check the network tab in your dev tools to see if the API request was made and any errors that it might be returning.

Turn off the server and see what happens when you refresh the browser.

**Unsuccessful Response**

Next, we need to figure out what we want to do when an error occurs. We can utilize the `error` object returned which contains a property called `message`. We can store this in our state to display an error message.

```javascript
// PetList.js
class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      petList: [],
      currentPet: undefined,
      originalPets: [],
      error: '',
    };
  }
    // ... other methods

componentDidMount() {
  axios.get('http://localhost:2999/pets')
    .then((response) => {
      this.setState({ pets: response.data });
    })
    .catch((error) => {
      this.setState({ error: error.message });
    });
}
```

**Exercise**:

Now that we have some error handling updating `state`, we should use this in the rendering of our component. With your neighbors, figure out how you can conditionally display this error data if it exists in the `render` function.

**Question**

With your neighbor discuss how you would handle validation errors.

## Key Takeaway

Using axios within our React application is very similar to the usage in our command-line application. We use the `componentDidMount` function to load the API data within the component lifecycle and `state` to manage the retrieval and ultimately the display of the API data.

## Additional Resources

- [Using axios with React](https://alligator.io/react/axios-react/)
- [axios documentation](https://github.com/axios/axios)
- [Where to Integrate API calls in React](https://hackernoon.com/where-to-integrate-api-calls-in-reactjs-componentwillmount-vs-componentdidmount-710085dc05c3)
