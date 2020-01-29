# Compound and Complex Conditionals
## Learning Goals
- Explore the _Truth Table_ & the _Precedence List_
- Practice expressing and evaluating complex conditions
- Practice making parse trees

## Compound Conditions
Comparisons are often combined. Combinations can take one of two forms, __&& (and)__ and __|| (or)__. When you combine with _and_, __both__ comparisons must be `true` for the entire combination to be `true`. By combining with `or`, when __either__ of the comparisons are `true`, the entire combination is `true`:

### Real world example

Imagine you need your morning coffee and a good night's sleep to have energy. This is an __&& (and)__ example. Let's consider different senarios. 

Now imagine you need either an apple or a banana in the afternoon for a snack to feel full. This is an __|| (or)__ example. Let's again consider the different scenarios.

### Truth Table
```ruby
true && true   
true && false  
false && true  
false && false 

true || true   
true || false  
false || true  
false || false 
```

<details>
<summary>
Use irb to check your answers or look at the answers hidden here.
</summary>

```ruby
true && true   # => true and true is true
true && false  # => true and false is false
false && true  # => false and true is false
false && false # => false and false is false

true || true   # => true or true is true
true || false  # => true or false is true
false || true  # => false or true is true
false || false # => false or false is false
```
</details>

Another way to write this is:

| **AND**    | **true**  | **false** |
|-------|-------|-------|
| **true**  | true  | false |
| **false** | false | false |

| **OR**    | **true**  | **false** |
|-------|-------|-------|
| **true**  | true  | true |
| **false** | true | false |

## Evaluating Compound Conditions: Understanding _Precedence_
Compound comparisons often involve a chain of expressions to be evaluated. Ruby follows strict rules when deciding the order in which expressions are evaluated. These rules can be expressed in terms of their _precedence_. __Operations with a higher _precedence_ are evaluated before operations with lower _precedence_.__ To change the order in which operations are evaluated, add parenthesis `()` around the operations you want evaluated first.

Here is an abbreviated _Precedence List_ from __highest__ to __lowest__ _precedence_:

1. (things inside parentheses)
1. `!`, `unary +`
1. `**`
1. `unary -`
1. `*`, `/`, `%`
1. `+`, `-`
1. `>`, `>=`, `<`, `<=`
1. `<=>`, `==`, `===`
1. `&&`
1. `||`

__Note:__ _unary +_ and _unary -_ here means assigning a numeric value (_Integer_ or _Float_) as either positive or negative, e.g. `-5`, `-12.2`, `+30` and `+2.0`. Thus a number with a _unary +_ is functionaly the same as a number without it. (It doesn't actually do anything.)

When evaluating a complex compound conditional expression, it is nice to visualize the resulting expression. One way to do this is by using a [parse tree](https://en.wikibooks.org/wiki/Introduction_to_Programming_Languages/Precedence_and_Associativity). A parse tree will show the way the result of higher precedence operators are passed to later operations, until you have a result.

Here is an example parse tree for the expression `4 + 1 % 2 > 2 * 3 && true`

  <details>
  <summary>
	Parse Tree
    </summary>
  <img src="images/condition-parse-tree.png" alt="condition-parse-tree">
  </details>

  Now create a parse tree for the expression `5 - 2**3 < 0 && (true || false)`

  Compare your solution with you neighbor.


## Condition Evaluation Exercise
With your neighbor(s), determine the final `boolean` output of these compound conditions. Refer to the _Truth Table_ and _Precedence List_ in the textbook resource.

When in doubt, write down your work on paper.

```ruby
# let's do these first three together
puts 5 > 4 && false
puts true && 5 * 2 > 3 + 3 * 2
puts true && 5 * 2 > (3 + 3) * 2

puts true && true || false
puts true && (true || false)
puts false && false || true
puts false && (false || true)
puts (false && false) && false && (true || false) || false

puts 4 == "4"
puts 4 == "4" || 4 == 4
puts 10 % 3 == 10.0 % 3

puts 10 * (5 / 2.0) == 10.0 * (5 / 2)
puts 10 * 5 / 2 > 10 * (5 / 2)

puts 2 * 2 ** 3 == (2 * 2) ** 3
puts (10 - 4) < +6 || -(2 * -4) > 0
```
