# Arrays and Hashes Together: Nesting

## Learning Objectives

By the end of this lesson, students should be able to...

- Store collections of values using arrays and hashes
- Use loops to iterate through an array or hash
- Combine arrays and hashes into more complex data structures

## Review: Hash or Array?

Determine whether you would use an array or a hash to store each of these collections and why.

1. The types of tea you have in your cupboard
1. Information about a customer
1. An address
1. The names of the first 150 pokemon, in order
1. All the meals you serve in your restaurant
1. Details about a meal served by your restaurant, such as name, price, and allergy info
1. Details about all the meals your restaurant serves

As the last question above demonstrates, sometimes an array or a hash by itself does not solve a problem. Very often we will need to combine these two data structures to produce something a little more nuanced.

## "Any Object" Includes Other Arrays and Hashes

Fortunately for us, Ruby was designed to be flexible in just this way. The elements in an array or the values in a hash can be _any object_, even another array or hash! So, to keep track of details of all the meals in our restaurant, we might devise something like this:

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

## Accessing Data

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

## Using Loops to Iterate Over Nested Structures

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
