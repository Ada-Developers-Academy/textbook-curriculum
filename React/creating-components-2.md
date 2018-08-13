# Creating Components: Part 2

## Learning Goals
- Continue nesting components within one another
- Continue to practice component creation and JSX syntax
- Use `state` within our components
- Act on events within our components
- Pass event handler functions as callbacks within `props`

### Overview
In this discussion, we are going to go back to our students application and add some new features. First, we're going to refactor our code a bit to set ourselves up to use some of the new concepts we've learned about, like `state`. Then, we're going to add some new functionality so we can use our application to take attendance for our students.

## Refactor!

**This diagram will drive our overall approach for accomplishing this goal:**
![nested components](images/nested-components.png)
<!-- https://drive.google.com/open?id=1xq5jaCrI7FGp6PG1gr-bYE1ZTvPb5PxZ -->

### Setup to manage list of data
One student is great and all, but ideally, we'd really be able to manage our whole list of students that we might need. We'd also like to do this _outside_ of the `App` component, because what if our application also tracks Teachers?

We'll create a new component called `StudentCollection` that will live between the existing  `App` and `Student` components. This new component will manage the full list of students and then render the data for each student.

1. Spend a few minutes now going back to the [creating components](creating-components.md) notes to see how to create the new component file with the basic class, imports and exports you need.

1. Move the code that renders the list of `Student`s from `App` to `StudentCollection`. Note: You will also need to move and update the `import` statement.

1. Import and render `StudentCollection` now from the `App` component instead. Note: You will need to add an import statement.

## Use `state` for data
One way that we often set initial `state` data in a component, is by taking data passed in through `props` (from the parent) and setting that to `state` in our constructor. Let's see an example!

Set up a constructor in the `StudentCollection` component. Don't forget your call to `super();` which is always required in a component constructor!

```javascript
// src/components/StudentCollection.js
constructor() {
    super();
  }
```

Then, add some constant student data to set the initial `state` in the constructor. We'll add an extra field to our students here, `isPresent`, which we'll be using in a bit.

```javascript
constructor() {
  super();

  this.state = {
    students: [
        {
          fullName: "Katherine Ada",
          email: "katherine-ada@ada.co",
          isPresent: false
        },
        {
          fullName: "Grade Ada",
          email: "grace@ada.co",
          isPresent: false
        }
      ];
  }
}

```

Next, we'll use a `map` in our `render` function to iterate through each item in our state object and render a `Student` component for each piece of data. You should already have some of this `map` logic, but now we'll be getting the data from `state` rather than a constant.

```javascript
// src/components/StudentCollection.js
render() {
    const studentComponents = this.state.students.map((student, i) => {
      return <Student key={ i }
        index={ i } fullName={ student.fullName } email={ student.email } isPresent={ student.isPresent }/>
    });

    return (
      <div>
        <h3>Students</h3>
        <section>
          { studentComponents }
        </section>
      </div>
    );
  }
```

Verify that you now see the data from the `state` variable in your browser.

Now let's take a look at an updated version of the diagram that we created in our last component creation lecture:

![nested components](images/nested-components.png)
<!-- https://drive.google.com/open?id=1xq5jaCrI7FGp6PG1gr-bYE1ZTvPb5PxZ -->

Note that we're passing in a new `isPresent` prop here. How could we modify our `Student` component to reflect this information?

### Modify `state` using an event
Listing out our students is great, but what if we could also track attendance? Let's do it! We'll set up a button for each student. When pressed, this button will update the `state` data for that student to mark them as "present". Additionally, we'll add some CSS so that students who have been marked "present" will be identified to the user.

There are a few things to consider when making this change to our application. Think about these questions with your seat squad.
1. Which component should contain the button that will enable us to mark an individual student as "present"?
2. Which component is managing the student data?
3. Is the answer to #1 the same as #2?

If you answered NO to question #3, you're on to something big. The data related to the students is tracked in the `StudentCollection` while the button to mark an individual student "present" should really be on each individual `Student` component. Our challenge then is to use the tools we have been given to _propagate_ the button press event from one component to another.

#### The button
Let's start by updating the `render` function of the `Student` component to include a button.

```html
<button>Mark Present</button>
```

