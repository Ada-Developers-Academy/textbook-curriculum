## Advanced Variables
## Learning Goals
- Review the two kinds of _variables_ we've encountered so far
  - _Local Variables_ and
  - _Instance Variables_
- Introduce the three other kinds of _variables_ that exist in Ruby
  - _Class Variables_
  - _Global Variables_ and
  - _Constants_


## There are 5 types of variables in Ruby

| Type             | Begins With        | Scope                                    |
|:----------------:|:------------------:|------------------------------------------|
|Local variable    | **a-z** *or* **_** | Available only within the immediate scope.
|Instance variable | **@**              | Available to a specific instance of a class
|Class variable    | **@@**             | Available anywhere in a specific class (including all instances) (avoid using these)
|Global variable   | **$**              | Available everywhere (don't use these)
|Constant          | **ALL_CAPS**       | Available in the scope of their definition

### Local Variable
- Local variables start with a lowercase letter or an underscore
- Local variables are only available within the block of their initialization
- Local variables will raise an error if they are read before they're created
- Local variables are used often

Let's examine the following code:
```ruby
class Library
  def open_library
    message = "The library is open"
    puts message
  end

  def close_library
    message = "The library is closed"
    puts message
  end
end

library = Library.new
library.open_library
library.close_library
```

Run this code by going to Terminal and running the example Ruby script: `ruby source/local_variable_example.rb`.

This code outputs the following:
```
The library is open
The library is closed
```

Both methods use a local variable named `message`. However, the scope of `message` is limited to the methods they are defined in.

Try placing the line of code `puts message` outside of the methods where it is defined (and in the `Library` definition). Running the script again should produce the following error:

```
`<class:Library>': undefined local variable or method `message' for Library:Class (NameError)
  from source/local_variable_example.rb:3:in `<main>'
 ```

Local variables allow you to safely assign values within a scope with full control.

### Instance Variables
- Instance variables begin with `@`
- Instance variables are available to the object of their initialization
- Instance variables are also used very commonly

```ruby
class Library
  attr_reader :library_name

  def initialize(name)
    @library_name = name
  end

end

library1 = Library.new("Woodland Library")
library2 = Library.new("Northview Library")

puts library1.library_name
puts library2.library_name
```

This code outputs the following:
```
Woodland Library
Northview Library
```

In this example, the different instances of Library have different values for `library_name`.

#### Exercise
To build on this, try defining more parameters and instance variables for the `Library` class that would vary instance by instance, like open hours or featured book.

As we learn about some of the more broad variables below, remember that we can use local and instance variables to avoid some of the issues we are about to discuss.

### Class Variables
- Class variables begin with `@@`
- Class variables are available to the entire class (in any method)
- Class variables will raise an error if they are read before they're created
- Class variables can cause problems later (**avoid using them**)
- Class variables are sometimes used for application configuration

```ruby
class Library
  attr_reader :library_name
  @@tagline = "Welcome to all of the libraries:"

  def initialize(name)
    @library_name = name
    @@tagline = @@tagline + " " + @library_name
  end

  def tagline
    puts @@tagline
  end

end

library1 = Library.new("Woodland Library")
library2 = Library.new("Northview Library")
library1.tagline
library2.tagline
```

This code outputs the following:
```
Welcome to all of the libraries: Woodland Library Northview Library
Welcome to all of the libraries: Woodland Library Northview Library
```

Here, we observe that all `Library`s can access and change the same `@@tagline` variable. This is useful in some cases, but can be confusing and obscure in most cases.

Let's explore one more example. Imagine a world where if one library opens, every library is open, and if one library closes, every library is closed. We'll model it like so:

```ruby
class Library
  @@status = "closed"

  def status
    puts "The library is " + @@status
  end

  def open_library
    @@status = "open"
  end

  def close_library
    @@status = "closed"
  end
end

library1 = Library.new
library2 = Library.new
library1.status
library2.status
library1.open_library
library1.status
library2.status
library2.close_library
library1.status
library2.status
```

This code outputs the following:
```
The library is closed
The library is closed
The library is open
The library is open
The library is closed
The library is closed
```

Here we see our desired behavior: if one `Library` opens, all `Library`s open, and if one `Library` closes, all `Library`s close.

#### What about Subclasses?
Class variables have one final trick to them. They are shared among every instance of the class they're defined in, but they're also shared among every subclass within that class.

Observe the following code:
```ruby
class Library
  def initialize(name)
    @@title = name
  end

  def title
    puts @@title
  end
end

class PublicLibrary < Library
end

class PrivateLibrary < Library
end

publicLibrary = PublicLibrary.new("Public Library")
privateLibrary = PrivateLibrary.new("Private Library")
publicLibrary.title
privateLibrary.title
```

This produces the following:
```
Private Library
Private Library
```
The `@@title` variable is shared among even different subclasses of `Library`.

#### Exercise
List other qualities of libraries that should affect other libraries. Also, list qualities of libraries that should *not* affect other libraries, and that would be better used as instance variables.

### Global Variables
- Global variables begin with `$`
- Global variables are available to the entire application
- Global variables are dangerous. **Don't use them**

Let's inspect the following code that describes libraries and books. This might be code that we write to give both libraries and books the properties of names that we pass in. However, pay attention to some erroneous assigning that we do in the following code:

```ruby
$name = "The Fellowship of the String"

class Library
  def initialize(name)
  end

  def name
    $name = "My favorite library is named " + $name
  end
end

class Book
  def initialize(name)
  end

  def name
    $name = "My favorite book is named " + $name
  end
end

library = Library.new("Woodland Library")
book = Book.new("The Philosopher's Code")
puts library.name
puts book.name
```

This code outputs the following:
```
My favorite library is named The Fellowship of the String

My favorite book is named My favorite library is named The Fellowship of the String
```

This output isn't what we intended at all! This example shows some simple mistakes we can make using global variables that have serious unintended consequences. In this example, we access the same global variable many times and change that value between classes. This usage is dangerous and confusing, and shows why it's best to avoid using global variables.

#### Refactor
Try refactoring the code found in `source/global_variable_example.rb` to use instance variables instead.

#### Predefined Global Variables
Ruby creates and maintains a lot of global variables for managing its internal configuration. It's good to know these exist, but you won't interact with them often.

The complete list of Ruby's predefined global variables is [here](https://ruby-doc.org/core-2.1.1/doc/globals_rdoc.html).

### Constants
- Constants are all uppercase with using underscores to separate words
- Constants are available within the scope of their initialization
- Constants will raise an error if they are read before they're created
- Constants can be used outside of their scope through the class it was instantiated
- Constants can not be defined inside of methods
- Constants are like any other variables, except that their value must remain constant for the duration of the program
- Constants are used often in Rails

```ruby
class Library
  RENTAL_PERIOD = 14

  def checkout_book
    puts "Your book is due in #{RENTAL_PERIOD} days."
  end

end

library = Library.new
library.checkout_book
```

This code outputs the following:
```
Your book is due in 14 days.
```

Here we observe that every `Library` has access to the constant `RENTAL_PERIOD`. This variable cannot be reassigned. Trying to reassign `RENTAL_PERIOD` to 15 later in the code produces the following error:

```
dynamic constant assignment
    RENTAL_PERIOD = 15
```

In summary, we can use constants to define variables that should not be reassigned.

#### Predefined Constants
The following are predefined constants that are reserved by Ruby.

```ruby
__FILE__ # current file
__LINE__ # current line
__dir__  # current directory, breaks the damn rules
ARGV #  An array containing the command-line arguments passed to the program. A synonym for $*.
ENV # A hash-like object containing the program's environment variables. ENV can be handled as a hash.
RUBY_PLATFORM # A string indicating the platform of the Ruby interpreter.
RUBY_RELEASE_DATE # A string indicating the release date of the Ruby interpreter
RUBY_VERSION #  A string indicating the version of the Ruby interpreter.
STDERR #  Standard error output stream. Default value of $stderr.
STDIN # Standard input stream. Default value of $stdin.
STDOUT #  Standard output stream. Default value of $stdout.
```

## What Have We Accomplished?
- Reviewed local and instance variables
- Used class variables to store and change a value accessed by all instances of a class
- Observed how global variables can be dangerous, and how to refactor and use other kinds of variables instead
- Gone over how to define unchanging values using constant variables
- Looked at predefined global variables and constants in Ruby

## Additional Resources
- [RubyFiddle](http://rubyfiddle.com/) - used to execute Ruby code in the browser, good for playing around with variables
- [Video: Ruby variable types and variable scope](https://www.youtube.com/watch?v=riPrhUu1fco) - video tutorial explaining the five types of variables in Ruby
- [Ruby Docs on Local, Instance, and Global Variables](http://ruby-doc.org/core-2.4.1/doc/syntax/assignment_rdoc.html)
