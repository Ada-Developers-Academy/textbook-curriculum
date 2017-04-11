# Rails Testing Setup

This resource is purely logistical, getting you set up to use spec-style testing in all your new Rails projects.

## Enabling Spec-Style Testing
Minitest is set up to do assert-style testing by default. The automatically generated testing classes will look like:

```ruby
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
end
```

There's nothing really wrong with this, but we can do testing in the more english-readable spec-style that we have been using in previous projects.

To demonstrate these steps, open up your TaskList project from Rails week 1.

### Step 1: Installing the Gems

In your `Gemfile` we will set up Rails to use the minitest-spec gem to do our testing so open the gemfile with `atom Gemfile`.  Then add the following lines to the file:

```ruby
group :test do
	gem 'minitest-rails'
	gem 'minitest-reporters'
end
```

This means when Rails runs the test task, it will use the minitest-rails gem.  

Then run `bundle install` to install gems and update `Gemfile.lock`.

### Step 2: Installing Minitest Spec

Next we will ask Rails to modify `test_helper.rb` to use spec style `describe` and `it` blocks. In the terminal, run

```bash
$ rails generate minitest:install
```

It will ask you if you want to overwrite the `test_helper.rb` file.  Answer yes **(Y)**.

### Step 3: Make Spec-style Testing the Default

In `config/application.rb` add these lines to the `Application` class.

```ruby
# config/application.rb
config.generators do |g|
  g.test_framework :minitest, spec: true
end
```

This will change automatically generated test files to use spec-style boilerplate code. So instead of the assert-style tests we saw above, we'll get something like this:

```ruby
require "test_helper"

describe Task do
  let(:task) { Task.new }

  it "must be valid" do
    value(task).must_be :valid?
  end
end
```

Note that test code for components you've already generated will **not** be modified.

### Step 4: Use Minitest Reporters (Optional)

Lastly edit `test/test_helper.rb` to tell Rails to use the `minitest-reporters` gem. Add these lines after the last `require` but before the rest of the file:

```ruby
# test/test_helper.rb
require "minitest/reporters"  # for Colorized output

#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)
```

## Automating This Process

As of right now, you'll have to follow all the above steps for every new rails project you make. Sounds like an easy way to forget something. Fortunately, Rails allows you to make all this stuff happen by default, every time you run `rails new`.

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

### Trust But Verify

To verify things worked as expected, create a new rails project. You should see a few things:

- At the end of the output from `rails new`, you should see something like
    ```
    generate  minitest:install
    Running via Spring preloader in process 51275
    force  test/test_helper.rb
    insert  test/test_helper.rb
    ```
- Our two testing gems, `minitest-rails` and `minitest-reporters`, should be included in the `Gemfile`
- Code matching what's above should have been inserted into `config/application.rb` and `test/test_helper.rb`

## Additional Resources

- [Sitepoint on Rails application templates](https://www.sitepoint.com/rails-application-templates-real-world/)
- [Rails guide on generators and templates](http://guides.rubyonrails.org/generators.html)
- [Adding Color to Minitest Output](http://chriskottom.com/blog/2014/06/dress-up-your-minitest-output/)
