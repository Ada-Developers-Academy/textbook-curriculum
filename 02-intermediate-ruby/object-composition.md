# Object Composition
## Learning Goals
- Put a name to something we've been doing: _Composition_
- Learn how to describe relationships between objects in terms of _has-a_, _is-a_, and _acts-like_
- Use _composition_ to bring behavior from one class into another
    + We want _composition_ when `first_class` _has-a_ `second_class`
    + The classic example: `Car` _has-a_ `Wheel`

## _is-a_ vs. _has-a_
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

## Small Note _acts-like_

Another form of _composition_ is described by and _acts-like_ relationship. This relationship leverages Ruby modules to `include` shared behavior in __unrelated classes__. You may find this type of composition referenced online or in books.  We will not use this type of composition in class, but know that `acts-like` is an uncommon type of composition.  
