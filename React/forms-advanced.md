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

Then we can change the `onClick` handlers to be an arrow function like this:

```jsx
<input
  name="fullName"
  onChange={this.onInputChange}
  value={this.state.fullName}
/>
```

In this way we can DRY our code a bit and have one function to update any field in the `NewStudentForm`'s state.

## Form Validation

By allowing the `NewStudentForm` component track the status of the form fields this will allow us to:
- Validate form fields on the fly
- More easily access the form fields when the form is submitted.

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
  onChange={this.handleEmailChange}
  value={this.state.email}
  className={this.emailValid() ? "valid": "invalid"}
  name="email"
/>
...
```

**Question:**  What does this line with `className=` do?

The form is rerendered every time the state of the component changes, and this code will run `this.emailValid()` and if the email field is valid the input will have a class of `valid`, and if not it will have the class of `invalid`.  With a little CSS we can give the user valuable feedback as to the status of a form field.

**Wait!** You just used a ternary!  Remember from [react hello world](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/React/react-hello-world.md#what-is-jsx) we said you can't put an if-statement in a `{}` block?  You can put a 1-line ternary.  However a full multiline `if` statement will not work.

```css
.valid {
  background: lightgreen;
}

.invalid {
  background: pink;
}
```

So with our form we can track input into the fields and provide real-time validation feedback.  Next we want to actually **do** something with the data, but our `NewStudentForm` component doesn't, and shouldn't need to care what happens with the submitted data.

**Question**:  Looking at our Ada student list app to date, what component would be managing the student data?
