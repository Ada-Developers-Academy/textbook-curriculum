# Integrating with an API in React

## Learning Goals

- Introduce `axios` as our API library
- Integrate a get API request into the react lifecycle using the `useEffect` hook

### Setup

So far our Ada Students project has been set to pull either static data from the `App` component, or from localStorage.  It then passes those students into `StudentCollection` and then into individual student components.  Now we're going to modify this to utilize an API instead.  For the purposes of learning we're going to use the [json-server](https://github.com/typicode/json-server) package which can take a json file and generate a sample REST server based on it.  This will let us simulate an API on our local machines without having to run one on the internet and have students across the cohort access the same API.

1. First, let's find our students app from earlier. Locate and navigate to the folder in the terminal.
2. Next check out the `11-api-start` branch with `git checkout origin 11-api-start`.  This will load a version of Ada Students which is already working, but using localstorage, exactly after the [`useEffect` lesson](./useEffect.md).
3. Next, we'll install the axios package by running `npm install axios --save`.
5. Verify! Open `package.json` and ensure we see axios and json server in the "dependencies" & "dev dependencies" sections.

### Review The Code

Now review the code and see how this application is structured it may work a little differently than your implementation.  Specifically the state data is all in the `App` component.

### Running the Server

We have the json-server package pre-installed and set up in our `package.json` file.  Open up `package.json` and look for the following section:

```json
"scripts": {
    "start": "react-scripts start",
    "server": "json-server --watch src/data/students.json",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
```

Check out the `server` line.  This adds a command to start the json-server package on the port 3000.  The command is: `npm run server`.  You can open the api in the browser with [http://localhost:3000/students](http://localhost:3000/students).  You can do all the RESTful routes for a students resource, listing showing, creating etc.  All these operations will update the students.json file.  So `students.json` will serve as an imitation API for us to learn with.

This should be familiar to you from the `Ada-Pets-node` project.

We have added a `.env` file to start React scripts on port 2999.

**Exercise**

With your neighbor, and using Postman, access the API to list and show several students.  

Answer: 

- What is the URL to list all students?
- What is the URL to list a single students?
- What happens when you try to access a students that does not exist?

### Replacing the localstorage Student data

Now we are set up to load axios library code within our React application using an `import` statement.

```javascript
// src/App.js
import axios from 'axios';
```

Let's update our students app to switch from using the localstorage data to start our student list to using the data from the API.  First we will add a constant to store our base URL and then clear out the localStorage content.

```javascript
// src/App.js
// ...
// API URL base
const API_URL_BASE = 'http://localhost:3000/students';

const App = () => {
  const [studentList, setStudentList] = useState([]);

  useEffect(() => {
    // Our API Code will go here

  }, []);
  // ...
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

We are going to use this same structure in our React applications within the `useEffect` Hook. Recall that this method is regularly used to load in our external data.  If the 2nd parameter to `useEffect` is an empty array, the callback method will be called only once after the component is initially rendered.

### Integrate in Lifecycle

Now lets fill in the `useEffect` hook.

```javascript
// src/App.js
// API URL base
const API_URL_BASE = 'http://localhost:3000/students';

const App = () => {
  const [studentList, setStudentList] = useState([]);

  useEffect(() => {
    axios.get(API_URL_BASE)
      .then( (response) => {
        // How to handle a successful response

      })
      .catch((error) => {
        // Still need to handle errors
      });
  }, []);
  // ...

```

Next, let's consider how we want our axios request to be structured within this lifecycle method.

**Questions:**
1. What do you think should happen in the `then` block when the API request is successful? Where will we store this data?
2. What do you think should happen in the `catch` block when there is an error?

**Successful Response**

Next, we'll fill in the URL as well as the logic in the success callback to update the state of our application to store the data from the API. By using the `setStudentList` function, we will be able to update our component once the data is sent back from the API.

```javascript
// src/App.js
// ...
const App = () => {
  const [studentList, setStudentList] = useState([]);

  useEffect(() => {
    axios.get(API_URL_BASE)
      .then((response) => {
        // Get the list of students
        const apiStudentList = response.data;
        // Set the state
        setStudentList(apiStudentList);
      })
      .catch((error) => {
        // Still need to handle errors
      });
  }, []);
  ```

**TEST IT!** Let's pause here for a moment because you should now be able to see your React app reloaded with data now coming from the API rather than the hard-coded array. If it isn't working, be sure to check the network tab in your dev tools to see if the API request was made and any errors that it might be returning.

Turn off the server and see what happens when you refresh the browser.

**Unsuccessful Response**

Next, we need to figure out what we want to do when an error occurs. We can utilize the `error` object returned which contains a property called `message`. We can store this in our state to display an error message.

Lets add a new state variable called `errorMessage` which starts as `null`, and set that variable if there is an API error.

```javascript
// src/App.js
// ...

const App = () => {
  const [studentList, setStudentList] = useState([]);
  const [errorMessage, setErrorMessage] = useState(null);

  useEffect(() => {
    axios.get(API_URL_BASE)
      .then((response) => {
        const apiStudentList = response.data;
        setStudentList(apiStudentList);
      })
      .catch((error) => {
        setErrorMessage(error.message);
        console.log(error.message);
      });
  }, []);
```

Then we can display that error message in our JSX.

```javascript
// src/App.js
// ...

return (
    <div className="App">
      { errorMessage ? <div><h2 className="error-msg">{errorMessage}</h2></div> : '' }
      <StudentCollection students={studentList} onUpdateStudent={updateStudent} />
      <NewStudentForm addStudentCallback={addStudent} />
    </div>
  );
```

**Question**

With your neighbor discuss: How would you handle errors from the API indicating a bad request?

## Key Takeaway

Using axios within our React application is very similar to the usage in our command-line application. We use the `useEffect` hook to load the API data within the component lifecycle and `state` to manage the retrieval and ultimately the display of the API data.

## Additional Resources

- [axios documentation](https://github.com/axios/axios)
- [How to fetch data with React Hooks](https://www.robinwieruch.de/react-hooks-fetch-data)
