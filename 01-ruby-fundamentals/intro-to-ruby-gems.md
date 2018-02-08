# An Introduction to Ruby Gems
Gems are what other languages call a library. They are packaged code that can be shared and distributed. Most gems are distributed using [RubyGems.org](https://rubygems.org/). A Gem will contain one or more
Ruby Classes, just like the ones you've been creating. Let's look at a couple gems to get an idea of what would be packaged and why:

- [Rails](https://rubygems.org/gems/rails)
- [Awesome Print](https://rubygems.org/gems/awesome_print/versions/1.8.0)
- [Colorize](https://rubygems.org/gems/colorize)
- [Pry](https://rubygems.org/gems/pry/versions/0.11.3)

## Installing Gems
Installing gems is super easy! We do it right from the Terminal. To install the gem `awesome_print`, do `$ gem install awesome_print`. You can see all the gems currently installed using `$ gem list`.

## Requiring Gems
Since gems are external Ruby libraries, they are not included in core Ruby. To use the code provided by the gem, we `require` it in our code base. This can be done at the top of any Ruby script, file, or in `irb`:

```ruby
require "awesome_print"
```

### Example: Using the `awesome_print` gem.
Generally the github page for a gem is the best place to go to get started. Let's check out the [awesome_print gems' page](https://github.com/awesome-print/awesome_print). Under _usage_ we see some common examples of how to use this gem.

In general `awesome_print` is a a great tool for printing debugging messages to the console because of it's syntax highlighting and how it provides information beyound `puts`.  

```ruby
require 'awesome_print'

# Awesome_print has Waaay too many features to demonstrate in one example.  
# We will stick to the basics.

# Comparing ap to puts

sample_array = ["Mercury", "Venus", "Earth", "Mars"]
ap "Awesome Print with an Array"
ap sample_array
puts "Puts with an Array"
puts sample_array


nested_structure = {
  points: [
    {
      name: "Great Pyramid of Giza",
      location: [32.5, 15.2]
    },
    {
      name: "Temple of Artemis",
      location: [47.8, 13.4]
    },
    {
      name: "Lighthouse of Alexandria",
      location: [32.6, 15.7]
    }
  ]
}

ap "Awesome Print with a nested structure"
ap nested_structure
puts "puts with a nested structure"
puts nested_structure

ap "Awesome print with an object"
class City
  def initialize(name)
    @name = name
  end
end

my_city = City.new("Seattle")
ap "Awesome Print with an Instance"
ap my_city
ap "Puts with an instance"
puts my_city

ap "Awesome print with Options!", color: {string: :purpleish}
```

**Exercise** Try to add an option to an `ap` statement.  Check the [github page](https://github.com/awesome-print/awesome_print)  for instructions

### Example: Using Colorize
Next let's take a quick look at the colorize gem

```bash
gem install colorize
```

Look at the [usage section](https://github.com/fazibear/colorize) of the github page

```ruby
puts "This is blue".colorize(:blue)
puts "This is light blue".colorize(:light_blue)
puts "This is also blue".colorize(:color => :blue)
puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
puts "This is light blue with red background".colorize(:light_blue ).colorize( :background => :red)
puts "This is blue text on red".blue.on_red
puts "This is red on blue".colorize(:red).on_blue
puts "This is red on blue and underline".colorize(:red).on_blue.underline
puts "This is blue text on red".blue.on_red.blink
puts "This is uncolorized".blue.on_red.uncolorize
```


## Other Great Gems!
- [Money](http://rubymoney.github.io/money/)
- [Awesome Print](https://github.com/awesome-print/awesome_print)
- [lolcat](https://github.com/busyloop/lolcat) & [table_flipper](https://github.com/iridakos/table_flipper)
- [pry](https://github.com/pry/pry)
- [Chronic](https://github.com/mojombo/chronic)
- [Geocoder](http://www.rubygeocoder.com/)
- [Faker](https://github.com/stympy/faker)
- [Terminal Table](https://github.com/tj/terminal-table)
- [Gist](https://github.com/defunkt/gist)
