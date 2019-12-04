  deletePet = (petId) => {
    axios.delete(`http://localhost:2999/pets/${ petId }`)
      .then((response) => {
        const petList = this.state.petList.filter((pet) => {
          return pet.id !== petId;
        });

        this.setState({
          petList,
          originalPets: petList,
        });
      })
      .catch((error) => {
        this.setState({ error: error.message });
      })
  }

