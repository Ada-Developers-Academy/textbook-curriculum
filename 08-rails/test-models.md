# Unit Testing Models

## Learning Goals
- Write some unit tests using the Rails testing DSL
- Be comforted knowing it's Minitest under the hood, and we know how to Minitest
- Talk about how to test Active Record models
- Get some basic strategies for where to start with testing

## Testing Active Record Models

### What Should You Test?

Figuring out what to test is a bit of an art. You'll develop a sense of what needs tested as you gain experience and exposure, but we can at least set you up with guidelines:

- Write at least one test for each _custom method_ on a model
- Write at least one test for each _model relationship_ on a model
- Write at least two tests for each _validation_ on a model
- Write at least two tests for each _scope_ on a model (we'll talk about scopes next week)

Why at least two tests for a validation? Because validations have two possible behaviors: success and failure! To truly exercise the validation, you need both _positive_ and _negative_ test cases, as well as cases that walk the line between the two.

For example, a Book's price should never be negative, so test instances where it's positive, negative and zero.  

### The Model

Let's say our model looks like this:

```ruby
# app/models/book.rb
class Book < ActiveRecord::Base
  belongs_to :author
  validates :title, presence: true, uniqueness: true
end
```

Just in this small bit of code, we see three or four things to test. First are the validations. Writing a _positive_ and _negative_ test case for each validation is four or so tests.

Then there's the `belongs_to` relationship. We should test that too, if only to make sure we've spelled everything right! We need to make sure that if an `author_id` is set on a book, we can access `book.author`.

#### Generated Test Code

**Question:** When we generated our `Book` model, Rails generated some tests as well. Where do they live?

If you generated this model after switching to spec-style testing, it should look something like this:

```ruby
# test/models/book_test.rb
require "test_helper"

describe Book do
  let(:book) { Book.new }

  it "must be valid" do
    value(book).must_be :valid?
  end
end
```

If you have something about `class`es and `ActiveSupport::TestCase` instead, just replace it with the above code.

### Testing The `presence` Validation

Let's look at validations first, particularly the `presence` validation. We can follow the pattern shown in the generated file to write our first test.

```ruby
# test/models/book_test.rb
require 'test_helper'

describe Book do
  describe 'validations' do
    it 'is invalid without a name' do
      book = Book.new
      result = book.valid?
      result.must_equal false
    end
  end
end
```

To see it in action, run `rails test test/models` from the project root.

**Question:** Is the test above a _positive_ or _negative_ test? What would the other test look like?

There's a couple things to note in the above example. First and foremost is that we are invoking our model directly with `Book.new`, and then calling `.valid?` on the created instance.

Also check our _expectations_. They look like Minitest _expectations_ because they are. [There's a bunch of available _expectations_](http://ruby-doc.org/stdlib-trunk/libdoc/minitest/spec/rdoc/MiniTest/Expectations.html), but I get most of my testing done with just a small set:

- `must_be(expression, fail_message)`
- `wont_be(expression, fail_message)`
- `must_equal(expr2, fail_message)`
- `must_include(object, fail_message)`
- `wont_be_nil(fail_message)`

The last thing to note is the use of a nested `describe` block. While not strictly necessary, this is a very useful organizational tool, especially when test files start to get very large.

#### Checking Which Validation Failed

An ActiveRecord model might have many different validations, and if any one of them fails then the whole model is considered invalid. Some completely different validation could be making this test pass, even if our validation isn't doing what we think.

**Question:** Once validations have been run on a model, how can you find out what caused them to fail? How can we use this to make our test more precise?

```ruby
# test/models/book_test.rb
require 'test_helper'

describe Book do
  describe 'validations' do
    it 'is invalid without a name' do
      book = Book.new
      result = book.valid?
      result.must_equal false

      book.errors.messages.must_include :title
    end
  end
end
```

### Exercise: Testing the `uniqueness` Validation

Take a few minutes and write a test for the `uniqueness` validation on the `Book` model. Questions to consider:
- What positive, negative and edge cases might be interesting?
- How will this test be similar to the `presence` validation?
- How will this test differ from the `presence` validation?

### Testing Relations

We've thoroughly covered our model validations, and can now be reasonably certain there's no way invalid models can make their way into our database. There's a second bit of functionality on the `Book` model that we still haven't covered though: it's relation to `Author`.

How should we think about these tests? First, think of what we can say about a `Book` and it's relation to `Author`.

- `Book` has a `author_id` column
- `Book` has a method named `author`, which will find the `Author` corresponding to `author_id`
- Setting either `author_id` or `author` will change the other accordingly

The tests, then, might look like the following:

```ruby
# test/models/book_test.rb
require 'test_helper'

describe Book do
  describe 'relations' do
    it 'can set the author through "author"' do
      # Create two models
      author = Author.create!(name: "test author")
      book = Book.new(title: "test book")

      # Make the models relate to one another
      book.author = author

      # author_id should have changed accordingly
      book.author_id.must_equal author.id
    end

    it 'can set the author through "author_id"' do
      # Create two models
      author = Author.create!(name: "test author")
      book = Book.new(title: "test book")

      # Make the models relate to one another
      book.author_id = author.id

      # author should have changed accordingly
      book.author.must_equal author
    end
  end
end
```

Note that we use `create!` to build our Author, but `new` to build our book. We're not testing Author here, so it makes sense to throw an exception (and invalidate the test) if it can't be created.

In this test, we're just checking the basic functionality of the `author_id` and `author` fields. There's not a whole lot of complex behavior, we just want to make sure we've spelled everything right.

In the next section, we'll examine a slightly more elegant way to test the same thing.

## What We Accomplished
- Thought about which parts of an ActiveRecord model are testable
- Remembered how to use minitest-spec
- Wrote tests for model validations
- Wrote tests for model relations

## Additional Resources
- [Ruby on Rails Guide - Model Testing](http://guides.rubyonrails.org/testing.html#model-testing)
- [Minitest Quick Reference](http://www.mattsears.com/articles/2011/12/10/minitest-quick-reference/)
- [Minitest Expectations](http://ruby-doc.org/stdlib-trunk/libdoc/minitest/spec/rdoc/MiniTest/Expectations.html)
- [Minitest Rails Spec Documentation](http://blowmage.com/minitest-rails/)
- [Minitest Model Testing for Beginners](http://buildingrails.com/a/rails_unit_testing_with_minitest_for_beginners)
