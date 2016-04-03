# Checkboxes and Radio Buttons
## Learning Goals
- Utilize _checkboxes_ and _radio buttons_ to collect multiple-choice data in an HTML form
- Explore handling multiple choice form data on the server side
- Learn a good pattern for making accessible multiple choice input elements
- Acknowledge that _checkboxes_ and _radio buttons_ are kinda weird.

Checkboxes and Radio buttons are quite odd. They're purpose is similar; provide multiple, pre-defined possibilities for the value of a single input. The difference is that checkboxes allow multiple selections while radio buttons allow only one.

## Creating Checkboxes
```html
<form action="" method="post">
  <p>My favorite pizza toppings are:</p>
  <input type="checkbox" name="toppings[]" value="pepperoni">Pepperoni
  <input type="checkbox" name="toppings[]" value="ham">Ham
  <input type="checkbox" name="toppings[]" value="mushrooms">Mushrooms
  <input type="checkbox" name="toppings[]" value="onions">Onions

  <input type="submit" value="Choose">
</form>
```

__Question: What's wrong with this code?__

Right. It's not creating an association between the checkboxes and their values. This is not good for a couple of reasons. First, it totally breaks accessibility guidelines, especially in regards to screen readers. Second, it disassociates the word `Pepperoni` with the checkbox that represents the value of `pepperoni`. Nobody likes disassociated meats.

we could _style_ this form to create implied visual groupings, but that only helps sighted humans who read/think they same way that we do. Let's look at a better (and unfortunately more verbose) way.

```html
<form action="" method="post">
  <fieldset>
    <legend>My favorite pizza toppings are:</legend>
    <label><input type="checkbox" name="toppings[]" value="pepperoni">Pepperoni</label>
    <label><input type="checkbox" name="toppings[]" value="ham">Ham</label>
    <label><input type="checkbox" name="toppings[]" value="mushrooms">Mushrooms</label>
    <label><input type="checkbox" name="toppings[]" value="onions">Onions</label>
  </fieldset>

  <input type="submit" value="Choose">
</form>
```
__Question: Is this better? Why?__

I think it's about six bajillion percent better. We nest all our pizza toppings in a `<fieldset>` which tells the browser/screenreader/crawler that the containing `<input>` elements are related. The `<legend>` element provides a text identifier that explains how the inputs are related. Think of it as a label for a the whole fieldset.

Speaking of labels, what's up with the `<label>` tags? Notice the absence of `for` and `id` attributes? I did that on purpose because of this bit from the [HTML5 Spec](http://www.w3.org/TR/2014/REC-html5-20141028/forms.html#the-label-element) (emphasis mine):

> The label element represents a caption in a user interface. The caption can be associated with a specific form control, known as the label element's labeled control, either using the `for` attribute, or by putting the form control __inside the label element itself__.

So by nesting the `<input>` inside the `<label>`, we create the same kind of association as we would by pairing the `for` attribute in the `<label>` with the `id` attribute in the `<input>`.

Neat, yeah? Now people (with and without assistive devices) and robots alike will understand what these checkboxes are, what their values represent, and how they relate to each other. We win. <3

__One More Question: Why is the name of all the checkboxes `toppings[]`?__

## Radio buttons are pretty much the same thing, only different.
```html
<form action="" method="post">
  <fieldset>
    <legend>My most favorite pizza topping is:</legend>
    <label><input type="radio" name="topping" value="pepperoni">Pepperoni</label>
    <label><input type="radio" name="topping" value="ham">Ham</label>
    <label><input type="radio" name="topping" value="mushrooms">Mushrooms</label>
    <label><input type="radio" name="topping" value="onions">Onions</label>
  </fieldset>

  <input type="submit" value="Yum">
</form>
```

Radio buttons are structured and work just like checkboxes with one key difference. You can only activate _one_ radio button in a given group, whereas you can activate _many_ checkboxes. We define the group with the `name` attribute in the `<input>` element. So for the code above, we have to pick _one favorite topping_ and only from the list provided. That's a hard one.

__Question: If I really wanted to know a person's favorite pizza topping, what would be the best type of `<input>` to use? What are the limitations or concerns of that type of input versus a group of checkboxes or radio buttons?__
