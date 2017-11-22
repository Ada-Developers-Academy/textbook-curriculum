$('.sort').click( function(event) {
  const $classes = $(this).attr('class').split(' ');
  if (bookList.comparator === $classes[1]) {
    bookList.models.reverse();
  } else {
    bookList.comparator = $classes[1];
    bookList.sort();
  }
  render(bookList);
});
