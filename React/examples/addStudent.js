const addStudent = (student) => {
  axios.post(API_URL_BASE, student)
    .then((response) => {
      // What should we do when we know the post request worked?
      const updatedData = [...studentList, response.data];
      setStudentList(updatedData);
      setErrorMessage('');
    })
    .catch((error) => {
      // What should we do when we know the post request failed?
      setErrorMessage(error.message);
    });
};
