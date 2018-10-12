# User Authentication and Authorization using OAuth
## Learning Goals
At the end of this lesson, students should be able to...

- Describe what happens when you "Sign in with Facebook" (or any other 3rd party provider)
- Understand the basic workflow of OAuth, and how it protects users
- Implement user login/logout using GitHub as an _OAuth provider_
- Define and use _environment variables_ in Rails

## Our Approach
We are going to use a few new tools to accomplish our goal of user authentication and authorization. We are going to work with GitHub as our **provider** which means our users will log in via their GitHub credentials. We will use [OmniAuth](https://github.com/omniauth/omniauth) which is a Ruby gem that standardizes the authentication process. It uses the [OAuth](https://oauth.net/) protocol for authenticating and authorizing users. **OAuth** is an open standard for authorization, commonly used as a way for users to log in websites using 3rd-party credentials (like Google, Facebook, Twitter, etc) without exposing their password.

![OAuth Overview](./images/oauth-overview.png)

## OmniAuth
The **OmniAuth** gem provides pretty much everything you need to use OAuth to authenticate users. It starts by adding a new route to your application: `/auth/:provider`.

`:provider` is a named parameter that will equal the name of the service we are using (`github`, in this example). When a user visits this route, OmniAuth will redirect the user to GitHub, beginning the authentication process. _All of this is handled automatically by OmniAuth_ - we do not have to define the route or the controller action ourselves.

Once the user has OKed our application, GitHub will redirect the user to `/auth/github/callback`, along with information about who they are. At this point, it's up to our application what to do next. Because the next steps are less prescribed, OmniAuth does not do this for us - _we will need to define the callback route and controller action ourselves_.

The whole thing goes something like this:

![OmniAuth Dance](./images/omniauth.png)

### Installing OmniAuth
Enough with talking, lets implement this into a quick application. Head over to your sandbox Rails app and open your Gemfile. Add the following lines to it:

```ruby
gem "omniauth"
gem "omniauth-github"
```

Save your Gemfile, then head over to your terminal, where you'll need to `$ bundle` (and restart your rails server). Notice that there's a specific gem for authenticating with GitHub. Each _provider_ has a small Ruby gem that's responsible for the specifics of how to authenticate with that service.

### GitHub Credentials
Each provider requires you to provide some credentials for your application, so they can keep track of which website is authorizing which user. [Login to GitHub and register a new "application"](https://github.com/settings/applications/new).

![GitHub Application Registration](./images/github-application.png)

After registration you will be given a `client id` and a `client secret`:

![GitHub Application Credentials](./images/github-credentials.png)

**Note:** These credentials are the equivalent of passwords to your GitHub account. Keep them safe; never, ever post them in public places or commit them in git.

#### Storing Credentials
Because they cannot be committed to git, the GitHub application credentials must be loaded external of the Rails application. The most common way to do this is to create a file called `.env` in the project root. Dot files (called that because they start with a dot) are typically excluded from version control and are well suited for secrets. __NEVER COMMIT A `.env` TO GIT!__  (This also means if you are working with a partner, you'll need to share this information since it won't be be in git)

To use a `.env` file with Rails, you **must** do all of these steps to gain access to the data you set in the `.env` file.
1. Add `gem 'dotenv-rails'` to the `:development` group in the Gemfile  

    __QUESTION:__ Why add it to the `:development` group? Why does the group matter?

1. Install the gem using `bundle`
1. Add the `.env` file to our `.gitignore`  

    This will help prevent us from accidentally publishing it on GitHub.

1. Create the `.env` file in the root directory with `$ touch .env`.

    This file is a collection of key/value pairs. We will add the application credentials from GitHub like this:

    ```bash
    GITHUB_CLIENT_ID: fd6XXXXXXXX
    GITHUB_CLIENT_SECRET: y6wXXXXXXX
    ```

1. Restart the Rails server. Similar to installing new gems, changes to the `.env` file will not be picked up without a server restart.

**With that done, the GitHub application credentials will now be available to Rails via the `ENV` constant.**

#### Accessing Credentials
Now that you have application credentials, let's configure Rails to use them. To do this, create a new _initializer file_. Initializers are files that run as part of the Rails start-up process, which means that **if you change an initializer, you must restart the server**.

Initializers go in the `config/initializers/` directory. From the terminal, create a new initializer with `$ touch config/initializers/omniauth.rb`. Open this file and add the following code:

```ruby
# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"], scope: "user:email"
end
```

This tells Rails to use OmniAuth for authentication. Specifically, it tells Rails that it will be communicating with GitHub, and where it can find the application credentials that GitHub expects: in the `ENV` variable we populated earlier.

Now restart the server so that the initializer is run.

## Let's Test it Out

Start the Rails server and point a browser at `http://localhost:3000/auth/github`. Amazingly, the request is redirected to GitHub to login and grant permission! After authenticating and granting, GitHub redirects the browser to `localhost:3000/auth/github/callback`. Here, you'll see a bunch of information in the url parameters. Let's create a route to better explore this information.

Open `routes.rb` to add:

```ruby
get "/auth/:provider/callback", to: "sessions#create"
```

This route points to a `create` action in the sessions controller. Note that we are not going to use the login/logout implementation we created in our previous version of the `SessionsController`, so we should comment out the routes and controller actions.  Open the controller in your editor and add a `create` action that looks like this:

```ruby
class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    raise
  end
end
```

Refresh the page in the browser and have a look at `auth_hash`, the local variable assigned to the value of `request.env['omniauth.auth']`. This is information stored in the `headers` of the HTTP request. This data is a hash that will likely have some combination of the data described in the [OmniAuth README](https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema), but the key/values returned varies by provider. GitHub will return the following important keys:

```ruby
# the `uid` is an identifier for the user from the provider's system
# using it plus the provider type (github in this case),
# we can uniquely identify a user
auth_hash["uid"]

# the info hash contains specifics of the user's account
auth_hash["info"]["name"]
auth_hash["info"]["email"]
```

With information returned by GitHub you can create a database record for uniquely identifying a user.

### Modeling Users
Start with a `User` model and migration: `$ rails generate model user`. Open the generated migration and add some columns to the database table:

```ruby
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :uid, null: false # this is the identifier provided by GitHub
      t.string :provider, null: false # this tells us who provided the identifier

      t.timestamps
    end
  end
end
```

Remember to migrate the database: `$ rails db:migrate`.

**Question**: What should we do if data is missing from our provider? What data is the most important for the database table we just created?

**Question**: What do we want our controller method to do upon successful or unsuccessful login?

### Handling the Auth Callback
In the auth callback, we will have access to a bunch of credentials about the user from GitHub. We'll follow this strategy to turn that into a logged in user:

1. Check if there's already a `User` record matching those credentials in our database
1. If there is no existing `User`, try to create a new `User`
1. Save the user's ID in the `session` (just like we did previously)
1. Redirect the user back to the `root_path`

```ruby
# app/controllers/sessions_controller.rb
# NOTE: this version is not final
class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user = User.find_by(uid: auth_hash[:uid], provider: 'github')
    if user
      # User was found in the database
      flash[:success] = "Logged in as returning user #{user.name}"
    else
      # User doesn't match anything in the DB
      # TODO: Attempt to create a new user
    end

    session[:user_id] = user.id
    redirect_to root_path
  end
end
```

Recall that before the `session` is sent to the browser it is encrypted. This means its contents are _opaque_ to the browser. All the browser sees is several KB of garbled nonsense, which it can neither interpret nor change. This makes the `session` ideal for things like storing the ID of an authenticated user, since there's no way for a malicious browser to fake a login.

**Exercise**: Let's implement a new class method in our `User` model which will accept the `auth_hash` as a parameter and construct a new `User` and save it to the database using the info from the `auth_hash`. [You can see our solution here](code_samples/oauth_build_from_github.rb).

Now that we've got this model method, we can implement the final version of our auth callback:

```ruby
# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    user = User.find_by(uid: auth_hash[:uid], provider: 'github')
    if user
      # User was found in the database
      flash[:success] = "Logged in as returning user #{user.name}"

    else
      # User doesn't match anything in the DB
      # Attempt to create a new user
      user = User.build_from_github(auth_hash)

      if user.save
        flash[:success] = "Logged in as new user #{user.name}"

      else
        # Couldn't save the user for some reason. If we
        # hit this it probably means there's a bug with the
        # way we've configured GitHub. Our strategy will
        # be to display error messages to make future
        # debugging easier.
        flash[:error] = "Could not create new user account: #{user.errors.messages}"
        redirect_to root_path
        return
      end
    end

    # If we get here, we have a valid user instance
    session[:user_id] = user.id
    redirect_to root_path
  end
end
```

## Wait!  How Do I Log Out!

We have authentication working now, but the user cannot actually log out.  The user is instead permanently logged in.  To log the person out we need to clear the session.

To start with we can add a route for logging out.

```ruby
delete "/logout", to: "sessions#destroy", as: "logout"
```
Then in the `SessionsController` we can add a method, `destroy` to handle logout.  

```ruby
#  app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  ...
  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out!"

    redirect_to root_path
  end
end
```

Lastly in our `/app/views/layouts/application.html.erb` file we can add links to log in and out.

```erb
<% if session[:user_id] %>
  <%= link_to "Log out", logout_path, method: "delete"   %>
<% else %>
  <%= link_to "Login with Github", "/auth/github" %>
<% end %>
```

**Question**: How could you display the name or email address of the logged-in user?

If you are making changes and end up getting stuck, you may need to [clear your browser's cookies](https://support.google.com/chrome/answer/95647?co=GENIE.Platform%3DDesktop&hl=en).

## Additional Resources
- [oauth Overview Notes](https://docs.google.com/presentation/d/1lIQ4F8gpXwaIEBHlsussoIEN31sqCY2upGIV_L81zi4)
- [oAuth Youtube video overview](https://youtu.be/CPbvxxslDTU)
- [Sessions, Cookies and Authentication ](http://www.theodinproject.com/courses/ruby-on-rails/lessons/sessions-cookies-and-authentication)(not including 'Rolling Your Own Auth')  
- [How to Set Environment Variables in Heroku](https://devcenter.heroku.com/articles/config-vars)
- [Logout Route delete or get?](https://stackoverflow.com/questions/26018471/routing-trouble-for-logout-link-delete-vs-get-action)
- [Stack Overflow: Create named routes for OmniAuth](https://stackoverflow.com/questions/4361994/create-named-routes-for-omniauth-in-rails-3?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)
