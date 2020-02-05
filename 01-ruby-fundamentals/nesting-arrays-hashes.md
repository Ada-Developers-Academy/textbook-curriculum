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

It's nice to be able to access one element at a time, but it requires us to know the **specific and literal** indices and/or keys of the structure, beyond just the structure itself. Can we write code that allows us to access values from nested arrays and hashes?

Yes! If all we know is the **structure** of the data, we can generically access values from the structure using **iteration.**

Read this code sample that combines iteration techniques and accessing from the `menu` variable defined above, and then let's dive into the explanation.

```ruby
# For each item in menu, print to the terminal the item's name and item's price with a hyphen in the middle
menu.each do |item|
  puts "#{item[:name]} - $#{item[:price]}"
end
```

<details>
  <summary>Want to check your understanding on iteration? Here's a review on what iteration is, and all of the vocabulary associated with it</summary>
  
### Iteration Review

We can iterate over **any array.** (We can also iterate over other data types, but let's delve into that later.)
This means that **with the right syntax,** we can execute any amount of code **for each element in the array.**

Being able to **execute code for each element in any given array** is an important skill that we will do _constantly_ in programming. This technique is called **iteration.**

If we know that `menu` is an **array**, then we can use iteration. In Ruby, this means _using an `each` loop_.

To iterate over the `menu` array, we do the following:

1. Determine what the array is (`menu`)
1. Call the `each` method on the array (`menu.each`)
1. Define the _iteration block_. This is a fancy phrase that means **start** a block of code with `do`, and end it with `end`. In practicality, programmers tend to forget the name "iteration block," so don't be alarmed if we also call it "the loop" or "the stuff inside the each loop."
1. Name the _block parameter_. This is the name of a **local variable.** This local variable **represents one element of the array at a time.** In this case, we are saying that each element of the `menu` array will be looked at _one loop at a time,_ and each element will be referenced by the local variable name `item`. In Ruby syntax, we define the name `item` inside of the `||`s, next to `do`. We can name this block parameter _any_ valid variable name.
    - In practice, the term "block parameter" is very fancy, and programmers tend to forget this name. We may also call this "iteratee" or "iteration variable."
1. Add the details of the _iteration block_. Between the `do |item|` and the `end`, we can write **any number of lines of code** to execute **for each element in the array.**
    - Again, to access the value of each element in the array, we reference it by the block parameter, or `item` in this case
    - Is `item` an array? Then you can use all of the good array syntax to access/read it!
    - Is `item` a hash? Then you can use all of the good hash syntax to access/read it!
    - If you're unsure of what data type `item` is, do some debugging work to find out

</details>

### Iteration and Nesting

Within our _iteration block_, we should write all of the lines of code that need to execute per element. If we need to print something per `item`, we should write `puts item` here. If we need to create variables, store data, modify data, and/or create data per element, we should do that here.

Similarly, if you need to access a deeper piece of data based on each `item`, then you should use `item` appropriately with the techniques we practiced today.

Even if `item` is one element within the array of `menu`, `item` may represented an array or hash itself.

#### Iteration Tips

- Proper/improper indentation in the code can make or break the readability of your code
- We do not `return` anything within iteration using `each` loops. In `each` loops, we are simply writing code to execute. We use `return` in order to return a value from a method, or in the future we'll use `return` for very specific pieces of syntax
- We can also use `each` in hashes. However, the syntax will need to change, as the block parameter in an `each` loop on a hash will not represent every _element_, but every _key-value pair._ You may need to look up online what this syntax is in Ruby.
- We can put `each` loops anywhere in our code, as long as it's valid syntax (yes, we can put it in a method!)
    - ...We can even put `each` loops within each loops

### Exercise

Copy the above data into a file, then write code to address the following prompts.

1. Add two more meals to our menu, including name, price and allergy information
1. Write a loop to find the average price of a meal on our menu
1. Write code to produce a list of all the allergens in the menu
    - How would you make sure there aren't duplicates?
1. Write code that asks the user for the name of a meal and prints out the price
    - What should your code do if the meal isn't found?
