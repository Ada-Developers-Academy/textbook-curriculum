# Methods
## Learning Goals
  - Learn why we need methods!
  - Learn to write our own methods!
  - Understand a _method signature_!
  - Figure out the difference between _parameters_ and _arguments_.
  - Identify method signatures for methods we have used
  - See the difference between using `return` and not using it

## Methods
We have seen and used methods before, but we haven't created our own method definitions yet. Let's change that.

### Creating methods: Why?
Methods allow us to assign a _name_ and _structure_ to sections of code. We create methods when we identify these sections of code that we may want to reuse and execute independently from other sections of code.


### Creating methods: Signatures and Blocks
To create a method, you must first understand it's _method signature_. A _method signature_ is comprised of 2 parts: the __name__ of the method, and the __arguments__ it is expecting. Once you have defined those two things, you can create a `def` (method definition) _block_.

#### Example 1
```ruby
def say_hello # <= that's the method signature
  puts "hello world!" # <= that's the block
end
```

In this example, `say_hello` is the method __name__. This method has no __parameters__ (more on that shortly), so the _method signature_ is just `say_hello`. The purpose of this method is to print out a string to the user. As we learned earlier, we want to _call_ or _invoke_ a method in order to execute its block:

```ruby
say_hello
# => hello world!
```

### Method Arguments (and parameters)
Okay, let's get this out of the way. Most folks use _argument_ and _parameter_ interchangeably. That's fine and it almost never matters. However, as best as I understand, here's the difference:

__In Ruby, _parameters_ are variables used to refer to pieces of data provided as input. _arguments_ are those pieces of data.__ The _parameters_ are defined in the _method signature_, and the _arguments_ are the specific values given to the method when it is _invoked_. Like I said, most of the time, this distinction isn't important.

Once we have created a method, we may want to use an _parameter_ to provide additional data or context to our method. Think back to our `Math.sqrt(9)` example. The `9` in the `()` is a _argument_. Looking at this, I can hazard an educated guess that the _method signature_ of `sqrt` looks something like `def sqrt(number)` (name and one parameter).

To add a parameter to the `say_hello` method, we need to change the __method signature__:

#### Example 2
```ruby
def say_hello(name) # <= method signature with a name and one parameter
  puts "welcome #{name}! hello world!" # <= the block
end

say_hello("Ada") # <= invoking the method with one argument
# => welcome Ada! hello world!
```

In this updated method, `name` is a variable with the value for the argument passed in. When we called the method, the `name` variable was substitued out for the value of string `"Ada"` since that was the value we passed in.

#### Example 3
```ruby
def add(num_one, num_two)
  return num_one + num_two
end
```

In this example, `add` is the method __name__. This method has two __parameters__ so the _method signature_ is `add(num_one, num_two)`. The purpose of this method is to __return__ the result of adding two variables together. We want to _call_ or _invoke_ this method to execute the block:
```ruby
add(1, 2)
# => 3
```

In this example method _call_, the variable `num_one` is substituted with value `1` and the variable `num_two` is substitued with value `2`.

#### Example 4

__Question: When do we need to use the `return` keyword?__

Let's see what the difference is between using `puts` and using `return.`

First, let's assign a variable to the _result_ of the method call.
```ruby
def add_with_return(num_one, num_two)
  return num_one + num_two
end

result = add(2, 2)
puts result
# => 4
```

Next, let's change the method and assign the variable in the same way.
```ruby
def add_with_puts(num_one, num_two)
  puts num_one + num_two
end

result = add(2, 2)
puts result
# => nil
```

**Methods can often be referred to as _messages_. When we send a message, we expect a reply.**



## Method Vocabulary

This vocab list will reference the following code:

```ruby
def sum(a, b, c)
  result = a + b + c
  return result
end

number = sum(5, 17, 106)
puts number
```

Term             | Description | Example&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
---              | ---         | -------------------
Method           | A section of code with a name. Organizes code so it's easier to read, and lets us do the same thing many times. | `def` through `end`
Method Signature | The name and parameters of a method. Answers the question "how do I invoke this?" | `sum(a, b, c)`
Parameter        | A variable used to store input to a method. Specified in the method signature. | `a`, `b`, `c`
Return           | Immediately exit a method, and optionally send a result back to whoever called it. Uses Ruby's `return` keyword. If no result is supplied, the returned value will be `nil`. | `return`,<br>`return result`
Invoke           | Run a method. Also known as _calling_ the method. The value returned by the method can be used immediately, stored in a variable, or ignored. | `number = sum(5, 17, 106)`
Argument          | The value to be used for a particular parameter. Specified when the method is invoked. May be a literal value or a variable. | `5`, `17`, `106`
