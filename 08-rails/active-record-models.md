# Active Record: Models
## Learning Goals
- Use AR _models_ to perform CRUD tasks on database records
- Joyfully embrace the _Rails Console_
- Begin exploring the AR _query interface_

## Active Record as a DSL
Given a table in our database called _books_ that has this structure:

| id | title     | author         | description   |
|:--:|:--------:|:-----------:|:----------:|
|  1 | 'Hidden Figures'   | 'Margot Lee Shetterly'       | 'Good book that came before the movie' |
|  2 | 'Practical Object-Oriented Design in Ruby'     | 'Sandi Metz'       | 'Good programming book' |
|  3 | 'Kindred'   | 'Octavia E. Butler'       | 'Good sci-fi book' |

We should have a corresponding file called `app/models/book.rb`. It will look like this:

```ruby
class Book < ApplicationRecord

end
```

This is our Book _model_, and it is connected to a table in the database called _books_. We don't have to explicitly tell Rails about that connection; by following the naming conventions (thank you, Inflector!), Rails knows which database table to use with which _model_. By doing this you'll also have the ability to map the columns of each row in that table with the attributes of the instances of your model.

For right now, our _models_ will likely be empty Ruby classes. The inherited class (`ApplicationRecord`) provides a tremendous amount of functionality. As we move forward in the curriculum, we will begin filling out our models with additional functionality.

## Interacting with models in the _Rails console_
Rails provides a REPL (similar to irb and pry) that pre-loads all the application information when started. It's one of the most useful tools I've encountered. Let's spend some time exploring it. From your application root, run `$ rails console`:

```bash
$ rails console
Running via Spring preloader in process 48975
Loading development environment (Rails 4.2.6)
2.3.0 :001 >
```

Now we're in the _console_, from here we can do all the stuff that irb and pry provide, plus have access to all of our Rails models. Use the console to create an __instance__ of our Book _model_:

```ruby
2.3.0 :001 > b = Book.new
 => #<Book id: nil, title: nil, author: nil, description: nil, created_at: nil, updated_at: nil>
```

We can assign data to the instance using plain Ruby:
```ruby
2.3.0 :002 > b.title = "Between The World and Me"
 => "Between The World and Me"
2.3.0 :003 > b.author = "Ta-Nehisi Coates"
 => "Ta-Nehisi Coates"
2.3.0 :004 > b
 => #<Book id: nil, title: "Between The World and Me", author: "Ta-Nehisi Coates", description: nil, created_at: nil, updated_at: nil>
```

When we are happy with the data in our _model_, we can write it to the database using a single command:

```ruby
2.3.0 :005 > b.save
(5.9ms)  begin transaction
SQL (2.2ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["title", "Between The World and Me"], ["author", "Ta-Nehisi Coates"], ["created_at", 2017-03-17 05:33:02 UTC], ["updated_at", 2017-03-17 05:33:02 UTC]]
   (1.5ms)  commit transaction
 => true
```

__Question: ZOMG what just happened?__
The Active Record DSL translates our Ruby code into SQL, and then executes it.

```ruby
Book.where(author: "Ta-Nehisi Coates")
```
becomes

```sql
SELECT * FROM "students" WHERE "author" = "Ta-Nehisi Coates";
```

## AR Class Methods: Finding and Organizing Records
ActiveRecord class methods are generally for locating & reading rows from the database:

```ruby
# return a collection of all rows in the books table
books = Book.all

# return the first book (lowest id)
book = Book.first

# return an individual record using the id
Book.find(1) # returns the Book with ID of value 1

# return the first book (lowest id) authored by Roxane Gay
roxane_book = Book.find_by(author: 'Roxane Gay')

# the AR DSL is structured to use chaining to create more specific queries
# here we find all books by Roxane Gay
# *and* return them in reverse alphabetical order
roxane_books_ordered = Book.where(author: "Roxane Gay").order(title: :desc)

# provide compound conditions to do more specific queries
specific_book = Book.where(author: "Roxane Gay", title: "Bad Feminist")

# use `not` to exclude values from results
not_roxane = Book.where.not(author: "Roxane Gay")
feminists_not_roxane = Book.where(title: "Feminism").where.not(author: "Roxane Gay")

# we can use `where` to pull a bunch of records at once
ids = [1,2,3]
Book.where(id: ids)

# return books in a specific order
alphabetical_books = Book.order(:author)
```

