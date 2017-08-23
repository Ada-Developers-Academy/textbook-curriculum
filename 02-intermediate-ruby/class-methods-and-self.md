# Class Methods & Self
## Learning Goals
- Review what we've learned about classes so far:
  - Constructor (`initialize`)
  - Instance Methods
  - Attributes (stored in instance variables)
- Discover new functionality within classes:
  - _Class Methods_ and
  - _self_
- Examine why we'd use one type of method over another

## Ruby Classes Thus Far

### Constructors (`initialize`), Instance Variables and Helper Methods

The `initialize` method within a class is special. When the `new` method is called on a _class_ a new _instance_ is created and the `initialize` method is promptly invoked. This method is used to create the default state of an _object instance_.

Typically within a `initialize` method we set any given attributes and make any necessary data manipulations. We hold on to these values in _instance variables_.

By default, instance variables are only visible inside their object. To make them readable or writable from the outside, use one of the _helper methods_ `attr_reader`, `attr_writer` or `attr_accessor`.

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
Instance methods are defined with `def a_snake_case_name`. Instance methods are only available on _instances_ of a class. **These are exactly the type of Ruby method we've seen thus far**.

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
    # ... load the song data from the file and send it to the speakers ...
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

#### Talking About Instance Methods

When Rubyists write English text about a class's instance methods, we typically write their names in the following format:

```
ClassName#method_name
```

The octothorp indicates that the method is an instance method. In the case of our `Song` class, we have `Song#play` and `Song#summary`. Note that we leave off the arguments - only the class and the method name are included.

### Review Summary

When we review each of these pieces of code that we've written there is one major thing in common. We are always creating an **instance** of our class prior to _calling_ any of the methods we create.

The reason we do this is that the types of methods we've been using always have some sort of specific data that is related to each individual instance of the object we are using. For the `Song`'s `summary` method, we were showing the data about a **specific** `Song`.

But what if we have things that related to **all** `Song`s? Or setting up a bunch of `Song`s? Stay tuned...!

## Class Methods and `self`

Class methods are methods that are called on a **class** and instance methods are methods that are called on an **instance of a class**.

### Class Method Syntax

With no specific problem in mind to start, let's see what the difference is in the **class definition**:

```ruby
class ClassName
  def self.class_method
    "This is a CLASS METHOD"
  end

  def instance_method
    "This is an INSTANCE METHOD"
  end
end
```

**Class methods** are _defined_ like **instance methods**, but they start with `self.` and are called internally with the `self` identifier.

Class methods are called directly on the _class_ and not on an _instance_ of the class.

```ruby
puts ClassName.class_method
# 'This is a CLASS METHOD'

instance = ClassName.new
puts instance.instance_method
# 'This is an INSTANCE METHOD'
```

We've already seen one class method: `new`. `new` is a built-in Ruby method defined on all objects, which builds an instance of that class, calls its `initialize` method, and returns it.

When writing about a class method, we use a dot instead of a pound sign: `ClassName.class_method`. Note that this matches the way the method is called.

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
