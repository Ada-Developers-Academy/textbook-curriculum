# HTML Forms
## Learning Goals
- Discover the mechanisms in the HTML standard that allow for interactive elements on a website
- Discuss how to create accessible and semantic forms
- Make and _post_ our first HTML form!

Forms are how users provide input to servers for operation. Everything from authoring a tweet to logging into an email account is accomplished using a small set of HTML tags that create and structure forms.

## Relevant Tags

- `<form>`
- `<label>`
- `<input>`
- `<input type="text">`
- `<input type="checkbox">`
- `<input type="radio">`
- `<input type="password">`
- `<input type="submit">`
- `<input type="hidden">`
- `<textarea>`
- `<select>`
- `<option>`
- `<button>`, and `<input type="button">` (primarily used for JavaScript interactions)
- `<fieldset>` and `<legend>` (handy, but not often used)

## Anatomy of a Form

There are a number of different tags used in building forms. For each tag, the different _attributes_ of that tag will make a big difference in how the form behaves.

Our running example for this lesson will be a signup form for the Ada newsletter.

### The `<form>` Tag

Every HTML form is wrapped in a `<form>` tag. A `<form>` works similar to a `<section>` or `<div>`, in that it's a block element designed to contain other elements. The big difference is that a `<form>` can be _submitted_, causing your browser to send the data somewhere.

The attributes on the `<form>` tell us things about the whole form, like what type of characters it uses or where to send the data when it's submitted. For right now there are two important attributes for a `<form>`:
- `action="some-URL"`: To what URL should we send the data when the form is submitted?
- `method="post"`: What HTTP verb should we use for the data? For right now, this will always be `post`.

Both of these attributes are necessary, but they won't make much sense until we've started working with web servers. For now, we will give you the values to use for both `action` and `method`.

Here's what it would look like in a web page:

```html
<h1>Sign up for the Ada newsletter</h1>
<form action="/newsletter/signup" method="post">
  <!-- We'll put something here soon -->
</form>
```

### `<input>` Tags

`<input>` tags do the hard work of forms, giving the user somewhere to provide input.

There are several types of `<input>`, each specified by the `type` attribute:

- `<input type="text">`
  - A one-line text box
- `<input type="checkbox">`
  - One checkbox (typically you would use several together)
- `<input type="radio">`
  - One radio button (typically you would use several together)
- `<input type="password">`
  - Similar to `type="text"`, but the characters are hidden
- `<input type="hidden">`
  - Stores a value to be submitted with the form, but is invisible to the user. We won't use these until next week.

Each `<input>` must also have a `name` attribute, which specifies what the data entered here will be called. You can think of it as being similar to the key in a hash. It's worth pointing out that `"name"` is a common value for the `name` attribute, which can get a little confusing.

Many `<input>`s will also have a `value` attribute. For checkboxes and radio buttons, `value` will determine what data will be sent to the server when the form is submitted. Going back to our hash metaphor, if `name` is the key then `value` is the value. For text inputs, `value` indicates an initial value for this field.

Another useful attribute for `type="text"` is `placeholder`, which is used to give the user an idea of what to type, but goes away as soon as they start typing (as opposed to a `value` which sticks around).

#### Submit Button

There's one special type of `<input>` element we should discuss: `<input type="submit">`. This creates a submit button! Almost every form you build will include one of these.

Let's add a few `<input>` elements to our email signup form. Since `<input>` is an inline-block element, we'll wrap each in a `<div>` to force line-breaks (this is a common pattern in the wild).

```html
<h1>Sign up for the Ada newsletter</h1>
<form action="/newsletter/signup" method="post">
  <div>
    <input name="email" type="text" placeholder="lovelace@adadev.org"></input>
  </div>

  <div>
    <input name="name" type="text" placeholder="Ada Lovelace"></input>
  </div>

  <input type="submit" value="Sign up now!"></input>
</form>
```

### `<label>` Tags

One thing you'll notice about our example so far is that it doesn't include any text on the page. There's no indication (other than the placeholder text) of what our `<input>` elements are for. To help out the user we'll label them with `<label>`s.

Each `<label>` gets a `for` attribute, which should match the `name` of the `<input>` it corresponds to. Making this connection is important for accessibility.

Adding `<label>` tags to our example yields:

```html
<h1>Sign up for the Ada newsletter</h1>
<form action="/newsletter/signup" method="post">
  <div>
    <label for="email">Your email:</label>
    <input name="email" type="text" placeholder="lovelace@adadev.org"></input>
  </div>

  <div>
    <label for="name">Your name:</label>
    <input name="name" type="text" placeholder="Ada Lovelace"></input>
  </div>

  <input type="submit" value="Sign up now!"></input>
</form>
```

That's starting to look like a real form!

### Other Form Elements

