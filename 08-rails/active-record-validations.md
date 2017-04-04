# Active Record Validations
## Learning Goals
- Explore the _validations library_ provided by Active Record
- Discuss the role _validations_ play in data management
- Guide users towards providing better data

## Validating User Input
Rails gives us a nice way to validate data before we try to put it into the database.

### Why would we want to validate data?
To prevent harmful side effects. A common example is a system trying to send an email to something that isn't an email address. Validating user input--and providing users an opportunity to correct invalid input--increases the reliability and quality of our applications and data.

## Using Active Record Validations
Using an example from our Book application, if our application depends on each book having a title, we will want to _validate_ that a title is provided.

In an Active Record model we can use the `validates` method to describe what valid data looks like. The `validates` method takes two arguments. First is the field name to
validate (`:title`). The second is a hash describing how we want to validate it (`presence: true`)

```ruby
class Book < ApplicationRecord
  validates :title, presence: true
end
```

## Validation Helpers
There are many validation helpers (like `presence`) the most common are:

- `:presence`: ensures that the data field is not null *or empty*
- `:uniqueness`: ensures the value doesn't already exist for that field in the db
- `:format`: uses a regular expression to ensure data conforms to a pattern
- `:length`: ensures text is within a given length
- `:numericality`: ensures the value is a number

Each of the helpers takes additional options that provide further refinement.


Let's assume we've extended our Author object to have an `email`, `username` and `age` fields in addition to their current fields. Here are a few a more potential examples:
```ruby
class Author < ApplicationRecord
  # must provide an email address and it must include an @ sign
  validates :email, presence: true, format: {with: /@/}

  # usernames must be unique and between 5 and 25 characters in length
  validates :username, uniqueness: true, length: { in: 5..25 }

  # age must be a number. An positive integer > 12, to be more precise.
  validates :age, numericality: { only_integer: true, greater_than: 12 }
end
```

## When is an object validated?
Stolen directly from the [Active Record Validations Rails Guide](http://guides.rubyonrails.org/active_record_validations.html) (but tidied and tweaked) The following methods trigger validations, and will save the object to the database __only if the object is valid__:

- `create`
- `create!`
- `save`
- `save!`
- `update`
- `update!`

The bang versions (e.g. save!) raise an exception if the record is invalid. The non-bang versions don't. `save` and `update` return false, while `create` just returns the object.

Active Record models also have a `valid?` method that will perform validations on demand without attempting to persist information to the database. This is a helpful debugging tool and we use it often when we're interacting with objects in the _Rails console_.

## Error Messages: When Validations Fail
When a validation fails, Active Record keeps track of which value(s)
caused the failure. Active Record collects these failures into the object's `errors` hash. By default it is empty, but when a record fails validation, `errors` is updated with information about each failure:

```ruby
book = Book.new(title: nil)
book.errors # => {} empty because the validations haven't run yet.
book.save   # validations run when a save is attempted.
book.errors # => contains :title=>["can't be blank"]
```

Since each column could have multiple validations (for example, email must be present and match a regex) the value associated with a column is an Array of error messages.

### Exposing Error Messages
Because errors are collected directly into the model instance, we can expose error information in views. This is particularly helpful when we follow the pattern of re-rendering a form when validation/saving fails.

```erb
<h2>New Book</h2>

<% if @book.errors.any? %>
  <ul class="errors">
    <% @book.errors.each do |column, message| %>
      <li>
        <strong><%= column.capitalize %></strong> <%= message %>
      </li>
    <% end %>
  </ul>
<% end %>

<div class="new-book">
  <%= form_for @book do |f| %>
    <%= f.label :title %>
    <%= f.text_field :title %>

    <%= f.label :description %>
    <%= f.text_area :description %>

    <%= f.submit %>
  <% end %>
</div>
```
