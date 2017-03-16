# Consuming an API w/Ruby

## Learning Goals:
- Consume an API in Ruby
- Identify the pieces of an HTTParty response/request

### HTTP isn't just for browsers

Web api's are requested using HTTP, this means that many tools and any programming language can make requests. Ruby has **many** tools to make HTTP requests:

- [HTTParty](http://httparty.rubyforge.org): Super simple, great to use for learning and simple requests
- [Net::HTTP](http://ruby-doc.org/stdlib-2.1.0/libdoc/net/http/rdoc/Net/HTTP.html): Standard Ruby library.
- [Typheous](https://github.com/typhoeus/typhoeus): Advanced functionality such as parallel requests and streaming.

Here is an example of a simple HTTP request using the HTTParty gem.

```ruby
require 'httparty'
r = HTTParty.get("http://pokeapi.co/api/v2/pokemon/25/")
```

It's that simple. This HTTP request is exactly the same as a request coming from your browser, a form, link, button, etc...  The return value of the HTTParty `.get` method is an HTTParty instance

    #<HTTParty::Response:0x7fe5dc1b8b08 parsed_response={"id"=>25, "name"=>"pikachu", "base_experience"=>112, "height"=>4, "is_default"=>true, "order"=>32, "weight"=>60, "abilities"=>[...

This instance of HTTParty has methods to access the data from the request:

```ruby
r.body    # => Raw response of the HTTP body (the html in this case)
r.code    # => The numerical code of the response (200)
r.message # => The text message that corresponds to the code ("OK")
r.headers # => A hash of data about the request (date, server, content-type)
```

So HTTParty is a tool to make HTTP requests, but HTML isn't a great way for computers to consume data, typically JSON or XML are used to represent data when it's not being displayed to humans. Let's look at an example of HTTParty with a JSON response.

```ruby
r = HTTParty.get("http://pokeapi.co/api/v2/pokemon/25/")
```

HTTParty will attempt to automatically parse any data that it knows how, it's very good at doing this with JSON

    r.parsed_response
    # => {"id"=>25, "name"=>"pikachu", "base_experience"=>112, ...

As you can see the `.parsed_response` returns a ruby `Hash`. HTTParty took the response JSON, and parsed it into ruby. This works similarly with XML.

### Parsing JSON Directly

When `HTTParty` isn't being used, you would need to parse the JSON using Ruby. Ruby provides a class to parse JSON, the class is called `JSON`, the method to parse is called `.parse`. We don't really  need to worry about using this library ourselves, just know that it's out that and that this is probably what `HTTParty` is using.

### Dealing with the data

We've looked at what an API is, how to make a request to it using ruby, and the types of responses you can expect back. Let's look at an example of how we could use this data.
```ruby
require 'httparty' # If using Rails with a Gemfile, this require is not needed
class Pokemon
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  #Using HTTParty to get and parse a JSON request
  def base_info
    HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{ @name }").parsed_response
  end

  def species
    HTTParty.get("http://pokeapi.co/api/v2/pokemon-species/#{ @name }").parsed_response
  end
end
```

We can see this class is initialized with a name, then the instance has two methods to access the Pokemon api:
```ruby
pikachu = Pokemon.new("Pikachu")
pikachu.base_info
pikachu.species
```

With this class we can now easily use the Pokemon API, the functionality can also be easy to test and extend, and even wrap in a gem to use in multiple projects.

### Practice

Try out a few api's using your browser and the [HTTParty gem](http://httparty.rubyforge.org), We've supplied one example request with each api, try to read through the api and figure out a different action to use:

- [Google Books](https://developers.google.com/books/docs/v1/getting_started)
    - `https://www.googleapis.com/books/v1/volumes?q=<search term>`
- [Open Weather Map](http://openweathermap.org)
    - `http://api.openweathermap.org/data/2.5/forecast?q=<search term>`
- [Meme Generator](http://version1.api.memegenerator.net)
    - `http://version1.api.memegenerator.net/Generators_Search?q=<search term>`
- [IP Address Lookup](http://www.hostip.info/use.html)
    - `http://api.hostip.info/get_html.php?ip=<ip address>`
