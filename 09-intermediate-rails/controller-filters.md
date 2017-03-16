# Controller Filters

## Learning Goals
- What is a controller filter?
- Use controller filters to DRY up your controller code
- Use controller filters to require user login

### What is a controller filter?
From the [rails docs](http://guides.rubyonrails.org/action_controller_overview.html#filters):  
  `Filters are methods that are run before, after or "around" a controller action.`

`before_action` and `after_action` are the most common, though there is also `around_action`.

### DRY Up Your Controllers
Another good way to use controller filters is to DRY up your code.

Let's examine a typical controller:
```ruby
class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
```

How many times did we duplicate the code `@student = Student.find(params[:id])`? A bunch! Instead of having this code duplicated in _each controller action_, we can use a `before_action` to DRY things up.

First, we create a new `private` method in our controller. It is  `private` because it is _only_ used within this Controller, and is not needed outside of the Controller.
```ruby
private

def find_student
  @student = Student.find(params[:id])
end
```

Next, we should set each of these controller methods up to use this new method using a controller filter. We specify the `only` portion to ensure that this `before_action` will only happen for the specified actions.
```ruby
class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]

  ...
```

Similar to routes, in a controller filter we can use `only` as well as `except` depending on whether we want to use the positive case or the negative one.

Lastly, we can now remove each of the duplicated lines of code from our original controller methods.
```ruby
class StudentsController < ApplicationController
  before_action :find_student only: [:show, :edit, :update]

  def index
    @students = Student.all
  end

  def show; end # Now an action with no contents

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  def edit; end # Now an action with no contents

  def update
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end

  def find_student
    @student = Student.find(params[:id])
  end
end
```

### User Login
"Before" filters may halt the request cycle. A common "before" filter is one which requires that a user is logged in for an action to be run. You can define the filter method this way:

### Example
In the `app/controllers/application_controller.rb`:
```ruby
  before_action :require_login

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to view this section"
      redirect_to session_path
    end
  end
```

If we add this to our application currently, it will cause issues since every action will require login and based on the logic inside of the `require_login` method, every action will then redirect to the login page again and again and again...

We want to ensure that our users can login without already being logged in! We can accomplish this by **excluding** this `require_login` `before_action` on the login controller actions.

In the `app/controllers/sessions_controller.rb`:
```ruby
skip_before_action :require_login, only: [:create]
```

This ensures that the `require_login` method is **not** called before the `create` action to ensure that the user can successfully log in.

### Additional Resources
- [Rails docs](http://guides.rubyonrails.org/action_controller_overview.html#filters)
