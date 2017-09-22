# Hotel Revisited

Hotel was a challenging, open-ended project! Now that you've worked through it once and gotten some feedback, it's worthwhile to spend some time iterating on what you've learned.

You'll start by reviewing the one of our key object-oriented design principles, _single responsibility_.

Then you'll address the Hotel project directly, and refactor your implementation to reflect this better understanding.

## Single Responsibility

The single responsibility principle helps answer the questions "What classes should I have?" and "Where should this logic live?" The big idea is that that each class in your program should be in charge of exactly one thing, no more, no less.

A common mistake made by new designers is to build classes that appear to each have a single responsibility, but then to put all the logic to carry out those various responsibilities in one place. One "master" class is in charge of all behavior, and other classes are only used to store state. This does not truly adhere to the single responsibility principle because responsibility consists of both behavior _and_ state.

Instead, if some code relies on a class's state, that code should be identified as being that class's responsibility and be organized accordingly. Logic should be delegated to "low level" classes rather than accumulating in one "high level" class.

In practice, this means that **code that reads or modifies the instance variables of a class should be wrapped in an instance method on that class**. Other classes should call that method rather than manipulating the state directly.

This idea is closely related to _loose coupling_, which is discussed in chapter 3 of _Practical Object-Oriented Design in Ruby_.

### Activity: Evaluating Responsibility

As an example, here are two different implementations of a system to keep track of orders in an online shopping cart.

#### Implementation A

```ruby
class CartEntry
  attr_accessor :unit_price, :quantity
  def initialize(unit_price, quantity)
    @unit_price = unit_price
    @quantity = quantity
  end
end

class ShoppingCart
  attr_accessor :entries
  def initialize
    @entries = []
  end
end

class Order
  SALES_TAX = 0.07
  def initialize
    @cart = ShoppingCart.new
  end

  def total_price
    sum = 0
    @cart.entries.each do |entry|
      sum += entry.unit_price * entry.quantity
    end
    return sum + sum * SALES_TAX
  end
end
```

#### Implementation B

```ruby
class CartEntry
  def initialize(unit_price, quantity)
    @unit_price = unit_price
    @quantity = quantity
  end

  def price
    return @unit_price * @quantity
  end
end

class ShoppingCart
  def initialize
    @entries = []
  end

  def price
    sum = 0
    @entries.each do |entry|
      sum += entry.price
    end
    return sum
  end
end

class Order
  SALES_TAX = 0.07
  def initialize
    @cart = ShoppingCart.new
  end

  def total_price
    subtotal = @cart.price
    return subtotal + subtotal * SALES_TAX
  end
end
```

#### Prompts

Once you have read through the above code, add a file to your Hotel project called `design-activity.md`. This file will be submitted with the rest of this exercise. In that file, please respond to the following prompts:

- What classes does each implementation include? Are the lists the same?
- Write down a sentence to describe each class.
- How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
- What **data** does each class store? How (if at all) does this differ between the two implementations?
- What **methods** does each class have? How (if at all) does this differ between the two implementations?
- Consider the `Order#total_price` method. In each implementation:
    - Is logic to compute the price delegated to "lower level" classes like `ShoppingCart` and `CartEntry`, or is it retained in `Order`?
    - Does `total_price` directly manipulate the instance variables of other classes?
- If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
- Which implementation better adheres to the single responsibility principle?
- Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?

Once you've responded to the prompts, `git add design-activity.md` and `git commit`!

## Revisiting Hotel

Now that we've got you thinking about design, spend some time to revisit the code you wrote for the Hotel project. For each class in your program, ask yourself the following questions:
- What is this class's responsibility?
    - You should be able to describe it in a single sentence.
- Is this class responsible for exactly one thing?
- Does this class take on any responsibility that should be delegated to "lower level" classes?
- Is there code in other classes that directly manipulates this class's instance variables?

### Activity

Based on the answers to the above questions, identify one place in your Hotel project where a class takes on multiple roles, or directly modifies the attributes of another class. Describe in `design-activity.md` what changes you would need to make to improve this design, and how why the resulting design would be an improvement.

If you need inspiration, remember that the [reference implementation](https://github.com/droberts-ada/hotel/tree/dpr/solution) exists.

Then make the changes! Don't forget to take advantage of all the tests you wrote - if they're well structured, they should quickly inform you when your refactoring breaks something.

Once you're satisfied, `git commit` your changes and then `push` them to GitHub. This will automatically update your pull request.
