# Intro to Data Structures: Arrays and Hashes

<!--
Instructor notes: May want to assign the first half
of this as flipped classroom pre-reading, since it's
mostly review of what they've seen in JSL.
-->

## Learning Goals
By the end of this lesson, students should be able to...

- Store collections of values using arrays and hashes
- Use loops to iterate through an array or hash
- Decide whether an array or a hash is appropriate for a given problem
- Combine arrays and hashes into more complex data structures

## Review: Collections

We've seen arrays and hashes before: they're _collections_, variables that hold other variables. This is a super important idea, and almost every programming language contains these basic constructs. Today we'll dive a little deeper into what you can do with arrays and hashes, but first we'll review some of the vocabulary and key concepts around them.

### Arrays

Here are some facts about arrays.

#### Creation

- Arrays are created by putting square brackets `[]` around a list of things
  - The list can be empty
- Since an array is an object, we can store it in a variable
- You can get the length of the array by calling `my_array.length`
- The elements in an array are _ordered by index_ - the order you put them in determines the index they get

```ruby
students = ['Ada', 'Katherine']

puts "#{students}"
# => ['Ada', 'Katherine']

puts students.length
# => 2
```

**Question:** Why do we interpolate when printing the whole array? What is the difference between `puts students` and `puts "#{students}"`?
- Open up `irb` and find out!

#### Indices and Elements

- Each element in the array is assigned a number called its _index_
  - Indices always start from 0
  - The index of the last element is always `my_array.length - 1` (why?)
  - Negative indices count backwards from the end, starting at `-1` for the last element
- Any object can be an element in an array
- You can add a new element to the array with the `my_array.push` method or with `<<`
- You can read elements using square brackets `[]` and the index
- Changing the value of an element is done in the same way
- Trying to read with an index that is not in the array will result in `nil`

```ruby
# Read the element at index 0
puts students[0]
# => Ada

# Read the last element
puts students[-1]
# => Katherine

# Add elements
students.push('Grace')
students << 'Edith'
puts "#{students}"
# => ['Ada', 'Katherine', 'Grace', 'Edith']

puts students[2]
# => 'Grace'

# Change the element at index 2
students[2] = 'Anita'
puts students[2]
# => 'Anita'

puts "#{students}"
# => ['Ada', 'Katherine', 'Anita', 'Edith']

# Read an element not in the array
puts students[10]
# => nil

puts students[4]
# => nil
# Why? Aren't there 4 elements?
```

#### Iteration

- Iteration is the process of doing something to each element in the collection
- To iterate using indices, you can use a `times` loop on the length of the array
- There is an `my_array.each` method, which is more readable

```ruby
# Print every student to the command line
students.length.times do |i|
  puts "#{students[i]}: an excellent student"
end

# Simpler syntax for doing the same thing
# Note that our iteration variable is the
# element itself, not the index
students.each do |student|
  puts "#{student}: a grand student"
end
```

#### Questions

1. What different ways are there to access the last element in an array?
1. Given an array with the age of each person in the class,
    - How would you find the average age?
    - How would you find the biggest or smallest age?

### Hashes

Here are some facts about hashes.

#### Creation

- Hashes are created by putting curly braces `{}` around a list of `key: value` pairs
  - The list can be empty
- Since a hash is an object, we can store it in a variable
- You can get the number of key/value pairs with `my_hash.length`
- The hash does **not** keep track of the order of its key/value pairs*

```ruby
fruit_prices = {
  apple: 2.15,
  pear: 3.02
}

puts "#{fruit_prices}"
# => { apple: 2.15, pear: 3.02 }

puts fruit_prices.length
# => 2
```

#### Keys and Values

- Any `"string"` or `:symbol` is a valid key
- Any object can be a value in a hash
- You can add a new key/value pair to the hash by setting the value of a key that's not in the hash
- Values can be read using square brackets `[]` an the corresponding key
- You can set values using the same notation
- Trying to read the value for a key not in the hash will result in `nil`
- Calling `my_hash.keys` will give you a list of all the keys for this hash

```ruby
# Read a value using its key
puts fruit_prices[:apple]
# => 2.15

# Set a value using its key
fruit_prices[:pear] = 2.85
puts "#{fruit_prices}"
# => { apple: 2.15, pear: 2.85}

# Add a new key/value pair
fruit_prices[:orange] = 1.45
puts fruit_prices[:orange]
# => 1.45

puts "#{fruit_prices.keys}"
# => [:apple, :pear, :orange]

# Look up a key that's not in the hash
puts fruit_prices[:blueberry]
# => nil

puts fruit_prices["orange"]
# => nil
# Why?
```

#### Iteration

- Like an array, you can iterate through the key/value pairs in a hash
  - Unlike an array, the order is not guaranteed*
- `my_hash.each` provides two iteration variables, the key and the value

```ruby
fruit_prices.each do |fruit, price|
  puts "#{fruit} costs $#{price}"
end
```
&ast;For more on hash ordering, see the footnote below.

#### Questions

1. Does it make sense to access the "last" key/value pair in a hash?
1. What data type do you get back from `my_hash.keys`?
1. How would you get a list of fruits costing less than $3.00?

## Comparing Arrays and Hashes

Arrays and hashes are very similar. Both store a collection of elements, and they have similar syntax. However the vocabulary is a little different, and each solves a different sort of programming problem.

