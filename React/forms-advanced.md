# Advanced Forms

In a previous lesson we talked about the idea of a controlled form, and built one as a React component. In this lesson we'll update the code to be a little DRYer, and to provide a better user experience.

## Learning Goals
- Use our JavaScript knowledge to DRY up our controlled form
- Dynamically provide user feedback as they complete a form with validations

## Refactor of Event Handlers

You may notice the event handlers for the name and input fields are very similar:

```javascript
//  NewStudentForm.js
...
onNameChange = (event) => {
  console.log(`Name Field updated ${event.target.value}`);
  this.setState({
    fullName: event.target.value,
  });
}

onEmailChange = (event) => {
  console.log(`Email Field updated ${event.target.value}`);
  this.setState({
    email: event.target.value,
  });
}
```

We can refactor this into a single function that can update any field, based on a parameter.

```javascript
//  NewStudentForm.js
...
onInputChange = (event) => {
  const updatedState = {};

  const field = event.target.name;
  const value = event.target.value;

  updatedState[field] = value;
  this.setState(updatedState);
}
```

**Question:** What is stored in the `field` variable?

**Question:** Why do we need to use subscript notation (square brackets) to update the state? In the past we used dot notation, which was more concise. What has changed?

Then we can change the `onClick` handlers to use our new consolidated function:

```jsx
<input
  name="fullName"
  onChange={this.onInputChange}
  value={this.state.fullName}
/>
```

In this way we can DRY our code a bit and have one function to update any field in the `NewStudentForm`'s state.

## Form Validation

Now that our `NewStudentForm` component track the status of the form fields in its state, we have an opportunity to provide a better user experience. Let's validate form fields on the fly, and let the user know whether what they've typed so far is OK.

We can perform a validation on the email field with a function like this:

```javascript
// NewStudentForm.js
...
emailValid = () => {
  return this.state.email.match(/\S+@\S+/);
}
```

And give the user feedback on validation with:

```javascript
// NewStudentForm.js
...
<input
  onChange={this.onInputChange}
  value={this.state.email}
  className={this.emailValid() ? "valid": "invalid"}
  name="email"
/>
...
```

**Question:**  What does this line with `className=` do?

The form is re-rendered every time the state of the component changes, and this code will run `this.emailValid()` and if the email field is valid the input will have a class of `valid`, and if not it will have the class of `invalid`.  With a little CSS we can give the user valuable feedback as to the status of a form field.

**Wait!** You just used a ternary!  Remember from [react hello world](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/React/react-hello-world.md#what-is-jsx) we said you can't put an if-statement in a `{}` block?  You can put a 1-line ternary.  However a full multiline `if` statement will not work.

```css
input.valid {
  background: lightgreen;
}

input.invalid {
  background: pink;
}
```

Now the form fields will change color based on whether the input is OK!

## Key Takeaway

Controlled forms give us programatic access to what the user's typing, as they type it. That opens up a whole world of opportunities for improving the user experience.

## Additional Resources

- [Instant Form Field Validation with React](https://medium.freecodecamp.org/how-to-use-reacts-controlled-inputs-for-instant-form-field-validation-b1c7b033527e)
