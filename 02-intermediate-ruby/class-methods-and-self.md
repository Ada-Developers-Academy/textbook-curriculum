# Class Methods & Self

## Learning Goals

- Review what we've learned about classes so far:
  - Constructor (`initialize`)
  - Attributes (stored in instance variables)
  - Instance Methods
- Discover new functionality within classes:
  - _Class Methods_
  - `self`
  - Class variables
- Examine why we'd use one type of method over another

## Introduction

The examples we will use in class today will assume we are writing software for a music player that plays audio tracks based off files on your computer, and keeps track of how many times each audio track has been played.

## Ruby Classes Thus Far

### Constructors (`initialize`), Instance Variables, and Instance Methods

The `initialize` method within a class is special. When the `new` method is called on a _class_ a new _instance_ is created and the `initialize` method is promptly invoked. This method is used to create the default state of an _object instance_.

Within the `initialize` method, we do any setup that should happen at the beginning of creating any instance of a class:

  1. make any necessary data manipulations
  1. set any given attributes in _instance variables_.

By default, instance variables are only visible inside their object. Within the class definition, we refer to and access the values of instance variables using the `@variable_name` syntax.

Outside of the class definition, code that wants to read or write those instance variables must use one of the _helper methods_ `attr_reader`, `attr_writer` or `attr_accessor` (which are shortcuts for _getter_ and _setter_ methods).

Here is a class that might represent a song in a music player program:

```ruby
class Song
  attr_reader :title, :artist, :filename, :play_count

  def initialize(title, artist, filename)
    @title = title
    @artist = artist
    @filename = filename
    @play_count = 0
  end
end
```

```ruby
song = Song.new("Respect", "Aretha Franklin", "songs/respect.mp3")
song.title
# => "Respect"
```

### Instance Methods

Instance methods are defined with `def a_snake_case_name`. Instance methods are invoked on _instances_ of a class. **These are exactly the type of Ruby method we've seen thus far**.

Here is an expanded version of our `Song` class, now with a couple of instance methods.

```ruby
class Song
  attr_reader :title, :artist, :filename, :play_count

  def initialize(title, artist, filename)
    @title = title
    @artist = artist
    @filename = filename
    @play_count = 0
  end

  def summary
    return "#{@title}, by #{@artist}"
  end

  def play
    @play_count += 1
    # ... more code that loads the song data from the file and sends it to the speakers ...
  end
end
```

```ruby
song = Song.new("Respect", "Aretha Franklin", "songs/respect.mp3")
puts song.summary
# => Respect, by Aretha Franklin
song.play
# 🎶 R-E-S-P-E-C-T 🎶
song.play_count
# => 1
```

#### Assess

With this code above, identify which parts of the following code are:

1. instance variables
1. instance methods
1. creating an instance of a class
1. invoking/calling an instance method on an instance of a class

<details>
    <summary>
    Answers
    </summary>
    1. `@title`, `@artist`, `@filename`, `@play_count`
    1. `summary`, `play`. `attr_reader` technically defines more instance methods, too! So, additionally: `title`, `artist`, `filename`, `play_count`
    1. `Song.new("Respect", "Aretha Franklin", "songs/respect.mp3")`
    1. `song.summary`, `song.play`, `song.play_count`
</details>

#### Instance Methods in Documentation

When Rubyists write English text about a class's instance methods in documentation, we typically write their names in the following format:

```
ClassName#method_name
```

The octothorp indicates that the method is an instance method. In the case of our `Song` class, we have `Song#play` and `Song#summary`. Note that we leave off the arguments - only the class and the method name are included.

### Review Summary

When we review each of these pieces of code that we've written there is one major thing in common: we are always creating an **instance** of our class prior to _calling_ any of its instance methods.

