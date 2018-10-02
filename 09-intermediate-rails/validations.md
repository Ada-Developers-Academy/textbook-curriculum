# Client Side vs Server Side Validation

## Learning Goals

By the end of this lesson, students should be able to...
- Define validation
- Define client-side validation
- Define server-side validation
- Understand the differences between the two
- Understand the benefits of both types of validation

### Validation
We use validations in web applications to test to ensure our users enter required information, and enter information in the format we expect. We have a strong desire to ensure the user knows what they have done incorrectly so they can fix it.

### Client-Side Validation
When validation is carried out client-side, this means that the validations are happening directly from the user's browser.

An example of this type of validation in Rails is when you use the `required: true` attribute on a form field.  This does some special behind-the-scenes Rails work to associate the input field with some _JavaScript_ which will run in the browser if the user does not fill in the field. This JavaScript will update the HTML to show the user what they've missed.

One disadvantage of client-side validation is that is relies on the appropriate JavaScript files to be loaded into the user's browser. If there is an issue loading a script, then this type of validation will not work.

### Server-Side Validation
When validation is carried out server-side, this means that the request must get past the browser and go to the server to be validated. This requires the server to send a response which contains information about the validation.

An example of this type of validation in Rails is when you configure a validation on a model. This requires that the request is sent to the Rails server, the model data is validated (usually by calling the `save` method), and then an appropriate response is sent back if the model validations have failed.

### Comparisons
Based on our definitions above, we can make some observations the differences between client and server-side validations and when they should be used. Client-side validation does not involve sending a request to the server, so it is faster than server-side validation. Client-side validation is also seen as more user friendly. Server-side validation generally happens right before saving data to your system, so it is considered more foolproof than client-side validation.


## Key Takeaway
Based on the differences between the two types of validation, the recommendation is to use **both** types of validations. Additionally, if you cannot use both, it is recommended that you exclude the client-side validation, because the server-side validation can prevent more issues.

## Additional Resources
- [Quora answer](https://www.quora.com/What-are-the-difference-between-client-side-and-server-side-validations-in-Web-pages)
- [Client side vs Server side](https://skillcrush.com/2012/07/30/client-side-vs-server-side/)
