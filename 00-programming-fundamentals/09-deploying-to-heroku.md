# Deploying to Heroku
Heroku is a cloud platform that allows you to deploy your web applications without needing a server. Let's take our previous Sinatra application and deploy it using Heroku.

## Step 1: Make sure your code is tracked by Git
Heroku uses git, so first we'll make sure our project is using git:
```bash
git status
```

If this command results in a message like `fatal: Not a git repository (or any of the parent directories): .git` then we'll need to setup git for our project:

```bash
git init
git add .
git commit -m "initial commit"
```

This is the normal git flow of initializing a repository, adding, and committing all of the code.

## Step 2: Be sure your application has a `config.ru` file
If you are deploying a Sinatra app, be sure to include a `config.ru` file in your project root. This file is used by `rack`, the underlying framework that Sinatra uses to connect to the internet. Check out the [example `config.ru` file for Sinatra](https://devcenter.heroku.com/articles/rack#sinatra) in Heroku's devcenter for more details.

## Step 3: If you're deploying a Rails app, add some gems to the `production` group of your Gemfile
Modify your Gemfile to isolate the `sqlite3` gem into the `development` and `test` groups. Then create (if you don't already have) a `production` group and add the `pg` and `rails_12factor` gems to it. It should look something like this:

```ruby
group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
```

## Step 4: Create a remote repository for your code on Heroku's servers:
Heroku is the service that will actually host our application. We will use the [Heroku Toolbelt](https://toolbelt.heroku.com). First we'll use a command that will create a repo on Heroku's server for us to push our application into.

```bash
$ heroku create kari-sinatra
```

Use a unique name where I used `kari-sinatra`, if you cannot think of a name leave it empty an Heroku will come up with a random name for you (this can be changed later). You should see out put that looks similar to:

```bash
Creating kari-sinatra... done, stack is cedar
http://kari-sinatra.herokuapp.com/ | git@heroku.com:kari-sinatra.git
Git remote heroku added
```

The `heroku create` command creates the repo on Heroku and also creates the git remote link on our computer.

__Question:__ What is a git remote? Why is it important that it is called _heroku_?

## Step 5: Push your app to Heroku
Now push your app to Heroku:

```bash
$ git push heroku master
```

You should see a bunch of output for about a minute. Heroku is receiving your application and deploying it. Now your app is now available on the internet. Navigate to `http://YOURAPPNAME.herokuapp.com` where YOURAPPNAME is the name you gave to heroku, `kari-sinatra` in my case, so the full url is `http://kari-sinatra.herokuapp.com`. TADA! You can also use `$ heroku open` to open your site in your default browser.

Now if you log on to your Heroku account online, you will see your app listed under the name you gave it. 