This is because all of the methods we use are always relying on specific data that is related to each individual instance of the object we are using. For the `Song`'s `summary` method, we were showing the data about a **specific** `Song`. If we had 500 different instances of `Song`, it would probably be true that each instance of `Song` had a different result for the `summary` method, even though they are all `Song` instances with the same implementation. The instance method `summary` used an instance variable within it.

There are times in which we'll make methods that are related to the concept of `Song`, but are not related to a specific instance of a `Song`.

  - What if we have things that related to **all** `Song`s?
  - What if we want `Song`-specific code used to set up a bunch of `Song`s, and not just one `Song`?

## Class Methods and `self`

Instance methods are methods that are called on an instance of a class. **_Class methods_ are methods that _are called on a class_**.

### Why?

Class methods provide functionality to a class itself. We may soon need to implement features that belong to the class, but don't belong to a single instance of the class. Let's look at the syntax

### Syntax to Use Class Methods

Class methods are called directly on the _class_ and not on an _instance_ of the class. Assuming that there is a class named `ClassName` and a class method named `class_method`...

```ruby
puts ClassName.class_method
# 'This is a CLASS METHOD'
```

Compare this to our syntax of calling an instance method.

```ruby
instance = ClassName.new
puts instance.instance_method
# 'This is an INSTANCE METHOD'
```

We've already seen many different class methods!

`new` is probably the class method we're most familiar with. If you haven't noticed before, take the time to notice that we always call `.new` off of the name of the class we're instantiating. That's because `new` is a class method! `new` is a built-in Ruby method defined on all objects, which builds an instance of that class, calls its `initialize` method, and returns that instance. It is a class method because it doesn't make sense to operate off of an instance of a class... initializing an instance of a class is the functionality of a class as a whole!

Another class method we might have seen before is `Random.rand` to generate a random number. `Random` is a class that doesn't particularly necessitate an _instance_ of a Thing that is Random, but it _is_ a class that has a feature available to the concept of Random.

When writing about a class method, we use a dot instead of a pound sign: `ClassName.class_method`. Note that this matches the way the method is called.

### Syntax to Define Class Methods

Let's see how to define a class method within a **class definition**:

```ruby
class ClassName
  def self.class_method
    return "This is a CLASS METHOD"
  end

  def instance_method
    return "This is an INSTANCE METHOD"
  end
end
```

**Class methods** are _defined_ like **instance methods**, but they start with `self.`

**Check:** What's the syntax to call the class method? What's the syntax to call the instance method?

#### Usage of Class Methods Within the Class

Class methods are called internally with the `self.class` identifier or the name of the class identifier.

```ruby
class ClassName
  def self.class_method
    return "This is a CLASS METHOD"
  end

  def instance_method
    return "This is an INSTANCE METHOD... and I'm calling the class method with syntax 1: #{self.class.class_method}, and syntax 2: #{ClassName.class_method}"
  end
end
```

### Class Variables
- Class variables begin with `@@`
- Class variables are available to the entire class (in any method)
- Class variables will raise an error if they are read before they're created
- Class variables can cause problems later (**avoid using them**)
- Class variables are sometimes used for application configuration

```ruby
class Library
  attr_reader :library_name
  @@tagline = "Welcome to all of the libraries:"

  def initialize(name)
    @library_name = name
    @@tagline = @@tagline + " " + @library_name
  end

  def tagline
    puts @@tagline
  end

end

woodland_library = Library.new("Woodland Library")
woodland_library.tagline
northview_library = Library.new("Northview Library")
northview_library.tagline

woodland_library.tagline
```

This code outputs the following:
```
Welcome to all of the libraries: Woodland Library
Welcome to all of the libraries: Woodland Library Northview Library
Welcome to all of the libraries: Woodland Library Northview Library
```

Here, we observe that all `Library`s can access and change the same `@@tagline` variable. This is useful in some cases, but can be confusing and obscure in most cases.

In general, we will discourage the use of class variables because of their usually unintended side-effects.

### Adding Class Methods to `Song`

