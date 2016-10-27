# Testing APIs

## Learning Goals
- Identify the areas of APIs that we want to test
- Utilize VCR to snapshot API calls
- Integrate tests

### How is testing APIs different?
We know why testing is important, we have seen the importance of the TDD cycle. When testing APIs it is important to note that we are now relying on external sources for our own code to work. There are a few things to consider when testing external sources:
1. If they're down, we're down
1. Every API call costs something (whether it be counting against your # of free calls or actually costing real $)

With these two considerations in mind, we want to reduce the dependency on an external API in testing, so we can focus on the important pieces of our code. In comes VCR!

### What is VCR?
VCR is a tool that allows your tests to _record_ HTTP interactions and replay them when necessary. By re-using these responses, VCR will improve stability and performance of your test suite.

Each interaction is recorded as a **cassette**. We can load cassettes in our tests, depending on which requests/responses we want to be testing.

![VCR](images/vcr.jpg)

### Installation
1. **Gem**

  There are a few gems that we want to include to test using VCR. First, we'll load those into our `development` and `test` sections.

  ```ruby
  group :development, :test do
    gem 'minitest-vcr'
    gem 'webmock'
  end
  ```

2. **Test Config**

  In your `test_helper.rb` file, add the following code:
  ```ruby
  require 'vcr'
  require 'webmock/minitest'

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes' # folder where casettes will be located
    config.hook_into :webmock # tie into this other tool called webmock
    config.default_cassette_options = {
      :record => :new_episodes    # record new data when we don't have it yet
    }
  end
  ```

3. **Tests**

  Now you're ready to test your API!!

  We wrap the code where an API call would be made in the `VCR.use_cassette` block. This will ensure that the code inside the block will use the cassette if it has not already been generated. 

  ```ruby
  test "Retrieve the Channel data" do
    VCR.use_cassette("channels") do
      response = ApiWrapper.list_channels
      assert response.length > 0
      # Anything else contextual about API data?
    end
  end
  ```

  TODO: Instructors... Is there a negative case?  
  Test a negative case:
  ```ruby
  test "Retrieve the Channel data" do
    VCR.use_cassette("no_channels") do
      response = ApiWrapper.list_channels
      assert_not response.length > 0
    end
  end
  ```

  Once you run a test that uses VCR, you'll notice that there will be a files in the `test/cassettes` folder with the name corresponding to the parameter provided in the `use_cassette` method.

  If you expect the response data to change, you must delete the cassette file.

  Once the cassette file is created, how do we know that our tests are not still calling the API directly? One (very manual) way of doing this is by turning off your Wifi. If you ensure you have the VCR cassette files, then turn off your Wifi and run your tests again, your tests should still pass! Huzzah!
