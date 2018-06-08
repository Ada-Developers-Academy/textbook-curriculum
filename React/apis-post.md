# Integrating with an API in React

## Learning Goals
- Use `axios` to make a post request from our React app based on an event

### Setup
We are starting with the pets application that we have already created and integrated with a GET request from the [pets API](https://petdibs.herokuapp.com/pets). We can see the updated documentation on the endpoints of this API [here](https://github.com/AdaGold/pets_api). This application already contains the event handlers to submit the form data from a controlled form. In this discussion, we'll be enhancing some of this logic to send a POST request to the API to add a new pet. We'll also need to ensure that our overall pet list is refreshed from the API once we add a new pet.

### Add a Pet

Let's examine our existing `addPet` function:
```javascript
// PetCollection.js
addPet = (petInfo) => {
  let updatedData = this.state.pets;
  updatedData.push(petInfo);
  this.setState({pets: updatedData});
}
```

This will take the data passed in (from the form) and update the array of pets to include that new pet information. When we introduce the API request, we likely still want to update the state with the new pet's information. The POST request will ensure that the data is not lost and that when we reload the list of pets from the API, we'll see the new one included.

The `post` request function in axios is a bit different than the `get` request. Remember that when we make a POST request, we need to pass along the data we want to POST to the URL we specify. We can use the existing `petInfo` variable that we used to update the state.
```javascript
// PetCollection.js
addPet = (petInfo) => {
    axios.post('https://petdibs.herokuapp.com/pets', petInfo)
      .then((response) => {
        // What should we do when we know the post request worked?
      })
      .catch((error) => {
        // What should we do when we know the post request failed?
      });
  }
```

**Think About It**

Take a look at the logic we put in the `then` and `catch` sections in the `componentDidMount` function when we made the GET request. What will be similar and different for the POST request?

```javascript
// PetCollection.js
addPet = (petInfo) => {
    axios.post('https://petdibs.herokuapp.com/pets', petInfo)
      .then((response) => {
        // We can update the state so we don't need to make another GET request
        let updatedData = this.state.pets;
        updatedData.push(petInfo);
        this.setState({pets: updatedData});
      })
      .catch((error) => {
        // Use the same idea we had in our GET request
        this.setState({ error: error.message });
      });
  }
```

**Checking In**

Now observe what happens when we submit the form in our application. Check in with your seat squad to be sure that you've got the post request set up successfully.

## Key Takeaway
Making a POST request from our React application is very similar to the GET request. We continue to utilize `state` within React as our primary mechanism for storing and updating data that will be displayed to our users.

## Additional Resources
- [Using axios with React](https://alligator.io/react/axios-react/)
- [axios documentation](https://github.com/axios/axios)
