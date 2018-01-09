# Object Orientation: Classes in Ruby

## Learning Goals
By the end of this lesson, students should be able to...
- Define, instantiate and use a Ruby _class_
- Store object state using _instance variables_
- Define object behavior using _instance methods_
- DRY up repeated code using _helper methods_
- Use Ruby's `self` keyword to refer to the current object

## Classes in Ruby

As with methods, there are two steps to working with classes in Ruby:
1. **Define** the class using the `class` keyword
    - Happens once
    - Similar to defining a method with `def`
1. **Instantiate** (create an instance of) the class using `.new`
    - May happen many times
    - Similar to invoking a method

With all the classes we've worked with so far (`String`, `Array` and `Hash`) we've only had to do the second step, because the class was already defined for us. The first step definitely did happen though - somewhere in the bowels of you computer there is a file called `string.rb` containing all the code required to make a `String` work.

### Example: `User`
Our running example today will be a class to represent a user of an application. We will call this class `User`. Note the capital `U`, and the difference between `User` (a class in our program) and user (a user of our app). Remember that we don't need to keep track of every fact about a user in our `User`, only the pieces that matter to our program.

The simplest possible class in Ruby doesn't have any state or behavior, just the name `User`. Even so, we can instantiate it with `User.new`.

```ruby
# Define the class
class User
end

# Create an instance of the class
ada = User.new
# ...what now?
```

We've got a user, but it's not very interesting yet. To make our classes more useful, we'll need to add some methods and attributes.

## Adding Behavior Through Methods

If we define methods inside of our class definition, they will be available for instances of our class. Because these methods require an instance of the class to run, they're sometimes called _instance methods_.

```ruby
# user.rb
class User
  def name
    return "Ada Lovelace"
  end

  def email
    return "ada@adadev.org"
  end

  def summary
    return "#{name}: #{email}"
  end
end
```

Check out the instance method `summary`. From here we call other instance methods, `name` and `email`. When you're inside an instance of a class, you can call other instance methods without any extra work.

Let's load this script into `irb` using the `-r` flag.

```bash
$ irb -r ./user.rb
```

```ruby
User               # => User - This is the class, it's just the idea of a user
User.email         # => Error!
ada = User.new     # => #<User:0x007fb7da550ca0> - this represents a particular user, it has an email
ada.email          # => ada@adadev.org
ada.summary        # => Ada Lovelace: ada@adadev.org
```

This is a good start, our users now have something to do. But our users are still all the same. There's nothing to differentiate one user from another.

```ruby
ada = User.new
katherine = User.new

ada.email        # => ada@adadev.org
katherine.email  # => ada@adadev.org
```

## Adding State Through Instance Variables

Ruby allows us to attach variables to an instance of a class. Such variables are appropriately named _instance variables_. To create or use an instance variable, prefix the variable's name with the `@` symbol. Instance variables can be read and written in any instance method.

By default, instance variables are not accessible outside the instance they're attached to. By convention, to make them readable we define a method with the same name as the variable, which returns the current value of that variable. This method is called a _reader_, _getter_ or _accessor_, depending on what language you're in (Ruby uses _reader_).

Similarly, Ruby allows us to define a method that will allow the variable to be set with the `=` sign. This method is variously called a _writer_, _setter_ or _mutator_ (Ruby uses _writer_).

Let's rewrite our `User` to take advantage of instance variables.

```ruby
# user.rb
class User
  # Reader for name
  def name
    return @name
  end

  # Writer for name
  def name=(new_name)
    @name = new_name
  end

  def email
    return @email
  end

  def email=(new_email)
    @email = new_email
  end

  def summary
    return "#{@name}: #{@email}"
  end
end
```

Now we can have different users with different attributes.

```ruby
ada = User.new
katherine = User.new

ada.name = "Ada Lovelace"
ada.email = "ada@adadev.org"

katherine.name = "Katherine Johnson"
katherine.email = "katherine@adadev.org"

puts ada.name           # => Ada Lovelace
puts katherine.summary  # => Katherine Johnson: katherine@adadev.org
```

## The Constructor

Objects in Ruby can have a special method called `initialize`. This method, often called a _constructor_, is called automatically from within the `new` method. So we will use it to "construct" our object. Since `initialize` is a method we create, we can define _parameters_ for it and pass _arguments_ to the `new` method. `new` is kind enough to pass along its _arguments_ to `initialize`.

```ruby
class User
  # Constructor! This will be called automatically when you invoke User.new
  def initialize(name, email)
    @name = name
    @email = email
  end

  def name
    return @name
  end

  def name=(new_name)
    @name = new_name
  end

  def email
    return @email
  end

  def email=(new_email)
    @email = new_email
  end

  def summary
    return "#{@name}: #{@email}"
  end
```

Now when we create a new `User`, we can give it some initial settings.

```ruby
ada = User.new('Ada Lovelace', 'ada@adadev.org')
puts ada.summary     # => Ada Lovelace: ada@adadev.org
```

