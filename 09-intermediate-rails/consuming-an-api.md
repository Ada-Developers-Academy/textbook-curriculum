# Consuming an API w/Ruby

## Learning Goals:
- Consume an API in Ruby
- Identify the pieces of an HTTParty response/request

### HTTP isn't just for browsers

Web api's are requested using HTTP, this means that many tools and any programming language can make requests. Ruby has **many** tools to make HTTP requests:

- [HTTParty](http://httparty.rubyforge.org): Just a few features, great to use for learning and simple requests
- [Net::HTTP](http://ruby-doc.org/stdlib-2.1.0/libdoc/net/http/rdoc/Net/HTTP.html): Standard Ruby library.
- [Typheous](https://github.com/typhoeus/typhoeus): Advanced functionality such as parallel requests and streaming.

Here is an example of an HTTP request using the HTTParty gem.

```ruby
require 'httparty'
response = HTTParty.get("https://dog.ceo/api/breeds/image/random")
```

...and just like that we will get back data from an API! This HTTP request is exactly the same as a request coming from your browser, a form, link, button, etc...  The return value of the HTTParty `.get` method is an HTTParty instance

    #<HTTParty::Response:0x7fa8c282d008 parsed_response={"status"=>"success", "message"=>"https://dog.ceo/api/img/hound-Ibizan/n02091244_1025.jpg"},...

This instance of HTTParty has methods to access the data from the request:

```ruby
response.body    # => Raw response of the HTTP body (the html in this case)
response.code    # => The numerical code of the response (200)
response.message # => The text message that corresponds to the code ("OK")
response.headers # => A hash of data about the request (date, server, content-type)
```

So HTTParty is a tool to make HTTP requests, but HTML isn't a great way for computers to consume data, typically JSON or XML are used to represent data when it's not being displayed to humans. Let's look at an example of HTTParty with a JSON response.

```ruby
response = HTTParty.get("https://dog.ceo/api/breeds/image/random")
```

HTTParty will attempt to automatically parse any data that it knows how, it's very good at doing this with JSON

    response.parsed_response
    # => {"status"=>"success", "message"=>"https://dog.ceo/api/img/hound-Ibizan/n02091244_1025.jpg"}

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

Try out a few APIs using your browser and the [HTTParty gem](http://httparty.rubyforge.org), We've supplied one example request with each api, try to read through the api and figure out a different action to use.

- [Google Books](https://developers.google.com/books/docs/v1/getting_started)
    - `https://www.googleapis.com/books/v1/volumes?q=<search term>`
- [IP Address Lookup](http://www.hostip.info/use.html)
    - `http://api.hostip.info/get_html.php?ip=<ip address>`
    
When reading through an API, ask the following questions:
- How do you walk through the response?
- Does this API require authentication?
- How does this API handle errors?
