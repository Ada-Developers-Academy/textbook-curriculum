# Object Inheritance
## Learning Goals
- Describe objects in terms of _is-a_ relationships
- Use _inheritance_ to indicate a hierarchy of ownership or lineage between classes
- Explore overriding method definitions in _subclasses_
- Use `super` to invoke the behavior of a _base class_ in a _subclass 

## Object Inheritance: _is-a_
_Inheritance_ is used to model the behaviors of one class after another. We would want to do this when two objects have a clear chain of ownership. Often the parent class, or _base class_, is more general while the child, or _subclass_, is more specific.

For example, we could have a `Bird` class that describes the general behaviors of birds. This is a _base class_. We could create `Penguin` and `Hawk` classes that model more specific behaviors. A `Penguin` is very different than a `Hawk`, but they are both birds. It would make sense then, to declare them _subclasses_ of `Bird`. 

A way to describe this is by using the _is-a_ phrase: `Penguin` _is-a_ `Bird`. `Hawk` _is-a_ `Bird`. In Ruby, we use the `<` symbol to denote that the class on the left of the `<` symbol is inheriting behaviors from the class on the right side of the `<` symbol:

```ruby
class Bird
  def talk
    "I'm a bird. Kah."
  end
end

# Penguin is-a Bird
# Penguin inherits from Bird
class Penguin < Bird
end
```

## Inheriting Methods
So what do we get when we inherit? We get __methods__. The  `Bird` class has an instance method called `talk`. Since all birds talk, our _subclasses_ will _inherit_ this method. So now our `Penguin` instances will have the talk method.

```ruby
generic_bird = Bird.new
generic_bird.talk #=> "I'm a bird. Kah."

tux = Penguin.new
tux.talk # => "I'm a bird. Kah."
```

This is known as _implicit inheritance_ because when we put functionality in the _base class_ (`Bird`), then all _subclasses_ (`Penguin`) will automatically get those behaviors.

## Overriding Methods
What happens when our classes have different functionality for the same idea? We can _override_ methods from _base classes_ in their _subclasses_.

```ruby
class Penguin < Bird
  def talk
    "I'm a bird. Sqwaaa."
  end
end

generic_bird = Bird.new
generic_bird.talk # => "I'm a bird. Kah."

tux = Penguin.new
tux.talk # => "I'm a bird. Sqwaaa."
```

In this case, we override the functionality that the _base class_ (`Bird`) provides with more specific functionality in the _subclass_ (`Penguin`).

### Using `super` to invoke behavior in _base classes_.

It's also possible to use the behavior defined in the _base class_ alongside specialized behavior in the _child class_. By using the keyword `super`, we can invoke the code in the _base class_ at any point in the _overriding_ method __and__ still be capable of using overriding code.

```ruby
class Hawk < Bird
  def talk
    # super invokes the `talk` method on the _base class_ (Bird)
    super + " *soars*"
  end
end

generic_bird = Bird.new
generic_bird.talk # => "I'm a bird. Kah."

hawk = Hawk.new
hawk.talk # => "I'm a bird. Kah. *soars*"
```

In this case, we utilize the behavior that the _base class_ (`Bird`) provides but augment it with behavior specific to the _subclass_ (`Hawk`).
