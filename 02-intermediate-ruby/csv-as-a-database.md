# CSV as a Database (DB)

## Lesson Pre-Requisites

- This lesson will use iteration and nested arrays and hashes
- This lesson will reference `CSV` as a class, although classes are not necessary
- This lesson uses `awesome_print` to clarify the printing of arrays and hashes. Make sure it's installed with `$ gem install awesome_print`

## Learning Goals
- Learn the concept of separating our data source into a different system (such as a database)
- Explore _comma separated values (csv)_ as a storage pattern for data
- Learn the syntax for reading a CSV file in Ruby

### Bonus Learning Goals
- Learn the syntax for writing to a CSV file in Ruby. The Ada curriculum currently does not have any assignments that require a student to write to CSV; this is an extension learning goal that is mostly just incredibly interesting, if time allows.

## Intro: How Do We Access Data?

We have been learning how to write code that reads and access data. By "data," we typically meant that we've had a series of (nested) arrays and (nested) hashes in Ruby, and put it inside of our one Ruby (`.rb`) file.

We should soon see a limitation to this: If we imagine all of the data that's needed to serve thousands or millions of users, do we really need to make millions nested arrays and hashes in our one Ruby file?

**No!**

In our ideal system, we would **separate** different parts of our program. We would have:

1. A system/set of files that stores and organizes our data, and is our one data source
1. A part of our code base that reads from this data source
1. A part of our code base that performs methods and calculations on the data

## What is a Database?

A _database_ is a system of storing and organizing information on a computer.

Our goal is to learn a pattern for organizing our code in the following ways:

1. **We will use a CSV file as our database,** or system to store and organize our data
1. **We will write Ruby code to read the data from the CSV/database**
1. We will continue to use Ruby code and Ruby methods to analyze, iterate over, and process our data from our database

## CSV Files Are One Way to Store and Organize Data

In this case a _CSV_ will act as our database.

What is a CSV file? It's a common file format used to store and **organize data as a single table of information.**

CSV files have **columns.** Each column describes **attributes** that one piece of data can have a value for.

CSV files have **rows.** Each row describes **one record** of data, or a whole set of values that are directly related with each other.

Look at this table (roughly CSV format) that describes data of planets. Imagine this data is in a file named `planets_data.csv`

| ID | Name    | Mass  | Distance |
|:---|:--------|:------|:---------|
| 1  | Mercury | 0.055 | 0.4      |
| 2  | Venus   | 0.815 | 0.7      |
| 3  | Earth   | 1.000 | 1.0      |
| 4  | Mars    | 0.107 | 1.5      |

Consider these questions:

1. What does each record _represent_?
1. How many rows/records of data are in this table?
1. How many "planets" does this data describe?
1. How many columns are described in this table?
1. How many attributes does each planet have? What are the attributes?

<details>

  <summary>Check your answers here!</summary>

1. Each record represents **one** planet
1. There are 4 records in this table
1. There are 4 planets described in this table
1. There are 4 columns described in this table
1. There are 4 attributes for each planet. Each planet has an ID, Name, Mass, and Distance
</details>

### Get a CSV File on your Computer

For the rest of this exercise, we will be working with a CSV file named `planets_data.csv`.

To setup:

1. Create a new directory for this exercise `$ mkdir csv-planets-exercise`
1. `$ cd csv-planets-exercise`
1. `$ touch planets_data.csv`
1. `$ code .`
1. Copy and paste this snippet into your `planets_data.csv` file:

    ```bash
    1,Mercury,0.055,0.4
    2,Venus,0.815,0.7
    3,Earth,1.0,1.0
    4,Mars,0.107,1.5
    ```
1. Take a moment to observe this CSV file. What does it look like? How does this compare to arrays and hashes?

<details>

  <summary>OR, if you're in a pinch, run this code to generate the file. We will not go into the details here.</summary>

  ```ruby
  require 'csv'
  planets = [
    [1, "Mercury", 0.055, 0.4],
    [2, "Venus", 0.815, 0.7],
    [3, "Earth", 1.0, 1.0],
    [4, "Mars", 0.107, 1.5]
  ]
  CSV.open("planets_data.csv", "w") do |file|
    planets.each do |planet|
      file << planet
    end
  end
  ```
</details>

## Writing Ruby Code to Read CSV Data

