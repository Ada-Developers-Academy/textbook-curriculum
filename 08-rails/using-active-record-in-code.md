# Using Active Record in Code

By the end of this lesson, students will be able to:

- Write code in the controller to access the database
- Properly access the properties of a model object in ERB

## No More Constants

Now that we are creating data in our Model via the console, we can really start to connect our whole rails project.

Remember when we wrote this at the top of our books controller?

``` ruby
BOOKS = [
  { title: "Hidden Figures", author: "Margot Lee Shetterly"},
  { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
  { title: "Kindred", author: "Octavia E. Butler"}
]
```

This was a quick little hack to get us data that we could play with right off the bat. Unfortunately, it doesn't really cover a realistic use case. We know at this point that we are planning to create update and delete things from a database managed by active record using CRUD actions, so now that we have some real data to play with, we've outgrown this.

## Accessing the Database

Luckily for us, the commands that we were using in the rails console are, in fact, the same commands that we will want to use in our code! (The console is in pry, and pry is ruby. Handy!)

So instead of the line we had originally in our `index` action:

```ruby
def index
  @books = BOOKS
end
```

We're going to want to use the query that returns all of the `Book` records to us! What would that look like?

<details>
<summary></summary>

```ruby
def index
  @books = Book.all
end
```
</details>

### Exercise:

With your neighbor(s), brainstorm how you would update the `books#show` action to use our new Active Record commands!

<details>
<summary></summary>

```ruby
  def show
    book_id = params[:id]
    @book = Book.find_by(id: book_id)
    if @book.nil?
      head :not_found
      return
    end
  end
```
</details>

## Active Record Objects in ERB

While this will help us use Active Record in the controller, we still need to make some adjustments. Since we're no longer using a hash, we need to remove the code that looks like this:

```ruby
<%= @book[:author] %>
```

Luckily, since we are using Active Record, this is as simple as treating the data as what it is: an object! The code above becomes:

```ruby
<%= @book.author %>
```

## Tests

Note that it is also important to update your tests. We will go into more detail on this soon. 

Here is the updated show test for reference.

```
describe "show" do
    before do
      @book = Book.create(title: "hello world")
    end

    it "will get show for valid ids" do
      # Arrange
      valid_book_id = @book.id
  
      # Act
      get "/books/#{valid_book_id}"
  
      # Assert
      must_respond_with :success
    end
    
    ...
```
### Live Code

Let's dash through the two views we've already made and update them to use this syntax! Once we like our changes, we'll make sure to test it by looking at all of the types of pages we changed.

## Summary

When we are using Active Record in our rails server, we can use the easy shorthand to access the database rather than using SQL.
