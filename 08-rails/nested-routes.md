# Advanced Routing & Relationships

## Learning Goals
- Explore _why_ we would want to use nested routes
- Explore _how_ to set up nested routes manually
- See how to use nested routes with `resources`
- Explore the `has_and_belongs_to_many` relationship to utilize a "join table"

## Context
Let's use an example in our book application to classify books under certain genres. As an example,  let's use two books:
1. **Bad Feminist** by _Roxane Gay_
  - Genres: Nonfiction, Feminism, Writing: Essays, Autobiography: Memoir

1. **Hidden Figures** by _Margot Lee Shetterly_
  - Genres: Nonfiction, History, Science, Biography, Historical


To implement this feature we'll want to:
1. Add a genre resource & all CRUD functionality (controller, model, views, routes)
  ```bash
  rails g controller genres
  rails g model genre
  ```

  ```ruby
  create_table :genres do |t|
    t.string :name

    t.timestamps
  end
  ```
1. When books are created, allow them to be associated one to many genres
1. Have a view to see all books in a particular genre

## Nested Routes
Oftentimes we create nested routes when we have resources which are _children_ of other resources. In this case, we will have a _genre_ resource which will contain books. Ideally, we can configure routes to be _nested_ within one another to provide additional context about the request we are making. For example, if we want to retrieve the list of books associated with the genre "nonfiction" (where genre "nonfiction" has an ID of 1 in our database), then we would want a route like `/genres/1/books`. This example demonstrates **nested routes**. We utilize RESTful routes for `books` inside the `genres` RESTful routes.

**Question**: Do we want _all_ `books` routes to be nested inside `genres`? If not, which would we want to be nested and which wouldn't?

Let's take a look at our standard RESTful routes:
```ruby
resources :genres
resources :books
```

Now, let's take a look at how to configure the nested routes we decided on above:
```ruby
resources :genres do
  get '/books', to: 'books#index'
  # resources :books, only: [:index]
  # two ways to get the same nested route
end

resources :books
```

What did we gain here? We've created an additional books index route which will also contain an additional `param` value `:genre_id`. Since we are using a nested route, Rails uses a more specific parameter name rather than `:id` which we are used to.

## Has and Belongs to Many Relationship
We can see the need for a new type of relationship based on the example books we described at the beginning of notes. Each book needs to have many genres and a genre does not only apply to a single book.

We have discussed this scenario a few times when working through ERDs and each time we've said "we'll talk about that later"! Now is the time!

We are going to use a **join table** to establish this relationship. This portion of our ERD will look like this:
![join table ERD](./images/join-table-erd.png)

- Each book has zero or more genres (through the books_genres table)
- Each genre has zero or more books (through the books_genres table)

**Important Notes about Join Tables**
- Rails is expecting the join table to be named according to the two resources we want to create the association for.
- We don't use a separate model for the join table. We access the data we configure through the join table with our existing models, `Book` and `Genre`.
  - Therefore when setting up the join table we want to `rails generate migration` rather than `rails generate model`

```bash
rails g migration CreateBooksGenresJoin
```

```ruby
# new migration file
create_table :books_genres do |t|
  t.belongs_to :book, index: true
  t.belongs_to :genre, index: true
  t.timestamps
end
```

Then we establish the relationship on the affected model objects.
```ruby
# models/book.rb
...
has_and_belongs_to_many :genres
```

```ruby
# models/genre.rb
...
has_and_belongs_to_many :books
```

## Putting it together

Now that we have established the relationship we are expecting and the route that will associate the two resources together, let's see how to get started on our controller implementation.

```ruby
# books_controller.rb
...
def index
  if params[:genre_id]
    # we are in the nested route
    # retrieve books based on the genre
  else
    # we are in our 'regular' route
    @books = Book.all
  end
end
```

Since we are retrieving the books based off of the genre, the query now gets a bit more complex. Since we don't have a `genre_id` directly on the book table, we have to look up the genre first and use that to find associated books.

```ruby
# books_controller.rb
...
def index
  if params[:genre_id]
    # we are in the nested route
    # retrieve books based on the genre
    genre = Genre.find_by(id: params[:genre_id])
    @books = genre.books
  else
    # we are in our 'regular' route
    @books = Book.all
  end
end
```

**Question:** What should our controller do if the user supplied a `genre_id` that doesn't match a genre?

## Additional Resources
- [Ruby on Rails: Nested Routes](http://guides.rubyonrails.org/routing.html#nested-resources)
- [Ruby on Rails: Has and Belongs to Many](http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association)
