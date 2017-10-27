# Web API 101

## Learning Goals:
- What is an API?
- API data formats
- Consider example APIs and consider authentication for APIs

## What is an API?
A web API is a programmatic interface to request and deliver data using HTTP. There isn't much difference between an API and the applications we've been making so far, except the responses aren't in HTML and usually the request is not coming from a browser.

APIs interact using HTTP so all that we've learned about the response-request cycle in Rails will apply to the way we'll use APIs as well.

## Data Formats
APIs use specific data formats because the only way for computers to interact with one another is by agreeing upon the way that communication will happen. Generally this communication happens using some kind of text format. Typically API data is JSON or XML. Most modern web API's use JSON, but plenty of XML APIs are still in use.

### JSON (JavaScript Object Notation)
JSON objects look a lot like Ruby Hashes. They consist of _keys_ and _values_. Unlike Ruby Hashes, JSON keys are always strings, and values are often strings. Dates and numeric values are not represented as strings.

Here is an example set of JSON data that represents a list of products:
```javascript
[
    {
        "id": 2,
        "name": "An ice sculpture",
        "price": 12.50,
        "tags": ["cold", "ice"],
        "dimensions": {
          "length": 7.0,
          "width": 12.0,
          "height": 9.5
        },
        "warehouseLocation": {
          "latitude": -78.75,
          "longitude": 20.4
        }
    },
    {
        "id": 3,
        "name": "A blue mouse",
        "price": 25.50,
        "dimensions": {
          "length": 3.1,
          "width": 1.0,
          "height": 1.0
        },
        "warehouseLocation": {
          "latitude": 54.4,
          "longitude": -32.7
        }
    }
]
```

Note that the overall collection is contained within an Array, and each individual item is represented by a single JSON object (the `{}`).

### XML (Extensible Markup Language)
XML has been around much longer than JSON and is therefore more mature and used in most legacy applications. HTML (which stands for Hypertext Markup Language) uses a very similar structure, so XML should look very similar to us.

Here is the same data from above, but represented in XML:
```html
<products>
  <product>
    <id>2</id>
    <name>An Ice Sculpture</name>
    <price>12.50</price>
    <tags>
      <tag>cold</tag>
      <tag>ice</tag>
    </tags>
    <dimensions>
      <length>7.0</length>
      <width>12.0</width>
      <height>9.5</height>
    </dimensions>
    <warehouseLocation>
      <latitude>-78.75</latitude>
      <longitude>20.4<longitude>
    </warehouseLocation>
  </product>

  <product>
    <id>3</id>
    <name>A blue mouse</name>
    <price>25.50</price>
    <dimensions>
      <length>3.1</length>
      <width>1.0</width>
      <height>1.0</height>
    </dimensions>
    <warehouseLocation>
      <latitude>54.4</latitude>
      <longitude>-32.7<longitude>
    </warehouseLocation>
  </product>
</products>
```

### Some Examples



#### GitHub API

The GitHub API is used for accessing all things GitHub!

- **Documentation**: [GitHub API Docs](https://developer.github.com/v3/)
- **Base URI**: http://api.github.com
- **Example Endpoints**:
    - [https://api.github.com/orgs/AdaGold/repos](https://api.github.com/orgs/AdaGold/repos)
    - https://api.github.com/users/<your_user_name_here>

#### Google Books API
The Google Books API is used to request and information about books.

- **Base URI**: https://www.googleapis.com/books/v1
- **Documentation**: [Google API](https://developers.google.com/books/docs/v1/using)
- **Example Endpoint**: [https://www.googleapis.com/books/v1/volumes?q=twain](https://www.googleapis.com/books/v1/volumes?q=twain)

#### iTunes API
Used to retrieve information about all different media types within iTunes.

- **Base URI**: http://itunes.apple.com/
- **Documentation**: [https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api](https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api)
- **Example Endpoint**: [https://itunes.apple.com/search?term=tegan+and+sara](https://itunes.apple.com/search?term=tegan+and+sara)

### Authentication
Oftentimes APIs are available for general use to the public. To ensure that the API creator can appropriately monitor and secure their API, they require the API consumer to unique identify themselves using an **API Key**. Each API creator determines how to provide the key along with your request, so it is different for different providers.

The three examples above do not require an API key, so we can make requests and see the responses without doing anything special. Most of these APIs provide _some_ amount of data without authenticating, but certain things will be locked down. For example, the API endpoint to retrieve the GitHub teams for a given organization (https://api.github.com/orgs/AdaGold/teams) requires authentication.
