# Being Lazy With Let

## Learning Goals

You should be able to:

- DRY up your test code with let & before.
- Explain how `let` is "lazy" in Minitest.

Consider writing tests for a `Pet` class like this:

```ruby
# pet.rb

class Pet
  attr_reader :name

  def initialize(name)
    @name = name
  end

  # .. more methods
end
```

In your Minitest code you will often find yourself creating instances over and over again in each test case like this:

```ruby
it "must have a name" do
  pet = Pet.new("Fido")

  # expectations go here
end
```

In most test cases we're creating a new identical instance of `Pet` to work with.  This doesn't seem *DRY*.

## Solution 1:  Before Blocks

One solution is to use Minitest's `before` block.  In Minitest a `before` block runs before each test case, which allows you to dry up common code in the arrange step of testing.

```ruby
require 'minitest/autorun'
require 'minitest/reporters'
require 'pet'

describe Pet do
  before do
    @pet = Pet.new("Fido")
  end

  it "must respond to name" do
    expect(@pet).must_respond_to :name
  end
  ...
end
```

In the above example the `before` block runs before each test and provides an instance variable `@pet` which we can use in our tests.  This can often serve as a helpful way to DRY testing code.

Unfortunately `before` blocks **always** run before each test case.  Even if we don't want to use `@pet` in a few test cases, like for instance if we want to try creating a Pet with no arguments the before block will still run.

## Let

If you recall, when using `attr_reader :name`, you pass in a _symbol_ (:name), and the `attr_reader` method uses the symbol to create a method with the same name.  

`let` works in a similar fashion.  It takes a symbol for a variable name and a block to give the variable a starting value.  `let` is called an initializer, because it provides an _initial_ value for the given variable name.

The **first** time ruby encounters the variable in a test, it will execute the given block to give the variable an initial value.  Subsequently it will function as a regular local variable.

```ruby
# pet_spec.rb
require 'minitest/autorun'
require 'minitest/reporters'
require 'pet'

describe Pet do
  let (:pet)  {              # <-- The name used
    Pet.new("Fido") # <-- The initial value of 'pet'
  }


  it "has a name" do
    expect(pet.name).must_equal "Fido"
  end
end
```

Because the block is only executed the when it is referenced, `let` is often called "lazy," the code inside the block doesn't execute until the variable is first used, in this case when we do `expect(pet.name).must_equal "Fido"`.

The block is only executed the first time the variable is encountered in a given test.  So the let runs **once** for each test case that uses it and **never** in test cases where it isn't needed.  Neat!

Just like `before` each test case runs autonomously with a fresh `pet` so that no test case will interfere with another.

### Proof that let is lazy

In the first example here, when using `before` the statement "Creating a pet named Ada Lovelace" is printed twice, once for each `it` block.

#### Using `before`

```ruby
# sample_spec.rb
require 'minitest/autorun'
require 'minitest/reporters'
require 'pet'

describe "Pet" do
  before do
    puts "Creating a pet named Ada Lovelace"
    @pet = Pet.new("Fido")
  end

  describe "initialize method" do
    it "New Pets initialize with a name" do
      expect(@pet).must_respond_to :name
      expect(@pet.name).must_equal "Ada Lovelace"
    end

    it "Throws an ArgumentError if created without a name" do
      expect {
        Pet.new
      }.must_raise ArgumentError
    end
  end
end
```
Output:

```bash
$  ruby specs/sample_spec.rb
Run options: --seed 62527

# Running:

Creating a pet named Ada Lovelace
.Creating a pet named Ada Lovelace
.

Finished in 0.011018s, 272.2817 runs/s, 272.2817 assertions/s.

2 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```

#### Using `let`

But if we use let instead the statement is only printed **once** because `pet` is only referenced in one test.

```ruby
require_relative "spec_helper"

describe "Pet" do
  let (:pet) {
    puts "Creating a pet named Ada Lovelace"
    Pet.new("Fido")
  }

  describe "initialize method" do
    it "New Pets initialize with a name" do
      expect(pet).must_respond_to :name
      expect(pet.name).must_equal "Fido"
    end

    it "Throws an ArgumentError if created without a name" do
      expect {
        Pet.new
      }.must_raise ArgumentError
    end
  end
end
```

```bash
ruby specs/sample_spec.rb
Run options: --seed 49538

# Running:

Creating a pet named Ada Lovelace
.

Finished in 0.005194s, 770.1194 runs/s, 770.1194 assertions/s.

2 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```

Notice the `puts` ran only once using `let`, and only in the test-case where it was used.  So `let` can often be more efficient because it only executes where it is referenced.

Unlike life, in Minitest being lazy pays off!

## Summary

The `let` method is useful to DRY up your testing code.  With it you can define a block of code that is used to initialize a variable the first time it is used in a test block.

## Resources
-  [Minitest let() is Lazy](http://ruby-journal.com/minitest-let-is-lazy/)
-  [4 Fantastic Ways To Setup State In Minitest](https://chriskottom.com/blog/2014/10/4-fantastic-ways-to-set-up-state-in-minitest/)
