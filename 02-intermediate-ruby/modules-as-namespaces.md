# Modules as Namespaces

## Learning Goals
By the end of this lesson, students should be able to

- Read and write code using Ruby _modules_
- Use modules to group classes and methods into _namespaces_

## Modules

Modules are a way to group together related ideas. They're like classes that can't be instantiated, making them a good choice if you need to tie together some methods that don't have any associated state.

We've seen a module before: `Math`. It doesn't makes sense to have an instance of `Math`, it's just a collection of related methods and constants.

```ruby
# No instances required!
Math::PI
# => 3.141592653589793
Math.sqrt(25)
# => 5.0
Math.cos(Math::PI / 4)
# => 0.7071067811865476
```

### Syntax

#### Defining a Module

Defining a module is very similar to defining a class, except they use Ruby's `module` keyword.

```ruby
module ModuleName
  # Define a constant
  CONSTANT_NAME = 4

  # Define a method
  def method_name
    # ...
  end

  # Define a class
  class ClassName
    def initialize(a, b)
      # ...
    end

    def instance_method
      # ...
    end
  end
end
```

#### Using a Module

Modules can contain constants, methods, classes and even other modules. The syntax for accessing something is a module is very similar to accessing something in a class.
- Constants, classes and other modules are accessed with `::`
    - `ModuleName::ClassName`
    - `Math::PI`
- Methods are accessed with `.`
    - `ModuleName.method_name`
    - `Math.sqrt(25)`

## Namespacing

*Namespacing* is a way of bundling related objects together. In ruby we use Modules to group related Classes and methods together. We do this to avoid naming collisions.

For example, imagine we're building an inventory management system for an arts and crafts store. We might want a class called `String`, but that name is already taken by one of Ruby's built-in classes.  When you do `String.new`, how is Ruby to know which `String` class to instantiate? The solution is to put our class in a module.

It's a similar idea to putting files into directories.  Files in the same directory cannot have the same name, but files in different directories may.

```ruby
module Inventory
  class String
    def initialize(color, quantity)
      @color = color
      @quantity = quantity
    end
  end
end

our_string = Inventory::String.new("green", 100)
ruby_string = String.new("ruby string")

puts our_string.class
puts ruby_string.class
```

The two `String` classes can work alongside each other.  This is because we _namespaced_ our `String` class under the `Inventory` Module.

The `::` operator looks up objects and classes within a module, in this case we use it to look up the `Inventory` Module's `String` class.

Leaving off the module makes us extend the `String` class globally which could lead to side-effects if not every part of our program does not expect the new behavior.

```ruby
class String
  def initialize(color, quantity)
    @color = color
    @quantity = quantity
  end
end

our_string = String.new("Ruby string")
# ArgumentError: wrong number of arguments (given 1, expected 2)
# from (pry):2:in `initialize'
```

## Example: Card Games

Namespaces/Modules become especially important when we include libraries into our code.  Different library authors may use the same names in their code and we want to avoid conflicts.

```ruby
# blackjack.rb
class Card
  def max_value
    return 11   # Aces are worth 11
  end
end
```

```ruby
# canasta.rb
class Card
  def max_value
    return 50   # Jokers are worth 50 points!
  end
end
```

```ruby
# main.rb
require_relative 'blackjack'
require_relative 'canasta'

blackjack_card = Card.new
puts blackjack_card.max_value # => 50 (uh oh!)

canasta_card = Card.new
puts canasta_card.max_value   # => 50

```

Because the canasta gem is loaded after blackjack it overrides blackjack's definition of Card and thus the version of card we end up using is canasta's.

We can avoid this by using namespaces.

```ruby
# blackjack.rb
module Blackjack
  class Card
    def max_value
      return 11   # Aces are worth 11
    end
  end
end
```

```ruby
# canasta.rb
module Canasta
  class Card
    def max_value
      return 50   # Jokers are worth 50 points!
    end
  end
end
```

```ruby
# main.rb
require_relative 'blackjack'
require_relative 'canasta'

blackjack_card = Blackjack::Card.new
puts blackjack_card.max_value # => 11

canasta_card = Canasta::Card.new
puts canasta_card.max_value   # => 50
```

Whenever you create a library, it's best-practice to namespace it with the name of your library or project.

### Constant Lookup

The :: operator is called the Constant Lookup Operator.  Like the name suggests you can use it to look up Constants as well.

```ruby
# BlackjackSample.rb

module Blackjack
  MAX_SCORE = 21
  module Player
    MAX_PLAYERS = 2
    class Player
      def initialize
      end
    end
  end
  module Card
    MAX_VALUE = 11
    class Card
      def get_max_value
        return MAX_VALUE
      end
    end
  end
end

MAX_SCORE = 50
MAX_PLAYERS = 4
MAX_VALUE = 21

puts "MAX_SCORE - #{MAX_SCORE}"
puts "Blackjack::MAX_SCORE - #{Blackjack::MAX_SCORE}"

puts

puts "MAX_Players - #{MAX_PLAYERS}"
puts "Blackjack::Player::MAX_Players - #{Blackjack::Player::MAX_PLAYERS}"

puts

puts "MAX_VALUE - #{MAX_VALUE}"
puts "Blackjack::Card::get_max_value -  #{Blackjack::Card::Card.new().get_max_value()}"
```


There are a few things going on the example above:


*	Constant MAX_SCORE is scoped within Blackjack and works expected.
*	Same for constant MAX_PLAYERS which is nested inside the Player module.
*	The Card class is scoped within the Card Module and has a method returning the MAX_VALUE within the same module (same scope).

So we can nest constant lookup as deeply as we need to, similar to how we can nest hashes inside hashes as deeply as we need to.

Using modules and namespacing is the standard way of organizing libraries with Ruby. It's a good practice to keep this in mind while writing one.


This was adapted from [RubyMonk's primer](https://rubymonk.com/learning/books/1-ruby-primer/chapters/35-modules/lessons/80-modules-as-namespaces).
