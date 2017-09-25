# Active Record Relationships
## Learning Goals
- Move beyond single-model, single-table applications
- Learn the Rails vernacular for describing _model relationships_
- Explore the __awesome__ functionality provided by *belongs_to* and *has_many*

## *has_many* & *belongs_to*
Two Rails models can be related to each other through an identifier field (what we call a _foreign key_ in SQL). Take a look at the these two tables:

**authors**

| id | name     |
| :------------- | :------------- |
| 1       | Sandi Metz       |
| 2     | Margot Lee Shetterly |

**books**

|id | title                             | description | price | author_id |
|:-:|:--------------------------------:|:---------:|:---------:|:---------:|
| 1 | Practical Object-Oriented Design in Ruby |    A great book on object-oriented design| 19.99     | 1
| 2 | 99 Bottles of OOP        | An even more in-depth great book on object-oriented design| 24.99|    1     |
| 3 | Hidden Figures                | Good book that came before the movie| 14.99 |    2    |

We would call this a __one-to-many__ association. We would say that Author *has_many* Books, and each Book *belongs_to* an Author. The `author_id` column for a Book corresponds to the `id` of an Author record.


### Defining an Association
ActiveRecord provides lovely methods to quickly create an association between two (or more!) models. We can use class methods within models to make the definition.

```ruby
class Author < ApplicationRecord
  # plural because many books could be associated with this single author
  has_many :books
end
```

```ruby
class Book < ApplicationRecord
  # singular because it belongs to only a single author
  belongs_to :author
end
```

To make this relationship work, the underlying `books` table needs to have an `author_id` column to store the ID of the associated `Author`.

__Note:__ ActiveRecord does _not_ require a formal `foreign_key` relationship defined at the database level in order to leverage these associations, but it can be a really good idea to create them in your migrations.

### So what do these associations give us?
A whole slew of nice lookup methods that help us build queries for the associated model. Here'a sampling, and the [Rails Guides on Active Record Associations](http://guides.rubyonrails.org/association_basics.html) has complete details:

### belongs_to :author
- `book.author`: get the Author associated with this Book
- `book.author = author_object`: reassign this Book to an Author

### has_many :books
- `author.books`: returns an array of all the Books associated with this Author
- `author.books << book_object`: associate a Book with this Author by adding it to the array of Books
- `author.books = book_collection`: remove all prior Book associations and replace them with a new set of associations
- `author.books.find(id)`: find a specific Book, scoped to just those associated with this Author (not the most useful)
- `author.books.where(conditions_hash)`: get the Books associated with this Author that also satisfy the conditions in the `where` hash (much more useful)


And, for the table-oriented among you:

| Call | Returns | Touches DB | Note |
|:----:|:-------:|:----------:|:----:|
| `book.author` | Author object | Memoized | |
| `book.author = author_object` | Author object | No (requires save) | |
| `book.author.update(author: author_object)` | Author object | Yes | |
| `book.build_author(author_hash)` | Author object | No | Does **not** set book.author_id |
| `book.create_author(author_hash)` | Author object | Yes | Does **not** set `book.author_id` |
| `author.books` | Collection of books | Memoized | |
| `author.books << book_object` | Collection of books | Yes | **Does** set `book.author_id` |
| `author.books = book_collection` | Collection of books | Yes | |
| `author.books.find(id)` |  Book object | Yes | |
| `author.books.where(condition)` |  Collection of books | Yes | |
| `author.books.build(book_hash)` | Book object | No | **Does** set `book.author_id` |
| `author.books.create(book_hash)` | Book object | Yes | **Does** set `book.author_id` |

### Try it out!
Now let's try it out for ourselves. We're going to run through the steps to update our book app to have this relationship using [these notes](active-record-relationships-exercise.md).
