
# Conditional Control Structures
## Learning Goals
- Learn strategies to manage complex conditions with `elsif` and `case`.
- Learn two new kinds of iteration using _conditional loops_: `while` and `until`

## Conditional Control Structures

### Using Compound Conditions

```ruby
puts "How many cities have you been to?"
city_count = gets.chomp.to_i
puts "How many countries have you been to?"
country_count = gets.chomp.to_i

# without compound conditions
if city_count > 8
  if country_count > 2
    puts "Wow! You're a world traveler!"
  end
end

# This is the same as the above, with compound conditions
if city_count > 8 && country_count > 2
    puts "Wow! You're a world traveler!"
end
```

```ruby
if command == "add"
  puts "We're adding numbers."
end

if command == "+"
  puts "We're adding numbers."
end

# This is the same as the above
# same amount of work, half as much code
if command == "add" || command == "+"
  puts "We're adding numbers."
end
```

### Complex conditionals
The `if/else/end` code we've written above is the standard and simplest form of a conditional. It is possible to extend this form with one or more `elsif` lines. Let's look at something kinda scary first:

```ruby
if command == "add" || command == "+"
  puts "We're adding numbers"
else
  if command == "subtract" || command == "-"
    puts "We're subtracting numbers"
  else
    if command == "multiply" || command == "*"
      puts "We're multiplying numbers"
    end
  end
end
```
How can you refactor this code using `if/elsif/else`?

<details>

  <summary>
  Refactored code using if/elsif/else

  </summary>

  ```ruby
  # This is equivalent to the above
  if command == "add" || command == "+"
    puts "We're adding numbers"
  elsif command == "subtract" || command == "-"
    puts "We're subtracting numbers"
  elsif command == "multiply" || command == "*"
    puts "We're multiplying numbers"
  end
  ```
</details>

This can be very useful, when you have more than one `elsif` line, because the indentation, or *nesting*, can quickly become very deep, and more difficult to understand.


### Simplifying really complex conditionals
When you have several `elsif` lines within a single `if`, there's a way to write each conditional with much less repetition. First, a really long, really complex conditional:

```ruby
if command == "add" || command == "+"
  puts "We're adding numbers"
elsif command == "subtract" || command == "-"
  puts "We're subtracting numbers"
elsif command == "multiply" || command == "*"
  puts "We're multiplying numbers"
elsif command == "divide" || command == "/"
  puts "We're dividing numbers"
elsif command == "exponify" || command == "**"
  puts "We're exponentiating numbers"
elsif command == "sqrt"
  puts "We're finding the square root of a number"
else
  puts "What do you want from me?!"
end
```

The above code works, but it's kinda messy. We can trim it by using the `case/when` syntax:
```ruby
case command
  when "add", "+"
    puts "We're adding numbers"
  when "subtract", "-"
    puts "We're subtracting numbers"
  when "multiply", "*"
    puts "We're multiplying numbers"
  when "divide", "/"
    puts "We're dividing numbers"
  when "exponify", "**"
    puts "We're exponentiating numbers"
  when "sqrt"
    puts "We're finding the square root of a number"
  else
    puts "What do you want from me?!"
end
```

## Conditional Loops
### Wait a `while`
Execute the iterator `while` the condition is true.

**Think Pair Share** 

Use a `while` loop to print out the numbers 0 though 3.

<details>

  <summary>
  While loop
  </summary>

  ```ruby
  i = 0

  while i < 4
    puts i
    i += 1
  end
  ```

  The above code will output the values of i until i is no longer less than 4, resulting in the following output:

  ```ruby
  0
  1
  2
  3
  ```

</details>

### Checking for valid user input using `while`

```ruby
command = gets.chomp

while command != "add" && command != "+"
  puts "Please tell me to add (+)!"
  command = gets.chomp
end

puts "OMG It's about time!"
```

### Make it clearer by using `until`
Execute the iterator `until` the condition is true.

```ruby
i = 0

until i == 4
  puts i
  i += 1
end
```

The above code will output the values of i until i is equal to 4, resulting in the following (equivalent to the above) output:

```ruby
0
1
2
3
```
### Checking for valid input using `until`

```ruby
command = gets.chomp

until command == "add" || command == "+" || command == "subtract" || command == "-"
  puts "Please tell me to add (+) or subtract (-)!"
  command = gets.chomp
end

puts "Yay we did it!"
```

### Make it clearer by using `include?`
The _Array method_ `include?` can be used to simplify a complex conditional. It returns `true` if the provided _parameter_ is equal to any of the elements in the _Array_, otherwise, it returns `false`:

```ruby
command = gets.chomp

until ["add", "+", "subtract", "-"].include?(command)
  puts "Please tell me to add (+) or subtract (-)!"
  command = gets.chomp
end

puts "Yay we did it!"
```