Now that we see the syntax for how we'd use a **class method** versus an **instance method** let's see why we'd want to use one over the other.

Let's think back to the `Song` class we created earlier. We'll start with tracking the total number of plays across all songs. For this we'll need to add a _class variable_, `@@total_plays`, as well as a method to read its value, `Song.total_plays`.

```ruby
class Song
  attr_reader :title, :artist, :filename, :play_count

  # Initialize our total play count
  # This will be set to 0 when the program is loaded
  @@total_plays = 0

  def initialize(title, artist, filename)
    @title = title
    @artist = artist
    @filename = filename
    @play_count = 0
  end

  def summary
    return "#{@title}, by #{@artist}"
  end

  def play
    @play_count += 1
    @@total_plays += 1
    # ... load the song data from the file and send it to the speakers ...
  end

  # Define a class method to access the class variable
  def self.total_plays
    return @@total_plays
  end
end
```

```ruby
# No instances required!
puts Song.total_plays
# => 0

respect = Song.new("Respect", "Aretha Franklin", "songs/respect.mp3")
moonlight = Song.new("What a Little Moonlight Can Do", "Billie Holiday", "songs/moonlight.mp3")

3.times do
  respect.play
end

5.times do
  moonlight.play
end

puts "#{respect.title}: #{respect.play_count} plays"
puts "#{moonlight.title}: #{moonlight.play_count} plays"
puts "total: #{Song.total_plays} plays"
# Respect: 3 plays
# What a Little Moonlight Can Do: 5 plays
# total: 8 plays
```

All that `total_plays` does is return the value of `@@total_plays`. If `@@total_plays` were an instance method, we would use the `attr_reader` helper method to accomplish the same thing. Unfortunately there's no equivalent to `attr_reader` for class variables, so we have to do the work ourselves.

#### Questions
- Consider the class variable `@@total_plays`
  - Where is `@@total_plays` initialized?
  - How would our program change if we did not initialize this variable?
  - How would our program change if we initialized this variable in the `initialize` method?
- Why is `total_plays` a class method? How would our program change if it was an instance method?

### Activity: `Song.most_played`

In the previous example, we used a class method to access a class variable. Another common use of a class method is to work with a collection of instances of that class.

For example, what if we wanted a method that, given an array of `Song`s, picks the one with the most plays? Since the argument is a collection of `Song`s, it doesn't make sense to require the method to be called on one particular instance. In this case, a class method is a good choice.

Work with a partner to implement `Song.most_played`. As you write the method, think about how you would test it - what interesting inputs can you imagine?

Once you've come up with an version you're happy with, [you can see ours here](https://gist.github.com/droberts-ada/8f3e70aa8dd05450f8c8b41692e206fc).

### Another Example

Another common use of a class method is as a _factory_, that is a method that builds an instance or instances of that class. This is a powerful technique, and we'll explore it more in this week's project.

As an example, imagine a computer chess game that has a class representing a pawn. When the game begins, each side has 8 pawns, so this class includes a method that builds each piece and gives it the correct position on the board.

```ruby
class Pawn
  def initialize(position)
    @position = position
  end

  # This is the class method, it starts with self.
  # It is only called on the class directly Pawn.make_row
  def self.make_row(side)
    if side == :white
      num = 2
    else
      num = 7
    end

    pawns = []
    ("a".."h").each do |letter|
      # Here we call the new method of the current class
      pawns << self.new("#{letter}#{num}")
    end

    return pawns
  end
end

#make one pawn
one_pawn = Pawn.new("A2")

#make a whole row of pawns
pawns = Pawn.make_row(:black)
pawns.length # => 8
```

## Additional Resources
- [Some Additional Examples](https://www.jimmycuadra.com/posts/self-in-ruby/)
- [Few More Examples](https://hackhands.com/three-golden-rules-understand-self-ruby/)
- [Even more uses of `self` than you'll need right now](http://blog.honeybadger.io/ruby-self-cheat-sheet/)
