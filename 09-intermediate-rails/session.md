# Session

## Learning Goals
- Learn about and utilize `session` in Rails
- See how `session` & `flash` are different than other variables in Rails

## `session`
`session` is a special type of hash-like-object that we utilize to keep track of data throughout a users "session", which normally ends when they close their browser. `session` is similar to `flash`, except that data stored there will not go away after the next request-response cycle. Instead it will be stored indefinitely. `session` is most often used to store information about a user when they log in.

Rails will automatically delete the information from the `session` when the user closes the browser. We can also manually remove the data if we not longer want to track it (like when the user logs out).

Let's see it! We are going to create a special form which is going to allow our users to "log in". This is not a secure way to simulate logging in, but we are using this as our first stepping stone to creating "real" authentication, which we'll do later on. We'll allow the user to type a username which will "log in" as that user.

Get the most recent version of the book site code from your instructor, then work through these steps with a partner.

1. Create a new `User` model with one column, `username`
    ```sh
    $ rails generate model User username:string
    $ rails db:migrate
    ```
1. Create a `UsersController`
    ```sh
    $ rails generate controller Users
    ```
1. Add the following routes to your routefile:
    ```ruby
    get "/login", to: "users#login_form", as: "login"
    post "/login", to: "users#login"
    post "/logout", to: "users#logout", as: "logout"
    get "/users/current", to: "users#current", as: "current_user"
    ```

    **Question:** Are these routes RESTful? If not, why not?
1. Create the `users#login_form` action and view. The view for this action should use `form_with` to create a form for the `User` model, accepting just the `username`.
    
    **Question:** Do you need to do anything in the controller action to enable this?

    **Question:** Given the routes above, do we need to do anything special with `form_with`?

    <details>
    <summary>Click here to see our implementation</summary>

    ```ruby
    # app/controllers/users_controller.rb
    def login_form
      @user = User.new
    end
    ```

    ```html+erb
    <!-- app/views/users/login_form.html.erb -->
    <%= form_with model: @user, url: login_path do |f| %>
      <%= f.label :username %>
      <%= f.text_field :username %>

      <%= f.submit "Log In" %>
    <% end %>
    ```
    </details>
1. Create the `users#login` action. This action should read the `username` field sent by the form, and do one of two things:
    - If the `username` corresponds to a `User` in the database, that user is returning to our site. Save their ID in `session[:user_id]`
    - If the `username` does not correspond to an existing user, this is a new user logging in for the first time. Create a `User` model, and use its ID to populate `session[:user_id]`.

    **Question:** How will the data sent by the form be organized? If you're not sure, how could you find out?

    <details>
    <summary>Click here to see our implementation</summary>

    ```ruby
    # app/controllers/users_controller.rb
    def login
      username = params[:user][:username]
      user = User.find_by(username: username)
      if user
        session[:user_id] = user.id
        flash[:success] = "Successfully logged in as returning user #{username}"
      else
        user = User.create(username: username)
        session[:user_id] = user.id
        flash[:success] = "Successfully logged in as new user #{username}"
      end

      redirect_to root_path
    end
    ```
    </details>
1. Create the `users#current` action. This page should display information about the currently logged-in user.

    **Question:** What should this page do if no one is currently logged in? There is more than one possible answer to this!

    <details>
    <summary>Click here to see our implementation</summary>

    ```ruby
    # app/controllers/users_controller.rb
    def current
      @current_user = User.find_by(id: session[:user_id])
      unless @current_user
        flash[:error] = "You must be logged in to see this page"
        redirect_to root_path
      end
    end
    ```

    ```html+erb
    <!-- app/views/users/current.html.erb -->
    <h2>You are logged in as user <%= @current_user.username %></h2>
    ```
    </details>
1. Create the `users#logout` action. This should set `session[:user_id]` to `nil` and redirect the user back to the `root_path`.
1. Think about other things you could add to improve the user experience. What has worked well on other sites you've visited?

## Key Takeaways
Rails provides a few special hash-like objects that allow us to go above and beyond local and instance variables in our Rails applications.

We will utilize `session` to keep track of logged in user information.

### Table of Rails Hash-like Objects
See this updated table that now includes `session`.

| Name        | Data Comes From                    | Available |
|:------------|:-----------------------------------|:----------|
| `flash`     | This or the last controller action | The rest of this request cycle and the next complete request cycle |
| `flash.now` | This controller action. Adds to the `flash` from the last cycle, but will not be carried over to the next one. | The rest of this request cycle (in `flash`) |
| `session`   | Some controller action             | Until the user closes the browser |
| `params`    | The request (URL or body)          | The corresponding request cycle   |


## Additional Resources
- [Sessions, Cookies and Authentication ](http://www.theodinproject.com/courses/ruby-on-rails/lessons/sessions-cookies-and-authentication)(not including 'Rolling Your Own Auth')
- [Rails Guide on Session](http://guides.rubyonrails.org/action_controller_overview.html#session)
