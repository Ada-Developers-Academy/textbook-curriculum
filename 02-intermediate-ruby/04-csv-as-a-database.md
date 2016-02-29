# CSV as a Database (DB)
## Learning Goals
- Learn a new approach to organizing data
- Explore _comma separated values (csv)_ as a storage pattern for data.
- Discuss how to use a class to model a collection of data

### What is a Database?
A _database_ is a system of storing and organizing information on a computer. In this case a _CSV_ will act as our database. In most cases a database can be thought of as a table or group of tables:

| ID | Name    |
|:---|:--------|
| 1  | Kari    |
| 2  | Jeremy  |
| 3  | Crystal |
| 4  | Cynthia |

We're going to quickly create a CSV to read. Let's go to our sandboxes and copypasta this code. Notice that it created a file named `ada_peeps.csv` on your computer.

```ruby
# csv-pronto.rb
people = [[1,"Kari"], [2, "Jeremy"], [3, "Crystal"], [4, "Cynthia"]]
CSV.open("ada_peeps.csv", "w") do |file|
  people.each do |person|
    file << person
  end
end
```

__Question: What does csv data look like?__

### The `CSV` Class
Ruby includes a CSV class tailored for working with csv data:

```ruby
require 'csv'
# Reads the contents of the file into an array of arrays.
CSV.read("ada_peeps.csv")
# => [["1", "Kari"],["2", "Jeremy"],["3", "Crystal"],["4", "Cynthia"]]

# Returns a CSV Object, to be read or manipulated.
csv = CSV.open("ada_peeps.csv")
# <#CSV io_type:File io_path:"file.csv" encoding:UTF-8 ...>
```

The `open` method requires at least one argument and up to three arguments as well as an optional block.

```ruby
CSV.open(filename, mode='r', options) {|file| block}
```

The required argument is the CSV filename and path. The second argument (`mode`) sets what permissions Ruby has to the file when it is opened. This defaults to `r` (read onle). Possible values are:

|Mode |  Meaning
|:---:|---------------------------------------------------------|
|"r"  |  Read-only, starts at beginning of file  (default mode) |
|"r+" |  Read-write, starts at beginning of file.               |
|"w"  |  Write-only, truncates existing file to zero length     |
|"w+" |  Read-write, truncates existing file to zero length.    |
|"a"  |  Write-only, starts at end of file if file exists.      |
|"a+" |  Read-write, starts at end of file if file exists.      |
|"b"  |  Binary file mode                                       |
|"t"  |  Text file mode                                         |

Most modes will create a new file if one doesn't already exist with the given name.

If you pass a block to `open`, Ruby will open the file, execute the code within the block (the file contents is given to the block as a local variable), and then close the file.

```ruby
require 'csv'
CSV.open("ada_peeps.csv", 'a') do |csv|
  csv << "5,Charles"
end
```

We can iterate over each line of the file using the `each` method:

```ruby
require 'csv'
CSV.open("ada_peeps.csv", 'r').each do |line|
  puts line
end
```

The `.read` method requires one argument, the filename, and allows for additional options. `.read` first opens the CSV file, then reads the contents of it into a new `Array`. Each row of CSV data is translated into an array as well.

```
# ada_peeps.csv
1,Kari
2,Jeremy
3,Cynthia
4,Crystal
5,Charles
```

```ruby
require 'csv'
require 'awesome_print'
array_of_ada_peeps = CSV.read("ada_peeps.csv")
ap array_of_ada_peeps
```
