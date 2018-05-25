# Creating Components: Part 2

## Learning Goals
- Continue nesting components within one another
- Continue practice component creation and JSX syntax

Next we are going to extend our application to support multiple students. Additionally, we are going to support components dynamically loading data.

**This diagram will drive our overall approach for accomplishing this goal:**
![nested components](images/nested-components.png)
<!-- https://drive.google.com/open?id=1xq5jaCrI7FGp6PG1gr-bYE1ZTvPb5PxZ -->


## Load data from `props`

First, we want to use the Student component we already created, but we want to allow this to load data dynamically.

To do this, we will pass in the data from the `App` component to the `Student` component. Within the `Student` component, we will use the code tags to pull in the data that was passed in.

1. Locate the spot where the `Student` component is rendered from the `App` component.

1. Update the component rendering to include two new parameters by adding them in like this:  
    - `<Student name="Improved Ada" email="improved-ada@ada.co" />`
    - This shouldn't change anything yet in our application, so save the file and refresh the browser to verify that the data still looks like the original hard-coded data.

1. Update the `render` function in the `Student` component to replace the hard-coded values with code tags `{ }` which contains the `prop` that came in from the parent component.  
    - It should now contain `{ this.props.name }` and `{ this.props.email }`
    - Verify that the content displayed is now coming from the values in the `App` component


If we identify each individual piece of the component rendered, we'll see:
![component prop breakdown](images/component-prop-breakdown.png)

Prop names can be any variable you want them to be. In this particular case, we chose `name` and `email` to store our values.

Once the prop names are **passed in** to the component, we can then use them within the component. That's where `this.props` comes in!

## Setup to manage list of data
One student is great and all, but ideally, we'd really be able to manage our whole list of students that we might need.

We'll create a new component called `StudentCollection` that will live between the existing  `App` and `Student` components. This new component will manage the full list of students and then render the data for each student.

Spend a few minutes now going back to the [creating components](creating-components.md) notes to see how to create the new component file with the basic class, imports and exports you need.

Move the code that renders `Student` from `App` to `StudentCollection`. Note: You will also need to move and update the `import` statement.

Import and render `StudentCollection` now from the `App` component instead.

## Use `state` for data

Set up a constructor in the `StudentCollection` component which will use a variable to create a state-managed collection of student information. Don't forget your call to `super();` which is always required in a component constructor!

```javascript
// src/components/StudentCollection.js
constructor() {
    super();

    this.state = {
      students: [
        {
          name: "State Ada",
          email: "state-ada@ada.co"
        },
        {
          name: "Grade Ada",
          email: "grace@ada.co"
        }
      ]
    };
  }
```

Next, we'll use a loop in our `render` function to iterate through each item in our state object and render a `Student` component for each piece of data. Remember that the `render` function needs to return a single element.

```javascript
// src/components/StudentCollection.js
render() {
    let studentComponents = this.state.students.map(function(student) {
      return <Student name={ student.name } email={ student.email }/>
    });

    return (
      <div>
        <h3>Students</h3>
        <section>
          { studentComponents }
        </section>
      </div>
    )
  }
```

Note that there are a few different ways to accomplish this same result. The approach we've taken here is to create a new variable _outside_ the `return` to construct the individual components. Then, within the return, we wrap the variable from above in a single `div` since we can only return one high-level element.

Verify that you now see the data from the constructor in your browser.

**Dive In:** Unpack the line with `return <Student...` with the person sitting next to you. Identify each piece of code on this line. Some questions to think about as you go through this activity:
- What do you think the `studentComponents` variable looks like after this code executes?
- How are `props` used within this code?
- How does this code relate to the code within the `Student` component?
- What would happen to the HTML rendered if you remove either `name` or `email`?
- What is being `return`ed and where is it going?

Now let's take a look at an updated version of the diagram that we created in our last component creation lecture:

![nested components](images/nested-components.png)
<!-- https://drive.google.com/open?id=1xq5jaCrI7FGp6PG1gr-bYE1ZTvPb5PxZ -->

## Some CSS
We want our page to have a nice look & feel! Let's add some simple CSS.

We can make use of the existing css file that comes from within our boilerplate React application. Let's add a new class in the `App.css` file for the student.

```css
/* App.css */
.student {
  width: 15em;
  border: 1px solid black;
  background-color: hsl(189, 100%, 89%);
  padding: 1em;
  margin: 1em;
}

.student-list {
  display: flex;
  justify-content: flex-start;
  flex-wrap: wrap;
}
```

**Try It!**

Now that you have two classes to add some styling, work with the person sitting next to you to figure out where you should add these classes in the HTML. Should they be within a `render` function? Should they be added when a component is rendered from another component? Should they be added in the same place, or a different place?


**Result**
```javascript
// components/student.js
render() {
  return (
    <div className="student">
    ...
  );
}
```

We don't want to add the class name onto each **component** that is rendered from the `StudentCollection` because that wouldn't go directly to the HTML. We should instead add it directly to the HTML **within** the component.

## Key Takeaway
Nesting components within one another gives us infinite possibilities in React.

## Additional Resources
- [How to write your first React component](https://medium.freecodecamp.org/how-to-write-your-first-react-js-component-d728d759cabc)
