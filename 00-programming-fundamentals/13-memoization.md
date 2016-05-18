# Memoization
## Learning Goals
- Discuss the tradeoffs between _time_ and _space_ complexity.
- Try to break Jeremy's computer
- Make the thing work with _memoization_
- Determine the 500th Fibonacci number.

## Memoize it!
In computing, __memoization__ is an optimization technique used primarily to speed up computer programs by _storing the results of expensive function calls and returning the cached result when the same inputs occur again_. Thanks Wikipedia!

In this sense, we are trading _time complexity_ (hard things takes lots of time) for _space complexity_ (storing the results of an expensive operation so we don't have to do it again). So storing the result of an expensive operation so it can be referenced later is referred to as _memoizing_ the operation. Most real-world, problem-solving algorithms/processes try to balance these two concerns.

## Let's do something hard.
The Fibonacci Sequence is one of those observations of the natural world that pops up all over the place: nature, art, science, programmer whiteboarding invterviews, and recurion examples.

Math nerds tell me that to find the *n*th place in the Fibonacci sequnce, you have to add the two preceeding numbers together. So Fibonacci looks like this:

```
1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 114, 203...
```

Math nerds define this sequence with something like `f(n) = f(n-1) + f(n-2)`, which looks like something we could program using recursion:

```ruby
def fib(num)
  return num if num <= 1 # base case f(0) and f(1) both equal 1.
  return fib(num - 1) + fib(num - 2) # recursive case
end
```

Let's use this to trace out `fib(5)`:

```
fib(5) =             fib(4)               +                fib(3)
                       /\                                    /\
                fib(3) + fib(2)                       fib(2) + fib(1)
                  /        \                            /        \
       fib(2) + fib(1)   fib(1) + fib(0)     fib(1) + fib(0)      1
         /        \        /        \          /        \
fib(1) + fib(0)    1      1          0        1          0
  /        \
 1          0

 fib(5) = 1 + 0 + 1 + 1 + 0 + 1 + 0 + 1
 fib(5) = 5
```

Oof! That's a lot of recursive calls. If we modify our `fib` method, we can keep track of how many recursive calls we are making when calculating a Fibonacci number:

```ruby
class FibCounter
  # make it an accessor so we can reset it between calculations
  attr_accessor :calls

  def initialize
    @calls = 0
  end

  def fib(num)
    # every time we call this method, let's increment the calls counter
    @calls += 1
    return num if num <= 1
    return fib(num - 1) + fib(num - 2)
  end
end
```

Now we can initialize a new `FibCounter` to do the work and then check exactly how much work it was:

```ruby
fibber = FibCounter.new
fibber.fib(10) #=> 55
fibber.calls #=> 177 
```

Dang! 177 recursive calls to get the 10th Fibonacci number. Ok, what about the 40th? Let's keep track of each call along the way:

```ruby
require 'colorize' # remember this?
(1..40).each do |num|
  fibber.calls = 0 # reset the counter
  puts "The fib of #{ num.to_s.blue } is #{ fibber.fib(num).to_s.green }. We called fib #{ fibber.calls.to_s.red } times."
end

# The fib of 1 is 1. We called fib 1 times.
# The fib of 2 is 1. We called fib 3 times.
# The fib of 3 is 2. We called fib 5 times.
# ...
# The fib of 38 is 39088169. We called fib 126491971 times.
# The fib of 39 is 63245986. We called fib 204668309 times.
# The fib of 40 is 102334155. We called fib 331160281 times.
```

Double dang! How are we ever gonna get to the 500th number in the sequence?

## Memoize it!
So calculating Fibonacci numbers is really expensive! Let's not invoke that expense unless we have to. By _memoizing_ the calculated values, we can avoid paying the cost of a single calculation multiple times. Instead of figuring out `fib(n)` everytime we encounter `n`, let's stash the result in a hash:

```ruby
class MemoFib
  attr_accessor :calls, :memo_hash

  def initialize
    @calls = 0
    @memo_hash = {
      0 => 0,
      1 => 1
    }
  end

  def fib(num)
    @calls += 1

    # new base case!
    return memo_hash[num] if memo_hash.has_key?(num)
    
    #and here comes the recursion!
    memo_hash[num] = fib(num - 1) + fib(num - 2)
  end
end
```

We changed the base case! That and the `@memo_hash` make this class much more adept at calculating Fibonacci numbers. Now, we look in `@memo_hash` to see if we've calculated a specific Fibonacci number before. If we have, we return it. If we haven't, we set up a recursive call to figure it out __and__ store the result in `@memo_hash`.

Let's see how this alters the number of recursive calls we have to make:

```ruby
fibber = MemoFib.new
fibber.fib(10) #=> 55
fibber.calls #=> 19 
```

Same answer, but only 19 recursive calls instead of 177! That's a pretty significant savings. And it keeps going. Check this out:

```ruby
fibber.fib(11) #=> 89
fibber.calls #=> 22
```

Calculating the next number in the sequence only took __3__ additional calls to `fib`. How is that possible? Let's look at the state of `@memo_hash` at this point:

```ruby
fibber.memo_hash #=> {0=>0, 1=>1, 2=>1, 3=>2, 4=>3, 5=>5, 6=>8, 7=>13, 8=>21, 9=>34, 10=>55, 11=>89}
```

In the process of calculating `fib(10)`, the code _memoized_ values in the sequence as it went. This means that we only ever calculated those values once. Here's what happened when we asked for `fib(11)`:

1. The code checked `@memo_hash` for a key of `11`, but it didn't have one.
2. So it set up the recursive case, which...
  3. Set the key of `11` in `@memo_hash` to the result of `fib(10) + fib(9)`
  4. Those recursive calls each checked `@memo_hash` for keys of `10` and `9`, respectively.
  5. Those keys existed in the hash, so the code returned their values. No further recursion necessary!
6. So `fib` was called a total of three times: once for `fib(11)`, which triggered O(1) lookups on `fib(10)` and `fib(9)`.
7. Finally, the value for `fib(11)` was stored in `@memo_hash`, just in case we ever need it again.
7. Wow!

__Question: So, what's the 50th Fibonacci number? The 100th? The 500th?__
