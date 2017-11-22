
# Filtering and Sorting Collections

## Learning Goals

By the end of this lesson you should:
- Be able to filter a collection by a specific attribute.
- Be able to create a comparator function to sort a collection

## Filtering a Collection

You can do basic filtering of a collection by using the `where` function.  

`bookList.where({author: 'Caitlin Moran'})`

We can change the `render` function by adding a click event to the author table cells by adding the class `author-cell` to the `td` elements containing the authors.

```javascript
const render = function render(bookList) {
  const $booklist = $('#book-list');
  $('.author-cell').unbind('click');

  $booklist.html('');

  bookList.forEach((book) => {
    let generatedHTML = bookTemplate(book.attributes);
    $booklist.append(generatedHTML);
  });

  $('.author-cell').on('click', function cellClicked(event) {
    const clickedText = $(this).html().trim();
    render(bookList.where({author: clickedText}));
  });
};
```

Now when you click on an author you will see a list of books by that author.  **Uh oh!** There is now no way to **unfilter** the list without refreshing the page.  As an exercise add a button called `clear-filter` which calls render with the entire list when clicked.

### Filtering with `select`

You can also filter the book list in a more complicated fashion with the select function.

```javascript
const filteredList = bookList.select( (model) => {
  return model.get('publication_year') > 1950;
});
```

## Sorting A Collection

Backbone collections have a `comparator` field which they use to determine the order of their models.  This `comparator` field defaults to the model's `cid` field.    

If we add the following to our `app.js` file.  Our application can sort the table by the title, author or publication year.

```javascript
// src/app.js
// ...
$('.sort').click( function(event) {
  const $classes = $(this).attr('class').split(' ');
  bookList.comparator = $classes[1];
  bookList.sort();
  render(bookList);
});
// ...
```

This event handler gets the classes of the element clicked on and uses the 2nd class (the attribute name) and sets the comparator to that value.  We then re-render the list.

**Question** What happens if we remove the `bookList.sort();` line?

This does lead us to one problem, we can only sort in ascending order.  If the user clicks on the same column twice wouldn't we want to reverse the process?  

**Exercise** Modify the above event handler to reverse the order if the same table header is clicked on twice.  **Hint** You can directly access the model array inside the collection with `bookList.models`.

You can see a solution [here](./Resources/sortingsolution.js).

You can also replace the comparator with a function to sort in a more complicated method.  You can see more on this [here](https://coderwall.com/p/uhd1wa/sorting-a-backbone-js-collection).

## Summary

In this exercise we have seen how to:
- Retrieve a subset of a collection by using `.where` and `.select`.
- Sort a collection by setting `comparator` to a specific field and learned you can set `comparator` to a function.

## Additional Resources
- [Coderwall Sorting a Backbone Collection](https://coderwall.com/p/uhd1wa/sorting-a-backbone-js-collection)
- [Stack Overflow article on reversing a sort](https://stackoverflow.com/questions/5013819/reverse-sort-order-with-backbone-js)
