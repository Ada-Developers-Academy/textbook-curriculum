# Active Record Relationships
## Learning Goals
- Move beyond single-model, single-table applications
- Learn the Rails vernacular for describing _model relationships_
- Explore the __awesome__ functionality provided by *belongs_to* and *has_many*

## *has_many* & *belongs_to*
Two Rails models can be related to each other through an identifier field (what we call a _foreign key_ in SQL). Take a look at the these two tables:

__artists__

|id | name      |
|:-:|:---------:|
| 1 | The Heavy |

__albums__

|id | name                             | artist_id |
|:-:|:--------------------------------:|:---------:|
| 1 | Great Vengeance And Furious Fire |     1     |
| 2 | The House That Dirt Built        |     1     |
| 3 | The Glorious Dead                |     1     |
| 4 | Hurt & The Merciless             |     1     |

We would call this a __one-to-many__ association. We would say that Artist *has_many* Albums, and each Album *belongs_to* an Artist. The `artist_id` column for a Album corresponds to the `id` of an Album record.

### Defining an Association
ActiveRecord provides lovely methods to quickly create an association between two (or more!) models. We can use class methods within models to make the definition.

```ruby
class Artist < ActiveRecord::Base
  # plural because many albums could be associated with this single artist
  has_many :albums
end
```

```ruby
class Album < ActiveRecord::Base
  # singular because it belongs to only a single artist
  belongs_to :artist
end
```

The `Album` class would need a `artist_id` attribute to store the ID of the associated `Artist`.

__Note:__ ActiveRecord does _not_ require a formal `foreign_key` relationship defined at the database level in order to leverage these associations, but it can be a really good idea to create them in your migrations.

### So what do these associations give us?
A whole slew of nice lookup methods that help us build queries for the associated model. Here'a sampling, and the [Rails Guides on Active Record Associations](http://guides.rubyonrails.org/association_basics.html) has complete details:

### belongs_to :artist
- `album.artist`: get the Artist associated with this Album
- `album.artist = artist_object`: reassign this Album to a different Artist
- `album.build_artist(artist_hash)`: instantiate a new Artist object, associated with this Album, using the provided hash
- `album.create_artist(artist_hash)`: just like `build_artist`, but call `save` after instantiating the Artist.

### has_many :albums
- `artist.albums`: returns an array of all the Albums associated with this Artist
- `artist.albums << album_object`: associate a Album with this Artist by adding it to the array of Albums
- `artist.albums= album_collection`: remove all prior Album associations and replace them with a new set of associations
- `artist.albums.find(id)`: find a specific Album, scoped to just those associated with this Artist (not very useful)
- `artist.albums.where(conditions_hash)`: get the Albums associated with this Artist that also satisfy the conditions in the `where` hash (much more useful)
- `artist.albums.build(album_hash)`: instantiate a new Album with the provided attribute hash and associate it with this Artist
- `artist.albums.create(album_hash)`: instantiate a new Album with the provided attribute hash and associate it with this Artist, then call `save` on the new Album object.

And, for the table-oriented among you:

| Call | Returns | Touches DB | Note |
|:----:|:-------:|:----------:|:----:|
| `album.artist` | Artist object | Memoized | |
| `album.artist = artist_object` | Artist object | No (requires save) | |
| `album.artist.update(artist: artist_object)` | Artist object | Yes | |
| `album.build_artist(artist_hash)` | Artist object | No | Does **not** set album.artist_id |
| `album.create_artist(artist_hash)` | Artist object | Yes | Does **not** set `album.artist_id` |
| `artist.albums` | Collection of albums | Memoized | |
| `artist.albums << album_object` | Collection of albums | Yes | **Does** set `album.artist_id` |
| `artist.albums = album_collection` | Collection of albums | Yes | |
| `artist.albums.find(id)` |  Album object | Yes | |
| `artist.albums.where(condition)` |  Collection of albums | Yes | |
| `artist.albums.build(album_hash)` | Album object | No | **Does** set `album.artist_id` |
| `artist.albums.create(album_hash)` | Album object | Yes | **Does** set `album.artist_id` |
