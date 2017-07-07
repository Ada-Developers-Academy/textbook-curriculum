# Being Lazy With Let
## Learning Goals
You should be able to:
- DRY up your test code with let & before.
- Explain how `let` is "lazy" in Minitest.

In your Minitest code you will often find yourself creating instances over and over again in each test case like this:

```ruby
it "must have a name" do
  player = Scrabble::Player.new("Ada Lovelace")

  # expectations go here
end
```

In most test cases we're creating a new identical instance of `Player` to work with.  This doesn't seem DRY.  

## Solution 1:  Before Blocks

One solution is to use Minitest's `before` block.

```ruby
describe Player do
  before do
    @player = Scrabble::Player.new("Ada Lovelace")
  end

  it "must respond to name" do
    @dplauer.must_respond_to :name
  end
  ...
end
```

So in the above example the `before` block runs before each test and provides an instance variable `@player` which we can use in our tests.  The problem with before blocks is that they **always** run before each test case.  Even if we don't want to use `@player` in a few test cases, like for instance if we want to try creating a Player with no arguments the before block will still run.  

## Let

Let is another way to DRY up your code.  With Let we create a block which can be referenced in our test cases.


```ruby
# player_spec.rb from Scrabble Project

describe Player do
  let (:player)  { 						 # <-- The name used
  	Scrabble::Player.new("Ada Lovelace") # <-- The value returned by 'player'
  }


	it "has a name" do
		player.name.must_equal "Watson"
    end
end
```

The `let` statement creates a block with the given name (in this case `player`) and executes the code in the curly braces the first time `player` is referenced in a test and caches the result for later use.  That's why it's often called "lazy," the code inside the block doesn't execute until the let is first used, in this case when we do `player.name.must_equal "Watson"`.  

In the same test case (`it` block) only the returned value from the block is used. So the let runs for each test case that uses it and doesn't run in test cases where it isn't needed.  Neat!

Just like `before` each test case sets up autonomously with a fresh `player` so that no test case will interfere with another.  

### Proof that let is lazy

In this example using `before` the statement "Creating a player named Ada Lovelace" prints twice, once for each `it` block showing that before always runs before a test case.  

#### Using `before`

```ruby
# sample_spec.rb

describe "Player" do
  before do
    puts "Creating a player named Ada Lovelace"
    @player = Scrabble::Player.new "Ada Lovelace"
  end

  describe "initialize method" do
    it "New Players initialize with a name" do
      @player.must_respond_to :name
      @player.name.must_equal "Ada Lovelace"
    end

    it "Throws an ArgumentError if created without a name" do
      proc {
        Scrabble::Player.new
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

Creating a player named Ada Lovelace
.Creating a player named Ada Lovelace
.

Finished in 0.011018s, 272.2817 runs/s, 272.2817 assertions/s.

2 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```

#### Using `let`

But if we use let instead:

```ruby
# player_spec.rb

describe "Player" do
  let (:player)  {
    puts "Creating a player named Ada Lovelace"
    Scrabble::Player.new('Ada Lovelace')
  }


    describe "initialize method" do
        it "New Players initialize with a name" do
            player.must_respond_to :name
            player.name.must_equal "Ada Lovelace"
        end

        it "Throws an ArgumentError if created without a name" do
          proc {
            Scrabble::Player.new
          }.must_raise ArgumentError
        end
    end
end
```

We get

```bash
ruby specs/sample_spec.rb
Run options: --seed 49538

# Running:

Creating a player named Ada Lovelace
.

Finished in 0.005194s, 770.1194 runs/s, 770.1194 assertions/s.

2 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```

Notice the `puts` ran only once, only in the test-case where it was used.  So let can often be more efficient because it's only ran where needed.  Unlike life, in Minitest being lazy pays off!

### A Longer Let Example:

The below example creates 2 let statements for a player and a tilebag from Scrabble and uses them together in a batch of tests.  You can use the names defined in let like variable names.  

```ruby
describe "Player & Tilebag" do
  let (:player)  { S	 }
  let (:tilebag) { Scrabble::TileBag.new }

  describe "draw_tiles for Player class" do

    it "fills tiles array with letters" do
     player.draw_tiles(tilebag)
     player.players_tiles.must_be_instance_of Array
     player.players_tiles[0].must_be_instance_of String
    end

    it "won't fill the array beyond 7 letters" do
      player.draw_tiles(tilebag)
      player.players_tiles.length.must_equal 7
    end

  end
end
```

## Summary

So `let` is a useful helper method to DRY up your testing code.  With it you can define a block of code that is run only when it is used in your test case and the result saved in the name you provide, in the example above `player` and `tilebag` so you can use it like a local variable in your test cases.  


## Resources
-  [Minitest let() is Lazy](http://ruby-journal.com/minitest-let-is-lazy/)
-  [4 Fantastic Ways To Setup State In Minitest](https://chriskottom.com/blog/2014/10/4-fantastic-ways-to-set-up-state-in-minitest/)
