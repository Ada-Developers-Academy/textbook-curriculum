# Modules as Namespaces

### Namespacing

*Namespacing* is a way of bundling related objects together.  In ruby we use Modules to group related Classes and methods together.  We do this to avoid naming collisions.  

For example we might create a class called "Shape" in a graphics program, but that name might be used elsewhere in another library.  When you do Shape.new, how is Ruby to know which Shape class to instantiate?  It's a similar idea to putting files into directories.  Files in the same directory cannot have the same name, but files in different directories may.  

In this example below we can create an Array class and put it into a module.  Notice that it does not affect Ruby's default Array class at all

```ruby
module Perimeter
  class Array
    def initialize
      @size = 400
    end
  end
end

our_array = Perimeter::Array.new
ruby_array = Array.new

p our_array.class
p ruby_array.class
```

The two "Array" classes can work alongside each other.  This is because we namespaced our Array class under the Perimeter Module.  

The :: operator looks up objects and classes within a module, in this case we use it to look up the Perimeter Module's Array class.  

Leaving off the module makes us extend the Array class globally which could lead to side-effects if not every part of our program does not expect the new behavior.  

```ruby
class Array
  def initialize
    @size = 400
  end
end

our_array = Array.new

p our_array.class
```

Above were contrived examples, but Namespaces/Modules become important when we include libraries into our code.  Different library authors may use the same names in their code and we want to avoid conflicts.


```ruby
# Class Card
#  def max_value()
#    return @max_value  # returns a value of 13 inclusive.
#  end
require 'blackjack'
playing_card = Card.new
puts playing_card.max_value


# Class Card
# def max_value()
#	return @max			# returns a value of 1000
# end
require 'pokemon'
pokemon_card = Card.new
puts pokemon_card.max_value


```
Because the pokemon gem is loaded after blackjack it overrides blackjack's definition of Card and thus the version of card we end up using is Pokemon's.

We can avoid this by using namespaces.  

```ruby
# Class Card
#  def max_value()
#    return @max_value  # returns a value of 13 inclusive.
#  end
require 'blackjack'
playing_card = Blackjack::Card.new
puts playing_card.max_value


# Class Card
# def max_value()
#	return @max			# returns a value of 1000
# end
require 'pokemon'
pokemon_card = Pokemon::Card.new
puts pokemon_card.max_value
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
        MAX_VALUE = 13
        class Card
          def get_max_value()
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
