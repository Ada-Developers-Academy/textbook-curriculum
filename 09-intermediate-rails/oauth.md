# Implementing an OAuth Solution in Rails

## Learning Goals

At the end of this lesson, students should be able to

- Have a list of steps to repeat to implement the user login/logout feature using GitHub as an _OAuth provider_ in Rails using `OmniAuth`
- Practice using environment variables in Rails
- On a high level, understand the OAuth process

## Our Approach

[OAuth](https://oauth.net/) is an open standard for authorization, commonly used as a way for users to log in websites using 3rd-party credentials (like Google, Facebook, Twitter, etc).

When we want to implement an OAuth solution for authorization in our Rails apps, we will use many different tools. Specifically, we are going to make the following decisions:

- we will use GitHub as our **OAuth Provider**, so our users will log in via their GitHub credentials
- we will use [OmniAuth](https://github.com/omniauth/omniauth), a Ruby gem that standardizes the authentication process using the OAuth protocol and integrates well with Ruby on Rails apps
- we will use [dotenv](https://github.com/bkeepers/dotenv), a Ruby gem to keep client IDs and client secrets hidden
- we will use a specific pattern of URLs to configure our routes: `get /auth/github` and `get /auth/github/callback`

![OAuth Overview](./images/oauth-overview.png)

Note: This diagram implies that the Rails controller we will used is named `SessionsController`. This is not a hard or fast rule, and it is possible that the example code differs.

## OmniAuth

The **OmniAuth** gem provides pretty much everything you need to use OAuth to authenticate users. It starts by adding a new route to your application: `/auth/:provider`.

`:provider` is a named parameter that will equal the name of the service we are using (`github`, in this example). When a user visits this route, OmniAuth will redirect the user to GitHub, beginning the authentication process. _All of this is handled automatically by OmniAuth_ - we do not have to define the route or the controller action ourselves.

Once the user has OKed our application, GitHub will redirect the user to `/auth/github/callback`, along with information about who they are. At this point, it's up to our application what to do next. Because the next steps are less prescribed, OmniAuth does not do this for us - _we will need to define the callback route and controller action ourselves_.

The whole thing goes something like this:


## Our Steps to Implementing Our Authentication Feature

In Rails, we will use the following big steps towards building this feature:

### Configuration: Make sure that the app is all set up

1. Ensuring that the OmniAuth gem is installed
1. Ensure that GitHub is expecting requests for Authentication to happen that come from your Rails server  from a specific endpoint `localhost:3000/...SOME ENDPOINT` as an OAuth Application (Client application)
1. Ensure that your Rails app knows how to talk to GitHub as an OAuth Application, given that it knows the right _secrets_

### Teach your Rails app how to do it

1. Add a route that will go to GitHub given a specific path that OmniAuth is looking for
1. Change the configurations of Rails to recognize and use OmniAuth, GitHub, the established secrets connected to GitHub when it needs to
1. Add a route to your Rails app that will wait for requests _from_ GitHub at a specific endpoint
1. Handle and process the information from the request (and the new authenticated user information!) to log in
1. Update your `User` model's attributes so you can handle, process, and store this information correctly
1. Don't forget to implement the logout feature!

## Exercise: Where?

For each step listed above, **predict**: Are there code changes I need to make in the Rails app? If there is, where would those be located? Are there changes I need to make outside of the app?

Spend five minutes thinking to yourself what the answer is for each step. Then, spend ten minutes talking about it with the person next to you. Spend only a little bit of time on predictions for pieces that seem very unfamiliar.

<details>

  <summary>
    Then, check your predictions together by expanding this section!
  </summary>

  #### Configuration

  1. Installing the OmniAuth gem should change the `Gemfile`
  1. We will go to Github.com literally to make some configurations for a new OAuth application
  1. We store our "secrets" using `env`! This means we'll need to make sure that the gem `dotenv` is installed using our `Gemfile`, and we'll need to put new pieces of information in our `Gemfile`

  #### Teach your Rails app how to do it

  1. We will add a new special OmniAuth route that a link from our Rails app will _go to_ in order to start the login process in our `routes.rb` file
  1. We will add some new Rails app configurations in a folder called `config/initializers/` in order to teach OmniAuth where to look for our specific secrets in the `.env` file
  1. We will add a new route that will wait for requests _from_ GitHub at a specific path in our `routes.rb` file
  1. We will handle and process the user information from the request in our controller that handles logging in, continuing to use the `session` hash
  1. We will update our `User` model's attributes using migrations
  1. We will implement our logout features with modifying our routes and controllers, continuing to use the `session` hash

</details>

## Exercise: Implement an Authentication Feature in the Books app!

Review the following diagram and quickly check it against the flow detailed above.

![OmniAuth Dance](./images/omniauth.png)

Now, make sure that you have a fresh, clean, up-to-date clone of the classroom's Books app!

Now, you and your pair are ready to follow these steps to get GitHub OAuth up and running for your app. Here are some following tips:

1. Work through this with one partner. If both want to follow the steps together, that's great! If one person wants to navigate while the other drives because of computer problems, that is okay too
1. Don't sweat the details at this moment. Right now, the important thing is getting through the activity in completion and successfully. Please don't focus on committing to memory at this time

### Configuration

#### Install `OmniAuth`

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
Because they cannot be committed to git, the GitHub application credentials must be loaded external of the Rails application. Similar to the work we've done on previous projects, we will use a `.env` file to store these credentials securely, though the process for using them in Rails will be slightly different.

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
