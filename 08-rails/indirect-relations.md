# Indirect Model Relations

## Learning Goals

By the end of this lesson, students should be able to...

- Identify when an indirect model relation would be useful
- Set up an indirect relation using `has_many through:`
- Distinguish between indirect relations and join tables

## Introduction

This lesson builds directly on the lesson on [many to many relationships](many-to-many-relationships.md), so do that one first. The concepts don't have to be 100%, but we'll be building on the `Genre` model we added there.

A common scenario when working with databases is to have two models that are related indirectly, through a third model. For example in our library application `Author` and `Genre` are related through the `Book` model.

![Author and Genre are related through Book](images/indirect-model-relation.png)
<!-- https://www.draw.io/#G1n2OylcmI2jEzvX_W76-0OpfHfk5QPnOE -->

**Questions:** Imagine that on the details page for an author, we wanted to list all the genres they have written. The list of genres should be de-duplicated (each genre should not appear more than once).
- What would the code look like to build this list of genres?
- Where should this code live?
- What view code would you need to display this list?

![Genre list for an author](images/indirect-relation-ui.png)

There are two pieces of work here. Generating the list of genres is business logic, and belongs in the model:

```ruby
# app/models/author.rb
class Author < ApplicationRecord
  # ...
  def genres
    genres = []
    books.each do |book|
      genres += book.genres
    end
    return genres
  end
end
```

**Question:** Why `+=` and not `<<`?

This method gives us an array of `genre`s, as we would expect from a model method. We now need to write some display logic to turn that list into some HTML. Here is one way to approach it:

```html
<!-- app/views/authors/show.html.erb -->
<p>
  <strong>Genres:</strong>
  <%= @author.genres.uniq.map { |g| g.name.capitalize }.join(', ') %>
</p>
```

## Rails Syntax for Indirect Relations

Turns out this kind of problem is very common when working with databases. We might phrase it generically as "find all the records that are two steps away". For example, in our ride share application we might want to find a list of all passengers who have ridden with a certain driver.

Because it's so common, Rails gives us a way to come up with this list automatically using the `through` keyword argument to the `has_many` helper method:

```ruby
# app/models/author.rb
class Author < ApplicationRecord
  has_many :books
  has_many :genres, through: :books

  # ...
  # remove the genres method we defined before
  # ...
end
```

There are two parts to this line of code. `has_many :genres` specifies both what table we're building a relation to, and what the method we're generating will be called. The `through: :books` tells us how to get there: follow the `books` relation for this author (defined on the line above).

If we refresh the page, we should see exactly the same behavior. All we've done is remove some boilerplate code.

Note that we did **not** need to create a new migration for this work. We've upgraded the ActiveRecord model, but have not changed our database schema.

**Question:** What would we do if we needed to get the list of authors for a given genre?

## Indirect Relations vs Join Tables

This is not the first time we've related two models through an intermediate table. Join tables solve a slightly different problem, but end up having a very similar structure at the database level.

So, why would you use one vs the other?

- With a _join table_, the table in the middle serves only to keep track of a list
  - The only columns are an ID and two foreign keys
  - It does not get a model class
  - Relatively simple to set up (dedicated syntax, restricted naming)
  - Sends a message to other engineers that this table only makes sense in the context of these two other tables
- With an _indirect relation_, the table in the middle is a full model
  - Can have many columns
  - Gets a model class that you can use in views and controllers
  - More complex to set up (requires generating a whole model), but gives you full functionality

**If your intermediate table is keeping track of _any_ information other than the relationship, then it's not a _join table_.**

## Summary

- Indirect relations are a common problem when working with databases
- Rails lets you define an indirect relation with `has_many :through`
  - There's also `has_one :through` for chains of singular relations
- Indirect relations are similar to but distinct from join tables

## Additional Resources

- [Rails Guides on `has_many :through`](https://guides.rubyonrails.org/association_basics.html#the-has-many-through-association)
- [`has_one :through`](https://guides.rubyonrails.org/association_basics.html#the-has-one-through-association), similar to `has_many :through`, but when you're only related to one thing
- Why didn't we [put the call to `uniq` in the model](https://stackoverflow.com/a/318146/1513338)? Because it involves [lambda syntax](https://stackoverflow.com/questions/8476627/what-do-you-call-the-operator-in-ruby), which we haven't learned yet.
