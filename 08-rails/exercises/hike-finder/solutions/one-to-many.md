# Hike Finder: One to Many Relationships

## Solutions

### Setup / Migrations

1. Is the relation between trailheads and hikes one-to-one, one-to-many or many-to-many? If one-to-many, which is the one and which is the many? In other words, does a trailhead have many hikes, or does a hike have many trailheads?
    > It is one-to-many: each trailhead has many hikes, while each hike has one trailhead
1. Assume that the `trailheads` table has been created, but the `hikes` table still does not have a `trailhead_id` column. What would you put in the migration file to set up this relation?
    > There are a few ways to do this, but here are two
    ```ruby
    class HikeHasATrailhead < ActiveRecord::Migration[5.0]
      def change
        # Preferred, but does some fancy things we haven't talked about yet
        add_reference :hikes, :trailhead, foreign_key: true, index: true

        # - or -
        # What we did in class
        add column :hikes, :trailhead_id, :integer
      end
    end
    ```
1. What code do we need to add to our models to fully utilize the relation between hikes and trailheads?
    ```ruby
    # app/models/hike.rb
    class Hike < ApplicationRecord
      belongs_to :trailhead
    end

    # app/models/trailhead.rb
    class Trailhead < ApplicationRecord
      has_many :hikes
    end
    ```

### Relations

1. Consider the following hike data:

    name   | trailhead_id | length_miles        | elevation_gain_feet | max_elevation_feet | rating
    ---    | ---          | ---                 | ---                 | ---                | ---
    Mount Si Via Teneriffe Road Trail | 3 | 9.0 | 2950                | 3900               | 2

    How would you add this data to the database? What are three different ways to set up the relation between this hike and its trailhead?

    ```ruby
    # Assuming the following setup code:
    trailhead = Trailhead.find(3)
    hike_data = {
      name: "Mount Si Via Teneriffe Road Trail",
      length_miles: 9.0,
      elevation_gain_feet: 2950,
      max_elevation_feet: 3900,
      rating: 2
    }

    # Method 1: go through the trailhead
    hike = trailhead.hikes.create(hike_data)

    # Method 2: set the trailhead
    hike = Hike.new(hike_data)
    hike.trailhead = trailhead
    hike.save

    # Method 3: set the trailhead ID
    hike = Hike.new(hike_data)
    hike.trailhead_id = 3
    hike.save

    # Method 4: shovel
    hike = Hike.create(hike_data)
    trailhead.hikes << hike
    ```
1. How would you load the trailhead for the hike with ID 9 into a local variable called `trailhead`?
    ```ruby
    hike = Hike.find(9)
    trailhead = hike.trailhead
    # - or -
    trailhead = Hike.find(9).trailhead
    ```
1. How would you load the list of likes for the trailhead with name "Pratt Lake Trailhead" into a local variable called `hikes`?
    ```ruby
    trailhead = Trailhead.find_by(name: "Pratt Lake Trailhead")
    hikes = trailhead.hikes
    # - or -
    hikes = Trailhead.find_by(name: "Pratt Lake Trailhead").hikes
    ```
1. How would you load the list of likes for the trailhead with name "Mt. Teneriffe Trailhead" with a rating of 4 into a local variable called `hikes`?
    ```ruby
    trailhead = Trailhead.find_by(name: "Mt. Teneriffe Trailhead")
    hikes = trailhead.hikes.where(rating: 4)
    ```
1. Write a method `best_adjacent_hike` that, given the name of a hike, finds the highest-rated hike that shares a trailhead with that hike. Think about error handling!
    ```ruby
    def best_adjacent_hike(name)
      hike = Hike.find_by(name: name)
      return nil unless hike
      return hike.trailhead.hikes.max_by do |adjacent_hike|
        adjacent_hike.rating
      end
    end
    ```
1. What interesting test cases are there for the above method?
    > We can imagine 4 interesting test cases:
    > - There are several hikes for that trailhead, one of which has the highest rating
    > - There are several hikes for that trailhead, two of which are tied for highest rating
    > - There is only one hike for that trailhead
    > - The name provided does not correspond to a real hike
    >
    > Note that we do not need to worry about "zero hikes for that trailhead". Why?