### Parameter Binding with Active Record

Active Record uses something called _parameter binding_ to take our requests and convert them into SQL, the nearly universal language of databases and (most importantly) make queries more secure (google research: [_sql injection_](https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=sql%20injection)), and to improve the reusability of queries. This idea is very important in Rails, and AR provides it.

If you write code using the `where` syntax above in the rails console (like `Book.where(author: "Roxane Gay")`), Active Record _does parameter binding automatically_. Active Record can also provides manual parameter binding:

```ruby
# using '?'
Book.where("author = ?", "Roxane Gay")

# using named parameters
Book.where("author = :author AND title = :title", author: "Roxane Gay", title: "Bad Feminist")
```

The first line above uses the `?` symbol as a placeholder, and inserts the second argument into that position.  So it is looking for books where the author is "Roxane Gay".

The second line makes a more complicated query and has 2 named parameters, `:author` and `:title` and passes in a hash where the named parameter values are passed in.  

So something like this would work as well:

```ruby
Book.where("author = :author OR title = :title", {author: "Ta-Nehisi Coates", title: "Bad Feminist"})
```

### Using AR to modify rows in the database
Instances of Active Record models can be created from a hash, a block or have their attributes manually set after creation. Once an instance has its data attributes defined, it can be saved to the database, making a persistent record of that data.

#### `new` vs. `create`
`new` returns a new object of that class, but doesn't save it to the database.

```ruby
# `new` with preset data
hidden_figures = Book.new(author: "Margot Lee Shetterly", title: "Hidden Figures")
hidden_figures.id # => nil
```

```ruby
# an "empty" new book
book = Book.new
# assigning data attributes
book.author = "Rachel Ignotofsky"
book.title = "Women In Science"
```

Meanwhile, `create` will initialize a new instance of the model *and* save it to the database:
```ruby
book = Book.create(author: "Margot Lee Shetterly", title: "Hidden Figures")
book.id #=> 5
```

#### Editing an existing row
Once we've located a record using `find`, `where`, or other class methods, we can modify the data in the __instances__ returned. Calling `save` on those instances will then persist the altered data back to the database.

```ruby
# find the book we want to modify
book = Book.where(author: "Margot Lee Shetterly").first
book.title #=> "Hidden Figurines"

# change the title which is wrong
book.title = "Hidden Figures"
book.title #=> "Hidden Figures"

# assign the book's description
book.description = "The phenomenal true story of the black female mathematicians at NASA."

# save the data back to the database
book.save

(0.1ms)  begin transaction
SQL (0.6ms)  UPDATE "books" SET "title" = ?, "description" = ?, "updated_at" = ? WHERE "books"."id" = ?  [["title", "Hidden Figures"], ["description", "The phenomenal true story of the black female mathematicians at NASA."], ["updated_at", 2017-03-17 05:54:21 UTC], ["id", 2]]
(1.3ms)  commit transaction
# => true
```

#### Removing rows from the database
Similar to updating data, we can invoke a method on an _instance_ of an AR model to remove it's associated data from the database

```ruby
# count our books
Book.count #=> 7

# find the book we want to remove
seuss = Book.find_by(title: "Lorax")

# remove the record from the database
seuss.destroy

(0.1ms)  begin transaction
SQL (1.5ms)  DELETE FROM "books" WHERE "books"."id" = ?  [["id", 7]]
(1.5ms)  commit transaction

# count our books again
Book.count #=> 6

# now there's not a seuss in the database
nope = Book.find_by(title: "Lorax") #=> nil
```

