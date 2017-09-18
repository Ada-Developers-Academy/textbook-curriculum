# HTTP Verbs, CRUD, and Idempotency
## Learning Goals
- Learn about the different kinds of HTTP requests (the HTTP _verbs_)
- Discuss the situations for which each _verb_ is suited
  - Define _idempotent_ and _safe_ in the context of HTTP requests
- Explore how the acronym _CRUD_ (**C**reate **R**ead **U**pdate and **D**elete) relates to both making interactive web applications and HTTP _verbs_.



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

### GET
The HTTP `GET` method is used to __read__ (or retrieve) a representation of a resource. In the everything-went-swimmingly case, `GET` return a representation of data in a format like HTML, XML or JSON, and a HTTP response code of 200 (OK). In an error case, return a 404 (NOT FOUND) or 400 (BAD REQUEST). We'll learn more about HTTP response codes as we go.

According to the design of the HTTP specification, `GET` requests are used only to __read__ data and not change it. Therefore, when used this way, they are considered 'safe'. That is, they can be called without risk of data modification or corruption. To say it another way, calling a resource with `GET` once has the same effect as calling it 10 times. Or a 1000.

`GET` is _idempotent_, __which means that making multiple identical requests ends up having the same result as a single request.__ While idempotent operations produce the same result on the server (no side effects), the response itself may not be the same (e.g. a resource's state may change between requests). For example, `get "/books"` gets the current list of books. The list of books may change between requests, but nothing about the actual process of requesting the `/books` route will _cause_ the list of books to change. `GET` should never modify any resources on the server.

### POST
The `POST` verb is most often utilized to __create__ new resources. In particular, it's used to create _subordinate_ resources. Think of subordinate resources as representing a single instance of a _parent_ resource. You wouldn't use `POST` to define what a `Book` object is, but you would use `POST` to __create__ data attributes about a specific `Book`.

By default, on successful creation, a `POST` should return HTTP status 201, and a `Location` header with a link to the newly-created resource.

`POST` is neither safe nor idempotent. It is therefore recommended for non-idempotent resource requests. Making two identical `POST` requests will most-likely result in two separate resources containing the same information.

### PATCH (and PUT)
`PUT` and `PATCH` are most-often utilized for __update__ capabilities. We `PUT` to a known resource with a request body containing newly-updated representation of the original resource.

On successful `PUT`, send a response code of 200 (OK; has response body) or 204 (OK; no response body). It is not necessary to return a link via a Location header in the creation case since the client already set the resource ID.

`PUT` is not a safe operation, in that it modifies state on the server, _but it typically is idempotent_. In other words, if you create or update a resource using `PUT` and then make that same call again, the resource is still there and still has the same state as it did with the first call. Since the request does not mutate the resource in a way that would differ across a variable number of calls, we can say it is _idempotent_.

This idea of crafting _idempotent_ requests is a design ideal. There's nothing stopping us from creating `PUT` requests that mutate the resource in a way that is not _idempotent_. For instance, calling `PUT` on a resource that increments a counter within the resource would make the call no longer _idempotent_. However, it's recommended to keep `PUT` requests _idempotent_. Use `POST` for non-_idempotent_, mutating requests.

#### A note about PUT, PATCH and Rails
In the wild, `PUT` and `PATCH` are used interchangeably - they both indicate the server should update a resource. They are not the same however - `PUT` indicates the resource should be _replaced_, while `PATCH` allows a _partial update_ to a resource. [The official Rails documentation prefers `PATCH`](http://weblog.rubyonrails.org/2012/2/26/edge-rails-patch-is-the-new-primary-http-method-for-updates/) for most uses.

### DELETE
`DELETE` does what it says on the tin. It is used to __delete__ a resource.

On successful deletion, return HTTP status 200 (OK) along with a response body (usually the representation of the deleted item), or a wrapped response (see Return Values below). If you're bandwidth constrained or just feeling kinda lazy, return HTTP status 204 (NO CONTENT) with no response body.

HTTP-spec-wise, `DELETE` operations are _idempotent_. If you `DELETE` a resource, it's removed. Repeatedly calling `DELETE` on that resource ends up the same: the resource is gone. If calling `DELETE` say, decrements a counter (within the resource), the `DELETE` call is no longer _idempotent_. As mentioned previously, usage statistics and measurements may be updated while still considering the service _idempotent_ as long as no resource data is changed. Using POST for non-_idempotent_ resource requests is recommended.

There is a caveat about `DELETE` idempotence, however. Calling `DELETE` on a resource a second time will often return a 404 (NOT FOUND) since it was already removed and therefore is no longer findable. This, by some opinions, makes DELETE operations no longer _idempotent_, however, the end-state of the resource is the same. Returning a 404 is acceptable and communicates accurately the status of the call.

## CRUD
**C**reate. **R**ead. **U**pdate. **D**elete. This acronym embodies a huge majority of what we do with our web applications both simple and complex. We begin architecting our applications routes and interfaces by considering what kind of actions users will perform (CRUD) and what effects those actions will have on resources within the application (idempotency).

## Summary

**Safe**: The request can be made without resulting in data modification.

**Idempotent**: Making the same request multiple times will result in the same behavior.

| HTTP Verb | CRUD Action | Safe | Idempotent |
|-----------|-------------|------|------------|
| `GET`     | Read        | ✅  | ✅        |
| `POST`    | Create      | ❌   | ❌         |
| `PATCH` or `PUT` | Update | ❌ | ✅        |
| `DELETE`  | Delete      | ❌   | ✅        |


## Additional Resources

- [Description of the various HTTP verbs](http://www.restapitutorial.com/lessons/httpmethods.html)
- [Difference between HTTP verbs and CRUD](http://softwareengineering.stackexchange.com/questions/120716/difference-between-rest-and-crud)
- [HTTP Status Dogs](https://httpstatusdogs.com/)
- [HTTP Basics](https://www.ntu.edu.sg/home/ehchua/programming/webprogramming/HTTP_Basics.html)
