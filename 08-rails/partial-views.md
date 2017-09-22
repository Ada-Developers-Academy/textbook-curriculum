# Partial Views
## Learning Goals
- What is a partial?
- Why do we use partials?
- How can we implement a partial?

## What and Why?
A partial is a view that you may want to reuse in other locations. Partials are intended for DRYness. They should contain a piece of HTML that is reused over multiple views. Partials optionally accept options for local variables.

Let's look at the `new` and `edit` forms that we have created thus far. What portion of the form is different and what portion is the same?

## Create a Partial
Partial views should start with an `_`. In addition, we want to rename the view to remove the action-specific name that it usually has.

#### Step 1
Let's start by creating a new view called `_form.html.erb`:
```bash
touch app/views/books/_form.html.erb
```

Next, we should copy in the existing `edit` form that we have been using.

Okay, so now we have a file that we should be able to share across two different forms. We still have to address two things:
1. The original forms are still there
2. We haven't handled the difference between the two forms

#### Step 2
Replace each of the existing views with the following and try it out in the browser.
```ruby
<%= render partial: "form" %>
```

The argument in this render statement corresponds to the name of the shared partial we have created.

#### Step 3
Lastly, we need to handle the difference between the forms using a local variable.

We can pass local variables along with the `render partial` command in the view, and then these variables can subsequently be used in the partial.

Let's update the `new` and `edit` views to utilize a variable.

`edit` view:

```ruby
<%= render partial: "form", locals: { action_name: "Edit" } %>
```


`new` view:

```ruby
<%= render partial: "form", locals: { action_name: "New" } %>
```

Then, if we want to utilize this `action_name` variable, we can update the submit button in the `partial` view to utilize this descriptor for the given action:
```ruby
<%= f.submit action_name %>
```

## Resources
[Rails Guides: Layouts and Rendering Using Partials](http://guides.rubyonrails.org/layouts_and_rendering.html#using-partials)  
[Rails API: Partial Render](http://api.rubyonrails.org/classes/ActionView/PartialRenderer.html)
