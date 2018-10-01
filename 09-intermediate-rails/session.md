# Session

## Learning Goals
- Learn about and utilize `session` in Rails
- See how `session` & `flash` are different than other variables in Rails

## `session`
`session` is a special type of hash-like-object that we utilize to keep track of data throughout a users "session", which normally ends when they close their browser. `session` is similar to `flash`, except that data stored there will not go away after the next request-response cycle. Instead it will be stored indefinitely. `session` is most often used to store information about a user when they log in.

Rails will automatically delete the information from the `session` when the user closes the browser. We can also manually remove the data if we not longer want to track it (like when the user logs out).

Let's see it! We are going to create a special form which is going to allow our authors to "log in". This is not a secure way to simulate logging in, but we are using this as our first stepping stone to creating "real" authentication, which we'll do later on. We'll allow the user to type an authors name which will "log in" as that author.

We'll need to a create a few new things in our application in order to get set up for this:
1. Create a login form and form submission route (think of how we do `new` and `create`)
2. Create a special controller for managing this login process called `SessionsController`
3. Add empty controller actions for the routes in step #1
4. Create a form view where our user will enter in the author's name
5. Create our initial controller action which will set the `session`
```ruby
# app/controllers/sessions_controller.rb
...
  def login
    author = Author.find_by(name: params[:name])

    if author
      session[:author_id] = author.id
    end
  end
```

6. Update the controller action to improve the user experience after they log in:
```ruby
# app/controllers/sessions_controller.rb
...
  def login
    author = Author.find_by(name: params[:name])

    if author
      session[:author_id] = author.id
      flash[:success] = "#{ author.name } is successfully logged in"
      redirect_to root_path
    end
  end
```

**Question**: Now where can we utilize this logged in Author information?  
**Question**: How you think you'd use the `session` in a logout action?

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
