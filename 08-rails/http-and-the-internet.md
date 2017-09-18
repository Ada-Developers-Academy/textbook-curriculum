# HTTP And The Internet
## Learning Goals
- Examine the _HTTP_ protocol; what does it do? How does it do it?
- Talk about the most common server architecture on the internet: _Client/Server_
- Define the key pieces in making the internet work:
  + _webserver_
  + _client_
  + _network_
  + _request_
  + _response_

## So what is the Internet?
It's a computer network: a collection of computers and devices connected using communication devices (routers, cables, wifi, fiber, etc).

Computers communicate over a network by sending data over the connection.

There are many types of networks and architectures, but we're going to look primarily at the internet and client/server architecture.

### Client/Server

A **Server** is a computer that provides a service to clients.

A **Client** is a computer that requests services from a _server_ (your web browser, an ATM, your phone, a point-of-sale terminal).

Typically there is a single _server_ and many _clients_.

![Client Server](images/client-server.png)

### How do _clients_ and _servers_ communicate? Protocols.

Hypertext Transfer Protocol (HTTP) functions as a __request-response__ protocol.

A client sends a __request__ and a server sends back an __response__. HTTP describes how that request and response are formatted. There are lots of different protocols that describe lots of different kinds of interactions. Common protocols utilized in networked or internet-based applications include HTTP and HTTPS (hypertext transfer protocol secured), IMAP, FTP, SSH, SMTP, LDAP, DHCP, and more.

All of these are, at the end of the day, text sent over the network. A suite of technologies take this text, carry it to the intended destination, and make sense of it. The _protocol_ is the definition of how the _client_ and _server_ understand the information they've received. Most _protocols_ serve a single purpose--displaying web pages (http), sending an email (smtp), transmitting a file (ftp), etc.


## Ruby's role in all of this
We will use Ruby--specifically a collection of Gems called **Rails**--to create a _webserver_.

The _webserver_ is a program on the _server_ which monitors incoming _HTTP requests_
and then responds with an _HTTP response_. A _webserver_ interfaces your application with incoming _HTTP requests_ on the server. By using Rails, we can introduce logic into our server so that it can make decisions, process user input, query data, and more.

When we create a Rails web application, we make a **request** from our browser to our webserver, which then will send a **response** back to our browser. When we develop our Rails applications, we run our webserver locally, on our own computer.

![Localhost Request Response](images/local-request-response.png)


### Request
So what does an _HTTP Request_ look like?



Below is an example. The key components for us right now are the:
- HTTP Verb, **GET**
- request URL, `/orders`

```
GET /orders HTTP/1.1
User-Agent: curl/7.30.0
Host: localhost:3000
Content-Length: 6
Accept: */*
```

The data sent in the request allows the server to determine what type of data you want to see in the response. A combination of HTTP verbs and URLs will give us our application behavior.

### Response

Below is an example response to the request above. The key components for us right now are the:
- Status code, **200**
- Status phrase, **OK**
- Content type, **text/html**
- The "bunch of HTML"

```
HTTP/1.1 200 OK
Content-Type: text/html
Server: WEBrick/1.3.1 (Ruby/2.1.2/2014-05-08)
Date: Mon, 22 Sep 2014 19:19:57 GMT
Content-Length: 21
Connection: Keep-Alive

# then a bunch of HTML
```

When the server interprets the request, it constructs a response to send back. The status information in the response immediately tells the requestor what type of response this is. Common status codes that you've seen before are:
- 200 OK
- 404 Not Found
- 403 Forbidden
- 500 Internal Server Error

Oftentimes, the server's response also contains HTML. This is the HTML that will be displayed on the page when your browser renders the response. Even when there is a 404 Not Found error, the response often still contains HTML which will display this information to the user. One example, is [GitHub's 404 page](https://github.com/sdjflksjdfksdjfkljsdlkfjs), which you've probably seen before.
