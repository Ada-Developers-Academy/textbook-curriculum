# Controller Filters for User Authorization

## Learning Goals
- Use controller filters to require user login
- Practice using memoization

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
      redirect_to session_path
    end
  end
```

This before filter assumes that the application has set the `session[:user_id]` property in the `SessionsController` as part of the *User Authentication* process.

If we add this to our application currently, it will cause issues since every action will require login and based on the logic inside of the `require_login` method, every action will then redirect to the login page again and again and again...

We want to ensure that our users can login without already being logged in! We can accomplish this by **excluding** this `require_login` `before_action` on the login controller actions.

In the `app/controllers/sessions_controller.rb`:
```ruby
...
skip_before_action :require_login, only: [:create]
...
```

This ensures that the `require_login` method is **not** called before the `create` action to ensure that the user can successfully log in.

## Additional Resources
- [Basics of Ruby Memoization](http://gavinmiller.io/2013/basics-of-ruby-memoization/)
