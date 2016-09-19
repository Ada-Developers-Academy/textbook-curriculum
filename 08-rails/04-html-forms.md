# HTML Forms, Part 1
## Learning Goals
- Discover the mechanisms in the HTML standard that allow for interactive elements on a website
- Discuss how to create accessible and semantic forms
- Make and _post_ our first HTML form!

Forms are how users provide input to servers for operation. Everything from authoring a tweet to logging into an email account is accomplished using a small set of HTML tags that create and structure forms.

## Relevant Tags
- `<form>`
- `<fieldset>` and `<legend>` (handy, but not often used)
- `<label>`
- `<input>`
  - `<input type="text">`
  - `<input type="checkbox">`
  - `<input type="radio">`
  - `<input type="password">`
  - `<input type="file">` and `<input type="image">`
  - `<input type="submit">`
  - `<input type="reset">` (careful with this one)
  - `<input type="hidden">`
- `<textarea>`
- `<select>`
  - `<option>`
- `<button>`, and `<input type="button">` are primarily used for JavaScript interactions.

## Creating and Submitting Forms
Forms are used to create requests to servers that can create, update, and delete resources.

We are going to look at how inputs from a form are passed along through the browser to our server. Let's open our Sintra exercise from a couple of days ago and create a new route and view like:

```bash
$ touch views/my-first-form.erb
```

```ruby
# my-site.rb
get '/my-first-form' do
  erb :my_first_form
end
```

Then, let's open `views/my-first-form.erb` in our editor. Add the following code to the page:

```html
<form action="" method="post" accept-charset="utf-8">
  <label for="username">Username</label>
  <input type="text" name="username" value="" id="username">

  <label for="fave-animal">Favorite Animal</label>
  <input type="text" name="fave-animal" value="" id="fave-animal">

  <input type="submit" value="Submit">
</form>
```

In the `form` tag, the `action` attribute defines to which route this form will `POST`. We're using a blank value because, by default, forms submit to the same route as the current page. We know that submitting the form will create a `POST` request because that's the value of the `method` parameter. We could use `PUT`, `DELETE`, or any other verb (even `GET`, but that's kinda silly).

Next we have a `label` tag
```html
<label for="fname">Username</label>
```

Labels are the text portion of a form. The reason we use labels instead of plain text is because we can join an `input` and a `label` to when the text is clicked the cursor will focus on the input. The `for` attribute defines the `id` that the `label` will match. Also, creating a link between the `label` and `input` tags is critical in creating usable form content for folks using screen readers.

Next we have two `input` tags with the type of 'text' (see [here](http://www.htmldog.com/reference/htmltags/input/) for a complete list of input types).

```html
<input type="text" name="username" value="" id="username">
<input type="text" name="fave-animal" value="" id="fave-animal">
```

Each `input` tag will pass a value along to the server when we submit the form. The data passed to the web serve in our _POST request_ is collected in a Ruby hash called `params`. In this hash, the `name` attribute of the HTML `<input>` defines the key, and the user input is value. In this case `username` will be assigned to what we type into the first text field.

And finally we have an `input` with the type of _submit_. This input creates a button to click that will send an HTTP request with the form data to the route in the `action` attribute of the `form` tag.

Give it a try. It broke, right? We haven't taught Sinatra how to handle a `POST` to the route. So let's do that:

```ruby
# my-site.rb
post '/my-first-form' do
  erb :my_first_form #yup, let's just render the same form again
end
```
Now it'll work, but it's not much fun. Let's make it more fun by adding something to our view:

```erb
<pre><%= params %></pre>
```

### Nested params
Let's make our form a little bit smarter. We can submit nested data by manipulating the `name` attribute.

```html
  <input type="text" name="peep[name]" value="" id="name">
  <input type="text" name="peep[fave_animal]" value="" id="fave_animal">
```

In Sinatra (and Rails) this is the way we _model_ data objects. Imagine a `Peep` class where the initialize method is coded to assign attributes from a hash. We would then pass the inner hash to the `new` method and all of our attributes would be assigned.

```ruby
class Peep
  def initialize(options = {})
    @name = options[:name]
    @fave_animal = options[:fave_animal]
  end
end

peep = Peep.new(params["peep"])
```

Awesome, yeah?
