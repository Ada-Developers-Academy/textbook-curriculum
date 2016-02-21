# More About Classes: Using Hashes and Establishing Default Values
## Learning Goals
- Revisit `Hash` objects
- Learn how a `Hash` can make our Ruby classes easier to manage

## Hashes: A Quick Refresher
Hashes in Ruby are used often to represent a collection of data that is dissimilar structurally, but is also contextually related. This often happens when we get some type of input from an outside source. This could come in many different formats such as JSON, XML, YAML, or CSV.

For example if we have some data:

| name              | email                                   |
|:----------------- |:----------------------------------------|
| Jeremy Flores     | jeremy@adadevelopersacademy.org
| Kari Bancroft     | kari@adadevelopersacademy.org

Each line of this table could be represented as a `Hash`, using the table headers as _keys_:

```ruby
person1 = {name: "Jeremy Flores", email: "jeremy@adadevelopersacademy.org"}
person2 = {name: "Kari Bancroft", email: "kari@adadevelopersacademy.org"}
```

A further optimization would be to represent this data as an `array` of `hash` objects:

```ruby
people = [
  { name: "Jeremy Flores", email: "jeremy@adadevelopersacademy.org" },
  { name: "Kari Bancroft", email: "kari@adadevelopersacademy.org" }
]
```

A Hash _key_ can have any object as its _value_, even another Hash.

```ruby
{ jeremy: # this is the key
  { # this entire hash is the value
    last_name: "Flores",
    first_name: "Jeremy",
    address: {
      street: "123 fake st",
      city: "Seattle",
      state: "WA"
    },
    pets: [
      {
        name:    "Rosalita",
        species: "dog"
      },
      {
        name:    "Raquel",
        species: "cat"
      }
    ]
  }
}
```

## Using `Hash` to initialize class objects
A `Hash` is a great way to pass in arguments to the `initialize` method of a `Class`. Have a look at this Class:

```ruby
class Address
  def initialize(first_name, last_name, street_one, street_two, city, state, country, postal_code)
    @first_name  = first_name
    @last_name   = last_name
    @street_one  = street_one
    @street_two  = street_two
    @city        = city
    @state       = state
    @country     = country
    @postal_code = postal_code
  end
end

Address.new("Jeremy","Flores","123 Fake St.","Apt Yes","Seattle","WA","USA","98115")
```

__Question: What happens if you don't have a `street_two` attribute?__

Let's try this again. This time, let's initialize using a `Hash`:

```ruby
class Address
  def initialize(address_hash)
    @first_name  = address_hash[:first_name]
    @last_name   = address_hash[:last_name]
    @street_one  = address_hash[:street_one]
    @street_two  = address_hash[:street_two]
    @city        = address_hash[:city]
    @state       = address_hash[:state]
    @country     = address_hash[:country]
    @postal_code = address_hash[:postal_code]
  end
end

Address.new(first_name: "Jeremy", state: "WA")
```

Using a hash to provide parameters to an `initialize` method lets us omit parameters that may not exist for some instances. It also adds clarity to `class` instantiation by explicitely stating keys and values.

```ruby
# not using a hash to initialize
Address.new("Jeremy","","","","WA","","")

# now with a fancy hash!
Address.new(first_name: "Jeremy", state: "WA")
```
