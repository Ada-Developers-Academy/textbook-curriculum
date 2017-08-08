# Hashes, Classes, and You
## Learning Goals
- Revisit `Hash`es
- Compare and contrast `Hash`es and objects

## Hashes: A Quick Refresher

Hashes in Ruby are used often to represent a collection of data that is dissimilar structurally, but is also contextually related. This often happens when we get some type of input from an outside source, like when we read from a file or pull data from the internet. This data may be come in a variety of formats such as JSON, XML, YAML, or CSV.

For example if we have some data:

Name              | Email
---               | ---
Charles Ellis     | charles@adadevelopersacademy.org
Kari Bancroft     | kari@adadevelopersacademy.org

Each line of this table could be represented as a `Hash`, using the table headers as _keys_:

```ruby
person1 = {
  name: "Charles Ellis",
  email: "charles@adadevelopersacademy.org"
}
person2 = {
  name: "Kari Bancroft",
  email: "kari@adadevelopersacademy.org"
}
```

A further optimization would be to represent this data as an `Array` of `Hash` objects:

```ruby
people = [
  {
    name: "Charles Ellis",
    email: "charles@adadevelopersacademy.org"
  }, {
    name: "Kari Bancroft",
    email: "kari@adadevelopersacademy.org"
  }
]
```

**Question:** Why is this second technique better?

A Hash _key_ can have any object as its _value_, even an Array, an instance of a Class or another Hash.

```ruby
require 'date'

person = {
  last_name: "Bancroft",
  first_name: "Kari",

  # The value for key 'birthday' is an instance of the Date class
  birthday: Date.new(2017,07,29),

  # The value for key 'address' is another hash
  address: {
    street: "123 fake st",
    city: "Seattle",
    state: "WA"
  },

  roommates: [ # Here the value is an array
    {
      name:    "Kylo",
      species: "dog"
    }, {
      name:    "Mike",
      species: "human"
    }
  ]
}
```

### Comparing Hashes and Classes

We've spent a lot of time talking about classes in recent days. Let's compare them to hashes.

Classes  | Hashes
---      | ---
Use _instance variables_ to store data | Use _key/value_ pairs to store data
Stored data can be of any type, including other objects and hashes | Stored data can be of any type, including other objects and hashes
Have methods | Do not have methods
Make copies with `.new` | Make copies by duplicating all keys / values
Require a pre-written class definition | Can be created on the fly

Classes take a little more up-front work. You need to know roughly what your data looks like in advance, and build the class to match. The advantage gained by this effort is that you get methods, including a constructor to quickly make many instances.

Hashes are much more dynamic and flexible. They're simpler and lighter-weight than full classes, making them great when you just want to quickly store some data without a bunch of up-front work. They're also great if you don't know in advance what data you'll be storing, like if you're reading data from disk or from the network.

Choosing how your data will be stored is one of the first steps in writing a complex program. Here are some loose guidelines:

If your data... | Then you might use a...
---             | ---
Comes from an external source, like a file or the internet | Hash
Involves giving names to pieces of data, without any specific behavior | Hash
Has complex behaviors you need to model | Class
Involves many pieces of data following a repeated pattern | Class

These guidelines are a good way to start thinking about a problem, but they can't cover every scenario. Often you'll find that several of them apply. As we keep learning and seeing new situations, our understanding of how to organize data within our programs will continue to evolve.

<!-- DPR: don't really want to emphasize how confusing things are
This relationship is complicated by a few facts:
- `Hash` _is_ a class, so hashes are objects
- Hashes can contain objects as values
- Objects can contain hashes as instance variables -->
