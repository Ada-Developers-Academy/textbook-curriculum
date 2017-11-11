# Make $(document).ready work as expected, despite turbolinks weirdness
gem 'jquery-turbolinks'

gem 'jquery-rails'

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
