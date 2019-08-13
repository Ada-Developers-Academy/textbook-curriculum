# Debugging Warmup

In pairs, on one machine, copy and paste the code into VSCode.
Without editing the file at all, use pry to do the following:
- output value of "thing" before do_part_1
- output value of "thing" before do_part_2
- output value of "thing" after do_part_2
- output the value of "value" within do_part_1
- output the value of "value" within do_part_2
- before my_number is multiplied by "value", change "value" to 0

```ruby

require 'pry'

def do_something(thing)
  binding.pry
  thing = do_part_1(thing)
  thing = do_part_2(thing)
  return thing
end

def do_part_1(thing)
  value = 6
  thing[:my_number] = thing[:my_number] * value
  return thing
end

def do_part_2(thing)
  value = 2
  thing[:my_number] = thing[:my_number] ** value
  return thing
end

do_something({my_number: 4})
```

## Related Lesson
[Debugging with Pry](Description:https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/02-intermediate-ruby/debugging.md)