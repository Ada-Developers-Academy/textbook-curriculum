# Controller Filters

## Learning Goals
- What is a controller filter?
- Use controller filters to DRY up your controller code

### What is a controller filter?
From the [rails docs](http://guides.rubyonrails.org/action_controller_overview.html#filters):  
  `Filters are methods that are run before, after or "around" a controller action.`

`before_action` and `after_action` are the most common.

Filters are inherited, so if you set a filter on `ApplicationController`, it will be run on every controller in your application.

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
      redirect_to new_session_path
    end
  end
```

If we add this to our application currently, it will cause issues since every action will require login and based on the logic inside of the `require_login` method, every action will then redirect to the login page again and again and again...

We want to ensure that our users can login without already being logged in! We can accomplish this by excluding this `require_login` `before_action` on the login controller actions.

In the `app/controllers/sessions_controller.rb`:
```ruby
skip_before_action :require_login, only: [:new, :create]
```
