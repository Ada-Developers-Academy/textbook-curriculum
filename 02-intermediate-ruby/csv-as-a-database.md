# CSV as a Database (DB)
## Learning Goals
- Learn a new approach to organizing data
- Explore _comma separated values (csv)_ as a storage pattern for data.
- Discuss how to use a class to model a collection of data

### What is a Database?
A _database_ is a system of storing and organizing information on a computer. In this case a _CSV_ will act as our database. In most cases a database can be thought of as a table or group of tables:

| ID | Name    | Mass  | Distance |
|:---|:--------|:------|:---------|
| 1  | Mercury | 0.055 | 0.4      |
| 2  | Venus   | 0.815 | 0.7      |
| 3  | Earth   | 1.000 | 1.0      |
| 4  | Mars    | 0.107 | 1.5      |

We're going to quickly create a CSV to read. Let's go to our sandboxes and copypasta this code. Notice that it created a file named `planet_data.csv` on your computer.

```ruby
# csv-pronto.rb
require 'csv'
planets = [
  [1, "Mercury", 0.055, 0.4],
  [2, "Venus", 0.815, 0.7],
  [3, "Earth", 1.0, 1.0],
  [4, "Mars", 0.107, 1.5]
]
CSV.open("planet_data.csv", "w") do |file|
  planets.each do |planet|
    file << planet
  end
end
```

__Question: What does csv data look like?__

### The `CSV` Class
Ruby includes a CSV class tailored for working with csv data:

```ruby
require 'csv'
# Reads the contents of the file into an array of arrays.
CSV.read("planet_data.csv")
# => [["1", "Mercury", "0.055", "0.4"], ["2", "Venus", "0.815", "0.7"], ["3", "Earth", "1.0", "1.0"], ["4", "Mars", "0.107", "1.5"]]

# Returns a CSV Object, to be read or manipulated.
csv = CSV.open("planet_data.csv")
# <#CSV io_type:File io_path:"file.csv" encoding:UTF-8 ...>
```

The `open` method requires at least one argument and up to three arguments as well as an optional block.

```ruby
CSV.open(filename, mode='r', options) {|file| block}
```

The required argument is the CSV filename and path. The second argument (`mode`) sets what permissions Ruby has to the file when it is opened. This defaults to `r` (read only). Possible values are:

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

Most modes will create a new file if one doesn't already exist with the given name.

If you pass a block to `open`, Ruby will open the file, execute the code within the block (the file contents is given to the block as a local variable), and then close the file.

```ruby
require 'csv'
CSV.open("planet_data.csv", 'a') do |csv|
  csv << [5, "Jupiter", 318, 5.2]
end
```

We can iterate over each line of the file using the `each` method:

```ruby
require 'csv'
CSV.open("planet_data.csv", 'r').each do |line|
  puts line
end
```

The `.read` method requires one argument, the filename, and allows for additional options. `.read` first opens the CSV file, then reads the contents of it into a new `Array`. Each row of CSV data is translated into an array as well.

```
# planet_data.csv
1,Mercury,0.055,0.4
2,Venus,0.815,0.7
3,Earth,1.0,1.0
4,Mars,0.107,1.5
5,Jupiter,318,5.2
```

```ruby
require 'csv'
require 'awesome_print'
array_of_planet_data = CSV.read("planet_data.csv")
ap array_of_planet_data
```
