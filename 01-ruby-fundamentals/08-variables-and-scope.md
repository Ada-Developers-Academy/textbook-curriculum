# Variables and Scope
## Learning Goals
- Explore the differences between _local variables_ and _instance variables_
- Learn how a variable's _scope_ is defined.

| Type             | Begins With        | Scope                                    |
|:----------------:|:------------------:|------------------------------------------|
|Local variable    | **a-z** *or* **_** | Available only within the immediate scope.
|Instance variable | **@**              | Available to a specific instance of a class

### Local Variables
We've created lots of _local variables_ already. They look like this:

```ruby
my_name = "Kari"
```

#### Characteristics of a _local variable_
- Local variables start with a lowercase letter or an underscore
- Local variables are only available within the block in which they were declared
- Local variables will raise an error if they are read before they are created
- Local variables are used __often__

### Instance Variables
In the last lecture, we learned about _instance variables_. These are variables that persist for as long as their _class instance_ exists. In this example, `@name` is an instance variable:

```ruby
class Ghost
  def initialize(name_var)
    @name = name_var
  end

  def name
    if @name == "casper"
      "#{@name} the ghost"
    else
      @name
    end
  end
end
```

#### Characteristics of an _instance variable_
- Instance variables begin with `@`
- The value of an instance variable is maintained as long as the instance exists
- Instance variables are available in all _instance methods_ of a _class_
- The value of an instance variable is the same in all _instance methods_
- Instance variables are also very common

## Scope
The _scope_ of a variable is the collection of methods, blocks, and objects that know about that variable. It's the comprehensive list of where that variable is available. We can talk about _scope_ for both _local_ and _instance_ variables.

### Scope of _local variables_
Local variables are only available inside the block in which they were declared and any of that block's child blocks. Rubyists often say that __local variables can't travel left__.

```ruby
def desserts(person)
  nom = "Pie" # local variable, available to any child defined within this same method.

  if person.likes(nom)
    choco_var = "Chocolate" # not available outside the if block
    [1,2,3,4].each do |num|
      mostest_nom = num > 3 # only available within the each block
      puts "I love #{choco_var}. " * num if mostest_nom
    end
  end
end
```

### Scope of _instance variables_
_Instance variables_ are available anywhere within _instance methods_ of a _class_.

```ruby
class User
  attr_accessor :username, :first_name, :last_name

  def initialize(first, last)
    @first_name = first
    @last_name = last
    @username = make_username
  end

  def full_name
    "#{ @first_name } #{ @last_name }"
  end

  def name_with_username
    "#{ full_name }: #{ @username }"
  end

  def make_username
    first_letter = @first_name[0] # first_letter is a local variable
    "#{ first_letter }-#{ @last_name }"
  end
end
```

*  [Slides](https://docs.google.com/presentation/d/1AArzIhCh0-jAtGf3O9yG1lh7GeFxSS75u_qfZ365ze0/edit)
*  [VariableScope.rb](source/VariableScope.rb)
*  [Pacman.rb](source/PacMan.rb)
*  [Song.rb](source/Song.rb)
*  [Card.rb](source/Card.rb)
*  [User.rb](source/User.rb)
