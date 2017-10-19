# Understanding function calls
## Learning Goals
+ Understand how function calls work
  + Understanding how the language works is key (pass by reference, pass by value, a combination, mutable and non-mutable types)
  + Call stack
  + What is a recursive function

## Assignments
Understand the code below. What do you expect to see in the console output? When do you expect the object_ids to change verses remain the same?
```ruby
def peek_add_ten(number)
  puts "In peek_add_ten: #{number.object_id}"
  number = number + 10
  puts "Number is now: #{number}"
  puts "On adding in peek_add_ten: #{number.object_id}"
  return
end

def add_ten(number)
  puts "In add_ten: #{number.object_id}"
  number = number + 10
  puts "Number is now: #{number}"
  puts "On adding in add_ten: #{number.object_id}"
  return number
end

# Main code logic
result = 10
puts "Original value: #{result}"
puts "Object id is: #{result.object_id}"

peek_add_ten(result)
puts "After peek_add_ten value is: #{result}"
puts "Object id is: #{result.object_id}"

result = add_ten(result)
puts "After add_ten value is: #{result}"
puts "Object id is: #{result.object_id}"
```
Now, copy over this code and try it out in the console. Did your expectations match what the console output showed?
Learn more by reading [Object passing in Ruby](https://launchschool.com/blog/object-passing-in-ruby) by LaunchSchool.

## Additional Resources:
- Read more on [References and mutability in Ruby](https://launchschool.com/blog/references-and-mutability-in-ruby) by LaunchSchool
- Read more on [Mutating and non-mutating methods in Ruby](https://launchschool.com/blog/mutating-and-non-mutating-methods) by LaunchSchool
- Revise lesson on [Reference and values](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/02-intermediate-ruby/references-and-values.md)

## Slide Deck
+ Slide Deck used in class</br>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://drive.google.com/file/d/0B__DV26QHsH4bWJmS1A0QXBad1U/view?usp=sharing">Introduction to Recursion</a></span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</br>
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a>
