# Inheritance Idioms

## Learning Goals

By the end of this lesson, students should be able to...

- Define the following terms
  - Abstract class
  - Template method
  - Polymorphism
- Write code that extends an _abstract class_
- Identify and implement _template methods_
- Take advantage of _polymorphism_

## Introduction

There are many common patterns around how inheritance is used in real software projects that are worth studying explicitly. Today we will discuss three of these: _abstract classes_ and _template methods_, and _polymorphism_.

### What is an Idiom?

In the context of software, the word "idiom" means much the same thing as in regular English:

> Idiom: A style or form of artistic expression that is characteristic of an individual, a period or movement, or a medium or instrument<br>
> -- <cite>[Miriam Webster](https://www.merriam-webster.com/dictionary/idiom)</cite>

In essence, a software idiom is a pattern or style of programming that is commonly used, but which isn't necessarily obvious from the syntax of the language.

For an example of an idiom that doesn't involve inheritance, consider the `map` method. Originally most programming languages did not contain a method named `map` - if you wanted to do that work, you would have to write it yourself:

```ruby
# Map without map
original = [1, 2, 3]
result = []

original.each do |item|
  result << 2 * item
end
```

Over the years programmers repeated this pattern over and over, to the point that "mapping" was a thing you could do without thinking about it. If you were to say something like "map this to that", people would know what you were talking about, even though there was nothing in the programming language called `map`. At this point, `map` had become an idiom.

If an idiom becomes common enough, language designers will take note and include formal support for that pattern in their languages. The language LISP included something similar to `map` as far back as 1959, but most mainstream languages did not support `map` officially until between 2005 and 2010.

The two idioms we will discuss today do not have language support in Ruby (though they do in other languages), but they are no less important for that.

### Abstract Classes

Again, let us begin with a definition:

> Abstract: disassociated from any specific instance<br>
> -- <cite>[Miriam Webster](https://www.merriam-webster.com/dictionary/abstract)</cite>

**An _abstract class_ is a class that is never instantiated**. Instead, it serves as the parent class for some number of child classes, which are instantiated.

**Question:** What abstract classes have we seen so far?

<details>
<summary>Click for the answer</summary>
Object, CsvRecord from the project
</details>

Returning to our example from [the previous lesson](object-inheritance.md), `Property` would be a good candidate for an abstract class. Instead of creating a generic `Property`, it would make more sense to always create an `Apartment`, `Condo`, or `House`.

In real-world software projects, abstract parent classes are very common when using a framework like Rails to structure your program. The framework provides a number of abstract classes, which your app can extend as needed.

Some languages, particularly statically typed languages like C++ and Java, have built-in support for abstract classes. Ruby does not - any class that is not instantiated is abstract, and the way to make class abstract is to not instantiate it.

### Template Methods

On to our next definition:

> Template: something that establishes or serves as a pattern<br>
> -- <cite>[Miriam Webster](https://www.merriam-webster.com/dictionary/template)</cite>

Based on this definition, a template method would be a method that establishes the pattern for a class. In practice, **a _template method_ is a method that is intended to be overridden by a subclass**. When extending the class, you must follow the pattern and implement the template method.

Typically, as the subclass implementor you do not invoke the template method directly. Instead, the superclass knows when to call the method. In other words:
- The superclass knows the bigger algorithm, but is missing one specific piece
- Your subclass fills in those details through the template method

If a superclass includes a template method, it will do one of two things:
- If there is a reasonable default behavior for this method, the superclass will do that. You only need to override the method if you want some other behavior.
- If there is not a reasonable default, the superclass's version of the method will raise a special exception: `NotImplementedError`. Any subclass will need to implement the method.

Template methods and abstract classes often go hand in hand, and both are extremely common in real-world software projects. Be on the lookout for them in both Rails and React.

### Polymorphism

A final definition. The term _polymorphism_ comes from Greek:
- _poly_, many
- _morph_, face or shape

So something that is polymorphic would have many faces or shapes.

In computing, we use the term _polymorphism_ to refer to any code that treats different types of object in the same way.

The key to polymorphism is that all your different types of objects need to implement the same method or methods. We call this set of methods an _interface_. You can think of this as the "face" from the definition above: each object implements many interfaces.

Here is an example of code that uses polymorphism:

```ruby
data = [
  3.14159,
  "Ada Lovelace",
  { duck: "quack", crow: "caw" }
]

data.each do |thing|
  puts thing
end
```

The elements of `data` are all of different types, but we are able to print each of them to the console. The _interface_ that these objects share is the method `to_s`, which `puts` calls internally.

Inheritance and polymorphism go together nicely. Since every subclass gets all the methods from the superclass for free, they automatically implement that _interface_. If you write code that can takes advantage of that interface without worrying about which specific subclass you've got, you're using polymorphism.

As an aside, the above code also demonstrates an abstract superclass (`Object`) with a template method (`to_s`) overridden by subclasses (`Integer`, `String`, `Hash`).

## Example

Let's see an example of some code that uses these three idioms: an abstract class, template methods, and polymorphism. To do so, we'll revisit our real estate program.

A customer has requested a new feature: the ability to show the estimated monthly payment for a property. The general rules for calculating the monthly payment are going to be the same for all the properties we list, but some of the details like how taxes are calculated will be different for each type of property.

We'll start with the `Property` class. This is an _abstract class_ that implements two _template methods_. `minimum_downpayment` has a default behavior, but `annual_property_tax` does not.

Both of these template methods are used by a third method, `monthly_payment`. We don't need to worry too much about the implementation, just be aware that it knows when to call the template methods.

```ruby
# property.rb
class Property
  attr_reader :address, :asking_price

  # Address has been simplified for the sake of brevity
  def initialize(address, asking_price)
    @address = address
    @asking_price = asking_price
  end

  # Minimum downpayment for most properties is 10%
  # Subclasses can override this if needed.
  def minimum_downpayment
    return 0.1
  end

  # Property tax is calculated differently for every
  # type of property, so there is no reasonable default
  # Instead we raise an exception, and expect any
  # subclass to override
  def annual_property_tax
    raise NotImplementedError, "TODO: Implement me in a subclass!"
  end

  # Complex method to compute the monthly payment.
  # Thank goodness someone else implemented this already!
  # We just have to fill in the details of minimum downpayment
  # and property tax calculations.
  def monthly_payment(loan_years, interest_rate)
    downpayment = minimum_downpayment * asking_price

    mortgage = (asking_price - downpayment) * ((1.0 + interest_rate) ** loan_years)

    annual_price = mortgage / loan_years
    annual_price += annual_property_tax

    return annual_price / 12
  end
end
```

Next, the subclasses. Since the algorithm for calculating payments is already defined in `Property`, we can build these without worrying about that. Instead, we fill in only the details needed for this specific type of property.

```ruby
# condo.rb
require_relative 'property'

class Condo < Property
  # the default value for minimum_downpayment is fine,
  # so we don't override it here

  # However, we have to implement annual_property_tax
  def annual_property_tax
    return asking_price * 0.1
  end
end
```

```ruby
# mansion.rb
require_relative 'property'

class Mansion < Property
  # A mansion requires a big downpayment!
  def minimum_downpayment
    return 0.3
  end

  # The tax calculation is complex
  def annual_property_tax
    if asking_price > 1e7
      return asking_price * 0.3
    else
      return asking_price * 0.2
    end
  end
end
```

Finally, some driver code. Three things to note:
- We don't instantiate `Property`, only its subclasses
  - Because of this, we don't need to `require_relative 'property'`
- We don't call the template methods ourselves, instead relying on `monthly_payment` to know when to do so
- When we treat `Condo`s and `Mansion`s in the same way, we are taking advantage of _polymorphism_

```ruby
# main.rb

require_relative 'Condo'
require_relative 'Mansion'

properties = [
  Condo.new("123 2nd ave W #206, Seattle, WA", 825_000),
  Condo.new("307 E Madison #614, Seattle, WA", 614_000),
  Mansion.new("504 Brickman blvd, Seattle, WA", 1_650_000)
]

puts "We have many marvelous properties avaiable!"

puts "All figures assume a the minimum downpayment on a 30-year loan with a 4% interest rate"

properties.each do |property|
  # We don't care if the property is an apartment or a condo.
  # That's the power of polymorphism - so long as whatever
  # we've got implements the property interface, we can use it.
  puts
  puts property.address
  payment = property.monthly_payment(30, 0.04)
  puts "Estimated monthly payment: $#{payment.round(0)}"
end
```

## Summary

Vocabulary

 Term            | Definition                                                 
-----------------|------------------------------------------------------------
 software idiom  | A common pattern used by programmers. Not always obvious from the syntax of the language. 
 abstract class  | A class that cannot or should not be instantiated, but instead serves only as a parent class. 
 concrete class  | A class that can or should be instantiated. May or may not inherit from some other class. 
 template method | A method that is intended to be overridden in a subclass.  
 interface       | Some set of methods that go together. A class that has all those methods _implements_ that interface. 
 polymorphism    | Treating instances of different classes in the same way. All those classes must implement the same interface.

## Additional Resources

- POODR chapters 6 and 7 talk about inheritance, template methods, and interfaces
- [The Template Method Pattern in Ruby](https://medium.com/@joshsaintjacque/the-template-method-pattern-558f3e16879f)
- [Building Interfaces and Abstract Classes in Ruby](https://metabates.com/2011/02/07/building-interfaces-and-abstract-classes-in-ruby/) - gets into some techniques we haven't seen, but an interesting read nonetheless