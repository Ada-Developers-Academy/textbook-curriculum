# Ruby 102

## Learning Goals
- Gain some familiarity with Ruby's core _Object Types_
    + `String`
    + `Symbol`
    + `Fixnum`
    + `Float`
- Explore some common _methods_ available to the core _types_

## `String`
Ruby _strings_ are a sequence of characters. **This sentence is weird**We use _strings_ for text that's meaningful to humans. Typically, strings are created by enclosing characters (letters, numbers, punctuation symbols, etc.) between a pair of single or double quotes.

Once a _string_ has been created, you have access to all of the _methods_ defined for `String`. There are two ways to access these methods: 1) dot notation and 2) operator notation. Let's look at both:

```ruby
# Declare a String by using double quotes
"Hello World"
# => "Hello World"

# Use dot notation to invoke a method
"Hotdog".reverse
# => "godtoH"

"I'm thirty one characters long!".length
# => 31

# Use operator notation to invoke a method
"Kit" + "tens!"
# => "Kittens!"

"-" * 40
# => "----------------------------------------"
```

__Question: What's the difference between dot and operator notation?__

### Single or Double Quotes?
Strings created from single or double quotes are identical in almost every way. The core difference is that double-quoted strings _interpolate_ special characters and Ruby code. Single-quoted strings do not.

For example `\n` is a special character for a new line. Using double quotes tells Ruby to evaluate this character. `#{}` is a special syntax for _interpolating_ Ruby code inside of a string. The code inside of the braces (`{}`) is interpreted by Ruby. The results are then inserted into the containing string.

```ruby
puts 'abc\ndef'  # => abc\nabc
puts "abc\ndef"  # => abc
                 #    abc

name = "Jeremy"
'My name is #{name.reverse}' # => "My name is \#{name.reverse}"
"My name is #{name.reverse}" # => "My name is ymereJ"
```

It's best to use double quotes by default. This gives the most flexibility and it's more common that you'd need to use a `'` inside of a sentence than a `"`.

If you want to use a double quote character inside of a string that is already enclosed by double quotes, use the `/` character to escape the quote character.

```ruby
puts "\"Hello\" I said"
# "Hello" I said
# => nil
```

Check out the [Documentation for String](http://www.ruby-doc.org/core-2.3.0/String.html) to see other things that you can do with `String` objects.

## `Symbol`
_Symbols_ are a lot like strings but they are meant to represent identifiers. _Symbols_ are text that are meant only for keeping track of the name of something inside of a Ruby application. They exist primarily as a performance optimization inside of Ruby. We will see more of them when we talk about _Hash_ objects.

```ruby
:elephant.object_id # => 483528
:elephant.object_id # => 483528

"elephant".object_id # => 70259726644020
"elephant".object_id # => 70359726563680
```

## Working with numbers: `Fixnum` & `Float`

Working with numbers in Ruby comes in two forms. The first form represents integers (whole numbers without a decimal point). These are called `Fixnum`s in Ruby. Numbers with a decimal point are represented by the `Float` object.

`Fixnum` objects are whole numbers. `1`, `9999`, `-255` are all `Fixnum` objects.

`Float` objects are numbers with a decimal point (like `3.14`, `0.001`, and `11.11 `).

### Math with `Fixnum` & `Float`
While many math operations perform intuitively, it's important to note the differences between `Fixnum` math and `Float` math. In short, doing math with _only `Fixnum`s_ will almost always return a `Fixnum`. Doing math involving `Float`s will always return a `Float`. Here's some examples:

```ruby
10 * 10
# => 100 (Fixnum)

2 / 3
# => 0 (Fixnum)

3 / 2
# => 1 (Fixnum)

2.0 / 3
# => 0.66666666666 (Float)

2.4 * ((100/99.88) * 4.2**8) - 77
# => 232585.84332597523 (Float)
```

Check out the Documentation for [Fixnum](http://ruby-doc.org/core-2.3.0/Fixnum.html) and [Float](http://www.ruby-doc.org/core-2.3.0/Float.html).

## Collections: `Array` & `Hash`
Ruby provides two _object types_ focused on _collections_ of information. These are the `Array` and the `Hash`. Both are used to manage multiple pieces of data, but each serves a specific purpose.

### `Array`
An `Array` is an __ordered__ collection, containing anywhere from zero to many other objects. `Array`s are very powerful because they keep their _elements_ in order. You should use an `Array` if you have a set of data for which the order they appear is important. Create an `Array` by  putting other _objects_ between brackets (`[]`). These _elements_ can be of any type (even other `Array`s). After an `Array` is declared, you have access to a startling number of methods.

`Array`s are _indexed_, which means that each item in the `Array` corresponds to an integer value denoting its place in the array, and that integer is used to access the object within the `Array`. The first object is assigned __0__, and subsequent objects receive incrementing indexing. Access specific objects using the element's index between brackets (`[0]`).

```ruby
[1, "hello", 3.14] # an Array with a Fixnum, String, and Float

# create an array of `Fixnum`s and assign it to the variable fibb
fibb = [1, 2, 3, 5, 8, 13, 21]

# use the `length` method to count the number of elements in an Array
fibb.length
# => 7

# access specific elements using the bracket notation
fibb[0]
# => 1

fibb[2]
# => 3

# the `first` and `last` methods are handy
fibb.first
# => 1

fibb.last
# => 21
```

### `Hash`
The other _object type_ for managing colletions if data is the `Hash`. Every `Hash` is composed of zero to many key/value pairs. This means that every piece of data, called a _value_, in a `Hash` is accessed by referencing its _key_. Most often, these keys are `Symbol`s, but they can also be `String`s or `Fixnum`s.

__Unlike `Array`s, `Hash` objects do not guarantee the order of key/value pairs!__ Create a hash by defining key/value pairs between braces (`{}`). The key comes first and can be declared using either _symbol_ or _hashrocket_ notation. The most recent versions of Ruby prefer _symbol_ notation, but both work. Key/value pairs are separated by a comma.

To access a _value_ in a `Hash`, use bracket notation with the corresponding _key_, like `my_hash[:my_key]`. You can use the same notation to create new keys in the `Hash` as well.

```ruby
jeremy = {
  pets: 2, #symbol notation
  greeting: "Hi!!! ^_^", # symbol notation
  lucky_number: 13, # symbol notation
  7 => "seven", # hashrocket notation
  "eight" => 13, # hashrocket notation
}

# use the length method to count the number of key/value pairs
jeremy.length
# => 5

# access values by giving the associated key between brackets (`[]`)
jeremy[:lucky_number]
# => 13

# `keys` returns an array of all defined keys in the array
# NOTE: THE ORDER IS NOT GUARANTEED
jeremy.keys
# => [:pets, :greeting, :lucky_number, 7, "eight"]

# similarly, `values` returns an array of all the values in the `Hash`
jeremy.values
# => [2, "Hi!!! ^_^", 13, "seven", 13]

# create a new key in the `Hash`
jeremy[:elephant] = "hotdog"

# now the length has changed
jeremy.length
# => 6
```

Look at the Ruby docs for [Array](http://www.ruby-doc.org/core-2.3.0/Array.html) and [Hash](http://www.ruby-doc.org/core-2.3.0/Hash.html) for more details about collections.
