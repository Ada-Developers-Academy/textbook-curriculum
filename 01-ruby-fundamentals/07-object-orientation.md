# Object Orientation: Methods, Classes, and Instances
## Learning Goals
  - Learn to write our own methods!
  - Understand a _method signature_!
  - Figure out the difference between _parameters_ and _arguments_.
  - Learn from whence methods come!
  - Discover Ruby's _class_ architecture!
  - Use our first _instance variables_

## Methods
We have seen and used methods before, but we haven't created our own method definitions yet. Let's change that.

### Creating methods: Signatures and Blocks
To create a method, you must first understand it's _method signature_. A _method signature_ is comprised of 2 parts: the __name__ of the method, and the __arguments__ it is expecting. Once you have defined those two things, you can create a `def` (method definition) _block_.

```ruby
def say_hello # <= that's the method signature
  return "hello world!" # <= that's the block
end
```

In this example, `say_hello` is the method __name__. This method has no __arguments__ (more on that shortly), so the _method signature_ is just `say_hello`. The purpose of this method is to print out a string to the user. As we learned earlier, we want to _call_ or _invoke_ a method in order to execute its block:

```ruby
puts say_hello
# => hello world!
greeting = say_hello
puts greeting
# => hello world!
```

__Question: When do we need to use the `return` keyword?__

### Method Arguments (and parameters)
Okay, let's get this out of the way. Most folks use _argument_ and _parameter_ interchangeably. That's fine and it almost never matters. However, as best as I understand, here's the difference:

__In Ruby, _parameters_ are passed and _arguments_ are accepted.__ The _arguments_ are defined in the _method signature_, and the _parameters_ are the specific values given to the method when it is _invoked_. Like I said, most of the time, this distinction isn't important.

Once we have created a method, we may want to use an _argument_ to provide additional data or context to our method. Think back to our `Math.sqrt(9)` example. The `9` in the `()` is a _parameter_. Looking at this, I can hazard an educated guess that the _method signature_ of `sqrt` looks something like `def sqrt(number)` (name and one argument).

To add a parameter to the `say_hello` method, we need to change the __method signature__:

```ruby
def say_hello(name) # <= method signature with a name and one argument
  puts "welcome #{name}! hello world!" # <= the block
end

say_hello("kari") # <= invoking the method with one parameter
# => welcome kari! hello world!
```

In this updated method, `name` is a variable with the value for the parameter passed in. When we called the method, the `name` variable was set equal to the string `"kari"` since that was the value we passed in.

## Objects Overview
An `object` is the representation of an idea within a program. Let's look at the common objects we've used already.

```ruby
String.new
# => ""

Hash.new
# => {}

Array.new
# => []
```

Where we would normally use the _string literal_ `""`, we can also call the `.new` method on the `String` class to create a new string object. A class can be identified by it's __capitialized first letter__. So `""`, `[]`, and `{}` are syntactic sugar; using _literals_ to _initialize_ a new _instance_ of an _object type_. Most classes do **NOT** have this kind of convenience.

### Creating a custom class
Although any abstract idea can be represented as an object, it's sometimes easy to think of a physical object to get the idea. Think about you as a human being. You have attributes like `height`, `weight`, and `eye_color`. You have methods like `walk`, `run`, `talk`, and `walk_backwards`. Different kinds of objects have different attributes and methods.

Think of the idea of a chair, not a specific chair, just the idea of a chair. What color is it? None! The idea of a chair doesn't have a color. Only an actual chair has a color.

Let's create a class for a Chair in ruby.

```ruby
class Chair
  def name
    "Terrible Chair"
  end  

  def weight_in_lbs
    29
  end

  def type
    "Swivel"
  end

  def color
    "Pink"
  end

  def max_height
    32.625
  end
end
```

I'm going to load this script into `irb` using the `-r` flag

```bash
$ irb -r ./chair.rb
```

```ruby
Chair # => Chair - This is the class, it's just the idea of a chair
Chair.color # => Error!
Chair.new # => #<Chair:0x007fb7da550ca0> - this is an instance of a chair, it has a color
Chair.new.color # => "Black"
```

## Every value is an object
In the last section, we said *everything is an object*. This is a confusing concept at first, but let's go over a couple of examples to highlight that point.

Every object has a class, try:

```ruby
"Hello".class # => String
{}.class # => Hash
Chair.new.class # => Chair
```
__Question: What are the limitations of our `Chair` _class_?__

### `initialize`
Let's start over building our class, but let's build it to be a little customizable. We want to be able to customize the attributes `color` & `name` when we create our chair.

```ruby
class Chair
  def initialize

  end
end
```

That `initialize` method (often called a _constructor_) is called automatically from within the `new` method. So we will use it to "construct" our object. Since `initialize` is a method we create, we can define _arguments_ for it and pass _parameters_ to the `new` method. `new` is kind enough to pass along its _parameters_ to `initialize`.

With those _parameters_, we can create _instance variables_. By prefixing a variable name with an `@` symbol, we create a variable that has visibility within __any instance method of the class__. As long as that specific instance of the class is around, Ruby will retain the value of its _instance variables_. Let's alter our `Chair` _class_ to look like this:

```ruby
class Chair
  def initialize(name, color)
    @name = name
    @color = color
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def color
    @color
  end

  def color=(new_color)
    @color = new_color
  end
end
```

### Use `attr` Methods to Avoid Repitition!
The code above allows us to read/get and write/set the color and name properties in the `Chair` _class_. This is done so frequently that Ruby added some syntactic sugar to help us out. Enter `attr_reader` and `attr_writer`:

```ruby
class Chair
  attr_reader :name, :color
  attr_writer :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end
end
```

These two attributes, `attr_reader` and `attr_writer` allow you to control the reading a writing of these particular properties. Adding `attr_reader :name` to our _class_ is exactly the same as creating the `def name` method in the previous example. Similarly, `attr_writer :name` replaces the `def name=(new_name)` method.

### `attr_accessor`
If you don't need to be able to control the read/get and write/set functionality independently, `attr_accessor` provides the functionality of `attr_reader` and `attr_writer`!

```ruby
class Chair
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end
end
```
