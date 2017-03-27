
# Setting Rails Apps Up On Heroku

## Learning Goals
-  Understand what Heroku is and the role it serves.
- Be able to deploy  a Rails App to Heroku.

## Introduction
So your rails app is awesome.  It does wizz-bang things and is the greatest thing since sliced bread.  There are a couple drawbacks... Your app is limited to just your computer, so you are the only one who can use it or test it.  So we will explore how to deploy an App to the web using a platform named **Heroku**.

## What is Heroku?
From the company
```
Heroku is a cloud platform that lets companies build, deliver, monitor and scale apps — we're the fastest way to go from idea to URL, bypassing all those infrastructure headaches.
```
So Heroku is a cloud platform like Amazon Web Services or Azure that provides a platform for web applications to run on.  

We use Heroku for a few reasons:

1.  Because it uses the Git version control system to deploy apps, neatly dovetailing with our current workflow.  
2.  It's very quick to get applications running on Heroku
3.  Apps can be deployed on the web for free.

You may ask why use Heroku instead of AWS or Azure, well Heroku is much faster to deploy to and get running with minimal setup.  

## Step 1 - Make a Heroku Account
To be able to deploy an App on Heroku you first need an account go to https://signup.heroku.com and create an account. 

![Heroku Signup](images/heroku.png)


## Step 2 - Download Heroku Command Line Tools

Then go to https://devcenter.heroku.com/articles/heroku-command-line and download and install the Heroku commandline tools.

After installing Heroku command line tool, go to your terminal and sign in to Heroku

```bash
 $ heroku login
```

## Step 3 - Go to your Application folder

Then open a new terminal window and change directory (cd) into your Rails app.

```bash
ada ~/ $cd path/to/my_rails_app
```

## Step 4 - Prepare Your App For Production

While you are developing you can use the Sqlite3 database, which is fine for development and testing, but on a production server you will need to use the Postgres database on Heroku.  

So open up the `Gemfile` in Atom or Sublime and look for this line:
```ruby
gem 'sqlite'
```
and change the line to only use Sqlite on development.  
```ruby
gem 'sqlite3', group: [:development, :test]
```

Then we just need to add gems for Postgres (pg) and Rails 12factor rails_12factor which is required by Heroku.
```ruby
gem 'pg', group: :production
gem 'rails_12factor', group: :production
```
Now that the Gemfile is finished you will need to run bundle to update the apps dependencies.
```bash
ada ~/path/to/my_rails_app $ bin/bundle install --without production
```
Lastly you need to update the Gemfile in Git.
```bash
ada ~/path/to/my_rails_app $ git add Gemfile
ada ~/path/to/my_rails_app $ git commit -m "Updated Gemfile for Heroku"
```

## Step 5 - Deploying to Heroku

To deploy to Heroku you will first need to login.  In terminal enter:
```bash
ada ~/path/to/my_rails_app $ heroku login
Enter your Heroku credentials.
Email:  YOUR-EMAIL-HERE@SOMEWHERE.NET
Password (Typing will be hidden):  
Authentication successful.
```

Then we need to create and give a name to our application on Heroku. 
The name you choose will be in the url for you hosted application, ex: http:/adies-app.herokuapp.com
```bash
ada ~/path/to/my_rails_app $ heroku create adies-app
Creating adies-app... done, stack is ceder
http:/adies-app.herokuapp.com/ | git@he...
Git remote heroku added
```

**Pay very close attention**:  The link in terminal provided is a link to your app.  In this example it's http:/adies-app.herokuapp.com  You can also see your apps listed in https://dashboard.heroku.com/apps.  

Now everything is ready to deploy your app.  You can use git push to push the current state of the master branch to Heroku:

```bash
ada ~/path/to/my_rails_app $ git push 
Initializing repository, done.
...
```

Lastly you need to create the database tables your app needs to run.

```bash
ada ~/path/to/my_rails_app $ heroku run rake db:migrate
running `rake db:migrate` attached to terminal... up, run.1833
...
```

If you make more changes in your application remember to commit the changes to the master branch in Git and push the master branch to Heroku and run the db:migrate task again.  

Now go check out your app!
