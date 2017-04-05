# Rails Testing Setup

This resource is purely logistical, getting you set up to use spec-style testing in all your new Rails projects.

## Procedure
Unfortunately Minitest is set up to do assert-style testing by default.  

So the default testing classes look like:

```ruby
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
end
```

There's nothing really wrong with this, but we can do testing in the more english-readable spec style that we have been using in previous projects so we will get started setting up the project for minitest-spec.

### Setup The Gemfile
#### Step 1:  Installing the Gems
In your **Gemfile** we will set up Rails to use the minitest-spec gem to do our testing so open the gemfile with `atom Gemfile`.  Then add the following lines to the file:
```ruby
group :test do
	gem 'minitest-rails'
	gem 'minitest-reporters'
end
```

This means when Rails runs the test task, it will use the minitest-rails gem.  

Then run `bundle install`

#### Step 2:  Installing Minitest Spec

Then we will ask Rails to modify test_helper.rb to use spec style describe and it blocks with `rails generate minitest:install`  It will ask you if you want to overwrite the `test_helper.rb` file.  Answer yes **(Y)**.

#### Step 3:  Make Spec-style Testing the default

In `config/application.rb` add these lines to the `Application` class.

```ruby
config.generators do |g|
  g.test_framework :minitest, spec: true
end
```

#### Step 4:  Use Minitest Reporters (Optional)

Lastly edit test/test_helper.rb to tell Rails to use the Minitest-spec style tests with `atom test/test_helper.rb` and add these lines to the top.

```ruby
require "minitest/reporters"  # for Colorized output

#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)
```

## Making Spec-style Testing the Default

As of right now, you'll have to follow all the above steps for every new rails project you make. Sounds like an easy way to forget something. Fortunately, Rails allows you to make all this stuff happen by default, every time you say `rails new`.

Remember the `~/.railsrc` file? Previously we added a line to make postgres the default database for all new Rails projects.

We're going to do something similar now. The big difference is that making Rails use spec-style testing is a lot more complex than just changing the default database. We'll use a combination of the `.railsrc` file and a new piece of rails called a _template_.

What is a _template_? For now, just think of it as a way to add some more complex defaults to Rails. Rails templates are a rabbit hole we could spend a whole bunch of time exploring, but instead we're just going to supply one for you.

### Instructions

1. Download [this template file](https://gist.github.com/droberts-ada/26a3bff1510b0b45fa5dd764a833483c), and save it as `~/.rails-template.rb`
1. Run the following command in your terminal
    ```bash
    echo "-m ~/.rails-template.rb" >> ~/.railsrc
    ```

That's it, you should now be good to go. From now on, every time you type `rails new` Rails will set your project up for spec-style testing. You shouldn't need to repeat these instructions until the next time you buy a computer.

To verify things worked as expected,
