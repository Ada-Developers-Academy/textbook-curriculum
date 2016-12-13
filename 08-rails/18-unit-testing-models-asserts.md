# Unit Testing Models
## Learning Goals
- Write some unit tests using the Rails testing DSL
- Be comforted knowing it's Minitest under the hood, and we know how to Minitest
- Talk about how to test Active Record models
- Get some basic strategies for where to start with testing
- Acknowledge that _fixtures_ are equal parts cool and weird

## A DSL in every pot
Like every-damn-thing else in Rails, testing is baked right in and there's a really-friendly-but-kinda-weird DSL sitting on top of it. The good news is that it's all Minitest, the same testing framework we've used in past projects.

### Finding the tests
So when we use `rails generate` commands to create files, we usually get some empty test files too. Right in the project root is a `test/` directory that houses all of our tests. Inside `test/`, tests are further organized into directories based on what kind of file they're testing. There's a directory for models, controllers, views, mailers, and helpers.

All those kinds of files serve different roles in the Rails infrastructure, so each has its own testing needs. We're gonna start with models because they're the most like the things we've tested before.

### Getting Setup with Colors
This part is optional, but **important** because colors make life brighter and developers happier.  In the Gemfile & `test/test_helper.rb` you will need to add minitest-reporters with:

Gemfile:
```ruby
group :test do
  gem 'minitest-reporters'
end
```
`test/test_helper.rb`
```ruby
require "minitest/reporters"
```
and inside the class include

```ruby
Minitest::Reporters.use!  # use Minitest Reporters for colored output.
```

## Testing Active Record models
Figuring out what to test can be really confusing. You'll develop a sense of what needs tested as you gain experience and exposure, but we can at least set you up with guidelines:

