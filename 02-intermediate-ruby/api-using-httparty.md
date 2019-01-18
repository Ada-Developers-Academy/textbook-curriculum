# Consuming an API w/Ruby

When we first discussed APIs, we described them as a way to publish data so it's easy for machines to consume. But so far we have only used the browser to read API data. In this lesson, we will discover how to make requests against an API from within a Ruby program.

## Learning Goals:
- Consume an API in Ruby
- Identify the pieces of an HTTParty response/request

## HTTParty

To consume an API from Ruby, we'll need to make use of a gem. There are a few that would do the trick, but in this class we'll be using one called [HTTParty](https://github.com/jnunemaker/httparty). HTTParty doesn't support some of the more complex things you can do with a network connection, but it's relatively simple to use and is more than powerful enough for our purposes.

**Question:** How would we install the HTTParty gem and include it in our program?

### Making Requests

The HTTParty gem gives us access to a module called `HTTParty`, which we can use to make requests. To do so we'll need a URL. This one will do:

```
https://dog.ceo/api/breeds/image/random
```

**Question:** Try this URL out in your browser. What do you get back?

Now let's do the same thing in Ruby. Open up pry and enter the following code:

```ruby
# pry
require 'httparty'

url = "https://dog.ceo/api/breeds/image/random"
response = HTTParty.get(url)
```

Pry is a great tool for investigating an API, because it allows us to poke at the data we get back without having to worry about writing a whole Ruby script.

When we say `HTTParty.get`, HTTParty will send a GET request to the url. The `get` method returns something, which we have stored in the variable `response`.

**Question:** What is `response`? What data does it contain?

`response` looks and acts like a hash containing the data we got back from the server. But it's really an instance of `HTTParty::Response`, which means it's got some extra methods we can call:

```ruby
# Use hash syntax to access the data returned
response["status"]  # => "success"
response["message"] # => "https://images.dog.ceo/breeds/leonberg/n02111129_892.jpg"

# Use dot notation to access other attributes
response.body    # => Raw response of the HTTP body
response.code    # => The numerical code of the response (200)
response.message # => The text message that corresponds to the code ("OK")
response.headers # => A hash of data about the request (date, server, content-type)
response.request # => An HTTParty::Request object containing info about what we sent to the server
```

So HTTParty is a tool to make HTTP requests, but HTML isn't a great way for computers to consume data, typically JSON or XML are used to represent data when it's not being displayed to humans. Let's look at an example of HTTParty with a JSON response.

```ruby
response = HTTParty.get("https://dog.ceo/api/breeds/image/random")
```

HTTParty will attempt to automatically parse any data that it knows how, it's very good at doing this with JSON

```
response.parsed_response
# => {"status"=>"success", "message"=>"https://dog.ceo/api/img/hound-Ibizan/n02091244_1025.jpg"}
```

As you can see the `.parsed_response` returns a ruby `Hash`. HTTParty took the response JSON, and parsed it into ruby. This works similarly with XML. Note that in this response, the `"status"` refers to a string representing the response, not a status code.

### Parsing JSON Directly

When `HTTParty` isn't being used, you would need to parse the JSON using Ruby. Ruby provides a class to parse JSON, the class is called `JSON`, the method to parse is called `.parse`. We don't really  need to worry about using this library ourselves, just know that it's out that and that this is probably what `HTTParty` is using.

### Dealing with the data

We've looked at what an API is, how to make a request to it using ruby, and the types of responses you can expect back. Let's look at an example of how we could use this data.
```ruby
require 'httparty' # If using Rails with a Gemfile, this require is not needed
class Dog
  attr_accessor :breed

  def initialize(breed)
    @breed = breed
  end

  #Using HTTParty to get and parse a JSON request
  def random_picture
    # this will ensure that there are no weird characters in the URI (like a space in the breed name)
    encoded_uri = URI.encode("https://dog.ceo/api/breed/#{ @breed }/images/random")   
    HTTParty.get(encoded_uri).parsed_response
  end
end
```

We can see this class is initialized with a name. Then the instance has one method that accesses the Dog CEO API:
```ruby
husky = Dog.new("Husky")
husky.random_picture

english_spaniel = Dog.new("English Spaniel")
english_spaniel.random_picture
```

With this class we can now easily use the Dog CEO API. We can also test or extend this functionality, or even wrap it in a gem to use in multiple projects.

### Practice

Try out a few APIs using your browser and the [HTTParty gem](https://github.com/jnunemaker/httparty), We've supplied one example request with each api, try to read through the api and figure out a different action to use.

- [Google Books](https://developers.google.com/books/docs/v1/getting_started)
    - `https://www.googleapis.com/books/v1/volumes?q=<search term>`
- [IP Address Lookup](http://www.hostip.info/use.html)
    - `http://api.hostip.info/get_html.php?ip=<ip address>`
    
When reading through an API, ask the following questions:
- How do you walk through the response?
- Does this API require authentication?
- How does this API handle errors?
