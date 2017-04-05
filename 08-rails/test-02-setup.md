# Rails Testing Setup



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


Now with **Rails 5** we can run the tests with any of the following commands:


| Command                                | Result                             |
|----------------------------------------|------------------------------------|
| rails test                             | Runs all Tests                     |
| rails test test/models                 | Runs tests in tests/models         |
| rails test test/jobs                   | Runs tests in tests/jobs           |
| rails test test/jobs test/models       | Runs tests in both                 |
| rails test test/models/user_test.rb:14 | Run test in that file on that line |


Just note that earlier versions of Rails used rake for testing.
