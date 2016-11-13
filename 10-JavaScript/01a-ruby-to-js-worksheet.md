# Ruby to JavaScript Worksheet
Read the code in each section, then write the equivalent JavaScript code for the Ruby that is given. Start by writing it out in a text editor or on a piece of paper. Then try running it and tweak your code until it successfully runs with expected output.

Each problem stands alone. Variables from previous problems do not exist.

## Problem Set
1.
```ruby
person_age = 55
ada_age = 2

if person_age < ada_age
   print "This person is younger"
elsif ada_age < person_age
   print "Ada is younger"
else
   print "They’re the same!"
end
```

2.
```ruby
x = 7
y = 7

if x > y || x == y
   if x > y
      print "x is bigger"
   else
      print "x = y"
   end
else
   print "y is bigger"
end
```

3.
```ruby
10.times do |i|
  puts i * i
end

```

11.
```ruby
(1..3).each do |i|
  puts i * i
end
```

4.
```ruby
total = 0

(1..3).each do |i|
  total = total + i
end

puts total
```

5.
```ruby
i = 0

while i < 3
  puts “hi”
  i = i + 1
end
```

6.
```ruby
i = 0

while i < 3
  puts “hi”
  i = i + 1
end

puts "bye"
```

7.
```ruby
fruits = ["banana", "apple", "kiwi"]
fruits.each do |fruit|
  puts "I love " + fruit + "!"
end
```

8.
```ruby
total = 0
values = [4, 6, 2, 8, 11]

values.each do |value|
    total = total + value
end

puts total
```

9.
```ruby
values = [8, 5, 3, 10, 14, 2]
values.each do |value|
  if value == 10
    puts "Special case!"
  else
    puts "Regular values like #{value}"
  end
end
```