#### The Event Handler
Next, let's explore the event handler setup. What data do we need from the button click event to appropriately change the overall student's state?

Create the event handler function with an initial logging statement to get us started. We'll follow the same pattern as before for a DOM event handler: start with `on`, then indicate what element and what event are being handled.

```javascript
// Student.js

onPresentButtonClick = () => {
  console.log(this);
}
```

Then we tie the button to the event handler function:

```javascript
// Student.js

<button onClick={ this.onPresentButtonClick }>Mark Present</button>
```

Test it out and see what gets logged in the console. What piece of data is going to help us determine exactly which student should be updated?

#### Callback from the Parent

Next, we must consider that the `state` of the students is not stored within this component. In order to update this, we'll need to call some code within the `StudentCollection` component which will change the state.

Let's create a new event handler function in the `StudentCollection` component. This even handler should take in one parameter which represents the unique identifier for the given student for whom we want to mark "present".

```javascript
//StudentCollection.js

markPresent = (studentIndex) => {
  console.log(studentIndex);
}
```

**Question:**  What way do we have to pass data from a parent component to a child component.

If you answered `props` you're correct!

We are going to send _a callback function_ as `props` from the `StudentCollection` component to the `Student` component. Once the event occurs in the child component, we can then get the data we need from the child, and pass that to the parent to update the `state`.

Update the `render` function in the `StudentCollection` component to pass in a new `prop` to `Student`, the callback function. Note: We are passing this as a function not _calling_ the function, so we leave the parenthesis off.

```javascript
// StudentCollection.js
this.state.students.map((student, index) => {
  return <Student key={ index }
    index={ index } fullName={ student.fullName } email={ student.email }
    markPresentCallback={ this.markPresent }/>
});
```

Now, in the `Student` component, we can call this callback function within our event handler with the information about the specific student that needs to be updated.

```javascript
// Student.js

onPresentButtonClick = () => {
  console.log(this);
  this.props.markPresentCallback(this.props.index);
}
```

Finally, we'll update the callback function in the parent component to modify the state of the student.

```javascript
//StudentCollection.js

markPresent = (studentIndex) => {
  console.log(studentIndex);

  // Store our state in a local variable so we can make the update
  let updatedStudents = this.state.students;
  updatedStudents[studentIndex].present = true;

  // Call setState to update our state (as well as re-render automatically)
  this.setState({ students: updatedStudents });
}
```

#### Event Handling Summary

Wow, that was kind of complex. Let's look at a diagram of what's going on.

![State management with callbacks](images/state-management-with-callbacks.png)

<!-- https://drive.google.com/open?id=1byKvDyUP5HUwQojmg2cpL4eNO9keFYpD -->

**On the left in orange** is the setup. Information is passed from parent components to child components at `render` time using `props`.
- `StudentCollection` gives `Student`:
  - Its position in the array (`index`)
  - A callback function to invoke when it is marked present (`markPresentCallback`)
  - Some info about itself (`fullName`, `email`, `isPresent`)
- `Student` gives its `<button>` a callback function to invoke when the button is clicked

**On the right in blue** is the sequence that happens when the `<button>` is clicked.
- The button invokes its callback, `onPresentButtonClick`
- `onPresentButtonClick` takes the index from the `Student`'s `props`, and uses it to invoke `markPresentCallback`

`markPresentCallback` comes from `markPresent` in the `StudentCollection`
- Invoking this function updates the state of `StudentCollection`
  - It uses the index that was passed in and updates the corresponding student record
- Updating state causes `StudentCollection` to re-render
- When `StudentCollection` re-renders, it will pass the new value for `isPresent` to the `Student`, causing that `Student` to re-render

This style of event handling is very common in React - it comes up whenever an event on a child component needs to update state stored in a parent component. Having a good handle on how the pieces fit together will be especially helpful once we talk about forms later.

## Key Takeaway
Once we have a grasp on how to use `props` and `state` within our React application, the possibilities are endless. Using these concepts to manage the data and our understand of how to nest components, we can create rich and interactive applications.

## Additional Resources
- [How to write your first React component](https://medium.freecodecamp.org/how-to-write-your-first-react-js-component-d728d759cabc)
