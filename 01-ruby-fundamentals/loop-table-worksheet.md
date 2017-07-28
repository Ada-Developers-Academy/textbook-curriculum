# Loop Table Worksheet!


1) Complete the following loop table by filling in the values for **loop count**, **value of x**, and **output**.

```ruby
[2,5,8,11,14].each do |x|
  puts 2 * x + 7
end
```


2) Complete the following loop table by filling in the values for **loop count**, **value of critter**, and **output**.
```ruby
["kittens", "meerkats", "red pandas"].each do |critter|
  affirmation = "I am as amazing as " + critter + "!"
  puts affirmation
end
```

3) Complete the following loop table by filling in the values for **loop count**, **value of letter**, **value of s1**, **value of s2**, and **output**.
```ruby
a = ["m", "p", "e", "u", "o", "r", "w", "r"]
s1 = ""
s2 = ""

a.each do |letter|
  if (a.index(letter))%2==0
    s1=s1+letter
    puts s1
  else
    s2=s2+letter
    puts s2
  end
end
```