**WARNING:** An AR model does also have a `delete` method and it will delete the instance from the database, but it does **[not](http://stackoverflow.com/questions/22757450/difference-between-destroy-and-delete)** do exactly the same thing.  We will discuss it a bit later when we introduce relationships.  For now, just avoid using it.    

## Summary Tables
For any call that takes a hash, the argument will be of form `attribute: value` or `attribute: [list, of, possible, values]`. To check multiple attributes, add them to the hash: `author: 'test author', title: 'test title'`. You can also pass a hash object to any of these.

Calls that talk to the DB will always result in a SQL query. Calls that are memoized will result in a SQL query the first time only (so subsequent changes to the database will not be shown).

### Retrieving Entries from the DB
These can be run on an ActiveRecord class (like `Book`) or on any collection (like the result of `Book.all`).

| Method                           | Description                        | Arguments  | Returns                | Talks to DB |
|:---------------------------------|:-----------------------------------|:-----------|:-----------------------|:------------|
| `Book.all`                    | Get all table entries              | N/A        | Collection of Books | Yes         |
| `Book.first`, `Book.last`  | Get entry with lowest / highest ID | N/A        | One Book            | Yes         |
| `Book.find(4)`                | Get the entry in row 4             | Integer    | One Book            | Yes         |
| `Book.where(author: 'so and so')`   | Get entries that match             | Hash       | Collection of Books | Yes         |
| `Book.find_by(title: 'such and such')` | Get matching entry with lowest ID  | Hash       | One Book            | Yes         |
| `Book.order(:title)`           | Sort entries                       | Field Name | Collection of Books | Yes         |
| `Book.count`                  | Count entries                      | N/A        | Integer                | Yes         |
| `Book.size`                   | Count entries                      | N/A        | Integer                | Memoized    |
| `Book.empty?`                 | Are there zero entries?            | N/A        | Boolean                | Memoized    |

### Interacting with a Retrieved Entry
Assume that `my_book` is a local copy of an entry in the table, as returned by a call like `Book.first`. Remember that any changes made to a local copy will not be reflected in the database until `save` is called on that copy.

| Method                | Description                                | Arguments | Returns | Talks to DB |
|:----------------------|:-------------------------------------------|:----------|:--------|:------------|
| `my_book.attributes`    | Get a hash containing all fields           | N/A       | Hash    | No          |
| `my_book.title`          | Get the value of one field                 | N/A       | Value   | No          |
| `my_book.id`            | Get the unique ID assigned by ActiveRecord | N/A       | Value   | No          |
| `my_book.author = 'coool'` | Modify the value of one field              | Value     | Value   | No          |

### Modifying the DB
`save`, `create`, `update`, and `destroy` are the only ways to change what's stored in the database - other methods just change **local copies** of the data. To use the vocabulary we learned for HTTP verbs, these methods are _unsafe_.

| Method                                        | Description                                    | Arguments | Returns     | Talks to DB |
|:----------------------------------------------|:-----------------------------------------------|:----------|:------------|:------------|
| `book = Book.new`                         | Make a new entry, stored in a local variable   | Hash      | One Book | No          |
| `book.save`                                  | Save a local copy of an entry to the DB        | N/A       | Boolean     | Yes         |
| `Book.create(author: 'author', title: 'title')` | Make a new entry and save to the DB          | Hash      | One Book | Yes         |
| `book.update(author: 'new author')`                    | Modify an entry and save to the DB             | Hash      | One Book | Yes         |
| `book.destroy`                               | Remove an entry from the DB, freeze local copy | N/A       | One Book | Yes         |




## What We Learned
- Active Record is an _ORM_, and provides a _DSL_ for modeling queries
- We explored how to create an Active Record _model_
- Some CRUD queries using Active Record in the _Rails console_

## Additional Resources
- http://guides.rubyonrails.org/active_record_querying.html  
- http://guides.rubyonrails.org/active_model_basics.html
