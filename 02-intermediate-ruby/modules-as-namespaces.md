# Modules as Namespaces

## Learning Goals
By the end of this lesson, students should be able to

- Read and write code using Ruby _modules_
- Use modules to group classes and methods into _namespaces_

## Modules

Modules are a way to group together related ideas. They're like classes that can't be instantiated, making them a good choice if you need to tie together some methods that don't have any associated state.

We've seen a module before: `Math`. The designers of Ruby decided to make `Math` a module rather than a class because it is a collection of related methods and constants, without any state to keep track of.

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

Defining a module is very similar to defining a class, except they use Ruby's `module` keyword. Modules can contain constants, methods, classes and even other modules. All of these are optional - you could have a Module with only constants, for example.

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

The syntax for accessing something is a module is very similar to accessing something in a class.
- Constants, classes and other modules are accessed with `::`
    - `ModuleName::ClassName`
    - `Math::PI`
- Methods are accessed with `.`
    - `ModuleName.method_name`
    - `Math.sqrt(25)`

For code within a module, you do not need to include the module name.

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

## Additional Resources

- [RubyMonk: Modules as Namespaces](https://rubymonk.com/learning/books/1-ruby-primer/chapters/35-modules/lessons/80-modules-as-namespaces).
- [Pragmatic Programmer's Guide: Modules](http://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html)
