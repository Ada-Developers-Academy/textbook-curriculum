# Condition Evaluation Worksheet
With your chair pair, determine the final `boolean` output of these compound conditions. Refer to the _Truth Table_ and _Precedence List_ [here](compound-and-complex-conditionals.md).

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