- Write at least one test for each _validation_ on a model
- Write at least one test for each _custom method_ on a model
- Write at least one test for each _model relationship_ on a model
- Write at least one test for each _scope_ on a model (we'll talk about scopes next week)

We say _at least one_ test because it often makes sense to test different combinations of information. For example, with _validations_ I like to write a test that verifies what kind of data is valid and a separate test that provides an example of invalid data. We write both a _positive_ and _negative_ test case.  Look to test edge-cases and boundaries between when a model becomes valid and invalid.  For example you should test normal looking data for validity, but also test instances with the minimal number of fields.  For example an Album must have a title and must be linked to an artist, but all other fields are optional.  So test an instance with only an artist and title as well as normal amounts of data.  An Album price should never be negative, so test instances where it's positive, negative and zero.  

### Constructing test cases
Let's say our model looks like this:

```ruby
class Album < ActiveRecord::Base
  belongs_to :artist
  validates :title, presence: true, uniqueness: true
end
```

Just in this small bit of code, I see three or four things to test. First are the validations. Writing a _positive_ and _negative_ test case for each validation is four or so tests. Then there's the `belongs_to` relationship. We should test that too. It gets a positive test--an associated `Artist` is defined--and a negative test--it should still be able to save/retrieve/etc. even if an `Artist` isn't associated. If we go over to `test/models`, we should find an `album_test.rb` file. It was created for us when we generated the model. It'll look like this:

```ruby
require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
```

`ActiveSupport::TestCase` is the DSL Rails put on top of Minitest. We can follow the pattern shown in the comment to write our first test. The `test` method takes two parameters. The first is the test name/description, and the second is a block where we'll define our _assertions_.

```ruby
require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "validations: album title can't be blank" do
    album = Album.new

    assert_not album.valid?
    assert album.errors.keys.include?(:title), "title is not in the errors hash"
  end
end
```

Nice! There's a couple things to note in the above example. First and foremost is that we are invoking our model directly with `Album.new`. This test file has scope to the full application due to how things are structured in the `test_helper` and parent class.

Also check out the _assertions_. They look like Minitest _assertions_ because they are. [There's a bunch of available _assertions_](http://guides.rubyonrails.org/testing.html#available-assertions), but we can get most of our testing done with just a small set:

- assert(expression, fail_message)
- assert\_not(expression, fail_message)
- assert\_equal(expr1, expr2, fail_message)
- assert\_includes(collection, object, fail_message)
- assert\_not\_nil(expression, fail_message)

__Question: is the test above a _positive_ or _negative_ test? What would the other test look like?__

## Running tests
[The Rails Guide on testing](http://guides.rubyonrails.org/testing.html#rake-tasks-for-running-your-tests) has a specific section for how to run tests that's definitely worth reading. The short version is that from the project root, we can run all of our tests with `rake test`. If you want to run just the model tests, run `rake test:models`. The output will probably look pretty familiar by now:

```
$ rake test
Run options: --seed 24284

# Running:

....

Finished in 0.094177s, 42.4733 runs/s, 95.5650 assertions/s.

4 runs, 9 assertions, 0 failures, 0 errors, 0 skips
```

## Creating test data with _fixtures_
Writing tests for objects that interact with a database often involves test data. In Rails, we define _fixtures_--temporary data used to populate models in tests--for test data. _Fixtures_ are kept in `test/fixtures` and are defined as [YAML](http://yaml.org/) files.

Note that though the purpose may sound similar, _fixtures_ are different than _seeds_ because _fixtures_ are used in the tests only, and _seeds_ are used in our development database.

Each YAML file defines default data for one model. So we'd use `test/fixtures/artists.yml` to create some test data for use when testing `Artist` models. Here's what YAML looks like:

```yml
the_heavy:
  name: The Heavy
the_clash:
  name: The Clash
tmonk:
  name: Thelonious Monk
```

YML is a set of key/value pairs separated by a colon. It's also __white space sensitive__. It knows how to nest key/value pairs based on their indentation, so pay close attention to your formatting. In the example above, we define three sets of data with keys `the_heavy`, `the_clash`, and `tmonk`. Each of those keys has a value which is a second set of key/value pairs (like a hash of hashes). Because our `Artist` model doesn't track much data, the _fixtures_ are pretty small. Let's take a look at another set of _fixtures_, this time for the `Album` model:

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

You can also use ERB code in the fixtures to programmatically generate sample data, but try to avoid that for now as most testing can be done with a small data set.  

### Managing The Test Database
So now you've got this test data, what do you do with it? Short answer: put it in the test database. When Rails runs tests, it does so in the __test environment__. This means that we can configure Rails to do things like load different gems or use a different database when running tests. Using a different database is important because we don't want to impact the development database by writing potentially invalid or corrupt data.

The test database is meant to be transient. By default, Rails will reset the test database _between every test_. Data saved to the database in one test won't exist in other tests. The exception is fixture data, which is always available in every test. However, any changes to fixture data in a test will not be preserved into the next test.

Use `rake db:test:prepare` if the test database seems to be stuck in a broken state. It will reset the test database, run any pending migrations, and re-seed the fixture data. Very handy!

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
  belongs_to :artist
  validates :title, presence: true, uniqueness: true
end
```

We want to test that an instance of `Artist` can retrieve the associated `Album` instances. In the test, I'll use the _fixture_ data to confirm that, starting with an `Artist` (that we know should have an associated artist), we can get their associated `Album` instances. We'll use `assert_include` to verify that the `Album` object (from the _fixture_ data) is in the returned collection:

```ruby
# test/models/artist_test.rb
require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  test "artist can have albums" do
    assert_includes artists(:the_clash).albums, albums(:combat_rock)
  end
end
```

The way we associate the fixture data is by referencing the appropriate fixture file. Since we are using the `test/fixtures/albums.yml` file, we use `albums()` to reference that fixture data. We use the symbol syntax to refer to each of the objects we created in our corresponding fixture files.

## References

- [Adding Color to Minitest Output](http://chriskottom.com/blog/2014/06/dress-up-your-minitest-output/)
- [Ruby on Rails Guide - Model Testing](http://guides.rubyonrails.org/testing.html#model-testing)
- [Minitest Quick Reference](http://www.mattsears.com/articles/2011/12/10/minitest-quick-reference/)
- [Minitest Model Testing for Beginners](http://buildingrails.com/a/rails_unit_testing_with_minitest_for_beginners)
