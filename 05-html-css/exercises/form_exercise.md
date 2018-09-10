# Forms Exercise

We have been contracted to build a website for a small art supplies company, Prismatic Paintbrushes. They take the quality of their product very seriously, and want to have a form on the site to allow users to give them feedback. Building this form is your task.

## Learning Goals

- Practice building various form elements
- Organize the data sent by a form to match what's required by a real web server

## Requirements

The feedback form should have the following properties:

- Brush size
  - Dropdown menu (see below for options)
  - Input name: `brush-size`
- Product material
  - Set of radio buttons (see below for options)
  - Input name: `material`
- Your feedback
  - Textarea with space for the user to type out a long comment
  - Input name: `feedback`
- Your name
  - Text input
  - Input name: `customer-name`
- Your email
  - Text input
  - Input name: `customer-email`

Each field should have a label describing it to the user, and each of the text areas should have a reasonable placeholder.

When submitted, this form should send a POST request to `TODO URL PLS`

### End Result

Here's what the finished product should look like.

![Finished Product](images/form_exercise_result.png)
<!-- See the solutions folder for code -->

**Question:** What CSS techniques did we use to style this page?

You don't need to worry about styling for this exercise, but it is an interesting thing to think about.

### Hints

To save you a little typing, here are tags for the dropdown menu and the radio buttons:

```html
<label for="brush-size">Brush Size</label>
<select name="brush-size">
  <option value="#3 Fan Blender">#3 Fan Blender</option>
  <option value="#6 Fan Blender">#6 Fan Blender</option>
  <option value="Half Size Round">Half Size Round</option>
  <option value="1&quot; Round Foliage Brush">1" Round Foliage Brush</option>
  <option value="#5 Detail Knife">#5 Detail Knife</option>
  <option value="#10 Painting Knife">#10 Painting Knife</option>
  <option value="2&quot; Blender">2" Blender</option>
  <option value="#2 Script Liner">#2 Script Liner</option>
  <option value="#6 Filbert">#6 Filbert</option>
  <option value="2&quot; Background">2" Background</option>
  <option value="1&quot; Oval Bristle">1" Oval Bristle</option>
  <option value="1&quot; Landscape">1" Landscape</option>
</select>

<label for="material">Product Material</label>
<div>
  <input name="material" type="radio" value="horsehair">
  <input name="material" type="radio" value="nylon">
  <input name="material" type="radio" value="polyester">
  <input name="material" type="radio" value="n-a">
</div>
```
