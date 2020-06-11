# Introduction to software design principles

![life of a software engineer](images/software-eng.jpg)

<!--  Image from https://www.geeksaresexy.net/2015/03/14/the-life-of-a-software-engineer-comic/ -->

Designing software is a complicated and difficult undertaking.  Because of this **software design** is a field of study that's grown up around techniques and strategies used to create software.  

## Learning Goals

By the end of this lesson you should be able to:

* Explain Object Oriented Design - common terms and concepts
* Conduct an introductory discussion on design principles
* Explain the concept of design patterns

## Notes

* [Slides used in class](https://docs.google.com/presentation/d/1D6X9J-4Jk5RZzoPjSCvOPP1DBb67i3eM55LIJyTluPw/edit#slide=id.p1)

## The Goals of Software Design

### Project Organization with Agile

## Object Oriented Design



### Encapsulation

### Inheritance

### Polymorphism

## Design Principles

### Have SOLID Principles

SOLID is an acronym first proposed in 2000 by Bob C Martin, aka "Uncle Bob," as a set of princples to strive for to create software which is maintainable, extensible and understandable.

The SOLID principles are:

1. Single Responsibility Principle
1. Open/Closed Principle
1. Liskov Substitution Principle
1. Interface Segregation Principle
1. Dependency Inversion Principle

#### Single Responsibility Principle

As the name suggests this principle means that every class or module should have a single role.  So if you have a Product class it should handle information relating directly to products and have methods which act on products.  You shouldn't have an instance variable in the Product class which stores the merchant's  image.  That would be mixing roles and giving the Product class multiple responsibilities between merchant and product data.

Consider the following class:

```ruby
class TextManipulator
  attr_reader :text

  def initialize(text) 
    @text = text
  end

  def append_text(new_text)
    @text.concat(new_text)
  end

  def find_and_replace(word, replacement)
    if @text.include?(word)
      @text.gsub!(word, replacement)
    end
    return @text
  end

  def find_and_delete(word)
    return self.find_and_replace(word, "")
  end

  def print_text
    puts @text
  end
end
```

<details>
  <summary><em>Question:</em> Does this class exemplify the single responsibilty principle?</summary>

No!  This class mixes manipulating the text and printing the text out.  It's mixing display and data manipulation.

Instead we could create a `TextPrinter` class which might have a `TextManipulator` object as an instance variable, and handles the display of the text.

</details>


#### Open/Closed Principle

This principle dictates that a long-standing and well-tested class should not be modified when new features need to be built.  If you do that, you might introduce new bugs to older features.  Instead of changing that class, you should use inheritance or composition to create new classes to add new features.  The idea is that the codebase is open to extension, via inheritance and composition, but older classes are closed for modification.

Consider this class which sends notifications to the user.

```ruby
class Notifier
  # ...
  def send(user, message)
    EmailSender.send(user, message)
  end
end
```

But what if requirements change and we want to send push notifications instead of emails... we could modify the `Notifier` class, but that could introduce bugs.  Instead we should set this up to be open to extension, but without letting the user modify the class which sends email notifications.

```ruby
class Notifier
  # Abstract method
  def send(user:, message:)
    raise NotImplementedError, "Attempted to call an abstract method"
  end
end

class EmailNotifier < Notifier
  def send(user: message:)
    # code to send emails
  end
end
```

Then we could easily create new subclasses of `Notifier` which send push notifications, text messages etc.  It becomes much easier to extend our features without users modifing classes being used in deployed code.  

#### Liskov Substitution Principle

This principle is named after [Barbara Liskov](https://en.wikipedia.org/wiki/Barbara_Liskov), an MIT computer scientist.  This principle states that an instance of a subclass should be substitutable for an instance of the parent class without breaking the behavior.  

Consider the code below:

```ruby
class Rectangle
  attr_accessor :width, :height

  def initialize(width = 0, height = 0)
    @width = width
    @height = height
  end

  def area
    return width * height
  end
end

class Square < Rectangle
  def initialize(width = 0)
    super(width, width)
  end

  def width=(new_width)
    @width = new_width
    @height = new_width
  end

  def height=(new_height)
    @width = new_height
    @height = new_height
  end  
end

rec = Rectangle.new
rec.width = 3
rec.height = 4
puts rec.area  # prints 12

sq = Square.new
sq.width = 3
sq.height = 4
puts sq.area # prints 16
```

This example violates the Liskov Substitution Principle (LSP) because substituting a Square for a Rectangle gives a different result.  

Here are some guidelines for enforcing the LSP principle.

1.  Method signatures should match and accept the same number of parameters as the base type.
1.  The return type of a subclass' methods should match the parent class
1.  Exceptions in the subclass should match the type generated by the superclass.

A few indicators that you have violated LSP are:

* Have a subclass method that override a method of the base class method to give it completely new behaviour.
* Have a subclass which documents that certain methods inherited from the superclass should not be called by clients.
* A subclass throws additional (unchecked) exceptions not thrown by the superclass

A better solution would look like this:

```ruby
class Shape
  def calculate_area
    raise NotImplementedError
  end
end

def Rectangle < Shape
  attr_accessor :height, :width
  
  def calculate_area
    height * width
  end
end

def Square < Shape
  attr_accessor :side_length
  
  def calculate_area
    side_length * side_length
  end
end
```

Notice that we often create abstract superclasses to make our code more extensible!

#### Interface Segregation Principle

#### Dependency Inversion Principle

## Design Patterns

## Optional: Reading Material

* When would you choose [**Inheritance** verses **Composition**](https://www.thoughtworks.com/insights/blog/composition-vs-inheritance-how-choose)
* A blog post on [10 tips to write reusable code](http://hoskinator.blogspot.com/2006/06/10-tips-on-writing-reusable-code.html)
* A blog post on [S-O-L-I-D object oriented design principles](https://scotch.io/bar-talk/s-o-l-i-d-the-first-five-principles-of-object-oriented-design)
* Good articles by ObjectMentor on [Design Principles](http://web.archive.org/web/20060908022742/http://www.objectmentor.com:80/resources/listArticles?key=topic&topic=Design%20Principles) covers S-O-L-I-D and a few other design principles
* TutorialsPoint on [Design Patterns Interview Questions](https://www.tutorialspoint.com/design_pattern/design_pattern_interview_questions.htm)
* Andiamogo on [Object Oriented Design Interview Questions](http://www.andiamogo.com/S-OOD.pdf)
* CareerCup on [Object Oriented Design Interview Questions](https://www.careercup.com/page?pid=object-oriented-design-interview-questions)
* Book: [Practical Object-Oriented Design in Ruby](https://www.amazon.com/Practical-Object-Oriented-Design-Ruby-Addison-Wesley/dp/0321721330)
* Book: [Agile Software Development, Principles, Patterns and Practices](https://www.amazon.com/Software-Development-Principles-Patterns-Practices/dp/0135974445)
* Book: [Design Patterns: Elements of Reusable Object-Oriented Software](https://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612)

## Slide Deck
+ Slide Deck used in class</br>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://drive.google.com/open?id=1g3Om6RoHXcZUK8R1iE86qtEh-27zlz7Z">Introduction to Software Design</a></span></br>
is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</br>
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a>
