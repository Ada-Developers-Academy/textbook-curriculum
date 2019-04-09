# Hike Finder: One-to-Many Relationships

## Database Setup

### Trailheads

In addition to the existing `hikes` table, we will add a new table to keep track of trailheads. A trailhead is the location where a hike starts, and has the following columns:

Attribute           | Type
---                 | ---
id                  | integer
name                | string
latitude            | string
longitude           | string

The `trailheads` table has several rows:

id  | name                    | latitude | longitude
--- | ---                     | ---      | ---
1   | Lake 22 Trailhead       | 48.0770  | -121.7457
2   | Pratt Lake Trailhead    | 47.3979  | -121.4866
3   | Mt. Teneriffe Trailhead | 47.4861  | -121.7011

### Hikes

In addition, we have an updated version of the `hikes` table:

id  | name   | trailhead_id | length_miles | elevation_gain_feet | max_elevation_feet | rating
--- | ---    | ---          | ---          | ---                 | ---                | ---
1   | Lake 22          | 1  | 5.4          | 1350                | 2400               | 4
9   | Granite Mountain | 2  | 8.6          | 3800                | 5629               | 5
12  | Mount Teneriffe  | 3  | 13.8         | 3800                | 4788               | 4
13  | Teneriffe Falls  | 3  | 5.4          | 1585                | 2370               | 4
25  | Pratt Lake Basin | 2  | 11           | 2300                | 4100               | 4
27  | Island & Rainbow Lakes | 2 | 11.7    | 3000                | 4400               | 3

## Questions

### Setup / Migrations

1. Is the relation between trailheads and hikes one-to-one, one-to-many or many-to-many? If one-to-many, which is the one and which is the many? In other words, does a trailhead have many hikes, or does a hike have many trailheads?
    > It is one-to-many: each trailhead has many hikes, while each hike has one trailhead
1. Assume that the `trailheads` table has been created, but the `hikes` table still does not have a `trailhead_id` column. What would you put in the migration file to set up this relation?
    > There are a few ways to do this, but here is one
    ```ruby
    class HikeHasATrailhead < ActiveRecord::Migration[5.0]
      def change
        add_reference :hike, :trailhead, foreign_key: true, index: true
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



