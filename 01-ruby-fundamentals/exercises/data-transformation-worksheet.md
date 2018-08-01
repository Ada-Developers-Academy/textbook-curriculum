# Data Transformation Worksheet

Make a new ruby file in any directory, named anything with a ruby file extension, such as `data-transformation.rb`.

Write Ruby code such that you can execute it from the command line with `$ ruby data-transformation.rb`.

This assignment will not be turned in, but will be reviewed.

# Part 1

## Iterating through Arrays

For each of the following problems, write the code to solve the problem. Each solution should be structured as a method that takes an array as a parameter and returns the result. **You should use the `Array#each` method to solve each problem.**


1. You are given an array of `String` objects, stored in a variable called `my_strings`. You want to use this array to create a new array of `Integer` objects, which represents the `length` of each string. We want to store the resulting array in a variable called `string_lengths`.
    <!-- MAP/COLLECT -->

1. You are given an array of `Integer` objects, stored in a variable called `my_nums`. You want to use this array to create a new array which contains `String` objects, which say "even" or "odd" depending on the `Integer` in the original array.
    <!-- MAP/COLLECT -->

1. You are given an array of `String` objects, stored in a variable called `my_strings`. You want to create a new array which only contains the strings from the original array that have a length that is smaller than 4. We want to store the resulting array in the original `my_strings` variable, overwriting the original value.
    <!-- REJECT! -->

1. You are given an array of `String` objects, stored in a variable called `my_strings`. You want to use this array to return the `String` that has the longest length. (In a tie, it should return the first `String` with the longest length)
    <!-- MAX_BY -->

## Transforming Arrays into Hashes

1. Given this array of `String` names, return an array of Hashes. Each Hash should have the keys `name` and `id`, which will represent their unique identifier in the form of an integer. The ids can start at `1` and then go up by one.

```ruby
names = ['Grumpy', 'Happy', 'Sleepy', 'Bashful', 'Sneezy', 'Dopey', 'Doc']

# => [{:name=>"Grumpy", :id=>1},
# {:name=>"Happy", :id=>2},
# {:name=>"Sleepy", :id=>3},
# {:name=>"Bashful", :id=>4},
# {:name=>"Sneezy", :id=>5},
# {:name=>"Dopey", :id=>6},
# {:name=>"Doc", :id=>7}]
```

2. Given this array of `String` names and this array of `String` specialties, return an array of Hashes. Each Hash should have the keys `name`, `specialty`, and `id`, which will represent their unique identifier in the form of an integer. The ids can start at `1` and then go up by one.

```ruby
names = ['Grumpy', 'Happy', 'Sleepy', 'Bashful', 'Sneezy', 'Dopey', 'Doc']
specialties = ['grump', 'smile', 'nap', 'blush', 'sneeze', 'goof', 'contemplate']

# => [{:name=>"Grumpy", :specialty=>"grump", :id=>1},
# {:name=>"Happy", :specialty=>"smile", :id=>2},
# {:name=>"Sleepy", :specialty=>"nap", :id=>3},
# {:name=>"Bashful", :specialty=>"blush", :id=>4},
# {:name=>"Sneezy", :specialty=>"sneeze", :id=>5},
# {:name=>"Dopey", :specialty=>"goof", :id=>6},
# {:name=>"Doc", :specialty=>"contemplate", :id=>7}]
```

3. Given these two arrays of strings, write code that returns an array of arrays. Each element in the larger array should have two elements: the first element is the name, and the second element is the specialty.

```ruby
names = ['Grumpy', 'Happy', 'Sleepy', 'Bashful', 'Sneezy', 'Dopey', 'Doc']
specialties = ['grump', 'smile', 'nap', 'blush', 'sneeze', 'goof', 'contemplate']

# => [["Grumpy", "grump"], ["Happy", "smile"], ["Sleepy", "nap"], ["Bashful", "blush"], ["Sneezy", "sneeze"], ["Dopey", "goof"], ["Doc", "contemplate"]]
```

## More Transformations

1. Given this array of hashes, iterate through the array and return an array of strings. Each string should be in the following format: `Grumpy's specialty is to GRUMP`, where `Grumpy` is replaced with each name and `GRUMP` is the specialty in capital letters.

```ruby
characters = [{:name=>"Grumpy", :specialty=>"grump", :id=>1},
 {:name=>"Happy", :specialty=>"smile", :id=>2},
 {:name=>"Sleepy", :specialty=>"nap", :id=>3},
 {:name=>"Bashful", :specialty=>"blush", :id=>4},
 {:name=>"Sneezy", :specialty=>"sneeze", :id=>5},
 {:name=>"Dopey", :specialty=>"goof", :id=>6},
 {:name=>"Doc", :specialty=>"contemplate", :id=>7}]

# => ["Grumpy's specialty is to GRUMP",
# "Happy's specialty is to SMILE",
# "Sleepy's specialty is to NAP",
# "Bashful's specialty is to BLUSH",
# "Sneezy's specialty is to SNEEZE",
# "Dopey's specialty is to GOOF",
# "Doc's specialty is to CONTEMPLATE"]
```

---

# Part 2

Don't do this part until going through the `Enumerable` lectures.

## Using `Enumerable` methods

Rewrite each solution in the section "Iterating through Arrays"

### Bonus

Is there a method from `Enumerable` you can use to solve #3 in "Transforming Arrays into Hashes"? Hint: it is _**not**_ a method covered in the class's Jigsaw activity.

## Conclusion

1. What went well?
1. What was challenging?
1. Which problems were easier? Why?
1. What strategies made the problems easier?
1. What are some differences between arrays and hashes that you learned?
