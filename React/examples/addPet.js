// Goes in App.js
addPet = (pet) => {
  console.log('pet = ', pet);
  axios.post('http://localhost:3000/pets', pet)
    .then((response) => {
      // We can update the state so we don't need to make another GET request
      const updatedData = this.state.originalPets;
      updatedData.push(response.data);
      this.setState({
        petList: updatedData,
        originalPets: updatedData,
        error: ''
      });
    })
    .catch((error) => {
      // Use the same idea we had in our GET request
      this.setState({ error: error.message });
    });
};
