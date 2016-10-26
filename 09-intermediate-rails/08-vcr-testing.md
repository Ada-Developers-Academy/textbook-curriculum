# Testing APIs

## Learning Goals
- Identify the areas of APIs that we want to test
- Utilize VCR to snapshot API calls
- Integrate tests

https://github.com/vcr/vcr/wiki/Usage-with-MiniTest

### How is testing APIs different?
We know why testing is important, we have seen the importance of the TDD cycle. When testing APIs it is important to note that we are now relying on external sources for our own code to work. There are a few things to consider when testing external sources:
1. If they're down, we're down
1. Every API call costs something (whether it be counting against your # of free calls or actually costing real $)

With these two considerations in mind, we want to reduce the dependency on an external API in testing, so we can focus on the important pieces of our code. In comes VCR!

### What is VCR?
VCR is a tool that allows your tests to _record_ HTTP interactions and replay them when necessary. By re-using these responses, VCR will improve stability and performance of your test suite.

Each interaction is recorded as a **cassette**. We can load **insert** and **eject** cassettes in our tests, depending on which requests/responses we want to be testing.

### Installation
1. **Gem**

There is a specific gem that we can use to include VCR in our tests. First, we'll load that into our `development` and `test` sections.

```ruby
group :development, :test do
    gem 'minitest-vcr'
end
```

2. **Test Config**

In your `test_helper.rb` file, add the following code:
```ruby

```

3. **Tests**

Now you're ready to test!!
