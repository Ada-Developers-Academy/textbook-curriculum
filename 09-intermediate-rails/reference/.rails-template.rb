# Make $(document).ready work as expected, despite turbolinks weirdness
gem 'jquery-turbolinks'

gem 'jquery-rails'

gem 'foundation-rails'

# Add normalize.css
gem 'normalize-rails'

gem_group :development, :test do
  # Use pry for rails console, enable binding.pry
  gem 'pry-rails'
end

gem_group :development do
  # Improve the error message you get in the browser
  gem 'better_errors'

  # Nice interactive terminal when an exception happens
  gem 'binding_of_caller'
end

# Add some extra minitest support
gem_group :test do
  gem 'minitest-rails'
  gem 'minitest-reporters'
end

# Don't even install coffeescript
gsub_file 'Gemfile', /^gem \'coffee-rails\'/ do
  "\# gem 'coffee-rails'"
end
  # Add jquery to application.js to work with foundation-rails
  inject_into_file 'app/assets/javascripts/application.js', after: '// about supported directives.' do
    <<-'RUBY'

//= require jquery
    RUBY
  end

  # Add jquery to application.js to work with foundation-rails
  inject_into_file 'app/assets/stylesheets/application.css', after: ' * It is generally better to create a new file per style scope.' do
    <<-'RUBY'

 *= require normalize-rails
    RUBY
  end


# Mess with generators to get the behavior we expect around new files
# For these injections, indentation matters!
inject_into_file 'config/application.rb', after: "class Application < Rails::Application\n" do
  <<-'RUBY'
    config.generators do |g|
      # Force new test files to be generated in the minitest-spec style
      g.test_framework :minitest, spec: true

      # Always use .js files, never .coffee
      g.javascript_engine :js
    end
  RUBY
end

# Things to do after all the gems have been installed
after_bundle do
  # Run rails generate minitest:install
  generate "minitest:install", "--force"

  # Run rails generate foundation:install
  generate "foundation:install", "--force"

  # Add minitest reporters support. This must be run after
  # rails generate minitest:install, because that command
  # changes test/test_helper.rb
  inject_into_file 'test/test_helper.rb', after: 'require "minitest/rails"' do
    <<-'RUBY'

require "minitest/reporters"  # for Colorized output

#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)
    RUBY
  end
end

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
