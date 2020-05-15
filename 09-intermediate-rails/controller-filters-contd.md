# Controller Filters for User Authorization

## Learning Goals
- Use controller filters to require user login

## Getting Started

We explored how to use controller filters in a previous lecture to DRY up our code. Now, we are going to utilize controller filters to implement *User Authorization*.

### User Login
"Before" filters halt the request cycle prior to accessing the expected controller action. A common "before" filter is one which requires that a user is logged in for an action to be run. You can define the filter method this way:

### Example
In the `app/controllers/application_controller.rb`:
```ruby
...
  before_action :require_login

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to view this section"
      redirect_to login_path
    end
  end
```

This `before_action` filter assumes that the application has set the `session[:user_id]` property in the `UsersController` as part of the *User Authentication* process.

If we add this to our application currently, it will cause issues since every action will require login and based on the logic inside of the `require_login` method, every action will then redirect to the login page again and again and again...

We want to ensure that our users can login without already being logged in! We can accomplish this by combining two things Rails has for controller filters: the `skip_before_action` filter, and the options to define which actions to exclude with `except`.

In the `app/controllers/users_controller.rb`:
```ruby
...
skip_before_action :require_login, except: [:current_user]
...
```

The `skip_before_action` ensures that the `require_login` method is **skipped on every action defined in this controller,** *except* the action listed after `except`: the `current_user` action.

## Additional Resources
- [Rails Documentation on Controller Filters](https://guides.rubyonrails.org/action_controller_overview.html#filters)
