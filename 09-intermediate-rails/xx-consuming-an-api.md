# Consuming an API w/Ruby

## Learning Goals:
- 

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

So HTTParty is a tool to make HTTP requests, but HTML isn't a great way for computers to consume data, typically JSON or XML are used to represent data when it's not being displayed to humans. Let's look at an example of HTTParty with a JSON response. Sign up for a free api key at [OpenWeatherMap.org](https://home.openweathermap.org/users/sign_up).

```ruby
r = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=Seattle&APPID=#{your_api_key}")
# => <HTTParty::Response:0x7fda1c9e2778 parsed_response={"coord"=>{"lon"=>-122.33, "lat"=>47.61}...
```

HTTParty will attempt to automatically parse any data that it knows how, it's very good at doing this with JSON

    r.parsed_response
    # => {"coord"=>{"lon"=>-122.33, "lat"=>47.61}, "sys"=>{}}

As you can see the `.parsed_response` returns a ruby `Hash`. HTTParty took the response JSON, and parsed it into ruby. This works similarly with XML.

### Parsing  JSON

When `HTTParty` isn't being used, you would need to parse the JSON using Ruby. Ruby provides a class to parse JSON, the class is called `JSON`, the method to parse is called `.parse`. First let's look at what some JSON looks like:

    '{"person": {"name": "Bookis"}}'

We can see it suspiciously similar to a ruby Hash, but it's wrapped in a String (JSON is a _string_). The `parse` method interprets a JSON string to create a Ruby hash object:

```ruby
JSON.parse('{"person": {"name": "jnf"}}')
# => {"person"=>{"name"=>"jnf"}}
```

### Dealing with the data

We've looked at what an api is, how to make a request to it using ruby, and the types of responses you can expect back. Let's look at an example of how we could use this [data](resources/weather.rb).
```ruby
require 'httparty' # If using Rails with a Gemfile, this require is not needed
class Weather
  attr_accessor :city

  def initialize(city)
    @city = city
  end

  #Using HTTParty to get and parse a JSON request
  def current_weather
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}").parsed_response
  end

  def forecast
    HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?q=#{city}").parsed_response
  end
end
```

We can see this class is initialized with a city name, then the instance has two methods to access the weather api:

    seattle = Weather.new("seattle")
    seattle.current_weather
    seattle.forcast

With this class we can now easily use the weather api, the functionality can also be easy to test and extend, and even wrap in a gem to use in multiple projects.

### Practice

Try out a few api's using your browser and the [HTTParty gem](http://httparty.rubyforge.org), I've supplied one example request with each api, try to read through the api and figure out a different action to use:

- [Google Books](https://developers.google.com/books/docs/v1/getting_started)
    - `https://www.googleapis.com/books/v1/volumes?q=<search term>`
- [Open Weather Map](http://openweathermap.org)
    - `http://api.openweathermap.org/data/2.5/forecast?q=<search term>`
- [Meme Generator](http://version1.api.memegenerator.net)
    - `http://version1.api.memegenerator.net/Generators_Search?q=<search term>`
- [IP Address Lookup](http://www.hostip.info/use.html)
    - `http://api.hostip.info/get_html.php?ip=<ip address>`
