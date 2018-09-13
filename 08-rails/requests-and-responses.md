# Requests and Responses: HTTP Verbs, CRUD, and Status Codes
## Learning Goals

- Learn about the different kinds of HTTP requests (the HTTP _verbs_)
- Discuss the situations for which each _verb_ is suited
- Explore how the acronym _CRUD_ (<b>C</b>reate <b>R</b>ead <b>U</b>pdate and <b>D</b>elete) relates to both making interactive web applications and HTTP _verbs_.
- Return a status code from a Rails application

## Introduction
The main differences between a _website_ and a _web application_ is the management of **resources**, aka **data**. There is always a set of common actions that we want to execute on data in a web application.

Those actions are to:
- **Create** new data
- **Read** existing data
- **Update** existing data
- **Delete** existing data

You'll hear this set of actions referred to as **CRUD**.

![CRUD](images/CRUD.png)

## HTTP verbs
When creating these CRUD actions for our web application, we must use the **HTTP Verb** in our request which corresponds to the action we want to take.

In the table below, you can see the starter mapping between the HTTP Verb and the CRUD Action.

| HTTP Verb | CRUD Action |
|-----------|-------------|
| `GET`     | Read        |
| `POST`    | Create      |
| `PATCH` or `PUT` | Update|
| `DELETE`  | Delete      |

By specifying the appropriate HTTP Verb, we will give our web application the information it needs to construct the appropriate response. If we send a `GET` request, our web application should understand that we don't want to _change_ anything in our data, we just want to _read_ it.


## The Details
### So what does an _HTTP GET Request_ look like?

The typical http request from a client is a `GET`.  When your browser goes to `localhost:3000/books` it sends an http get request.

Kinda like this:

```
# this is the request
GET /books HTTP/1.1
User-Agent: curl/7.30.0
Host: localhost:8080
Content-Length: 6
Accept: */*
```

```
# and the corresponding response
HTTP/1.1 200 OK
Content-Type: text/html
Server: WEBrick/1.3.1 (Ruby/2.1.2/2014-05-08)
Date: Mon, 22 Sep 2014 19:19:57 GMT
Content-Length: 21
Connection: Keep-Alive

# then a bunch of html
```

So what is `GET` exactly, and why do I keep typing it in all caps? Short answer: `GET` is one of a family of HTTP _verbs_ that we use to describe the nature of a request. Some _verbs_ are responsible for fetching information from the server; others are responsible for doing things like telling the server to update or even delete data. There's quite a few default _verbs_ in the HTTP spec, though we (Ruby/Rails devs) mostly just use `GET`, `POST`, `PUT` (and `PATCH`), and `DELETE`.

Here's the long version (paraphrased/contextualized from [REST API Tutorial](http://www.restapitutorial.com/lessons/httpmethods.html)):

## CRUD
<b>C</b>reate. <b>R</b>ead. <b>U</b>pdate. <b>D</b>elete. This acronym embodies a huge majority of what we do with our web applications both simple and complex. We begin architecting our applications routes and interfaces by considering what kind of actions users will perform (CRUD) and what effects those actions will have on resources within the application (idempotency).

## Summary




## Additional Resources

- [Description of the various HTTP verbs](http://www.restapitutorial.com/lessons/httpmethods.html)
- [Difference between HTTP verbs and CRUD](http://softwareengineering.stackexchange.com/questions/120716/difference-between-rest-and-crud)
- [HTTP Status Dogs](https://httpstatusdogs.com/)
- [HTTP Basics](https://www.ntu.edu.sg/home/ehchua/programming/webprogramming/HTTP_Basics.html)