Array                                     | Hash
---                                       | ---
Created with square brackets `[]`         | Created with curly braces `{}`
Uses integers for indices                 | Uses strings or symbols for keys
Indices start from 0 and count up         | Any string or symbol is OK
Any object can be an element              | Any object can be a value
Access elements with square brackets `[]` | Access values with square brackets `[]`
Add an element with `.push()` or `<<`     | Add a key/value pair with `[]`
Access via an index that doesn't exist returns `nil` | Access via a key that doesn't exist returns `nil`
Elements are given their index in order (sequentially) | Keys/values do not have an index, and order is not guaranteed

### Exercise: Hash or Array?

Determine whether you would use an array or a hash to store each of these collections and why.

1. The types of tea you have in your cupboard
1. Information about a customer
1. An address
1. The names of the first 150 pokemon, in order
1. All the meals you serve in your restaurant
1. Details about a meal served by your restaurant, such as name, price, and allergy info
1. Details about all the meals your restaurant serves

## Arrays and Hashes Together

As the last question above demonstrates, sometimes an array or a hash by itself does not solve a problem. Very often we will need to combine these two data structures to produce something a little more nuanced.

### Creation

Fortunately for us, Ruby was designed to be flexible in just this way. The elements in an array or the values in a hash can be _any object_, even another array or hash! So, to keep track of details of all the meals in our restaurant, we might devise something like this.

```ruby
menu = [
  {
    name: 'beet salad',
    price: 6.75,
    allergens: ['nuts']
  },
  {
    name: 'quiche',
    price: 10.00,
    allergens: ['gluten', 'dairy']
  },
  {
    name: 'molten chocolate cake',
    price: 8.50,
    allergens: []
  }
]
```

There's a lot of text and braces flying around here but the big idea is the same as before: we use _literals_ to define an object and then assign it to a variable. We've created an array called `menu` with three elements, each of which is a hash.

This technique where we type the data directly into our program is sometimes called _hard-coding_ the data. There are several other ways to get data, like reading it from a file or downloading it from the internet - this is something we'll talk about later. For now all of our data will be hard-coded.

### Accessing Data

We can use these nested structures just like any other variable in Ruby:

```ruby
# The first element in the "menu" array is a hash
puts menu[0]
# => {:name=>"beet salad", :price=>6.75, :allergens=>["nuts"]}

# Since "menu[0]" is a hash, we can apply more square brackets to it
puts menu[0][:name]
# => beet salad

# We can also assign it to a variable
salad = menu[0]
puts salad[:name]
# => beet salad

# "salad" and "menu[0]" are now just different names for the same
# object! Changes to one will be seen through the other.
# More on this idea later.
salad[:price] = 7.25
puts menu[0]
# => 7.25

# Array inside a hash inside an array - woah!
puts menu[0][:allergens][0]
# => nuts
```

The allergy information for each meal is an array inside a hash inside an array! This may seem a little complex, but this data structure fits our data well. Getting comfortable with this sort of nested structure is one of the big hurdles a novice programmer faces.

### Iteration

Iteration uses the same techniques we discussed above:

```ruby
# Print the name and price of each item on the menu
menu.each do |item|
  puts "#{item[:name]} - $#{item[:price]}"
end
```

### Exercises

Copy the above data into a file, then write code to address the following prompts.

1. Add two more meals to our menu, including name, price and allergy information
1. Write a loop to find the average price of a meal on our menu
1. Write code to produce a list of all the allergens in the menu
    - How would you make sure there aren't duplicates?
1. Write code that asks the user for the name of a meal and prints out the price
    - What should your code do if the meal isn't found?

## Footnote: On the Order of Key/Value Pairs

This isn't something you need to worry about right now, but if you want to nerd out a little over language design than read on.

Hash ordering is a tricky subject in Ruby. According to the Ruby language definition the order of keys and values in a hash is not guaranteed. To understand what this means, consider the following program.

```ruby
test_hash = {
  a: 'one',
  b: 'two'
}
puts "#{test_hash}"
```

According to the spec, for this program both `{a: 'one', b: 'two'}` and `{b: 'two', a: 'one'}` are valid outputs, and the two permutations of the hash are considered equivalent.

However, in the standard implementation of Ruby that we're using hash ordering _is_ preserved. When iterating through a hash, you'll always get key/value pairs out in the order they were inserted. That means that _in our version of ruby_ we can predict the following results:

```ruby
h1 = {:a=>"one", :b=>"two"}
h2 = {:b=>"two", :a=>"one"}

# Iteration (and printing) is in FIFO order
puts "#{h1}"
# => {:a=>"one", :b=>"two"}
puts "#{h2}"
# => {:b=>"two", :a=>"one"}

# Even though they print differently, the two are considered equal
puts h1 == h2
# => true
```

This behavior does **not** appear in other programming languages like [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...in#Description) or [Python](https://docs.python.org/3/tutorial/datastructures.html#dictionaries), or even in [other implementations of Ruby](https://stackoverflow.com/questions/31418673/is-order-of-a-ruby-hash-literal-guaranteed). Moreover, unlike an array you cannot change the order of a hash; a hash cannot be sorted.

For these reasons **you should not rely on hash ordering** - it's a bad habit that will produce subtle bugs when you change languages.
