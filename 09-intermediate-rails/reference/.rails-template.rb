puts "Executing the Rails template"
API_MODE = ARGV.include? '--api'
puts "API mode: #{API_MODE}"

unless API_MODE
  # jQuery is cool
  gem 'jquery-rails'

  # Make $(document).ready work as expected, despite turbolinks weirdness
  gem 'jquery-turbolinks'

  # CSS libraries
  gem 'foundation-rails'
  gem 'normalize-rails'
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

    //= require jquery
    JAVASCRIPT
  end

  # Add normalize-rails
  inject_into_file 'app/assets/stylesheets/application.css', after: ' * It is generally better to create a new file per style scope.' do
    <<-'SCSS'

    *= require normalize-rails
    SCSS
  end
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

  unless API_MODE
    # Run rails generate foundation:install
    generate "foundation:install", "--force"
  end

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

  unless API_MODE
    # Add Foundation Javascript with Motion-ui this must be run after
    # rails generate foundation:install, because that command
    # adds foundation_and_overrides.scss
    inject_into_file 'app/assets/stylesheets/foundation_and_overrides.scss', after: '// @include motion-ui-animations;' do
      <<-'SCSS'

@import 'motion-ui/motion-ui';
@include motion-ui-transitions;
@include motion-ui-animations;

      SCSS
    end
  end
end
