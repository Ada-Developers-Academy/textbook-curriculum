# Arrays and Hashes in combination
You've Dealt with variables holding a single value and you've been introduced to the concept of collections as well, but here we'll go into greater depth.  

## Learning Goals
The objectives of this unit are to make you comfortable with:
* Explaining what an Array & Hash are and the differences.
* Declaring an Array & Hash
*  Write code to access and change the values inside an Array & Hash.
*  Iterate (loop) through an Array & Hash

## Variables and Data Types
We use variables to store information that we want to access and/or change later, and they can hold different "types" of data.  Right now we know about:
* Strings
* Symbols
* Fixnums
* Float

And you've probably seen some others as well.  Each "*Data Type*" can hold a certain kind or *type* of information.  

So for example:
```ruby
name = gets.chomp()  # puts a string into name
age = 38             # puts a number into age
pi = 3.14159		 # stores 3.14159 into pi
```

However these variables can only hold one piece of information each.  That's limiting.  Often we want to store a list or group of data and perform work on it.

##Arrays and Hashes

Thus enter the *collection* types of Arrays & Hashes.  These data types can store an arbitrary list of data in a single variable.  

### Arrays

An array is a list of data and each item in the list can be accessed or *indexed* by a number.  The first element of any Array is index number 0.  You can always see the size of the Array can be accessed with the length method.  

```ruby
# declaring an Array
my_list = {"Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard", "Squirtle", "Wartortle"}

# Accessing the first element
puts my_list[0]

# check the length of the array
puts "My list has #{my_list.length} elements"
```

**Question**:  1.  How can you find the last element of the Array?

You can loop through an array like this:
```
deposits = [300, 250, 128, 64, 3016]

total = 0
# in this loop n becomes each element of the array
deposits.each do |n|
	total += n
end
```
| Loop #  |   n   |   Total   |
|---------|-------|-----------|
| 1       |  300  |    300    |
| 2       |  250  |    550    |
| 3       |  128  |    678    |
| 4       |  64   |    742    |
| 5       |  3016 |    3758   |


This loop does the same thing with slightly different syntax.  

```
deposits = [300, 250, 128, 64, 3016]

total = 0
# in this loop n becomes 0 to 4 (inclusive) and is used as the "index" of the array.
for n in 0..4 do
	total += deposits[n]
end
```
| Loop #  |   n   | deposits[n] |   Total   |
|---------|-------|-----------|--------------
| 1       |  0    |    300    |   300       |
| 2       |  1    |    550    |   250       |
| 3       |  2    |    678    |   128       |
| 4       |  3    |    742    |   64        |
| 5       |  4    |    3758   |   3016      |


**Question**: 2.  How could you write it with the *(0..n).each* type of loop?

### Hashes

A Hash is similar to an array in that it's a collection of data.  Hover to access an individual element in an Array you always use a number as a key to get to that element.

So for this list of Pokemon:
```
my_list = {"Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard", "Squirtle", "Wartortle"}
```
The Array has the following key/value pairs.

| Key | Value     |
|-----|-----------|
|  0  | Bulbasaur |
|  1  | Ivysaur   |
|  2  | Venusaur  |
|  3  | Charmander|
|  4  | Charmeleon|
|  5  | Charizard |
|  6  | Squirtle  |
|  7  | Wartortle |

However sometimes you want to access values with something other than a number.  That's where a Hash comes in.  A Hash is a way to *index* a list with keys that aren't necessarily numbers.

You can declare a Hash like this:

```
my_hash = { "Venusaur" => "Water", "Charmander" => "Fire", "Charmeleon" => "Fire", "Charizard" => "Fire", "Squirtle" => "Water", "Wartortle" => "Water" }
```

One thing to remember is that the keys must be unique.  For example in the Hash above, you couldn't use "Squirtle" to refer to another value.

You access elements in a Hash just like an array, but you need to use the keys to access it.
```
puts my_hash["Charizard"]
```

will output:

```
Fire
```

### Collections of Collections!

Where it can get interesting is when you have a collection of collections like the one below.

```
pokemon_types = {"Fire" => ["Charmander", "Charmeleon", "Vulpix", "Ninetales", "Growlithe", "Arcanine"], "Water" => ["Squirtle", "Wartortle", "Blastoise", "Psyduck", "Golduck", "Poliwag"], "Bug" => ["Caterpie", "Metapod", "Pinsir"], "Grass" => ["Tangela", "Bayleef"] }
```

And running:
```
puts pokemon_types["Fire"]
```

Will output:

```
Charmander
Charmeleon
Vulpix
Ninetales
Growlithe
Arcanine
```

And you could access "Bayleef" by doing this:
```
pokemon_types["Grass"][1]
```

**Question**: 3.  How could you look through printing each of the elements of the pokemon_types Array.  

### Looping through Hashes

Similar to an array, you can loop through a Hash like this:

```
pokemon_types = {"Fire" => ["Charmander", "Charmeleon", "Vulpix", "Ninetales", "Growlithe", "Arcanine"], "Water" => ["Squirtle", "Wartortle", "Blastoise", "Psyduck", "Golduck", "Poliwag"], "Bug" => ["Caterpie", "Metapod", "Pinsir"], "Grass" => ["Tangela", "Bayleef"] }

pokemon_types.each do |key, value|

	puts "The " + key.to_s + " type includes " + value.to_s

end

```

Will output

```
The Fire type includes ["Charmander", "Charmeleon", "Vulpix", "Ninetales", "Growlithe", "Arcanine"]
The Water type includes ["Squirtle", "Wartortle", "Blastoise", "Psyduck", "Golduck", "Poliwag"]
The Bug type includes ["Caterpie", "Metapod", "Pinsir"]
The Grass type includes ["Tangela", "Bayleef"]
```



## Reference

|  Operation     | Array    |  Hash     |
|----------------|----------|-----------|
|  initalization | arr = [] | hash = {} |
| Initialize with values | arr = ["Pikachu", "Rattata"] | hash = {"Pikachu" => "Electric", "Rattata" => "Normal" |
