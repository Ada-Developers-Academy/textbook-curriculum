puts "Executing the Rails template"
API_MODE = ARGV.include? '--api'
puts "API mode: #{API_MODE}"

# Generated with figlet
ADA_RAILS = <<-FIGLET
    _       _         ____       _ _
   / \\   __| | __ _  |  _ \\ __ _(_) |___
  / _ \\ / _` |/ _` | | |_) / _` | | / __|
 / ___ \\ (_| | (_| | |  _ < (_| | | \\__ \\
/_/   \\_\\__,_|\\__,_| |_| \\_\\__,_|_|_|___/

FIGLET

unless API_MODE
  # jQuery is cool
  gem 'jquery-rails'

  # Make $(document).ready work as expected, despite turbolinks weirdness
  gem 'jquery-turbolinks'
  # Bootstrap CSS Library
  gem 'bootstrap', '~> 4.1.3'
  gem 'sass-rails'
end

gem_group :development, :test do
  # Use pry for rails console, enable binding.pry
  gem 'pry-rails'
end

unless API_MODE
  gem_group :development do
    # Improve the error message you get in the browser
    gem 'better_errors'

    # Nice interactive terminal when an exception happens
    gem 'binding_of_caller'

    # Automatically run our tests
    gem 'guard'
    gem 'guard-minitest'
  end
end

# Add some extra minitest support
gem_group :test do
  gem 'minitest-rails'
  gem 'minitest-reporters'
end

unless API_MODE
  # Don't even install coffeescript
  gsub_file 'Gemfile', /^gem \'coffee-rails\'/ do
    "\# gem 'coffee-rails'"
  end

  # Add jquery to application.js to work with foundation-rails
  inject_into_file 'app/assets/javascripts/application.js', after: '// about supported directives.' do
    <<-'JAVASCRIPT'

  //= require jquery3
  //= require popper
  //= require bootstrap-sprockets
    JAVASCRIPT
  end

  append_to_file 'app/assets/stylesheets/application.css' do
    <<-'SCSS'

/* Custom bootstrap variables must be set or imported *before* bootstrap. */
@import "bootstrap";
/* Import scss content */
@import "**/*";
    SCSS
  end
end

unless API_MODE

  gsub_file 'app/assets/stylesheets/application.css', / \*= require_tree .\n/ do
  ""
  end
  gsub_file 'app/assets/stylesheets/application.css', / \*= require_self\n/ do
  ""
  end
  run "mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss"
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

# Allow us to use form_with without utilizing the remote form option
create_file 'config/initializers/action_view.rb' do
  <<~INIT
    Rails.application.config.action_view.form_with_generates_remote_forms = false
  INIT
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

  puts "Successfully generated a new Rails app using the Ada Developers Academy template"
  puts "This is template version 2 (intermediate Rails)"
  puts "You are on..."
  puts ADA_RAILS
end
