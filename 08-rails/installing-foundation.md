#  Installing Foundation By Default

## Learning Goals
- Learn how to install and use the Foundation Framework via the gem.
- Practice modifying our `.rails-template.rb` file to add an additional gem and content.

## Installing the Foundation Gem

To install Foundation in your Rails project via the Gem first add the following to your Gemfile.

```ruby
gem 'foundation-rails'
```

And run `bundle install` from the terminal in your rails project.  


Then in your terminal in the rails project folder run the command:

```bash
$  rails generate foundation:install --force
```

This will add the following files to your project
-  app/assets/javascripts/application.js
-  app/assets/stylesheets/foundation_and_overrides.scss
-  app/assets/stylesheets/_settings.scss
-  app/assets/stylesheets/application.css
-  app/assets/stylesheets/foundation_and_overrides.scss  

It will also overwrite the default layout `app/views/layouts/application.html.erb`

### Motion-UI

Optionally you can include the motion UI for animation effects in your site.  To do so open the `app/assets/stylesheets/foundation_and_overrides.scss` and uncomment the following lines by taking off the `//`.

```scss
// @import 'motion-ui/motion-ui';
// @include motion-ui-transitions;
// @include motion-ui-animations;
```


## Automating Foundation Installation

We have an awesome template file `~/.rails-template.rb` which sets up Minitest and other gems.  Why not use it for Foundation as well!

### Add the Gem to the template

First to add the Foundation gem to the template file we will edit `~/.rails-template.rb`  and add the following line alongside the other Gems.  We will insert the text between `### New gems that weren't in our default`


```ruby
# Gems we've talked about in class, but which have absolutely nothing to do
# with setting up spec-style testing.
# Included here for convenience.
gem_group :development do
  # Improve the error message you get in the browser
  gem 'better_errors'

  # Use pry for rails console
  gem 'pry-rails'
end

### New gems that weren't in our default 
# For colored text in Rails console
gem 'awesome_print'
# For the Foundation CSS Framework
gem 'foundation-rails'
### New gems that weren't in our default 


# Add some extra minitest support
gem_group :test do
  gem 'minitest-rails'
  gem 'minitest-reporters'
end
```

### Automating `rails generate foundation:install`

To install Foundation automatically when you create a new rails app we will also add the foundation install command below where we installed minitest.  See where I added `generate "foundation:install", "--force"`

```ruby
  # Run rails generate minitest:install
  generate "minitest:install", "--force"
  # Run rails generate foundation:install
  generate "foundation:install", "--force"
```

### Including Motion-ui (Optional)

You can include motion-ui by adding the following to the bottom of the file, just before the final end.

```ruby
  # Add Foundation Javascript with Motion-ui this must be run after
  # rails generate foundation:install, because that command
  # adds foundation_and_overrides.scss
  inject_into_file 'app/assets/stylesheets/foundation_and_overrides.scss', after: '// @include motion-ui-animations;' do
    <<-'RUBY'

@import 'motion-ui/motion-ui';
@include motion-ui-transitions;
@include motion-ui-animations;

    RUBY
  end
```

## But I just want it to work!

In that case you can replace the `.rails-template.rb` file with [this gist](https://gist.github.com/CheezItMan/381344fc4655ff22c28fe24ecaf01917).

## Resources
- [Foundation Gem](https://github.com/zurb/foundation-rails)
- [Foundation 6 Examples](http://foundation.zurb.com/sites/docs/kitchen-sink.html)
