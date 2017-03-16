# Factory Girl

## Learning Goals
- TODO

[Factory Girl Rails](https://github.com/thoughtbot/factory_girl_rails) is a fixture replacement (not that we've learned what fixtures are). Basically what it does is allows you to define `ActiveRecord` object presets, then use the `FactoryGirl` syntax to initialize or create those object(s) at any time and with additional attribute definitions. Each preset is called a "factory".

### Configuration
To install add the gem to the `development` and `test` environments to your `Gemfile`:

    gem 'factory_girl_rails'

In the `spec_helper.rb` file, add a `require` statement:  
```ruby
require 'factory_girl'
```

Add the following line within the `config` block in `spec_helper.rb`
```ruby
config.include FactoryGirl::Syntax::Methods
```
This line will give you access to the shortened `FactoryGirl` methods so you don't need to type out the full class with method call every time.

### Define Factories
Next create a file to define your factories,

    touch spec/factories.rb

Within this file lets define our first factory for a Book model
```ruby
FactoryGirl.define do
  factory :book do
    name "House of Leaves"
    author "Mark Z. Danielewski"
    description "House of Leaves is the debut novel by the American author Mark Z. Danielewski, published by Pantheon Books. The novel quickly became a bestseller following its release on March 7, 2000. It was followed by a companion piece, The Whalestoe Letters"
  end
end
```

### Naming Factories
Note that by default, the factory must have the same name as the class for which the factory is created. If you want to name the factory something other than the object name, you must specify the `class` name in the factory definition.

```ruby
FactoryGirl.define do
 factory :book do
   name "House of Leaves"
   author "Mark Z. Danielewski"
   description "House of Leaves is the debut novel by the American author Mark Z. Danielewski, published by Pantheon Books. The novel quickly became a bestseller following its release on March 7, 2000. It was followed by a companion piece, The Whalestoe Letters"
 end

 factory :older, class: Book do
   name "To Kill a Mockingbird"
   author "Harper Lee"
   description "To Kill a Mockingbird is primarily a novel about growing up under extraordinary circumstances in the 1930s in the Southern United States. The story covers a span of three years, during which the main characters undergo significant changes."
 end
end
```


### Use Factories

Now within our specs we can use the FactoryGirl syntax to create this Book object, which will be an ActiveRecord Book object that we defined in `app/models/book.rb`. FactoryGirl is just storing the default values.
```ruby
require 'spec_helper'

describe Book do

  describe "validations" do
    it "is valid" do
      expect(create(:book)).to be_valid
    end

    it "is invalid without a name" do
      expect(build(:book, name: nil)).to be_invalid
    end

  end
end
```

The `create` and `build` methods are going to be the most common FactoryGirl methods, these methods accept the same argument, but are slightly different.  
__create__ will attempt to __save__ the record  
__build__ will not attempt to save the record  


The first argument in the `create` or `build` method call is the name of the factory, which is the symbol after `factory` in the `factories.rb`. The second argument in the `create` or `build` method call is an optional hash, where you can pass in additional attributes or attributes to override on the creation of the object.


### More Factory Girl
The Factory Girl Getting Started documentation is the best resources for more detailed information about how to use factories in your testing.  
[Factory Girl Getting Started](http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md)
