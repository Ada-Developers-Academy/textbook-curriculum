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

  # Automatically run our tests
  gem 'guard'
  gem 'guard-minitest'
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

## Add some important things to our gitignore file
inject_into_file '.gitignore', after: '.byebug_history' do
  <<-'RUBY'

/coverage
.DS_Store
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

create_file 'Guardfile' do
  <<~GUARDFILE
    guard :minitest, autorun: false, spring: true do
      watch(%r{^app/(.+)\.rb$})                               { |m| "test/\#{m[1]}_test.rb" }
      watch(%r{^app/controllers/application_controller\.rb$}) { 'test/controllers' }
      watch(%r{^app/controllers/(.+)_controller\.rb$})        { |m| "test/integration/\#{m[1]}_test.rb" }
      watch(%r{^app/views/(.+)_mailer/.+})                    { |m| "test/mailers/\#{m[1]}_mailer_test.rb" }
      watch(%r{^lib/(.+)\.rb$})                               { |m| "test/lib/\#{m[1]}_test.rb" }
      watch(%r{^test/.+_test\.rb$})
      watch(%r{^test/test_helper\.rb$}) { 'test' }
    end
  GUARDFILE
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