In order to read CSV data, we need to follow these steps:

1. Learn the Ruby syntax for opening CSV files
1. Learn the Ruby syntax for reading the data from an opened CSV file
1. Put the data from the CSV file into a variable in our Ruby script

### Set up our Ruby script

In this same project directory, make a new Ruby file `main.rb` and open it in your text editor.

## Opening CSV Files requires `'csv'` and `CSV.read`

Ruby includes a `CSV` data type (class) tailored for working with CSV data.

Ruby needs us to include on the top of `main.rb` this line: `require 'csv'`. Every time we try to use CSV in a Ruby file, we should make sure we have `require 'csv'` near the top, otherwise we'll get an error where Ruby doesn't know what `CSV` is.

For convenience, [this is a link to Ruby's CSV documentation](https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV.html)

### `CSV.read(filename)`

[`CSV.read(filename)`](https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV.html#method-i-read) is a method that:

- Is responsible for converting the data in a CSV file into a Ruby array
- Takes in one argument: `filename`, which is the relative path to a `csv` file
- Returns an array of arrays
- We can use optional block syntax (that is compatible with `read`) to iterate over the data

### The Default Behavior Gives Us an Array of Arrays

To observe this method's default behavior, run this version of `main.rb`:

```ruby
require 'awesome_print'
require 'csv'

# Reads the contents of the file into an array of arrays.
planets = CSV.read('planets_data.csv')

ap planets
# => [["1", "Mercury", "0.055", "0.4"], ["2", "Venus", "0.815", "0.7"], ["3", "Earth", "1.0", "1.0"], ["4", "Mars", "0.107", "1.5"]]
```

1. What is the relative path from `main.rb` to our CSV file?
1. What does the array of arrays look like?
1. What is the value of the variable `planets`?

## Processing CSV Data in Ruby

We have proven that we can use Ruby code to find a CSV file, open it, and even put it into a Ruby variable!

However, we may want really robust ways to work with this data.

This curriculum will describe one very specific way to iterate through the CSV data. It is 100% acceptable to use alternative ways not described here.

Our approach will be this:
1. Re-organize our CSV file to have headers
1. Leverage interesting syntaxes that work with `CSV` in order to get back an array of hashes instead of an array of arrays
1. Leverage interesting Ruby syntax that work with `CSV` to iterate over the data with `each`

### Put Headers in our CSV file

CSV files can optionally dedicate the first row to describing the names of the columns.

Observe the following code snippet, describe it, and replace your `planets_data.csv` with this. What are the pros and cons of defining a header row?

```bash
id,name,mass,distance
1,Mercury,0.055,0.4
2,Venus,0.815,0.7
3,Earth,1.0,1.0
4,Mars,0.107,1.5
```

If we add a header row, we should get clarity about what each column of each row represents.

### About Options and adding `headers: true`

When we work with CSVs in Ruby, Ruby says we can give a bunch of options. We give this by creating a hash that contains any key-value pairs that we know that work. We've already done the research for you, so we're going to recommend and use one set of options: `{headers: true}`

The option `headers: true` in combination with `CSV.read` will change the behavior of `CSV.read`. Instead of an array of arrays, we get something called `CSV::Table`. **We will not get into the details of this new data type (class)**, but we'll see that this data type is very compatible with the next step.

Observe the addition of `headers: true` with this code:

```ruby
require 'awesome_print'
require 'csv'

planets = CSV.read('planets_data.csv', headers: true)

ap planets
# => #<CSV::Table mode:col_or_row row_count:5>
```

This difference will be useful in the next step...

### Chaining `.each` Lets Us Look At One Record at a Time

We can chain `.each` to `CSV.read` and a whole `each` code block at the end of this line.

Observe this code:

```ruby
require 'awesome_print'
require 'csv'

CSV.read('planets_data.csv', headers: true).each do |record|
  ap "Hooray!"
  ap record
end
```

1. What does the variable `record` represent?
1. For each `record`, what two things does the code do?
1. What would be a better variable name for `record`?
1. What data type is each `record`?
    - What are the keys of each `record`?
    - What piece of code might have caused this?
    - What is the data type of the keys?

### Another Example, All Together

Observe this code that creates an array of planets that are not Earth:

```ruby
require 'awesome_print'
require 'csv'

planets_that_arent_earth = []

CSV.read('planets_data.csv', headers: true).each do |planet|
  if planet["name"] != "Earth"
    planets_that_arent_earth << planet
  end
end

ap planets_that_arent_earth
```

1. What does the variable `planets_that_arent_earth` represent? How do we use it?
1. True or false: We can use conditionals, loops, call methods, read/assign/re-assign variables within this `each` loop.

How can we change this code so that we get an array of planets with a mass smaller than `0.5`?

## Summary

We should observe a pattern that our **source of data, or database** is a system of organizing data that can be separated from our Ruby code.

We can use Ruby code and `CSV.read` to read the CSV file.

We can use a combination of `CSV.read`, the `headers: true` option, and `.each` in order to iterate through this data.

## Bonus Syntax: `CSV.read` and Forcing `CSV::Table` to be an Array

The data returned from `CSV.read` looks like an array of arrays or an array of hashes, but is infact a `CSV::Table`. To transform this data into an array of hashes we need to add the following onto our `.read` method: `CSV.read('planets_data.csv', headers: true).map(&:to_h)` when using headers and `CSV.read('planets_data.csv').map(&:to_a)` when not using headers.

## Bonus: If We Need to Write to a CSV

`CSV.read` is great for reading data. However, it is impossible to actually write to a CSV file without `CSV.open`.

[`CSV.open(filename)`](https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV.html#method-c-open) is a method that:

- Is responsible for opening a CSV file to allow for reading that CSV file and writing back to that CSV file
- Takes in several arguments:
    - Required: `filename`, which is the relative path to a `csv` file
    - Optional: `mode`, which is necessary for programs and how they expect to use a file. Has a default value of `'r'`.
    - Optional: `options`, a hash used to customize the behavior of this `open` method
- Returns a `CSV` object. At Ada, we will not use this much
- We will use the optional block syntax that is compatible with `open`

### About Modes

The second argument (`mode`) sets what permissions Ruby has to the file when it is opened. Turns out that opening files in programs is tricky, so this is standard. This defaults to `r` (read only). Possible values are:

|Mode |  Meaning
|:---:|-----------------------------------------------------------|
|"r"  |  Read-only, starts at beginning of file  (default mode)   |
|"r+" |  Read-write, starts at beginning of file.                 |
|"w"  |  Write-only, truncates existing file to zero length       |
|"w+" |  Read-write, truncates existing file to zero length.      |
|"a"  |  Append write-only, starts at end of file if file exists. |
|"a+" |  Append read-write, starts at end of file if file exists. |
|"b"  |  Binary file mode                                         |
|"t"  |  Text file mode                                           |

What we should learn from this is that "reading" and "writing" are distinct operations, and that in order to write to a CSV file, we need to indicate a mode.

### Example of Writing to a New File

Let's watch `CSV.open` in action. Observe how we are using a code block that we haven't seen before, but is described in the documentation and research.

We should read this code as:
1. We should open the CSV file `planets_data.csv`. When we open it, we have the intention of _appending_ to the end of this same file, with mode `'a'`
1. After we call `CSV.open`, we open up a code block, with a variable `csv`. This variable `csv` represents the open file.
1. With the file opened, inside of the code block, we make `jupiter_data`. In this example, it should be an array.
1. We shovel `jupiter_data` into our open file, `csv`

```ruby
require 'awesome_print'
require 'csv'

CSV.open('planets_data.csv', 'a') do |csv|
  jupiter_data = [5, "Jupiter", 318, 5.2]
  csv << jupiter_data
end
```

**Now run the code once.**

1. Was there anything printed to the terminal?
1. Check your `planets_data.csv` file. Is Jupiter in there?
1. If we run `main.rb` again, what will happen to the CSV file? What about if we run it 500 times?

### Example With Headers

This strategy doesn't change much even if we add the option `headers: true`.

```ruby
require 'awesome_print'
require 'csv'

CSV.open('planets_data.csv', 'a', headers: true) do |csv|
  saturn_data = [6, "Saturn", 999, 9.0]
  csv << saturn_data
end
```

# Resources
-   [CSV Documentation](https://ruby-doc.org/stdlib/libdoc/csv/rdoc/CSV.html)
-   [Sitepoint CSV Tutorial](https://www.sitepoint.com/guide-ruby-csv-library-part/)
