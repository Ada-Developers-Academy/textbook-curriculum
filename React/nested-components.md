# Nested Components

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

1. Spend a few minutes now going back to the [creating components](creating-components.md) notes to see how to create a new component.
    - What should the file be called?
    - What needs to be imported and exported?
    - What should the component function look like?

1. Move the code that renders the list of `Student`s from `App` to `StudentCollection`. Note: You will also need to move and update the `import` statement.

1. Import and render `StudentCollection` now from the `App` component instead. Note: You will need to add an import statement.


## Additional Resources
- [How to write your first React component](https://medium.freecodecamp.org/how-to-write-your-first-react-js-component-d728d759cabc)
