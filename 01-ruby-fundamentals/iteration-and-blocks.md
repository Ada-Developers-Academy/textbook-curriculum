# Iteration & Blocks
## Learning Goals
- Learn what _Iteration_ is and how to do it.
- Learn what _Blocks_ are and how to recognize them.
- Use a _Loop Table_ to clarify how values change over the course of an iteration.

## Iteration
_Iteration_ is the process of systematically interacting with a collection of values, one at a time. We call it "looping" sometimes, and we do a lot of it. Here is a simple loop; fire up irb and give it a try:

```ruby
10.times { |n| puts n } # So... what happened
```

__Question: What is `times`?__

We can iterate all kinds of things, but probably the most common and most fun is iterating an _Array_. They're especially suited for iteration because they, by default, have a objective order to their elements. Here's an example of iterating an _Array_ using the `each` _method_:

```ruby
[10, 20, 30, 40, 50].each do |number|
  puts number * 10
end
```

Cool, right? `each` iterated the _Array_, starting with the first value, multiplied the value by 10, and spit it out. It knew what to do on each step of the iteration because we provided a _block_ of instructions.

### Let's talk about Blocks...
Blocks are not a unique features of Ruby, but they're defs one of my favorite. What is a block? Documentation says a block is:

>A section of code which is grouped together.

Kay.....

A block is a set of code that is not executed immediately, but is stored in a variable or passed to a method, and is potentially executed at a later moment in time.

```ruby
[1,2,3,4].each do |number|
  puts number * 100 # <= this is a block. :)
end

[1,2,3,4].each { |number|
  puts number * 100 # <= this is a block too! :D
}
```

`number * 100` is a chunk of code, similar to what would be in a method, but there's not a method called `multiply_by_one_hundred`, so we provide our own code to be performed during each iteration of the loop.

Block can be identified by either `do ... end` or `{ }`.

Block arguments are defined using a pair of `|` (pipe) characters. They look like a slide, so I like to say that we slide arguments into the block. For example:

```ruby
[1,2,3].each do |number|
  puts number # wheeeee! Right down the slide!
end
```

`number` is the defined argument, this means that objects given to the block are going to be assigned to the `number` variable within the scope of the block.

### Exercise: Walk Through a Loop:
It's critically important to understand what's happening during iteration. The best way to get comfortable with loops is to make a chart showing how values change during iteration. Here's an example of a loop and it's corresponding value chart:

```ruby
[11,5,8,100].each do |n|
  puts n * 4
end
```

| loop count | value of n | output |
|------------|------------|---------
| 1          | 11         | 44
| 2          | 5          | 20
| 3          | 8          | 32
| 4          | 100        | 400


With a pair, figure out what's happening on each iteration of the following loop, on paper, using the handy table template:

| loop count | value of x | value of y | output |
|------------|------------|------------|---------
| | | |
| | | |

You'll need more rows, but you get the idea.

```ruby
y = 0
[9,8,7,6,5,4,3,2,1].each do |x|
  if x % 2 == 0
    y = y + x
    puts y
  else
    puts x
  end
end
```
