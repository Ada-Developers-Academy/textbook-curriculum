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
### Constructors (`initialize`) & Instance Variables
The `initialize` method within a class is special. When the `new` method is called on a _class_ a new _instance_ is created and the `initialize` method is promptly invoked. This method is used to create the default state of an _object instance_.

Typically within a `initialize` method we set any given attributes and make any necessary data manipulations. We hold on to these values in _instance variables_.

```ruby
class Planet
  attr_reader :name, :moons

  def initialize(name, moons)
    @name  = name.capitalize
    @moons = moons
  end

  def get_info
    "I am a planet whose name is #{ @name } and has #{ @moons }."
  end
end
```

### Instance Methods
Instance methods are defined with `def a_snake_case_name`. Instance methods are only available on _instances_ of a class. **These are exactly the type of Ruby method we've seen thus far**.

```ruby
class Order
  def initialize(subtotal, quantity) # <= instance method
    @subtotal = subtotal
    @quantity = quantity
  end

  def total # <= instance method
    @subtotal * @quantity
  end

  def to_money # <= instance method
    # in the line below, `total` is invoking the instance method above
    "$" + sprintf("%0.02f", total / 100)
  end
end
```

```ruby
order = Order.new(1000, 2)
order.to_money #=> $20.00
```

### Attributes
The methods `attr_reader`, `attr_writer`, and `attr_accessor` create _getter_ and _setter_ methods in our Ruby classes. Ruby provides a couple of methods to help us get and set these instance variables. All three define one or more methods to get (`attr_reader`), set (`attr_writer`), or both get and set (`attr_accessor`) an instance variable.

```ruby
# Using attr_accessor
class Coordinate
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end
```
```ruby
point = Coordinate.new(10, 15)
point.x += 5 #=> Move this coordinate along the x-axis 5 units
puts point.y #=> Print this coordinates y-axis
```

### Review Summary
When we review each of these pieces of code that we've written there is one major thing in common. We are always creating an **instance** of our class prior to _calling_ any of the methods we create.

The reason we do this is that the types of methods we've been using always have some sort of specific data that is related to each individual instance of the object we are using. For the `Planet`'s `get_info` method, we were showing the data about a **specific** Planet.

But what if we have things that related to **all** Planets? Or setting up a bunch of Planets? Stay tuned...!

## Class Methods & `self`

Class methods are methods that are called on a **class** and instance methods are methods that are called on an **instance of a class**.

### Let's Try It

With no specific problem in mind to start, let's see what the difference is in the **class definition**:
```ruby
class TryingThisOut
  def self.cool
    "This is a CLASS METHOD"
  end

  def rad
    "This is an INSTANCE METHOD"
  end
end
```

**Class methods** are _defined_ like **instance methods**, but they start with `self.` and are called internally with the `self` identifier.

Class methods are called directly by the _class_ and not by an _instance_ of the class.
```ruby
puts TryingThisOut.cool
# will output 'This is a CLASS METHOD'

test = TryingThisOut.new
puts test.rad
# will output 'This is an INSTANCE METHOD'
```

### Adding in Context

Now that we see the syntax for how we'd use a **class method** versus an **instance method** let's see why we'd want to use one over the other.


#### Revisit our `Penguin`
Let's think back to the `Penguin` class we created from homework previously.
```ruby
class Penguin
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def looks
    return "Fuzzy!"
  end
end
```
```ruby
p = Penguin.new("Gerri")
puts p.name
puts p.looks
```

Which piece of this class will always be the same for **every instance** of the class?

#### Activity
Rewrite the `Penguin` class to convert the `looks` method to be a **class method** instead of an **instance method**.

Think about other functionality you could add to your `Penguin` class. Can you think of one **instance method** and one **class method** that you might add?

#### Summary

Once we convert the `looks` method to a **class method** we should have something like:
```ruby
class Penguin
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.looks
    return "Fuzzy!"
  end
end
```
The really interesting difference comes in how we'll now call the `looks` method:
```ruby
p = Penguin.new("Gerri")
puts p.name
puts Penguin.looks
# OR
puts p.class.looks
```

In the second `puts` statement from above, we are utilizing the `class` on our instance to then call the **class method** because `p.class` will give us `Penguin`.

### Another Example
```ruby
class Pawn
  def initialize(position)
    @position = position
  end

  # This is the class method, it starts with self.
  # It is only called on the class directly Pawn.make_row
  def self.make_row(side)
    if side == "white"
      num = 2
    else
      num = 7
    end

    pawns = []
    ("a".."h").each do |letter|
      pawns << self.new("#{letter}#{num}")
    end

    pawns
  end
end

#make one pawn
one_pawn = Pawn.new("A2")

#make a whole row of pawns
pawns = Pawn.make_row("black")
pawns.length # => 8
```

## Additional Resources
- [Some Additional Examples](https://www.jimmycuadra.com/posts/self-in-ruby/)
- [Few More Examples](https://hackhands.com/three-golden-rules-understand-self-ruby/)
- [Even more uses of `self` than you'll need right now](http://blog.honeybadger.io/ruby-self-cheat-sheet/)
