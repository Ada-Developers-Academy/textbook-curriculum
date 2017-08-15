# Literals
## Learning Goals
- Learn what _Literals_ are and how to use them
- Review _objects_ and _object types_
- Learn a little about _class objects_ and _object instances_

_Literals_ are special syntax to create _objects_. They do a lot of the magic that makes Ruby very readable. There are many different _literals_, but we're going to focus on the most common. You're likely to see these in code often.

## Objects: Classes & Instances
We've learned about _object types_ in previous discussions. Every _value_ in Ruby represents one of these _types_.

Put more specifically, every individual _object_ in Ruby is an _instance_ of a specific _type_. `String` is a very specific kind of object called a `class`. We will learn the specifics of `class` objects in upcoming lectures. For now, we should think of them as an _object_ that describes the behavior and properties of a _type_. We know that both `"tacos"` and `"nachos"` have a `.length` method because they are both derived from the `String` _class_.

Put another way, we can say that `"tacos"` and `"nachos"` are both _instances_ of the `String` _class_. By having a _class_, we can guarantee that _objects_ of the same _type_ have the same behaviors and methods available to them.

## Enter Literals
For most _class objects_ in Ruby, we create a new _instance_ by invoking the `.new` method. Like this:

```ruby
String.new # => ""
```

But that isn't how we've created `String` objects so far. We've simply written `"tacos"` when we wanted a `String`. Those two double-quotes are _literals_--syntactic sugar that makes our code a little sweeter. Behind the scenes, Ruby is indeed initializing a `String` _object_ from the `String` _class_. But it would be obnoxious and ugly if we had to type `String.new` everytime we wanted to use a string.

__A literal, in terms of data declaration, is when the input value (the code you type) is exactly equal to the output value (how that value is printed).__

### Here are some literals we've used already
```ruby
String.new # => new empty string, not a literal
"" # => new empty String, totes a literal.
'' # => new empty String that doesn't interpolate

Array.new # => new empty array, not a literal
[] # => new empty array
[:elephant, :hotdog] # => new array with two values

Hash.new # => new empty hash, not a literal
{} # => new empty hash, totes a literal
{ elephant: :hotdog } # => new hash with one key/value pair

:word # => new Symbol. Literal

123 # => new Integer, also a literal
```

### More Literals!
There are a many more literals. For a complete list see this [guide](http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Literals). Here's a few that we will end up using pretty often:

```ruby
# floats
123456.789
2.2

# string backslash notation
"tacos\nare\nawesome"
"tacos\tare\tawesome"

# string % notation
# little dubs doesn't interpolate
%w(tacos are awesome)

# big dubs interpolates before assembling the array
x = "awesome"
%W(tacos are #{x})

# x "shells" out to the console; it runs the command in the same shell where ruby is running
%x{say tacos are awesome}
`say tacos are awesome`
puts %x{ls -lah .}
puts `du -hs`

# here documents - used to create large blocks of text in a `String`
are_tacos_awesome = <<YES

I mean, how can we even be having this conversation? We're friends and all,
but if we can't get on the same taco page, I might have to rethink our plans
to go snorkling next week. Snorkling plus tacos 4eva, amirite?

YES

puts are_tacos_awesome
```
