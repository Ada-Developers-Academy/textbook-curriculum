# Object Orientation: Classes, and Instances
## Learning Goals
  - Discover Ruby's _class_ architecture!
  - Use our first _instance variables_

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

Where we would normally use the _string literal_ `""`, we can also call the `.new` method on the `String` class to create a new string object. A class can be identified by it's __capitalized first letter__. So `""`, `[]`, and `{}` are syntactic sugar; using _literals_ to _initialize_ a new _instance_ of an _object type_. Most classes do **NOT** have this kind of convenience.

### Creating a custom class
Although any abstract idea can be represented as an object, it's sometimes easy to think of a physical object to get the idea. Think about you as a human being. You have attributes like `height`, `weight`, and `eye_color`. You have methods like `walk`, `run`, `talk`, and `walk_backwards`. Different kinds of objects have different attributes and methods.

Think of the idea of a chair, not a specific chair, just the idea of a chair. What color is it? None! The idea of a chair doesn't have a color. Only an actual chair has a color.

Let's create a class for a Chair in ruby.

```ruby
class Chair
  def name
    return "Terrible Chair"
  end  

  def weight_in_lbs
    return 29
  end

  def type
    return "Swivel"
  end

  def color
    return "Black"
  end

  def max_height
    return 32.625
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

That `initialize` method (often called a _constructor_) is called automatically from within the `new` method. So we will use it to "construct" our object. Since `initialize` is a method we create, we can define _parameters_ for it and pass _arguments_ to the `new` method. `new` is kind enough to pass along its _arguments_ to `initialize`.

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

### Use `attr` Methods to Avoid Repetition!
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
