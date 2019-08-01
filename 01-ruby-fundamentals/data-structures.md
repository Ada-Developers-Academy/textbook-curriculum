# Intro to Data Structures: Arrays and Hashes

## Learning Goals
By the end of this lesson, students should be able to...

- Understand how to create a new array
- Understand how to assign an array to a variable
- Understand how to access an element from an array
- Understand how to put a new element into an array
- Understand how to create a new hash
- Understand how to assign a hash to a variable
- Understand how to put something into a hash
- Understand how to access a value in a hash using a key
- Decide whether an array or a hash is appropriate for a given problem

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
  - The hash can be empty
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
