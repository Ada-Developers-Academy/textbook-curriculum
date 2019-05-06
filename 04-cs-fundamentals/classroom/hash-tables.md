# Hash Tables

## Objectives

By the end of this lesson you should be able to:

- Explain the terms
  - _hash table_
  - _hash function
  - _collision_
- Explain at a high-level how Hash Tables work
- Explain some of the trade-offs involved in using hash tables

## Hash Tables Overview

In our programs we often need to store data and need a quick way to look up specific items.  We could store elements in an array, but finding specific entries in an array require looping through potentially the entire list an O(n) operation, or maintaining the list in order.

A _hash table_, also known as a _dictionary_, is an implementation of an _abstract data type_ known as an _associative array_ a data structure designed to store key-value pairs and provide a method to look up a value from it's key.  

A hash table applies keys to a special method known as a _hash function_ which converts the key into an index in an array.  The hash table then stores the key-value pair into that location.

<!-- Lucidchart link  https://www.lucidchart.com/invitations/accept/5fdcf503-7d8b-4139-94d4-795bfed27883 -->

![Hash Function Example](images/hash-function.png)

You have already used hashes quite a bit and we know the following runtimes of a hash table.  

| Action | Average Case | Worst Case | 
|---|---|---|
| find(key) | O(1) | O(n)
| remove(key) | O(1) | O(n)
| insert(key, value) | O(1) | O(n)

Note the **worst-case**  runtimes, because **normally** when we estimate the runtime of a data structure's methods with Big-O we assume the worst-case.  However a well-designed hash table, will attempt to prevent the worst-case scenario from occurring.  Therefore when we work with hash tables we **assume the average-case**.  The likelyhood of the worst-case from occurring depends on how well the **hash function** is implemented.

### Hash Function

All __hash functions__ are used to map keys to indices in the storage array.  Good hash functions attempt to spread all possible values over the entire data structure and avoid assigning multiple keys to the same index.

Designing a good hash function is something of a black art as there is no mathematical formula that will work perfectly in all cases.  Instead we use practical general-purpose functions which work well in most cases.  This type of algorithm is often called a _heuristic_.  A Heuristic in Computer Science is a practical solution which works in most cases, but is not mathematically proven to work well in all cases.

However because there is an enormous list of possible keys and a limited-size array, any hash function will result in some keys mapped to the same index.  When this occurs it is called a _collision_.  

### Resolving Collisions

There are many ways to resolve a collision, one way is to make each element of the hash array a collection and store new elements in the next field in the collection.

For example if I calculated a hash function by converting any key to a string and calculated the length, I could use that number to find an index in my array.  However since the length can be of arbitrary size I can divide the length by the size of my array and take the remainder.  Then the number would be between 0 and the length of the array.

```ruby
  def hash_code(key)
    return key.to_s.length % @array.length
  end
    
```

If I attempted the following:

```ruby
  my_hash = MyHash.new
  my_hash["Dan"] = "Lead Instructor"
  my_hash["Chris"] = "CS Fun Instructor"
  my_hash["Dee"] = "Instructor Extraordinaire"
  my_hash[356] = "A big number"
```

We will end up with a hash which looks like this:  

![Bad hash function example](images/Example-hash.png)

In this example we resolve collisions by creating an array at each index of the main array and adding the key-value pair to the end of the list.  As you can see if the hash function does not adequately spread values out over the length of the array, this can result in long chains of key-value pairs and an O(n) worst-case runtime to find items.

Luckily most libraries use well-proven hashing functions which normally prevent high numbers of collisions.  


## How Ruby's Hash Tables Work

Ruby uses the [MurmurHash3](https://github.com/aappleby/smhasher/wiki/MurmurHash3) hash function to convert any key into a number, and divides that number by the length of the array saving the remainder.  That remainder then becomes the index.  

`index = murmur_hash(key) % array.length`

When a Ruby hash has a collision it is chained similar in a manner similar to the example above.  When there are too many collisions (more than 5) Ruby then rebuilds the hash table, making it bigger and then re-hashing (recalculates the index for each key-value pair) all the entries.  This does mean there is some practical performance overhead when a hash reaches a certain size and needs to expand.

For small hashes Ruby simply uses an array because for small numbers of elements, an array is faster than the more complicated hash-table data structure.

### Ruby's Hash Maintains Order

One neat feature of Ruby hashes since 1.9 is that hashes maintain order.  When you loop through a Ruby hash, you iterate through the key-value pairs in the order they were inserted.  This is very useful for **a number of whiteboarding problems**.

## Summary

Hash Tables are a data structure which allows quick lookup of a value by using a key.  Each key is mapped to an index of an internal array with a special method called a _hash function_.  The average-case lookup is O(1) and worst-case is O(n).  However most good implementations use a _hash function_ which attempts to uniformly distribute elements and prevent collisions.

## Key Terms

| Term | Definition
|---|---
| Hash Table | A Data structure implementing an Associative Array which maps unique key identifiers to values.  A well designed Hash table has an O(1) lookup time.
| Hash Function | A function used by a hash table to map a key to an index in the array used to store the data.
| Collision | When multiple keys map to the same element in the Hash Table's internal array.

## Resources

- [How the hash works in Ruby](https://launchschool.com/blog/how-the-hash-works-in-ruby) - From Lauchschool
- [Basics of Hash Tables](https://www.hackerearth.com/practice/data-structures/hash-tables/basics-of-hash-tables/tutorial/) - HackerEarth