# Active Record Relationships

Today we are going to be discussing Active Record relationships in Rails.

For this discussion, think of your instructor as a mediator and guide, rather than as a lecturer. You are encouraged to do the following:

* Whenever possible, you should use voice.
* You should pose questions to the group, not the instructor.
* Similarly, you are encouraged to answer questions, with the instructor available to correct misconceptions and provide answers when no one else has an answer.
* Say something, even if you think you might be wrong! (Nobody throws a frisbee well on their first try)
* When discussing code, you are encouraged to use VS Code Liveshare, and or screen sharing through zoom.
* Take notes!

## Materials
* [Active Record Relationships](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/active-record-relationships.md)
* [Active Record Relationshps Exercise](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/exercises/active-record-relationships-exercise.md)

## Prompts
You are encouraged to copy these questions into a document and take notes during the discussion.

### Updating our Models and Database

On a high-level, we want there to be two models, `Book` and `Author`, and we want them to have a one-to-many relationship, where one `Author` has many `Book`s.

1. What is the code in the model files (`app/models/book.rb` and `app/models/author.rb`) that we need to add in order to establish a one-to-many relationship between `Book` and `Author`?
1. Rails wants us to have a separate database table for every model.
    - On a high-level, what are the changes to the database that we need to make?
    - What columns or tables do we need to remove or add?
1. What is a foreign key? How does the database use this column in order to establish a relationship between two models?

### Using Active Record Relationships

Assume that the following records of data exist in our database:

`books`

| id | title | author_id | description |
|---|---|---|---|
| 778 | `"Frankenstein"` | 241 | `"It's a book"`
| 81 | `"Another Book"` | 99 | `"It's another book"`
`authors`

| id | name |
|---|---|
| 241 | `"Mary Shelley"`
| 5 | `"A False Author"`

1. If we do `book = Book.find_by(id: 778)`...
    - What Ruby code can we write to...
      - access the book's author?
      - access the book's author's name?
      - give `book` a new author?
1. If we do `author = Author.find_by(id: 241)`...
    - What Ruby code can we write to...
      - access the author's books? What data type is this?
      - access all of the `title`s of all of the books associated with `author`?
      - add a new book to `author`?
      - Predict: remove a specific book from `author`?
1. How could we use these methods in our tests?

### If Time Allows: Updating our Views, Controllers, Tests, etc.

Whenever we add a new feature, we should think about how it changes our entire app.

1. What changes did we make to the **views** in order to see authors?
1. What changes did we need to make in our controllers?
    - In what controller actions? Why?
    - In what controller helper methods? Why?
1. What changes will we need to anticipate for our tests?
1. Hypothesize about Rails: Why didn't we need to make a new `AuthorsController`?
