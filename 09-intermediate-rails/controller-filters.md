# Controller Filters

## Learning Goals
- What is a controller filter?
- Use controller filters to DRY up your controller code

### What is a controller filter?
From the [rails docs](http://guides.rubyonrails.org/action_controller_overview.html#filters):  
  `Filters are methods that are run before, after or "around" a controller action.`

`before_action` and `after_action` are the most common, though there is also `around_action`.

### DRY Up Your Controllers
Another good way to use controller filters is to DRY up your code.

Let's examine a typical controller:
```ruby
class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by_id(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find_by_id(params[:id])
  end

  def update
    @book = Book.find_by_id(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :isbn, :author_id)
  end
end
```

How many times did we duplicate the code `@book = Book.find_by_id(params[:id])`? A bunch! Instead of having this code duplicated in _each controller action_, we can use a `before_action` to DRY things up.

First, we create a new `private` method in our controller. It is  `private` because it is _only_ used within this Controller, and is not needed outside of the Controller.
```ruby
private

def find_book
  @book = Book.find_by_id(params[:id])
end
```

Next, we should set each of these controller methods up to use this new method using a controller filter. We specify the `only` portion to ensure that this `before_action` will only happen for the specified actions.
```ruby
class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update]

  ...
```

Similar to using resources routes, in a controller filter we can use `only` as well as `except` depending on whether we want to use the positive case or the negative one.

Lastly, we can now remove each of the duplicated lines of code from our original controller methods.
```ruby
class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update]

  def index
    @books = Book.all
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :isbn, :author_id)
  end

  def find_book
    @book = Book.find_by_id(params[:id])
  end
end
```


### Additional Resources
- [Rails docs](http://guides.rubyonrails.org/action_controller_overview.html#filters)
