# Active Record: Migrations
## Learning Goals
- What is an AR (Active Record) _migration_?
- Learn how to use `rails` and AR to control the _schema_ of a database
- Understand the role of _migrations_ in a Rails application

Active Record is an important piece of the Rails approach to web applications. Distributed as a gem, AR is an **Object Relational Mapping** technique. It is used to abstract, normalize, and simplify the interaction between Ruby code and a relational database. It's primary role is to _model_ data structures and their relationships, providing a Ruby class to represent each collection of data (table) in your application's database.

__Question: What is the role of _models_ in the MVC pattern?__

## A Few Terms
-  A Database _schema_ is the structure of a database.  It's the logical view of the tables and how they are related to one another.  
-  A _migration_ is a change to that database schema.

So in this lesson we will be learning how to create, change and structure the Model layer of our application.  

## Generating New Rails Models & Migrations
An important component of the `rails` command line tool is the generator. We can use the generator to automatically create idiomatic classes and files in the appropriate directories for the most common application roles.

Using the generator ensures that we are following Rails _conventions_ and really speeds project set up. Let's run a generator command:

```bash
$ rails generate model student name:string pie:string birthday:datetime
```

This command will do three things:

- Create a Rails _model_ in the `app/models/` directory called `student.rb`
- Create a Rails _migration_ in the `db/migrations/` directory called `<timestamp>_create_students.rb`
- Put enough code in each of those files to get us going.

Each file plays a role in describing how Rails interacts with the database and what information the database contains. Let's focus on _migrations_ in this discussion.

## Active Record Migrations
Rails gives us a structured approach to maintaining the database schema: _database migrations_. These are step-by-step instructions describing how to construct the schema. If done right, they provide a blueprint of not only how to construct the database schema, but a history of how the database requirements have changed over time. A schema starts off with nothing in it, and each migration modifies it. Migrations may add or remove tables, columns, or rows.

The command we ran above generated both a _model_ and a _migration_. The convention here is that adding a _model_ means you need some persistence in your application. The corresponding _migration_ provides the documentation and instructions to the database on how to store the data the _model_ is describing.

### Migrations without Models
Often, you will need to modify the database schema outside the confines of creating a new _model_. A really common example is altering a _column_ name or datatype of an existing table. Just like `rails` can generate _models_, it can generate _migrations_ that are not associated with a model:

```bash
$ rails generate migration add_hobby_to_students
```

This will generate a file in `db/migrate/20160415165736_add_hobby_to_students.rb`. Notice how we use the name of the file to indicate its intention. That is very intentional and another convention to observe.

### Working with Migrations
If we run the command above and opened the resulting `20160415165736_add_hobby_to_students.rb` file, we will see something like this:

```ruby
class AddHobbyToStudents < ActiveRecord::Migration
  def change
  end
end
```

All _migrations_ will be a class that inherits from `ActiveRecord::Migration`. __Most__ migrations will only have a single method--`change`--that describes how the schema will __change__ when the _migration_ is executed.

Within the `change` method, we can use many other method calls provided by `ActiveRecord::Migration` to describe how to modify the database _schema_. Here are the most common methods you'll encounter in _migrations_:

- `create_table(table_name)`: Creates a new table in the database, this is the command that the `Post` migration used.
- `add_column(table_name, column_name, data_type, options)`: Adds a column to an existing table.
- `remove_column(table_name, column_name)`: Removes a column from an existing table.
- `change_column(table_name, column_name, new_data_type)`: Changes an existing column from one data type to another.
-  `rename_column(table_name, old_column, new_column)`: Renames a column to match the newly given column name.

__Question: Just looking at the name of the migration, which of these methods would we utilize to complete the _migration_?__

```ruby
class AddHobbyToStudents < ActiveRecord::Migration
  def change
    # Rails loves both symbols and implicit parens
    add_column :students, :hobby, :string
  end
end
```

### Running (and reversing) Migrations
Once we have created and defined a _migration_, we need to run it. The changes described in a _migration_ are not applied to the database until we explicitly invoke them. A _migration_ is either __up__ (its changes have been applied to the database) or __down__ (its changes have not been applied).

Rails provides a collection of `rake` tasks to describe that state of _migrations_ and database schema:

- Use `rake db:migrate` to apply all pending _migrations_ to the schema
- Use `rake db:migrate:status` to see the up/down status of all _migrations_
- Use `rake db:rollback` to __reverse__ the schema changes of the last _migration_

__Question: When would we not be able to `rollback` a migration? Why not?__

## Naming Conventions
Built into Rails is a class known as the _Inflector_. It has one of the hardest jobs: deciphering the English language. The _Inflector_ does its very best to assist Rails in understanding the correct singular and plural versions of any noun it receives. This is extremely important in providing Rails developers conventions and tools that follow those conventions. Notice in our _migration_ examples above how the generated class and file names all automatically received a singular or plural notation. That's the _Inflector_ at work. I don't envy the _Inflector_.

By convention, _model_ class and file names are singular. The associated database table is pluralized. The idea is that the table is _all the students_, while an __instance__ of the _model_ describes just one student. Here's a handy table:

|Model / Class (singular) | Table / Schema (plural)| Filename (singular) |
|:-----------------------:|:----------------------:|:-------------------:|
| Post                    | posts                  | post.rb             |
| LineItem                | line_items             | line_item.rb        |
| Mouse                   | mice                   | mouse.rb            |
| Medium                  | media                  | medium.rb           |
| Person                  | people                 | person.rb           |
| Deer                    | deers                  | deer.rb             |


