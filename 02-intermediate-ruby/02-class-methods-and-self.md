# Class Methods & Self
## Learning Goals
- Review what we've learned about classes so far:
  - Constructor (`initialize`)
  - Instance Methods
  - Attributes (stored in instance variables)
- Discover new functionality within classes:
  - _Class Methods_ and
  - _self_

## Ruby Classes Thus Far
### Constructors (`initialize`) & Instance Variables
The `initialize` method within a class is special. When the `new` method is called on a _class_ a new _instance_ is created and the `initialize` method is promptly invoked. This method is used to create the default state of an _object instance_.

Typically within a `initialize` method we set any given attributes and make any necessary data manipulations. We hold on to these values in _instance variables_.

```ruby
class Product
  def initialize(name, price)
    @name  = name.capitalize
    @price = price
    activate!
  end

  def activate!
    # pretend there's some logic here that may conditionally activate a product
    @status = :for_sale
  end
end
```

### Instance Methods
Instance methods are defined with `def a_snake_case_name`. Instance methods are only available on _instances_ of a class. These are the only kind of Ruby method we've seen thus far.

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

order = Order.new(1000, 2)
order.to_money #=> $20.00
```

### Attributes
The methods `attr_reader`, `attr_writer`, and `attr_accessor` create _getter_ and _setter_ methods in our Ruby classes. Ruby provides a couple of methods to help us get and set these instance variables. All three define one or methods methods to get (`attr_reader`), set (`attr_writer`), or both get and set (`attr_accessor`) an instance variable.

```ruby
# Without attr_accessor :(
class Coordinate
  def x
    @x
  end

  def x=(new_x)
    @x = new_x
  end

  def y
    @y
  end

  def y=(new_y)
    @y = new_y
  end
end

# With attr_accessor :)
class Coordinate
  attr_accessor :x, :y
end
```

## Class Methods & `self`
Class methods are defined like instance methods, but they start with `def self.make_row` and are called internally with the `self` identifier.

Class methods are called directly by the _class_ and not by an _instance_ of the class.

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
