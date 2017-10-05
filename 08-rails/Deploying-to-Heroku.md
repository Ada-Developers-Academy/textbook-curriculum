
# Deploying a Rails App to Heroku

## Learning Goals
Students should be able to...

- Explain what Heroku is and the role it serves.
- Deploy  a Rails App to Heroku.

## Introduction
So your rails app is awesome. It's got gadgets and gizmos aplenty, maybe even whooz-its and whatz-its galore. There are a couple drawbacks... Your app is limited to just your computer, so you are the only one who can use it or test it. So we will explore how to deploy an App to the web using a platform named **Heroku**.

## What is Heroku?
From the company
```
Heroku is a cloud platform that lets companies build, deliver, monitor and scale apps — we're the fastest way to go from idea to URL, bypassing all those infrastructure headaches.
```
So Heroku is a cloud platform like Amazon Web Services or Azure that provides a platform for web applications to run on.  

We use Heroku for a few reasons:

1. Heroku uses the Git version control system to deploy apps, neatly matching our current workflow
1. It's very quick to get applications running on Heroku
1. Apps can be deployed on the web for free

You may ask why use Heroku instead of AWS or Azure. Heroku is much faster to deploy to and get running with minimal setup, but is still powerful enough to back [serious commercial products](https://www.heroku.com/customers). This puts it right in the sweet spot for us.

## Step 1 - Make a Heroku Account
To be able to deploy an App on Heroku you first need an account go to https://signup.heroku.com and create an account.

![Heroku Signup](images/heroku.png)


## Step 2 - Download Heroku Command Line Tools

Then go to https://devcenter.heroku.com/articles/heroku-command-line and download and install the Heroku command line tools.

After installing Heroku command line tool, go to your terminal and sign in to Heroku

```bash
 $ heroku login
 Enter your Heroku credentials.
 Email:  YOUR-EMAIL-HERE@SOMEWHERE.NET
 Password (Typing will be hidden):  
 Authentication successful.
```

You will stay logged in until you manually log out, even if you close the terminal or reboot.

## Step 3 - Deploy to Heroku

The next step is probably the hardest: choosing a name for your application. Because the name will be part of your app's URL, it needs to be unique. If you can't decide, leave the name blank and Heroku will generate one for you (you can change it later if needed).

For this example, we're using the name `adies-app`.

```bash
~ $ cd path/to/my_rails_app
~/path/to/my_rails_app $ heroku create adies-app
Creating adies-app... done, stack is ceder
http://adies-app.herokuapp.com/ | git@he...
Git remote heroku added
```

The output contains the link for your app. In this case, it's `http://adies-app.herokuapp.com/`. You can also open the page in your browser using the `heroku open` command.

Now everything is ready to deploy your app.  You can use git push to push the current state of the master branch to Heroku:

```bash
~/path/to/my_rails_app $ git push heroku
Initializing repository, done.
...
```

Lastly you need to create the database tables your app needs to run.

```bash
~/path/to/my_rails_app $ heroku run rails db:migrate
running `rake db:migrate` attached to terminal... up, run.1833
...
```

### Summary

Initial deployment:

```
heroku create app-name
git push heroku
heroku run rails db:migrate
```

Updates:

```
git push heroku
# If your database schema changed
heroku run rails db:migrate
```

## Things to Remember

- If you make changes to your application, you'll have to `git push heroku` again.
  - If you change your database schema, you'll also have to `heroku run rails db:migrate`.
- By default, Heroku will use whatever's on your master branch. If you want to push the contents of a different branch, use `git push heroku <branch_name>:master`.
- Heroku requires you to use postgresql as your database. Fortunately, we've already set up rails to use that as the default for new applications.

Now go check out your app!
