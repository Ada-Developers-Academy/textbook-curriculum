// Goes in App.js
deletePet = (petId) => {
  axios.delete(`http://localhost:3000/pets/${petId}`)
    .then((response) => {
      const petList = this.state.fullList.filter((pet) => pet.id !== petId);

      this.setState({
        petList,
        fullList: petList
      });
    })
    .catch((error) => {
      this.setState({ error: error.message });
    });
};
