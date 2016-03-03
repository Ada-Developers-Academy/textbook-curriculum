# Object Composition
## Learning Goals
- Put a name to something we've been doing: _Composition_
- Learn how to describe relationships between objects in terms of _has-a_, _is-a_, and _acts-like_
- Use _composition_ to bring behavior from one class into another
    + We want _composition_ when `first_class` _has-a_ `second_class`
    + The classic example: `Car` _has-a_ `Wheel`

## _is-a_ vs. _has-a_ vs. _acts-like_
From __Learn Ruby The Hard Way__:
  > You use the phrase _is-a_ when you talk about objects and classes being related to each other by a class relationship. You use _has-a_ when you talk about objects and classes that are related only because they __reference__ each other.

We will discuss _is-a_ relationships in the next lecture. For now, let's say that we have a way to express that one class will _inherit_ behaviors from another, like a `Duck` class inheriting the behaviors from a `Bird` class. We could say `Duck` _is-a_ `Bird`. Right now, I want to focus on _has-a_ relationships.

## Object Composition: _has-a_
_Composition_ is the concept that a class can be _composed_ of other classes as parts, much like how a car has wheels. What we've done so far with relationships between classes (think `Account` and `Owner`, `SolarSystem` and `Planet`) has been _composition_, we've just never labeled it as such.

A way to describe this is by using the _has-a_ phrase: i.e. `Car` has a `Wheel`, `SolarSystem` has many `Planet`s.


```ruby
class Developer
  attr_accessor :name
  def initialize(name)
    @name = name
    @code = Code.new
  end

  def code
    @code.make_bugs
  end
end

class Code
  def make_bugs
    "typey typey typey ERROR"
  end
end

```

In the example above, `Developer` _has-a_ `Code`. Each has its own data and behaviors. Telling an instance of `Developer` to `code` invokes the `make_bugs` method on an instance of `Code`. `Developer` has a behavior (`code`) that is _encapsulated_ by the `Code` class. Maybe a `Developer` can `code` without `make_bugs` happening, but we haven't taught it how yet.

## Object Composition: _acts-like_
Another form of _composition_ is described by and _acts-like_ relationship. This relationship leverages Ruby modules to `include` shared behavior in __unrelated classes__. That is, when the relationship between two or more Ruby classes is that they both _act like_ a certain thing, you want this form of composition.

This is something of an advanced technique, so we won't spend much time here. _Object Composition_ in this form leverages modules in a way we haven't seen. We organize methods into a `module`, and then bring the `module` into the Ruby classes that need to model the shared behavior. We use `include` to _compose_ instance methods into a class, and `extend` to _compose_ class methods into a class. Whew. Too many words. Here's code:

```ruby
module Sleeper # this is the collection of shared behavior
  def snooze(hours) # note this is a method not attached to a class
    "zzz" * hours
  end
end

class Human
  include Sleeper
end

class Dog
  include Sleeper
end

class Computer
  include Sleeper
end

jeremy = Human.new
rosa = Dog.new
iridium = Computer.new

# everybody knows how to snooze!!!!
jeremy.snooze(1) => "zzz"
rosa.snooze(2) => "zzzzzz"
iridium.snooze(5) => "zzzzzzzzzzzzzzz"
```

This is a powerful technique that isn't appropriate to every situation. Be aware that it exists, but recognize that in many parts of the Ruby world, including where we will be spending lots of our time, _composition_ using `modules` is uncommon.
