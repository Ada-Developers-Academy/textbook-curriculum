# Backbone Events

## Learning Goals

## Responding to User Events
So far, our Backbone application has only been able to serve static, hard-coded data. This isn't very useful, and it's not very interesting, so let's give the user the ability to add a task to the list.

### Setup
We'll add a simple HTML form to the top of the page with two fields: a title and a description. When the user clicks the "Add Task" button or presses enter, the task should be displayed in the list. There should also be a "Clear" button, which resets the form.

Here's some HTML to get us started. This will replace the whole `<main>` section from the previous lecture.

```html
<main id="application" class="row">
  <section class="small-12 columns">
    <h1>Task List</h1>

    <form class="row new-task">
      <div class="small-12 large-4 columns">
        <label for="title">Title</label>
        <input type="text" name="title"></input>
      </div>
      <div class="small-12 large-4 columns">
        <label for="description">Description</label>
        <input type="text" name="description"></input>
      </div>
      <div class="small-12 large-4 columns">
        <!-- Placeholder for vertical alignment -->
        <label class="show-for-large">&nbsp;</label>
        <button type="submit" class="success button">Add Task</button>
        <button type="button" class="warning button clear-button">Clear</button>
      </div>
    </form>
  </section>

  <ul class="task-list small-12 large-6 columns end">
  </ul>
</main>
```

Note that webpack is only watching our JavaScript files for changes. You'll have to refresh the page if you want to see the new HTML.

**Question:** If you didn't know anything about Backbone, how would you solve this problem? What steps would your application have to go through?

#### HTML Forms and the Submit Event
In addition to the click or keypress event that happens when a user clicks the button or presses enter, an HTML form will emit a "submit" event when either of those things happens. This isn't a Backbone thing, it's just how HTML forms work. You could handle the submit event in jQuery with code like this:

```javascript
$('.my-form').submit(callbackFunction);
```

One tricky thing: by default, _any_ button in a form will emit a submit event when clicked. To disable this behavior, you need to give your HTML button a `type="button"` attribute (like we have for our clear button).

### Clearing the Form
It's not quite as glamorous as adding a new task, but clearing the form provides a good introduction to Backbone's event system without tying us up in complex logic, so we'll start there.



### Adding a Task

## What Have We Accomplished?

## Additional Resources
