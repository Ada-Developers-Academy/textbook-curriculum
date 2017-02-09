# Comparisons & Flow Control
## Learning Goals
  - Meet the booleans!
  - Use equality and numeric comparisons to change how code executes.
  - Leverage conditionals and blocks to make decisions in code.

## Comparisons
Equality comparisons can be used on all object types, including `String`, `Integer`, `Float`, `Array`, and `Hash`:

- `==` (equal to?)
- `!=` (not equal to?)

Numeric comparisons are used primarily on `Integer` and `Floats`:

- `>`  (greater than?)
- `<`  (less than?)
- `>=` (greater than or equal to?)
- `<=` (less than or equal to?)

Comparisons result in a `boolean` object. This object type has only two possible values: `true` and `false`.

```ruby
1 > 0
# => true

"hello" == "hello"
# => true
```

## Flow Control: Conditionals
`if` and `else` allow you to control the flow of your program. This means that they allow you to define which blocks of code will execute, and which will be skipped.

```ruby
if <condition>
  <block>
end

moar_code here
```

When you use an `if`, the code in the _block_ that follows (until the `end`) will only be executed *if* the _condition_ evaluates to `true`. Additionally, you may add `else` before the `end`:

```ruby
if <condition>
  <block>
else
  <alternate block>
end

moar_code here
```

In this case, when _condition_ is `false`, then the _alternate block_ will execute. Otherwise, it will be skipped. When you have an `if` and an `else` only one of _block_ or _alternate block_ will execute, and that is determined by the evaluation of the _condition_.

```ruby
puts "Hey! What’s your name?"
response = gets.chomp

is_my_name = response.downcase == "computer"
if is_my_name
  puts "Weird, that's my name too. Small world!"
else
  puts "That's a great name!"
end

puts "Well, it was nice to meet you #{response}."
```

```ruby
if 1 > 0
  # this block will always happen
else
  # this block will never happen
end
```

### Negating Comparisons
Ruby has an `unless` keyword that works just like `if`, but in the reverse way. With an `if`, the block executes if the _conditional_ evaluates as `true`. With `unless`, the block executes if the _conditional_ evaluates as `false`.

```ruby
puts "What is your favorite animal?"
fav_animal = gets.chomp

if fav_animal.downcase == "camel"
  puts "I also love camels!"
else
  puts "That's a great animal, but I love camels the most."
end

# The following code works identically to the above
unless fav_animal.downcase == "camel"
  puts "That's a great animal, but I love camels the most."
else
  puts "I also love camels!"
end
```

Another way to "negate" a conditional is to use the `!` (not) operator. This should be placed just before a boolean value, or a comparison. When combined with a comparison, it should be enclosed in parentheses:

```ruby
puts "What day of the week is it?"
day_of_week = gets.chomp

puts "What did you have for lunch today?"
lunch = gets.chomp

if day_of_week.downcase == "tuesday"
  if !(lunch == "tacos")
    puts "Taco Tuesdays are my favorite, though!"
  end
end

if day_of_week.downcase == "friday"
  unless lunch == "fish tacos"
    puts "What? Friday fish tacos are a must!"
  end
end
```