Much more concise! This pattern of passing in a bunch of values for instance variables is a very common one, but the constructor is just another method, so you can write any code you need in it. You can even call other methods!

Another advantage of setting instance variables in the constructor is that we know those variables will always have a value. By making it impossible to have a `User` without an associated `name` and `email`, we can save ourselves all sorts of frustration later on.

## Use Helper Methods to Avoid Repetition

The code above allows us to read/get and write/set the name and email properties in the `User` class. This is done so frequently that Ruby added some syntactic sugar to help us out. Enter two _helper methods_, `attr_reader` and `attr_writer`:

```ruby
class User
  # Generate reader methods for name and email
  attr_reader :name, :email

  # Only generate a writer method for email
  attr_writer :email

  def initialize(name, email)
    @name = name
    @email = email
  end

  def summary
    return "#{@name}: #{@email}"
  end
end
```

A _helper method_ (sometimes called a _macro_ or _generator_) is a small piece of code that generates a big piece of code. These two lines tell Ruby to automatically add reader and writer methods for those variables to your class. Adding `attr_reader :name` to our class is _exactly_ the same as creating the `def name` method in the previous example. Similarly, `attr_writer :name` replaces the `def name=(new_name)` method.

The instance variables to be exposed are specified using a comma-seperated list of symbols. To demonstrate the syntax, in the above example we have created both reader and writer methods for `@email`, but only a reader method for `@name`.

These pieces of code are called helper **methods** for a reason. Under the hood they're actually built-in Ruby methods that are run when the class is defined. `attr_reader` or `attr_writer` is the name of the method, and the instance variables to expose (like `:name`) are the arguments. Weird!

If you don't need to be able to control the read/get and write/set functionality independently, `attr_accessor` provides the functionality of `attr_reader` and `attr_writer`!

```ruby
class User
  # email had both an attr_reader and an attr_writer, so we replace it with attr_accessor
  attr_accessor :email

  # name had only an attr_reader, so we leave it as-is
  attr_reader :name

  def initialize(name, email)
    @name = name
    @email = email
  end

  def summary
    return "#{@name}: #{@email}"
  end
end
```

Helper methods like `attr_accessor` are very useful, because they allow us to add common functionality without typing out a bunch of boilerplate code. This makes our programs more readable and reduces the possibility of making a mistake. For these reasons, **we recommend that you always use the `attr_reader` / `attr_writer` / `attr_accessor` helper methods**, and never write getter and setter methods manually.

We'll see many more helper methods as we start talking about Rails in a few weeks.

## The `self` Keyword

Inside an instance method, it's sometimes useful to refer to the current object, the instance upon which this method was invoked. Ruby's `self` keyword does exactly this.

```ruby
class User
  def puts_self
    puts self
  end
end
```

```ruby
ada = User.new('Ada Lovelace', 'ada@adadev.org')
ada.puts_self     # => #<User:0x007fb7da550ca0>
```

`self` acts much like any other variable. You can print it, call methods on it, and even pass it to other methods. The only thing you can't do is reassign it.

Some other languages (notably JavaScript) use `this` instead of `self`, but the meaning is the same.

The `self` keyword will come up quite a lot as we continue to learn about Ruby and build more complicated programs, but for now it's enough to know that it exists.

**Question:** In what situations might `self` be useful?

## Classes Vocabulary

Term              | Definition | Example&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
---               | ---        | ---
Object            | A programming concept that ties together _state_ (variables) and _behavior_ (methods). |
Class             | Definition of what an object looks like, using Ruby's `class` keyword. The first letter is always capitalized. | `class User`
Instance          | One particular object. Built using a class's `new` method. | `ada = User.new`
Instance Variable | A variable attached to a particular instance of a class. Also known as _attributes_. Always begins with an `@`. Not visible outside that class. | `@name`
Instance Method   | A method attached to a particular instance of a class. Often relies on or modifies instance variables. Can be invoked from outside that class using `.` notation. | `def summary()`
Constructor       | A special instance method that is called automatically when a new instance of a class is created. Takes care of any initial setup. Any arguments passed to `new` will be passed to the constructor. | `def initialize(name, email)`
Reader Method     | Instance method that returns the value of an instance variable. Also known as a _getter_ or _accessor_. | `def email`<br>&nbsp;&nbsp;&nbsp;&nbsp;`return @email`<br>`end`
Writer Method     | Instance method that sets the value of an instance variable. Also known as a _setter_ or _mutator_. | `def email=(new_email)`<br>&nbsp;&nbsp;&nbsp;&nbsp;`@email=new_email`<br>`end`
Helper Method     | A small piece of code that generates a big piece of code. In Ruby, they're used to automatically add functionality to a class, like reader or writer methods. | `attr_accessor :email`
`self`            | Ruby keyword referring to the current object | `self`

## Additional Resources

- [Creating your own attr_accessor in Ruby](https://mikeyhogarth.wordpress.com/2011/12/01/creating-your-own-attr_accessor-in-ruby/)
