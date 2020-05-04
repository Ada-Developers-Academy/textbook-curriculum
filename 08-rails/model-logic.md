# Model Logic

## Learning Goals

- Define a method in an ActiveRecord model
- Know when to use model methods

## Business Logic

In Rails, we frequently say that your _business logic_ should go in the model. But what is business logic?

Generally speaking, business logic is anything that isn't part of the mechanics of running a web server. Here are some examples:

- Calculating the score of a Scrabble word
- Selecting an available driver to assign to a trip
- Determining which rooms in your hotel are available on a given date

One key observation is that these tasks are all independent of context. You could imagine a method to do any of these in a terminal program, a webapp, a mobile app, or many other settings. Because they're concerned with the problem at hand rather than with the specifics of the platform or the process of presenting content to the user, they all qualify as business logic.

As an example of business logic for our library app, we'll be writing a method to answer the following question: in what year was an author first published?

**Question:** How would you compute this value? Don't worry about _where_ to put this logic yet, only how it might work.

## Model Methods

In Rails, methods that implement business logic are defined in the model. Since our method answers a question about one author, we will write an instance method in the `Author` model.

```ruby
# app/models/author.rb
class Author < ApplicationRecord
  # ... relations and validations ...

  def first_published
    books_with_year = self.books.where.not(publication_date: nil)
    first_book = books_with_year.order(publication_date: :asc).first
    return first_book.publication_date
  end
end
```

There are a few things to observe here:
- This is a regular old Ruby method! All of your previous Ruby skills still apply.
- We can access attributes of this model like database fields and relations via `self.thing`
- We use local variables to store intermediate values just like any other ruby method

**Question:** How would we call this method? Where should we put this call?

## Updating Ada Books

We can then update Ada books to use this method and have an Authors controller.

<details>
  <summary>routes.rb</summary>

  ```ruby
  # config/routes.rb
  Rails.application.routes.draw do
  # verb 'path', to: 'controller#action'

    root to: 'books#index'

    resources :books
    resources :authors, only: [:index, :show]
  end
  ```
</details>

<details>
  <summary>app/controllers/authors_controller.rb</summary>

  ```ruby
    class AuthorsController < ApplicationController
    def index
      @authors = Author.all.order(:name)
    end

    def show
      @author = Author.find_by(id: params[:id])

      if @author.nil?
        head :not_found
        return
      end
    end
  end
  ```

</details>

<details>
  <summary>app/views/index.html.erb</summary>

  ```erb
    <h1>Authors</h1>

    <ul>
    <% @authors.each do |author| %>
      <li><%= link_to author.name, author_path(author.id) %>
    <% end %>
    </ul>
  ```

</details>

<details>
  <summary>app/views/show.html.erb</summary>

  ```erb
    <h1><%= @author.name %></h1>
    <h2>First Published <%= @author.first_published.nil? ? "Never": @author.first_published %>

    <h2>Books</h2>
    <ul>
      <% @author.books.each do |book| %>
        <li><%= link_to book.title, book_path(book.id) %></li>
      <% end %>
    </ul>
  ```

</details>



## Summary

- Business logic is anything concerned with the problem domain
    - Does not include logic to run the platform or present information to the user
- In Rails, business logic goes in the model
- Models are regular Ruby classes, so you can define methods in the same way we've seen before
- Calling `self.something` inside a model method gives access to ActiveRecord fields and relations

## Additional Resources

- [Where do I put my code?](http://codefol.io/posts/Where-Do-I-Put-My-Code)
- [Rails Guide to Scopes](http://guides.rubyonrails.org/active_record_querying.html#scopes)
    - Scopes are methods that you can call on a collection of that model, similar to `.order` or `.where`. They're an advanced technique we won't cover formally, but they can be super useful.
