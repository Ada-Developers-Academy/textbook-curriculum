# Classes Part 2: Helper Methods and Self

## Learning Goals
By the end of this lesson, students should be able to...
- DRY up repeated code using _helper methods_
- Use Ruby's `self` keyword to refer to the current object

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

### Exercise

Use helper methods to DRY up the `Product` class from the [previous lesson](classes-in-ruby.md).

<details>
<summary>Solution</summary>

```ruby
class Product
  attr_accessor :name, :quantity_in_stock
  attr_reader :quantity_sold

  def initialize(name, quantity_in_stock)
    @name = name
    @quantity_in_stock = quantity_in_stock
    @quantity_sold = 0
  end

  def available?
    return quantity_in_stock > 0
  end

  def sell(amount)
    @quantity_in_stock -= amount
    @quantity_sold += amount
  end
end
```
</details>

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

## Vocabulary

Here is the table from the previous lesson, updated to include new terms.

Term              | Definition | Example&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
---               | ---        | ---
Object            | A programming concept that ties together _state_ (variables) and _behavior_ (methods). |
Class             | Definition of what an object looks like, using Ruby's `class` keyword. The first letter is always capitalized. | `class User`
Instance          | One particular object. Built using a class's `new` method. | `ada = User.new`
Instance Variable | A variable attached to a particular instance of a class. Also known as an _attribute_. Always begins with an `@`. Not visible outside that class. | `@name`
Instance Method   | A method attached to a particular instance of a class. Often relies on or modifies instance variables. Can be invoked from outside that class using `.` notation. | `def summary()`
Constructor       | A special instance method that is called automatically when a new instance of a class is created. Takes care of any initial setup. Any arguments passed to `new` will be passed to the constructor. | `def initialize(name, email)`
Reader Method     | Instance method that returns the value of an instance variable. Also known as a _getter_ or _accessor_. | `def email`<br>&nbsp;&nbsp;&nbsp;&nbsp;`return @email`<br>`end`
Writer Method     | Instance method that sets the value of an instance variable. Also known as a _setter_ or _mutator_. | `def email=(new_email)`<br>&nbsp;&nbsp;&nbsp;&nbsp;`@email=new_email`<br>`end`
Helper Method     | A small piece of code that generates a big piece of code. In Ruby, they're used to automatically add functionality to a class, like reader or writer methods. | `attr_accessor :email`
`self`            | Ruby keyword referring to the current object | `self`

## Additional Resources

- [Creating your own attr_accessor in Ruby](https://mikeyhogarth.wordpress.com/2011/12/01/creating-your-own-attr_accessor-in-ruby/)
