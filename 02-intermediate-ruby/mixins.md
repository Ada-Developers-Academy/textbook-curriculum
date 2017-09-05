# Mixins
## Learning Goals
- Recap _object composition_
- Try out a Ruby _mixin_
- Provide extra context for how Enumerable works

## Using _modules_ to make _mixins_
A _mixin_ is a collection of methods in a _module_ that is _composed_ into a Ruby class via either `include` (for instance methods) or `extend` (for class methods). Ruby classes can by _dynamically extended_, meaning that, at any point after it is declared, a class can be re-opened and modified.

Here's an example of extending a class directly. Let's give it a try.

```ruby
class String # <= wat?!? We can do this? We sure can!
  def smiley_spaces
    self.gsub(/\s+/, " :) ")
  end
end
```

Now call `$ "Hello Smiley World!".smiley_spaces`!

Neat, right? Ruby treats all classes--whether provided by Ruby or us--as equal. They can be mixed, extended, modified, and reconstructed to our hearts' content.

### Our First Mixin
Let's take this idea and crank it up to eleven. We can create a module and then `include` it in any class we like. The methods in that module then act like they were defined there, becoming available to all instances of the class. In this way, we have created code that can be reused by many classes. Here's an example; let's put it in our sandbox and give it a spin in `irb`:

```ruby
module Messageable
  def receive_message
    puts "incoming message..."
    @inbox_count += 1
  end

  def open_message
    puts "opening a message..."
    @inbox_count -= 1
  end
end

class SMSInbox
  include Messageable

  def initialize
    @inbox_count = 0
  end
end

class EmailInbox
  include Messageable

  def initialize
    @inbox_count = 0
  end
end
```

Here, we use mixin functionality by using `include` on a module (Messageable) within a class. When we `include` a module, all of the module's instance methods become available to that class.

With this design decision, we are choosing to design classes so that they have an _acts-like_ relationship. An SMSInbox _acts-like_ it is messageable, as does an EmailInbox. Using an _acts-like_ relationship doesn't lock us down into a hierarchical relationship that inheritance/is-a relationship might.

## Conclusion
Mixins are modules of methods that are composed into a Ruby class either through `include` or `extend`. Mixins are one way that we can implement the _acts-like_ relationship described by object composition.

Mixins are what make things like `Enumerable` work. They are very powerful, but not very common.

## Additional Resources
- For more information on Enumerable, read up on it in [our chapter on Enumerable](enumerable.md) and [more Enumerable](more-enumerable.md)
- For another interesting Mixin, look up [Comparable](https://ruby-doc.org/core-2.4.0/Comparable.html)
