
# Using Foundation Gem in Rails

## Learning Goals
-  Be able to install Foundation using the Foundation Gem
-  Be able to use Foundation specific styles and widgets in your hmtl/css code.
-  Be able to adjust the Foundation variables to style Foundation apps

## Installing Foundation-Rails

To install the Foundation-Rails gem add the following line to your Gemfile.

```ruby
gem 'foundation-rails'
```

Then run `bundle install`.  

Lastly you can run an installer the the gem provides with: `rails g foundation:install`

Rails will provide a warning that the app/views/layouts/application.html.erb file will be overridden.  This is because the installer will add the required Javascript & css files.  

```bash
$  rails g foundation:install
Running via Spring preloader in process 7609
      insert  app/assets/javascripts/application.js
      append  app/assets/javascripts/application.js
      create  app/assets/stylesheets/foundation_and_overrides.scss
      create  app/assets/stylesheets/_settings.scss
      insert  app/assets/stylesheets/application.css
    conflict  app/views/layouts/application.html.erb
Overwrite /Users/Chris/ada/StudentWork/Foundation/foundation_example/app/views/layouts/application.html.erb? (enter "h" for help) [Ynaqdh] Y
       force  app/views/layouts/application.html.erb
   identical  app/assets/stylesheets/foundation_and_overrides.scss
   identical  app/assets/stylesheets/_settings.scss
```

The installer adds the following files to your app/assets folder.  

![foundation files](img/foundationfiles.png)


## Example Styling

### Drop-Down Menus

You can create drop-down menus for your app with code like this:


```erb

```