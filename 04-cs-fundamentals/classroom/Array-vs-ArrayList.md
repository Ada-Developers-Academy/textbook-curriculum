# Native Array vs Linked List

## Presentation
+ [Array vs LinkedList](https://drive.google.com/open?id=1-FASrGQ1o93yk2r6iqsra1marq-D8vXerHDYdPW0PO8)

## Assignment
+ [AdaGold/list-implementations](https://github.com/AdaGold/list-implementations)

# Native Array vs Array List

## Presentation
+ [Array vs LinkedList](https://drive.google.com/open?id=1-FASrGQ1o93yk2r6iqsra1marq-D8vXerHDYdPW0PO8)

## Notes
In short, Ruby Arrays are magical and have characteristics that most programmers would not associate with an "array" (which has an implied "native" in front when used in conversation). Instead, Ruby's Arrays are similar to ArrayList in other languages (Java, C++, C#, etc) and have added functionality.

### Native Arrays
Native Arrays are:
  + fixed in size
  + contiguous blocks of memory
  + have no methods

You must specify the size when you create a native array. This size determines how large the contiguous block of memory needed must be (number of bytes for the data * number of elements to be stored). Contiguous memory means that the entire block of information is stored in memory all in a row. The fact that the information is contiguous allows us to have O(1) operations when working with the array in many cases.

Information in native arrays is accessed by indexing the array (e.g. `a[0]` or `a[i]`) and no methods are called on a native array (e.g. you cannot say `a.shuffle` or `a.first`).

So if we wanted to create an array that holds ["apple","banana","pear"] and then becomes ["apple","banana",""], we might say:

```ruby
a = ["","",""]
a[0] = "apple"
a[1] = "banana"
a[2] = "pear"
puts a.length # would return 3

# and then
a[2] = ""
puts a.length # would return 3
```

### Array Lists
A Ruby Array is like an ArrayList in other languages. ArrayLists are wrapper classes that use a native array as the underlying structure, but give added functionality by providing methods that allow you to interact with the native array without knowing all the details of what happens.

Array Lists:
  + do not have a fixed size (they resize the native array inside when needed)
  + still use contiguous blocks of memory (because the information is _actually_ stored in a native array, but this is hidden)
  + provide methods to call on an array (e.g. `add`, `delete`, `include?`, `size`, `max`)

  So if we wanted to create an ArrayList that holds ["apple","banana","pear"] and then becomes ["apple","banana",""], we might say:

  ```ruby
  a = ArrayList.new
  a.add("apple")
  a.add("banana")
  a.add("pear")
  puts a.size # would return 3

  # and then
  a.delete("pear")
  puts a.size # would return 2
  ```

### Interface vs Implementation

