# Rails Forms: Strong Params

## Learning Goals
- Identify what strong parameters are and why Rails requires them
- Extend Rails forms to use strong parameters

### Getting Started

Let's consider where we ended up most recently with our controller method that handled adding a new book, `create`. Here is the code we ended up with:
```ruby
# in app/controllers/books_controller.rb
def create
  @book = Book.new(author: params[:book][:author], title: params[:book][:title], params[:book][:description]) #instantiate a new book
  if @book.save # save returns true if the database insert succeeds
    redirect_to root_path # go to the index so we can see the book in the list
    return
  else # save failed :(
    render :new # show the new book form view again
    return
  end
end
```

This code is written with the assumption that our `params` hash contains data as follows:
```ruby
{
  book: {
    author: "some author",
    title: "some title",
    description: "some description"
  }
}
```

Notice that the parameters passed into `Book.new` are all listed out individually. What if we wanted to pass all of the data from the `params` directly without listing out each individual field? What happens when we try: `@book = Book.new(params[:book)])`?

What happened? Most likely, you've gotten a `ForbiddenAttributeError`.

In Rails, controllers are **not permitted to pass parameters directly** from the form into our ActiveRecord model instances. This is a security feature to ensure users cannot update sensitive model attributes that they should not be updating.

### Strong Parameters
Rails has introduced the concept of **strong parameters** to use in our controllers to prevent these errors. Strong params will require us to give explicit access to a set of attributes that come through `params` that we'll then be able to pass to our model methods. We set up strong params once for our controller, and then we will no longer need to specify each field individually (in the way we had to above).

### Update the Controller
Now that we have an idea of _why_ we need strong params, let's see how to implement these in our controller.

1. Create a `private` method section towards the bottom of our controller.
1. Create a new method that we'll use to return the _permitted_ parameters.
    ```ruby
    private

    def book_params
      # code here
    end
    ```
1. We'll use two special controller methods here which will allow us to define exactly which parameters (coming from the form) we want to allow. Those methods are `require` and `permit`.  We use `require` to identify the highest-level param which contains all others and that we cannot live without. We then use `permit` to list the params within that overall one which we want to allow.
    ```ruby
    private

    def book_params
      return params.require(:book).permit(:author, :title, :description)
    end
    ```
1. We then use this method within our creation code above, in place of the code where we were writing out each parameter.
    ```ruby
    def create
      @book = Book.new(book_params) #instantiate a new book using strong params
      ...
      # this code is the same
    end
    ```
1. Run through the form submission again to ensure that we are no longer getting the `ForbiddenAttributeError`.

A few things to note here:

1. The new `book_params` method is using the `params` variable which the controller makes available to us (even though we're not passing it in as a parameter)
1. We chain the method calls of `require` and `permit`. This works because the `:description` `:author` and `:title` fields are located **within** the `:book` param.
1. If the request is made **without** `:book` in `params` the application will raise an error.  

Later we will write tests to verify that the controller responds with :bad_request when the params are missing.  For now, we do not have validations to test it against.


## Key Takeaway
We use strong params within our controllers to provide a safe way to require and permit data that comes from our forms. This is a Rails controller pattern that we should follow rather than specifying each field individually.

## Additional Resources
- [Rails Guide: Strong parameters](http://edgeguides.rubyonrails.org/action_controller_overview.html#strong-parameters)
