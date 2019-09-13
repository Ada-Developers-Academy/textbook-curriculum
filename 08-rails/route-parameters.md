# Route Parameters

## Learning Goals

By the end of this lesson, students should be able to...
- Describe the role of a _route parameter_ in a web application
- Define a route with a parameter

## Introduction

We've already built a route, controller action and view for our `/books` resource, which generates HTML for a list of books. Our next step is to build a page to show details on an individual book.

**Question:** What should the URL for this page be?

<details>
<summary>Answer</summary>
The pattern followed in most web applications is to use the URL `/books/number`, where `number` is the ID of the book we're interested in. However, using what we know so far, to do that we would need to define a separate route for each book. This is where route parameters come in.
</details>

### Creating a Parameterized Route

A route parameter is similar to a method parameter, in that part of the path is left unspecified, and is filled in when the route is used. In this case, it will be whatever ID the user types into their address bar. Inside our controller action we'll be able to use that ID to find the book we need.

**Question:** In which file do we define routes?

A parameterized route will look like this:

```ruby
get '/books/:id', to: 'books#show'
```

This should look like the same form of defining routes as before: we still have a _verb_, _path_, that goes to some _controller#action_.

However, note the `:id` in the path - this is the parameter. We can identify it as a route parameter because of the `:`. Remember that we've called it `:id` - we'll be using this name later.

Now any request that Rails gets with a path matching the pattern `/books/something` will be sent to the `show` action on the `BooksController`.

### Using a Route Parameter

We will have access to values that were params in a special hash called `params`. `params`, which contains all of the route params we saw defined above, is _a Rails-defined object_.

In order for us to use it realistically, the next step is to build the `show` action.

**Question:** How do you add a controller action?

## Summary

- Route parameters are a way to have a variable in a URL
- Define route parameters in the routefile with a symbol
  - `get '/books/:id', to: 'books#show'`
- Use route parameters through the special `params` hash

## Additional Resources

- [Rails guide on routing](https://guides.rubyonrails.org/routing.html)
- [Rails guide on params](https://guides.rubyonrails.org/action_controller_overview.html#parameters)
