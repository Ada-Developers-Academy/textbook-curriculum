# Web API 101

## Learning Goals:
- What is an API
- API data formats
- Consume a web API using Ruby

## What is an API?
A web api is a programmatic interface to request and deliver data using HTTP. Typically api data is JSON or XML. Most modern web API's use JSON, but plenty of XML api's are still in use. There isn't much difference between an api and the applications we've been making so far, except the responses aren't in HTML and usually the request is not coming from a browser. A few example api's are:

#### Weather API

http://openweathermap.org/API is used for current weather data, forecasting, searching, and weather maps.

- **Documentation**: http://openweathermap.org/API
- **Base URI**: http://api.openweathermap.org/data/2.5/
- **Example**:
    - http://api.openweathermap.org/data/2.5/weather?q=Seattle
    - http://api.openweathermap.org/data/2.5/forecast?q=Seattle
    - http://api.openweathermap.org/data/2.5/find?q=Seattle&mode=xml

#### Google Books API
The google books api is used to request and information about books.

- **Base URI**: https://www.googleapis.com/books/v1
- **Documentation**: [Google API](https://developers.google.com/books/docs/v1/using)
- **Example**: [https://www.googleapis.com/books/v1/volumes?q=twain](https://www.googleapis.com/books/v1/volumes?q=twain)

#### Flickr API
Used to retrieve photos by album, collection, user, and search.

- **Base URI**: http://api.flickr.com/services/rest/
- **Documentation**: http://www.flickr.com/services/api/
- **Example**: http://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=INSERT_API_KEY_HERE&format=json
