# Introduction to Hash Tables

## Learning Goals

By the end of this lesson you should be able to:

- Explain the uses of a Hash table
- Explain the concept of a hashing function and the criteria for a good hashing function
- Explain the concept of a Collision and Collision handling schemes including:
  - _linear probing_
  - _separate chaining_
  - _quadratic probing_
  - _double hashing_
- Use a hash table to solve a coding problem
- Choose between a hash table, binary search tree, linked list or array to solve a programming problem.

## Introduction

In practical programming we often spend much more time looking data up in a data structure as opposed to inserting or removing data.  A typical example is a grocery store.  At the checkout point we need to quickly recognize items and look up their prices in order to ring up a bill.  In ye olde days employees often had to memorize the prices of each item.  This worked in small shops, and was supplemented by price tags.  However stores have grown and price tags can fall off or prices change after an item is tagged.  Today most items have been given a unique key called a [Universal Product Code (UPC)](https://en.wikipedia.org/wiki/Universal_Product_Code#targetText=UPC%20(technically%20refers%20to%20UPC,of%20sale%2C%20per%20GS1%20specifications.).  The software at the point of sale regularly need to look up items from their UPC codes and retrieve the current price.  

![cash register](images/cash-register.jpg)

The systems could use an array to store the data with Log<sub>2</sub>(n) retrieval times, or a binary search tree of the data, but in that case for `m` lookups and a universe of `n` products it would take O(mlog<sub>2</sub>n) to complete a transation.  It would be better to reduce the lookup time to a constant and the entire transaction to O(m).

This is where hash tables come in.  Hash tables reduce lookup times O(1) or constant time.  They do this by trading space complexity for time complexity.

## Hash Table Overview

A hash table is essentially a generalization of an array.  Each element has a _key_ and _value_.  The key is a unique identifier for the element and can be used to quickly retrieve the value from the table.  In the same way an index number can be quickly used to retrieve an element from an array.  However a key can be any type of value, a string, a number, or any other kind of object.  

![hash table](images/hash-table.png)

A hash table is built on an array.  When given a key value, the hash table applies a function called a _hash function_ to the key resulting in a number between 0 and the length of the array.  The hash table then uses that value to either look up or place the item into an element the array known as a _bucket_.  A bucket is the term used for each element of the hash table's internal array used to store data.

To summarize the image above, given a key, a hash function is run resulting in an index number used by the hash table to identify the bucket used to store the information.

Hash tables are also often called:

- _Dictionaries_ because like a dictionary is used to look up a definition from a word, in a hash table a key is used to look up a value.  This is a term used in Python.
- _Hash Map_ because the hash function helps map an item to it's location in a table.

Hash tables perform relatively well in terms of Big-O

| Operation | Hash Tables (average) | Hash Tables (Worst) | Arrays | Linked Lists
| --- | ----------- |--- |--- |--- |--- |
| Search by key/index | O(1) | O(n) | O(1) | O(n) |
| Insert | O(1) | O(1) | O(n) | O(1) |
| Delete | O(1) | O(n) | O(n) | O(1) |

Notice the linear worst-case performance of a hash table.  We will address this when we discuss the hashing function.


## Hashing Functions

The key, no pun intended, to a hash table is the hashing function.  The hashing function is used to convert any key to a number.  That number can then be used to find an index in the internal array used by the hash table.

To be useful a hash function must satisfy a few criteria:

- **The hash function must be consistent.** if the hash function of key k, `h(k)` results in a number it should always result in the same number.
- **The hash function should (mostly) map different keys to different values** - we want to avoid situations where two keys map to the same index in the array.
  - This is even better if the hash  function distributes elements uniformly across the collection.
- **The hash function should execute in constant time** - The hashing function should scale well and execute relatively quickly.

When a hashing function assigns two different keys to the same bucket, this is known as a _collision_.  Hash tables work most efficiently, as we will see, the fewer collisions they have.

Unfortunately there is no universal hashing function which can take any type of key and guarantee that collisions do not occur and in fact there is no guarantee the hashing function will not cause **every** key in a given application to collide.  This is why hashing functions are known as _heuristics_.  Heuristics are algorithms which work practically well, but may have a mathematically possible worst-case which is unattractive.

#### The Division Method

#### The Multiplication Method

## Collisions

## Collision Resolution

## Sample Problem

## Summary

Hashes are one of the most practically useful data structures you will encounter.  They make a great many problems easier and with lower time complexity.  You will also likely **never** have to create a hash table data structure yourself, but you will need to know their practical applications and be able to discuss how they function.

There are many ways to structure a hash table.  One of the most common is simple chaining with each element of the internal array or _bucket_ referencing the beginning of a linked list.  Alternative solutions include _dynamic arrays_ which use arrays to store the elements in each bucket and open addressing using either _linear probling_, _quadratic probing_ or _double hashing_.  

## Side Note

Ruby actually [uses an array](https://launchschool.com/blog/how-the-hash-works-in-ruby#targetText=Conclusion,in%20Java%2C%20Python%20or%20Ruby) for hashes smaller than 6 items.  It has been found to be faster than using a more complicated data structure for small datasets.

## Resources

- [Basecs on Hash Tables: Taking Hash Tables Off The Shelf](https://medium.com/basecs/taking-hash-tables-off-the-shelf-139cbf4752f0)
- [Basecs: Hashing Out Hash Tables](https://medium.com/basecs/hashing-out-hash-functions-ea5dd8beb4dd)
- [How the Hash works in Ruby](https://launchschool.com/blog/how-the-hash-works-in-ruby#targetText=Conclusion,in%20Java%2C%20Python%20or%20Ruby)
