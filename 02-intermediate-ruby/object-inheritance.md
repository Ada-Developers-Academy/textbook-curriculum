# Object Inheritance
## Learning Goals
- Describe objects in terms of _is-a_ relationships
- Use _inheritance_ to indicate a hierarchy of ownership or lineage between classes
- Explore overriding method definitions in _subclasses_
- Use `super` to invoke the behavior of a _base class_ in a _subclass

## Object Inheritance: _is-a_
_Inheritance_ is used to model the behaviors of one class after another. We would want to do this when two objects have a clear relationship. Often the parent class, or _base class_, is more general while the child, or _subclass_, is more specific.

For example, we could have a `Product` class that describes the general behaviors of items in an online store. This is a _base class_ or _superclass_. We could create `Book` and `Video` classes that model more specific behaviors and additional information. A `Book` is very different than a `Video`, but they are both products in the store. It would make sense then, to declare them _subclasses_ of `Product`.

A way to describe this is by using the _is-a_ phrase: a `Book` _is-a_ `Product`. `Video` _is-a_ `Product`. In Ruby, we use the `<` symbol to denote that the class on the left of the `<` symbol is inheriting behaviors from the class on the right side of the `<` symbol:

```ruby
class Product
  attr_reader :id, :name

  def initialize
    @id = 12345
    @name = "Generic Product"
  end

  def about
    return "#{id}:  #{name}"
  end
end

# Book is-a Product
# Book inherits from Product
class Book < Product
end
```

The code above creates an is-a relationship between `Product` and `Book`.  The relationship diagramed below gives any instance of `Book` both `id`,  name and about methods.

![Inheritance Diagram](images/basicInheritance.png)

## Inheriting Methods
So what do we get when we inherit? We get __methods__ and instance variables from the parent class. The  `Product` class has an instance method called `about`. Since all items in the store have an `about` method, our _subclasses_ will _inherit_ this method. So now our `Book` instances will have the `about` method.

```ruby
generic_item = Product.new
generic_item.about #=> "12345: Generic Product"

poodr = Book.new
poodr.about #=> "12345: Generic Product"
```

This is known as _implicit inheritance_ because when we put functionality in the _base class_ (`Product`), then all _subclasses_ (`Book`) will automatically get those behaviors.

## Overriding Methods
What happens when our classes have different functionality for the same idea? We can _override_ methods from _base classes_ in their _subclasses_.

```ruby
class Book < Product
  def about
    return "#{id}: Book"
  end
end

generic_item = Product.new
generic_item.about #=> "12345: Generic Product"

poodr = Book.new
poodr.about # => "12345: Book"
```

In this case, we override the functionality that the _base class_ (`Product`) provides with more specific functionality in the _subclass_ (`Book`).

### Using `super` to invoke behavior in _base classes_.

It's also possible to use the behavior defined in the _base class_ alongside specialized behavior in the _child class_. By using the keyword `super`, we can invoke the code in the _base class_ at any point in the _overriding_ method __and__ still be capable of using overriding code.  In other words the overriding method can do the same action as the parent class **and** more.

```ruby
class AudioBook < Book
  def about
    # super invokes the `about` method on the _base class_ (Book)
    return super + "-Audio"
  end
end

generic_item = Product.new
generic_item.about # => "12345"

audiobook = AudioBook.new
audiobook.about # => "12345: Book-Audio"
```

In this case, we utilize the behavior that the _base class_ (`Book`) provides but augment it with behavior specific to the _subclass_ (`AudioBook`).

![super in method calls](images/super.png)

## Super & Initialize

We've seen how methods by themselves work with methods, what about instance variables?  Instance variables are inherited as well, for example:

```ruby
class Product
  def initialize(id, name)
    @id = id
    @name = name
  end

  def about
    return "#{id}: #{name}"
  end
end

class Book < Product
  attr_reader :author, :isbn

  def initialize(id, title, author, isbn)
    super(id, title)
    @author = author
    @isbn = isbn
  end
end
```

In the above example notice the `super` keyword in the 1st line of the `Book` class' `initialize` method.

In initialize, `super` calls the parent, or superclass' constructor.  So `Product`'s `initialize` method is called and `@id` and `@name` are set to the given parameter.

`super` must be the first line in a subclass' `initialize` method.  If `super` is called without an argument, it will use the parameters from the subclass' `initialize` method.

![Super in initialize ](images/inheritance-super.png)

**Exercise**  With your seatmates create an `Video` class.  A `Video` will have, in addition to an ID number and a name, a director and publisher.  It will also have a method which returns the format of the video (BlueRay, DVD, Streaming).  The `about` method should list the format of the video, the ID and the name. Then create an instance of the `Video` class.

## Summary

Inheritance allows one class to gain or "inherit" the methods and attributes from another class.  This is a key concept in Object Oriented Programming.  Inheritance can be extremely powerful, but it is also easy to misuse.

Inheritance is good to use where one class is clearly an extension or variation of the parent class, so the class gaining methods and attributes **"is-a"** specialized version of the parent class.  Be very selective in your use of inheritance as composition is more often the most effective strategy.

## Resources
- [Understanding Inheritance in Ruby](http://culttt.com/2015/06/24/understanding-inheritance-in-ruby/)
- [Ruby the Hard Way inheritance vs composition](https://learnrubythehardway.org/book/ex44.html)
- [Youtube Video Intro to class inheritance](https://www.youtube.com/watch?v=hrCKyNFSaos)
