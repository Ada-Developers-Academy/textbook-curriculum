# let's do these first three together
puts 5 > 4 && false
answer = false
puts true && 5 * 2 > 3 + 3 * 2
answer = true
puts true && 5 * 2 > (3 + 3) * 2
answer = false

puts true && true || false
answer = true
puts true && (true || false)
answer = true
puts false && false || true
answer = true
puts false && (false || true)
answer = false
puts (false && false) && false && (true || false) || false
answer = false

puts 4 == "4"
answer = false
puts 4 == "4" || 4 == 4
false = true
puts 10 % 3 == 10.0 % 3
#i chose false here before checking in the command line
answer = true

puts 10 * (5 / 2.0) == 10.0 * (5 / 2)
#oops. i again chose the wrong boolean. need to work on integer and float conversions
answer = false
puts 10 * 5 / 2 > 10 * (5 / 2)
answer = true

puts 2 * 2 ** 3 == (2 * 2) ** 3
answer = false
puts (10 - 4) < +6 || -(2 * -4) > 0
answer = true
