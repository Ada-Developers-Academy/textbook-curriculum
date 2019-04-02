# Hike Finder: Working With a Single Model

## Database Setup

Our database has one table, `hikes`. The `hikes` table has the following columns:

Attribute           | Type
---                 | ---
id                  | integer
name                | string
length_miles        | float
elevation_gain_feet | integer
max_elevation_feet  | integer
rating              | integer

The hikes table has 3 rows:

id  | name    | length_miles | elevation_gain_feet | max_elevation_feet | rating
--- | ---     | ---          | ---                 | ---                | ---
1   | Lake 22 | 5.4          | 1350                | 2400               | 4
2   | Annette Lake | 7.5     | 1800                | 3600               | 3
4   | Mount Si     | 8.0     | 3150                | 3900               | 3
5   | Loowit Trail | 28.0    | 6000                | 4800               | 5
7   | Mount Townsend | 8.0   | 3010                | 6260               | 2
12  | Mount Teneriffe | 13.8 | 3800                | 4788               | 4
13  | Teneriffe Falls | 5.4  | 1585                | 2370               | 4

## Questions

### Migrations

1. How would you create a database table including the above columns?
    - What command would you use to generate the migration?
    - Do you need to include the `id`, `created_at` and `updated_at` fields in the migration?
    - Do you need to make any other changes to the generated migration?
    - How do you run the migration?
1. How would you add a new column of type `string` called `best_month`?
    - How do you create a new migration?
    - What goes in the migration file?
    - What commands do you need to run?

### Reading Data

1. How would you store the list of all hikes in a variable named `hike_list`?
1. How would you search for the hike with ID 13 and store it in a variable named `hike`?
    - There are two ways to do this! What is the other one?
1. What happens when you use each of the previous two methods to search for a hike with ID 19?
1. How would you get the list of hikes with a rating of 4?
1. What happens if you try to get the list of hikes with a rating of 1?
1. How would you get the number of hikes in the database?
1. **BONUS:** How would you get the list of hikes less than 8 miles long?

### Creating Data

For these questions we'll be working with the following data

name    | length_miles | elevation_gain_feet | max_elevation_feet | rating
---     | ---          | ---                 | ---                | ---
Fortune Ponds | 13.0   | 2700                | 4700               | 3

1. How would you build a new instance of the `Hike` model with the above data and store it in a local variable named `new_hike`, without saving it to the database?
1. Once `new_hike` has been built, how would you save it to the database?
1. How would you accomplish the above two steps in one method call?

### Updating Data

1. Assume that hike #4 has been loaded into an local variable called `hike`:
    ```ruby
    hike = Hike.find(4)
    ```
    How would you change the value of `length_miles` to 8.2 for this local variable, without changing the database?
1. Once that change has been made, how would you save the new value to the database?
1. Imagine you had several attributes to update stored in a hash like this:
    ```ruby
    new_values = {
        elevation_gain_feet: 4200,
        length_miles: 9.7,
        rating: 4
    }
    ```
    How would you change all the fields on the `hike` local variable to match whats in the hash and save it to the database in one line of code?

### Deleting Data

1. There are two ActiveRecord methods that will remove a row from the database. What are they, and which one should you be using?
1. What will the following code print out?

```ruby
hike = Hike.find(4)
hike.destroy
puts Hike.find_by(id: 4)
puts hike.id
```