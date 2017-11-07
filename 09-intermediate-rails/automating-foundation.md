# Automating Foundation Installation In Rails

## Overview

The Rails Foundation gem automatically installs the foundation JavaScript & CSS files.  

To manually install it manually you need to add the following line to your Gemfile.

```ruby
gem 'foundation-rails', '6.4.1.2'
```

We keep it on the current version `6.4.1.2` because Foundation is transitioning to the XY Grid, and the foundation-rails gem will be updated soon which makes the `Float Grid` a legacy method and not on by default.

Then after executing `bundle install` you can execute

```bash
$  rails g foundation:install
```

to install the Foundation CSS & JavaScript files.  

Lastly to install the motion UI animations (useful for menus etc) you can uncomment the following lines from `foundation_and_overrides.css`

```CSS
// @import 'motion-ui/motion-ui';
// @include motion-ui-transitions;
// @include motion-ui-animations;
```

## Automating the installation

To automate the installation you can modify the `~/.rails-template.rb` file we created for testing with [this file](./reference/.rails-template.rb).

This template adds the foundation gem to the Gemfile, runs `rails g foundation:install` and uncomments the motion-ui library.  

## Resources
- [Foundation-Rails Gem](https://github.com/zurb/foundation-rails)
