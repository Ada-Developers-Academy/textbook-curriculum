# Understanding Function Calls

## Learning Goals

By the end of this lesson you should be able to

- Explain how function calls work
- Explain the terms
  - Pass by reference
  - Pass by value
  - Call stack
  - Recursive Function
- Correctly identify the time and space complexity of small recursive functions

## Video Lesson

- [Video Lesson]()
- [Slides Used]()
- [Assignment](https://github.com/Ada-C12/recursion-tracing)

## Introduction

## Exercise

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

## Pass By Reference & Pass By Value

## Recursion

## Resources

- Read more on [References and mutability in Ruby](https://launchschool.com/blog/references-and-mutability-in-ruby) by LaunchSchool
- Read more on [Mutating and non-mutating methods in Ruby](https://launchschool.com/blog/mutating-and-non-mutating-methods) by LaunchSchool
- Revise lesson on [Reference and values](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/02-intermediate-ruby/references-and-values.md)