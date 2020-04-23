# Integrating with an API in React

## Learning Goals

- Use `axios` to make a post request from our React app based on an event

### Setup

We are starting with the students application that we have already created and integrated with a GET request from the [json-server package](https://www.npmjs.com/package/json-server).  This application already contains the event handlers to submit the form data from a controlled form. In this discussion, we'll be enhancing some of this logic to send a POST request to the API to add a new student. We'll also need to ensure that our overall student list is refreshed from the API once we add a new student.

### Add a Student

Let's examine our existing `addPet` function:

```javascript
// src/App.js
  const addStudent = (student) => {

    const newStudentList = [...students];

    // Find the max id and add 1
    const studentIds = newStudentList.map(student => student.id);
    const nextId = Math.max(...studentIds) + 1;

    newStudentList.push({
      id: nextId,
      fullName: student.fullName,
      email: student.email,
      present: false,
    });

    setStudentList(newStudentList);
  }
```

This will take the data passed in (from the form) and update the array of students to include that new student information. When we introduce the API request, we likely still want to update the state with the new student's information. The POST request will ensure that the data is not lost and that when we reload the list of pets from the API, we'll see the new one included.

The `post` request function in axios is a bit different than the `get` request. Remember that when we make a POST request, we need to pass along the data we want to POST to the URL we specify. We can use the existing `student` variable that we used to update the state.

```javascript
// src/App.js
// ...

  const addStudent = (student) => {
    axios.post(API_URL_BASE, student)
      .then((response) => {
        // What should we do when we know the post request worked?


      })
      .catch((error) => {
        // What should we do when we know the post request failed?

      });
  }
```

**Think About It**

Take a look at the logic we put in the `then` and `catch` sections in the `useEffect` function when we made the GET request. What will be similar and different for the POST request?

Working with your neighbor give it a try, remember that you will need an `id` field for the student to add it to `studentList`, as each `Student` component requires an id.  How can you get an ID from the API?  Try making a `post` request with Postman to look for the answer.

When you are ready you can look at our [solution](examples/addStudent.js).

**Checking In**

Now observe what happens when we submit the form in our application. Check in with your neighbors to be sure that you've got the post request set up successfully.

### Extension

- How can you handle validation errors in a real API, like we made before?
- How could you delete pets from the API with your React App?
  - With your neighbor implement this functionality.

## Exercise

At this point you can list students and add new students, but you cannot delete them.  For this exercise take the working code from this [point in the textbook](https://github.com/AdaGold/ada-students/tree/12-api-post), and add a `delete` button to each student and give the app the ability to delete students.  Every time a user clicks on a "delete" button for a specific student, our app should send a `DELETE` request to the API.  

You can get the code by cloning the repository and checking out the branch with the command

`git checkout origin 12-api-post`

When you are ready check out [our completed solution](https://github.com/AdaGold/ada-students/tree/12-api-post).

You can also checkout [how to make a `DELETE` request with Axios](https://github.com/axios/axios#axiosdeleteurl-config) on the documentation.  The documentation on this function is minimal.

## Key Takeaway

Making a POST request from our React application is very similar to the GET request. We continue to utilize `state` within React as our primary mechanism for storing and updating data that will be displayed to our users.

## Additional Resources

- [axios documentation](https://github.com/axios/axios)
- [How to fetch data with React Hooks](https://www.robinwieruch.de/react-hooks-fetch-data)
