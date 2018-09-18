# What is Ruby on Rails?
## Learning Goals

By the end of this lesson, students should be able to...

- Answer the question at the top of this document
- Explain the Rails mantra of _Convention Over Configuration_
- Have a basic understanding of MVC
  - Describe the different parts of an MVC application
  - Discuss the problem that MVC solves

## So what is it?
[Ruby on Rails](http://rubyonrails.org/) is a widely-used, Ruby-based __MVC__ web framework created in 2005 by [@dhh](https://twitter.com/dhh).

You've probably used web applications built in Rails:

- GitHub
- Twitter
- Disney
- Hulu
- Yellow Pages
- GroupOn
- LivingSocial
- IndieGoGo
- And a whole lot more

## Rails is a DSL
Rails is a __Domain-Specific Language__ for creating web pages.

Fully open source, it is constantly adapting to new trends and requirements of modern web development. It's distributed as a family of gems; there were ~28 individual gems last time I counted that made up the core of Rails. The philosophy of Rails (ostensibly) can be summarized by two statements:

1. DRY - Don't Repeat Yourself
1. Convention over Configuration

## Before We Begin

First let's install Rails version 5.

```bash
$ gem install rails --no-rdoc --no-ri
$ rails -v
```

You should see the rails version as `5.0.1` or later.

__Questions:__ Why `--no-rdoc` and `--no-ri`?

The docs take _a year_ to install, and we'll never look at them. There are docs that are easier to use than what's provided by rdoc & ri.

## Creating a New Rails Project
```bash
$ rails new rails-learning
```

## Whoa! What Happened?
The Rails gem includes a command-line program, `rails`, that has a number of options. With it we can start a server, quickly create new classes, work with the database, and many other things. The command `new` creates a new directory and creates all the subdirectories and files a Rails application needs to get started.

You can see all of the command line options that the Rails application builder accepts by running `$ rails new -h`.

## What's Inside?
Let's take a tour: `$ cd rails-learning/`

Here's a table I shamelessly stole from the [Rails Getting Started Guide](http://guides.rubyonrails.org/getting_started.html):

|File/Folder|Purpose|
|:---:|-------------|
| app/        | Contains the controllers, models, views, helpers, mailers and assets for your application. You'll focus on this folder for the remainder of this guide. |
| bin/        | Contains the rails script that starts your app and can contain other scripts you use to setup, deploy or run your application. |
| config/     | Configure your application's routes, database, and more. This is covered in more detail in Configuring Rails Applications. |
| config.ru   | Rack configuration for Rack based servers used to start the application. |
| db/         | Contains your current database schema, as well as the database migrations. |
| Gemfile & Gemfile.lock | These files allow you to specify what gem dependencies are needed for your Rails application. These files are used by the Bundler gem. For more information about Bundler, see the [Bundler website](http://bundler.io/). |
| lib/        | Extended modules for your application. |
| log/        | Application log files. |
| public/     | The only folder seen by the world as-is. Contains static files and compiled assets. |
| Rakefile    | This file locates and loads tasks that can be run from the command line. The task definitions are defined throughout the components of Rails. Rather than changing Rakefile, you should add your own tasks by adding files to the lib/tasks directory of your application. |
| README.md | This is a brief instruction manual for your application. You should edit this file to tell others what your application does, how to set it up, and so on. |
| test/       | Unit tests, fixtures, and other test infrastructure. |
| tmp/        | Temporary files (like cache, pid, and session files). |
| vendor/     | A place for all third-party code. In a typical Rails application this includes vendored gems. |

## The MVC Pattern: Model View Controller

In the `app/` directory you will find three particular subdirectories of interest: `models/`, `views/`, and `controllers/`. These three pieces do most of the work of any Rails application.

MVC was devised in '79 by the folks working on Smalltalk, which is one of the core influences of Ruby. What we call MVC today, especially in the realm of web stack, is pretty different than that original specification, but the core principles have held true.

Essentially, MVC is way to divide responsibilities to complete a task. It's especially well suited to object oriented programming because of the focus on messaging between objects.

### The Model
- Contains data for the application (often linked to a database)
- Contains state of the application (e.g. what orders a customer has)
- No knowledge of user interfaces, so it can be reused
- Similar to many of the Ruby classes we've written so far

### The View
- Turns data into HTML
- Does not contain "business logic", only display logic
- Similar to the command-line interfaces we've built in the past

### The Controller
- Receive events from the outside world (HTTP requests)
- Gather data from the model
- Pass data to the view to be rendered as HTML

We can think of each of these roles as the responsibility of an object, and use those responsibilities to organize a web service, like this:

![MVC in Rails](images/railsmvc.png)

We'll come back to this picture a lot over the coming week.

## Other Rails Resources
- [The best: Rails Guides](http://guides.rubyonrails.org/)
- [A beginner cheatsheet for Ruby & Rails](http://www.pragtob.info/rails-beginner-cheatsheet/)
- [Complete API documentation for Rails](http://apidock.com/rails)
- [Short YouTube overview of MVC Architecture from Lynda.com](https://www.youtube.com/watch?v=3mQjtk2YDkM)
- [Image: Rails Structure](http://docs.railsbridge.org/job-board/img/request-cycle.jpg)
