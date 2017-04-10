# Unit Testing Models
## Learning Goals
- Write some unit tests using the Rails testing DSL
- Be comforted knowing it's Minitest under the hood, and we know how to Minitest
- Talk about how to test Active Record models
- Get some basic strategies for where to start with testing
- Acknowledge that _fixtures_ are equal parts cool and weird.

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
    value(album).must_be :valid?
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
      result.must_be false
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
- `must_equal(expr1, expr2, fail_message)`
- `must_include(collection, object, fail_message)`
- `wont_be_nil(expression, fail_message)`

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
      result.must_be false

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


## Running tests
[The Rails Guide on testing](http://guides.rubyonrails.org/testing.html#the-rails-test-runner) has a specific section for how to run tests that's definitely worth reading. The short version is that from the project root, we can run all of our tests with `rails test`. If you want to run just the model tests, run `rails test test/models`. The output will probably look pretty familiar by now:

```bash
$ rails test test/models

# Running tests with run options --seed 56340:

.........

Finished tests in 0.097170s, 92.6214 tests/s, 92.6214 assertions/s.


9 tests, 9 assertions, 0 failures, 0 errors, 0 skips
```

## Creating Test Data With _Fixtures_
Writing tests for objects that interact with a database often involves test data. In Rails, we define _fixtures_--temporary data used to populate models in tests--for test data. _Fixtures_ are kept in `test/fixtures` and are defined as [YAML](http://yaml.org/) files.

Each YAML file defines default data for one model. So we'd use `test/fixtures/artists.yml` to create some test data for use when testing `Artist` models. Here's what YAML looks like:

```yml
the_heavy:
  name: The Heavy
the_clash:
  name: The Clash
tmonk:
  name: Thelonious Monk
```

YML is a set of key/value pairs separated by a colon. It's also __white space sensitive__. It knows how to nest key/value pairs based on their indentation, so pay close attention to your formatting. In the example above, we define three sets of data with keys `the_heavy`, `the_clast`, and `tmonk`. Each of those keys has a value which is a second set of key/value pairs (like a hash of hashes). Because our `Artist` model doesn't track much data, the _fixtures_ are pretty small. Let's take a look at another set of _fixtures_, this time for the `Album` model:

```yml
combat_rock:
  title: Combat Rock
  artist: the_clash
  released: 1982
  label: Epic
  label_code: FE 37689
  format: LP, Album
house_that_dirt_built:
  title: The House That Dirt Built
  artist: the_heavy
  released: 2009
  label: Counter Records
  label_code: COUNT028
  format: LP, Album
```

In this example, we define two data sets, each representing one `Album`. Each _fixture_ contains quite a bit of data. Take a look at the values for the `artist` key in each _fixture_. Because we're using Rails, and because Rails knows that an `Album` `belongs_to` an `Artist`, and because we're defining our test data with _fixtures_, we can __reference other _fixture_ data in related models by key__. So `artist: the_heavy` will connect the _fixture_ `house_that_dirt_built` with the `Artist` _fixture_ `the_heavy`. This connection will be critical when we begin testing model relationships.

### Managing The Test Database
So now you've got this test data, what do you do with it? Short answer: put it in the test database. When Rails runs tests, it does so in the __test environment__. This means that we can configure Rails to do things like load different gems or use a different database when running tests. Using a different database is important because we don't want to impact the development database by writing potentially invalid or corrupt data.

The test database is meant to be transient. By default, Rails will reset the test database _between every test_. Data saved to the database in one test won't exist in other tests. The exception is fixture data, which is always available in every test. However, any changes to fixture data in a test will not be preserved into the next test.

Use `rails db:test:prepare` if the test database seems to be stuck in a broken state. It will reset the test database, run any pending migrations, and re-seed the fixture data. Very handy!

## Putting it all together
Ok, let's test a model relationship for the final example. We'll use the fixture data from the previous examples. Here's our models:

```ruby
# app/models/artist.rb
class Artist < ActiveRecord::Base
  has_many :albums
  validates :name, presence: true, uniqueness: true
end

# app/models/albums.rb
class Album < ActiveRecord::Base
  belongs_to :album
  validates :name, presence: true, uniqueness: true
end
```

We want to test that an instance of `Artist` can retrieve the associated `Album` instances. In the test, we'll use the _fixture_ data to confirm that, starting with an `Artist` (that I know should have an associated artist), we can get their associated `Album` instances. We'll use `assert_include` to verify that the `Album` object (from the _fixture_ data) is in the returned collection:

```ruby
# test/models/artist_test.rb
require 'test_helper'

describe Artist
  it "Artists can have albums" do
    artists(:the_clash).albums.must_include albums(:combat_rock)
  end
end
```

## References
- [Minitest Quick Reference](http://www.mattsears.com/articles/2011/12/10/minitest-quick-reference/)
- [Minitest Expectations](http://ruby-doc.org/stdlib-trunk/libdoc/minitest/spec/rdoc/MiniTest/Expectations.html)
- [Adding Color to Minitest Output](http://chriskottom.com/blog/2014/06/dress-up-your-minitest-output/)
- [Ruby on Rails Guide - Model Testing](http://guides.rubyonrails.org/testing.html#model-testing)
-  [Minitest Rails Spec Documentation](http://blowmage.com/minitest-rails/)]
- [Minitest Model Testing for Beginners](http://buildingrails.com/a/rails_unit_testing_with_minitest_for_beginners)
