// src/components/StudentCollection.js
import React from 'react';
import Student from './Student';

// From the end of the props lesson.
const StudentCollection = (props) => {

  const studentComponents = props.students.map((student, i) => {
    return (
      <li key={i}>
        <Student fullName={student.fullName} email={student.email} />
      </li>
    );
  });

  return (
    <ul className="student-collection">
      {studentComponents}
    </ul>
  );
};

export default StudentCollection;
