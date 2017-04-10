# The Test Database

## Learning Goals

- Explain how Rails' testing database differs from its development and production databases
- Use _fixtures_ to define test data
- Understand when _fixtures_ are appropriate and when they are not

## The Test Database

When Rails runs tests, it does so in the __test environment__. This means that we can configure Rails to do things like load different gems or use a different database when running tests. Using a different database is important because we don't want to impact the development database by writing potentially invalid or corrupt data.

The test database is meant to be transient. By default, Rails will reset the test database _between every test_. Data saved to the database in one test won't exist in other tests. The exception is fixture data, which is always available in every test. However, any changes to fixture data in a test will not be preserved into the next test.

Use `rails db:test:prepare` if the test database seems to be stuck in a broken state. It will reset the test database, run any pending migrations, and re-seed the fixture data. Very handy!

## Creating Test Data With _Fixtures_
Writing tests for objects that interact with a database often involves test data. In Rails, we define _fixtures_--temporary data used to populate models in tests--for test data. _Fixtures_ are kept in `test/fixtures` and are defined as [YAML](http://yaml.org/) files.

Each YAML file defines default data for one model. So we'd use `test/fixtures/artists.yml` to create some test data for use when testing `Artist` models. Here's what YAML looks like:

<!-- XXX: for some reason the yml fenced syntax highlighter never ends. Major bummer. While editing, useful to remove the "yml" here. -->
```yml
metz:
  name: Sandi Metz
butler:
  name: Octavia E. Butler
```

YML is a set of key/value pairs separated by a colon. It's also __white space sensitive__. It knows how to nest key/value pairs based on their indentation, so pay close attention to your formatting. In the example above, we define two sets of data with keys `metz` and `butler`. Each of those keys has a value which is a second set of key/value pairs (like a hash of hashes). Because our `Author` model doesn't track much data, the _fixtures_ are pretty small. Let's take a look at another set of _fixtures_, this time for the `Book` model:

```yml
kindred:
  title: Kindred
  author: butler
  synopsis: A good sci-fi book
  publication_year: 1979
  publication_city: New York
parable:
  title: Parable of the Sower
  author: butler
  synopsis: Fire drugs?
  publication_year: 1993
  publication_city: New York
poodr:
  title: Practical Object Oriented Design in Ruby
  author: metz
  synopsis: A good book on programming
  publication_year: 2012
  publication_city: Chicago
```

In this example, we define two data sets, each representing one `Book`. Each _fixture_ contains quite a bit of data. Take a look at the values for the `author` key in each _fixture_. Because we're using Rails, and because Rails knows that an `Book` `belongs_to` an `Author`, and because we're defining our test data with _fixtures_, we can __reference other _fixture_ data in related models by key__. So `author: metz` will connect the _fixture_ `poodr` with the `Author` _fixture_ `metz`.

### Accessing Fixtures

At the beginning of every test, Rails will tear down your entire test database and rebuild it from scratch, importing all the fixtures. This means you can get at fixtures the same way you would access any other model instance: with ActiveRecord methods.

```ruby
metz = Author.where(name: "Sandi Metz")
```

It's worth noting that Rails will give the fixture data a random ID every time, so you can't count on `Book.first` or `Book.find(3)` do to what you expect.

You can also reference fixtures by the name you gave them in the YAML file:

```ruby
metz = authors(:metz)
```

All the authors can be accessed through `authors`, all the books through `books`, and so on. However, these collections are **not** enumerable - if you need to enumerate all the rows, use the ActiveRecord methods (e.g. `Book.all.each`, not `books.each`).

### Using Fixtures to Test Relationships

Recall from the last lecture the way we tested model relations. It was a little clunky - we had to create our data inline, for every test.

With fixtures, we can do better. Instead of defining our data in the test we can use the fixture data, as follows:

```ruby
# test/models/book_test.rb
require 'test_helper'

describe Book do
  describe 'relations' do
    it "has an author" do
      book = books(:poodr)
      book.author.must_equal authors(:metz)
    end

    it "can set the author" do
      book = Book.new(title: "test book")
      book.author = authors(:metz)
      book.author_id.must_equal authors(:metz).id
    end
  end
end
```

### When **NOT** to use Fixtures

Fixtures are great, and used well they can go a long way toward DRYing up and simplifying your test code. However, they're not always the right choice.

Because fixtures are available for every test, they work best for defining a baseline of "good" data for your tests to work with - for example, an `Author` for your new `Book` to `belong_to`. In contrast, I have found that when you put "bad" data in your fixtures, things tend to get very confusing very quickly. This is compounded by the fact that there are usually many, many more examples of invalid data than of valid.

What's more, for performance reasons, Rails will never run validations against your fixture data - it simply assumes you know what you're doing. This can make it very difficult to even tell what's _supposed_ to be "good" data.

As a general rule of thumb, fixtures are useful for valid data and positive tests, while invalid model instances should be confined to the test or `describe` block where it's interesting.

## What We Accomplished

- Learned about the _test environment_, and how it is torn down and re-created for each test
- Used _fixtures_ to define data available for every test
- Used _fixtures_ to clean up an existing test
- Considered when _fixtures_ **aren't** the best choice

## Additional Resources

- [Rails Guide on the Test Database](http://guides.rubyonrails.org/testing.html#the-test-database)