While `<input>` covers most types of form elements, there are a few that for one reason or another get a special tag. The two most common are `<textarea>` and `<select>`.

A `<textarea>` is used for a multiline text input. You can use it in the same way as `<input type="text">`, except for it takes `rows` and `columns` attributes to specify how big it is.

A `<select>` is used for dropdown menus, and should have a `name` attribute. Each item in the menu should be wrapped in an `<option>` tag, and should have a `value` attribute indicating the data sent to the server when that option is selected.

Let's add a `<select>` to our email signup form:

```html
<h1>Sign up for the Ada newsletter</h1>
<form action="/newsletter/signup" method="post">
  <div>
    <label for="email">Your email:</label>
    <input name="email" type="text" placeholder="lovelace@adadev.org"></input>
  </div>

  <div>
    <label for="name">Your name:</label>
    <input name="name" type="text" placeholder="Ada Lovelace"></input>
  </div>

  <div>
    <label for="source">How did you hear about us?</label>
    <select name="source">
      <option value="search">Found through a search engine</option>
      <option value="friend">Referred by a friend</option>
      <option value="sponsor-company">Through one of our sponsor companies</option>
    </select>
  </div>

  <input type="submit" value="Sign up now!"></input>
</form>
```

## Creating and Submitting Forms

Forms are used to create requests to servers that can create, update, and delete resources.

We are going to look at how inputs from a form are passed along through the browser to our server. Let's open the web application we have been using and create a new route and view like:

```bash
$ touch app/views/books/new.html.erb
```

```ruby
# app/controllers/books_controller.rb
def new

end
```

Then, let's open the view (`app/views/books/new.html.erb`) in our editor. Add the following code to the page:

```html
<form action="/books" method="post" accept-charset="utf-8">
  <!-- SPECIAL INPUT TO ALLOW RAILS TO USE THIS FORM -->
  <input name="authenticity_token" value="<%= form_authenticity_token %>" type="hidden">


  <label for="title">Title</label>
  <input type="text" name="title" value="" id="title">

  <label for="author">Author</label>
  <input type="text" name="author" value="" id="author">

  <input type="submit" value="Submit">
</form>
```

In the `form` tag, the `action` attribute defines to which route this form will `POST`. We're using the route that corresponds to the RESTful POST route for creating a new entry. We know that submitting the form will create a `POST` request because that's the value of the `method` parameter. We could use `PUT`, `DELETE`, or any other verb (even `GET`, but that's kinda silly).

Next we have a `label` tag
```html
<label for="title">Title</label>
```

Labels are the text portion of a form. The reason we use labels instead of plain text is because we can join an `input` and a `label` to when the text is clicked the cursor will focus on the input. The `for` attribute defines the `id` that the `label` will match. Also, creating a link between the `label` and `input` tags is critical in creating usable form content for folks using screen readers.

Next we have two `input` tags with the type of 'text' (see [here](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input) for all input info).

```html
<input type="text" name="title" value="" id="title">
<input type="text" name="author" value="" id="author">
```

Each `input` tag will pass a value along to the server when we submit the form. The data passed to the web server in our _POST request_ is collected in a Ruby hash called `params`. In this hash, the `name` attribute of the HTML `<input>` defines the key, and the user input is value. In this case `title` will be assigned to what we type into the first text field.

And finally we have an `input` with the type of _submit_. This input creates a button to click that will send an HTTP request with the form data to the route in the `action` attribute of the `form` tag.

Give it a try. It broke, right? We haven't taught our app how to make this work!

### Nested params
Let's make our form a little bit smarter. We can submit nested data by manipulating the `name` attribute.

```html
<input type="text" name="book[title]" value="" id="title">
<input type="text" name="book[author]" value="" id="author">
```

In Rails this is the way we _model_ data objects. Once we have our form set up in this way, then we can pass this data from the form to the controller action that should be handling the form submission.

### `params`
Once we have the form we set up to send the submission to the appropriate route, then we need to modify the corresponding controller action.

We have seen Rails using the special variable called `params` before when we were writing the definition for our `show` action. `params` will also store each piece of data that we've specified in our form!

<!-- We will expand upon this idea once we learn about Active Record, but until then, imagine a `Book` class where the initialize method is written to assign attributes from a hash. We would then pass the inner hash to the `new` method and all of our attributes would be assigned.

```ruby
# app/models/book.rb
class Book
def initialize(options = {})
@title = options[:title]
@author = options[:author]
end
end
```
-->

```ruby
# app/controllers/books_controller.rb
book = Book.new(title: params[:book][:title], author: params[:book][:author])
```
## Resources
- [MDN Input Element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
- [MDN Form Element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form)
- [SO on why `<textarea>` isn't `<input type="textarea">`](https://stackoverflow.com/questions/5637326/why-isnt-textarea-an-inputtype-textarea)
