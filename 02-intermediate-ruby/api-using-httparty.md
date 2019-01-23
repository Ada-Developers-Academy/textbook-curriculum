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

**Question:** What is `response`? What data does it contain? What is its class?

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

## Query Parameters

`dog.ceo` is great, but it's not a very complex API. To explore more of the features of HTTParty, let's dive into something a little more interesting.

### ISS Pass Time API

There is a project called Open Notify, which publishes an API to compute the next time the International Space Station will be visible from a given location on Earth.

**Activity:** Spend a few minutes reading through [the documentation for the ISS pass time API](http://open-notify.org/Open-Notify-API/ISS-Pass-Times/).
- Can you make the API work from your browser?
- What is different about the URL for this API?

### Query Parameter Syntax

The following URL will show ISS passes for Seattle. Put it in your browser now.

```
http://api.open-notify.org/iss-pass.json?lat=47.6062&lon=122.3321
```

The pieces after the `?` in the URL are called _query parameters_. They act almost the same as method parameters in Ruby. Each query parameter takes the form:

```
name=value
```

Different query parameters are separated by ampersand (`&`) characters. A bunch of query parameters together make up a _query string_, which has the form:

```
?name1=value1&name2=value2
```

You can figure out the names and the possible values of an API's query parameters by reading the API's documentation.

### Query Parameters in HTTParty


HTTParty does a lot of work to make it easy to send a request: 

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
