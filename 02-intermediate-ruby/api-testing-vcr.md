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

### What is VCR doing?
VCR is essentially a recording device that interrupts the normal way they we send messages out to the internet. The first time a set of tests that use VCR run, the cassette takes note of the new request, based off of request method, URI, and body:

![A VHS cassette watches a message leave HTTParty, taking note](images/apis/VCR_step_1.png "A VHS cassette watches a message leave HTTParty, taking note")

When the API responds, the cassette takes note of the contents of the response as well:

![A VHS cassette sees the response from the API before it gets back to HTTParty.](images/apis/VCR_step_2.png "A VHS cassette sees the response from the API before it gets back to HTTParty.")

Whenever the same request (matching on request method, URI, and body) is sent out in the future, VCR gobbles up the message before it goes to the API, taking the API out of the equation:

![A VHS removes the API from the web call process](images/apis/VCR_step_3.png "No API's were hurt in the making of this image.")

At this point, the cassette can read in and play back messages and responses as if it were the API.

![The VHS takes the place of the API.](images/apis/VCR_step_4.png "The cassette takes the place of the ")

### Installation
1. **Gems**
    ```
    $ gem install minitest-vcr webmock dotenv
    ```
1. **Test Config**

    In your `spec_helper.rb` file, add the following code:
    ```ruby
    require 'vcr'
    require 'webmock/minitest'
    require 'dotenv'

    Dotenv.load

    VCR.configure do |config|
      config.cassette_library_dir = 'test/cassettes' # folder where casettes will be located
      config.hook_into :webmock # tie into this other tool called webmock
      config.default_cassette_options = {
        :record => :new_episodes,    # record new data when we don't have it yet
        :match_requests_on => [:method, :uri, :body] # The http method, URI and body of a request all need to match
      }
      # Don't leave our Slack token lying around in a cassette file.
      config.filter_sensitive_data("<SLACK_TOKEN>") do
        ENV['SLACK_TOKEN']
      end
    end
    ```

    The last section, beginning with `config.filter_sensitive_data`, tells VCR not to put your slack token into the cassette file, instead replacing it with the string `"<SLACK_TOKEN>"`. That way when the cassettes end up in your git repo, you won't be exposing your secrets to the world. You'll need a separate call to `config.filter_sensitive_data` for every piece of data you want to omit from your cassettes.

    Cassette files usually should be checked into git as they fill a similar role to spec files.

1. **Tests**

    Now you're ready to test your API!!

    We wrap the code where an API call would be made in the `VCR.use_cassette` block. This will ensure that the code inside the block will use the cassette if it has not already been generated.

    ```ruby
    it "Can send valid message to real channel" do
      VCR.use_cassette("channels") do
        message = "test message"
        response = SlackApiWrapper.send_msg("<CHANNELID>", message)
        response["ok"].must_equal true
        response["message"]["text"].must_equal message
      end
    end
    ```

    Test a negative case:
    ```ruby
    it "Can't send message to fake channel" do
      VCR.use_cassette("channels") do
        response = SlackApiWrapper.send_msg("this-channel-does-not-exist", "test message")
        response["ok"].must_equal false
        response["error"].wont_be_nil
      end
    end
    ```

Once you run a test that uses VCR, you'll notice that there will be a file in the `test/cassettes` folder with the name corresponding to the parameter provided in the `use_cassette` method.

If you expect the response data to change, _**you** must delete the cassette file._

Once the cassette file is created, how do we know that our tests are not still calling the API directly? One (very manual) way of doing this is by turning off your Wifi. If you ensure you have the VCR cassette files, then turn off your Wifi and run your tests again, your tests should still pass! Huzzah!

## Wrap Up

Our process for testing with VCR is as follows:

1. Configure VCR
    - Add the VCR setup to your `spec_helper.rb`
    - Ensure that any personal information or secrets are hidden using a filter

1. Wrap test code that causes API calls in `VCR.use_cassette("name") do..end`

1. Run tests as normal

1. Check to see that cassettes have been created

1. When a test needs to change, delete the existing cassette and proceed from step 2