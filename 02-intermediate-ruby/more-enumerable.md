# More Enumerable: Hashes
## Learning Goals
- Discover how Enumerable functions when enumerating a Hash object
- Practice expressing object relationships with Enumerable methods.

## Enumerable is _mixed in_ to Hash
As long as a class implements the `each` method, it can _mix in_ Enumerable. In human terms, this means that if an object type consists of a collection, and each item in that collection is distinct, then it can be enumerated (counted, differentiated, separated, etc.). But how does a Hash, which is explicitly not ordered, implement `each`?

By converting the key:value pairs into an array! We can access the key and value data by _de-structuring_ the array in the block. Here's an example:

```ruby
h = {
  first_key: "first_value",
  second_key: "second_value",
  elephant: "hotdog"
}

h.each do |key, value|
  puts "The key is #{key} and the value is #{value}."
end
```

This outputs:
```
The key is first_key and the value is first_value.
The key is second_key and the value is second_value.
The key is elephant and the value is hotdog.
```

### Hash Practice
With your seat squad, create a file called `enum-hash.rb`. Open it in your editor and add this code:

```ruby
# enum-hash.rb
scores = {
  jeremy: [10, 20, 34, 55, 86],
  been:   [11, 27, 95, 45, 33],
  raquel: [15, 54, 23, 22, 57],
  rosa:   [5, 3, 7, 77, 34]
}
```

Use Enumerable methods to answer the questions below. After we've had some time to explore, we'll review solutions as a class.

**Questions**
1. Who has the single highest score (and what is that score)?
1. Who has the highest *average* score (and what is that average)?
    - Average is the sum of scores divided by the number of scores
1. Who has the biggest difference between their highest and lowest score (and what is that difference)?
