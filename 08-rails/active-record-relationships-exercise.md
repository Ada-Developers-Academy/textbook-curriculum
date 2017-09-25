### Let's Try it out
Let's update our books application from our previous lectures to have this structure. We will complete the following steps to modify our application to support this new **one-to-many** relationship. Note: We will lose some data in this process and that is OK for now.

1. Remove the existing `author` column on the books table
2. Create a new `authors` table and `Author` model.
  - this will start with one column, `name`
3. Add an `author_id` column to the `books` table to relate to the two tables
4. Set up the model relationship
5. Set up some test data
6. Test it out!

#### Step One
1. Create a new migration where we will modify the existing table.

  `rails g migration RemoveAuthorColumn`

2. Open the corresponding migration file and add the contents using the Rails migration syntax for removing an existing column in the database.

  `remove_column :table_name, :column_name`

  ```ruby
  def change
    remove_column :books, :author
  end
  ```

3. Save and run the migration

  `rails db:migrate`

4. Verify: examine the `schema.rb` file and ensure the author field on the books table is gone.

#### Step Two
1. Create a new authors table and model via the following command

  `rails g model Author`

2. Open the corresponding migration file and add a new string column for `name`

  ```ruby
  def change
    create_table :authors do |t|
      t.string :name

      t.timestamps
    end
  end
  ```

3. Save and run the migration

  `rails db:migrate`

4. Verify: examine the `schema.rb` file and ensure the new `authors` table has appeared.



#### Step Three
1. Create a new migration where we will modify the existing books table to add the author relationship.

  `rails g migration AddAuthorIdToBooks`

2. Open the corresponding migration file and add the contents using the Rails migration syntax for adding a new relationship/reference.

  ```ruby
  def change
    add_reference :books, :author, foreign_key: true
  end
  ```

3. Save and run the migration

  `rails db:migrate`

4. Verify: examine the `schema.rb` file and ensure that there is now some additional information on the `books` table related to the `author`.

#### Step Four
In order for ActiveRecord to establish this relationship with the "dot methods" we want to use, we must modify the model objects to contain the relationship reference.

1. Update the `Book` model
  ```ruby
  # app/models/book.rb
  class Book < ApplicationRecord
    has_one :author   # singular
  end
  ```

2. Update the `Author` model
  ```ruby
  # app/models/author.rb
  class Author < ApplicationRecord
    has_many :books   # plural
  end
  ```

#### Step Five
To set up some test data, let's dive into the Rails console to create some database and model associations.

1. Create a new `Author`
2. Set a `Book` instance to have the `Author` we created in step #1
3. Repeat!


#### Step Six
Now that we have the appropriate data set up, let's try out a bunch of the "dot methods" on our models. Refer back to the relationships notes to see some ideas for things you can try out.
