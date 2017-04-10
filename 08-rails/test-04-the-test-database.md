## Creating Test Data With _Fixtures_
Writing tests for objects that interact with a database often involves test data. In Rails, we define _fixtures_--temporary data used to populate models in tests--for test data. _Fixtures_ are kept in `test/fixtures` and are defined as [YAML](http://yaml.org/) files.

Each YAML file defines default data for one model. So we'd use `test/fixtures/artists.yml` to create some test data for use when testing `Artist` models. Here's what YAML looks like:

```
the_heavy:
  name: The Heavy
the_clash:
  name: The Clash
tmonk:
  name: Thelonious Monk
```

YML is a set of key/value pairs separated by a colon. It's also __white space sensitive__. It knows how to nest key/value pairs based on their indentation, so pay close attention to your formatting. In the example above, we define three sets of data with keys `the_heavy`, `the_clast`, and `tmonk`. Each of those keys has a value which is a second set of key/value pairs (like a hash of hashes). Because our `Artist` model doesn't track much data, the _fixtures_ are pretty small. Let's take a look at another set of _fixtures_, this time for the `Album` model:

```
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
