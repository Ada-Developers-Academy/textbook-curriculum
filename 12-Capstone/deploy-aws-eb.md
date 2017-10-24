# Deploying to AWS with Elastic Beanstalk
In this lecture we will learn about an alternative option for deploying back-end web applications.

## Learning Goals
After following along with this lecture you should be able to:

1. Explain what AWS is and how it differs from Heroku
1. Explain what Elastic Beanstalk is and how it relates to Heroku
1. Explain what components of AWS are used with Elastic Beanstalk
1. Follow a guide to deploy a Ruby on Rails web application to EB

## Overview
Previously we've seen deployment with Heroku which is easy to get started with, but which also restricts your options for deployment architectures and technologies. We've also seen deployment with GitHub pages, but this only supports static front-end web applications.

One alternative for deploying back-end web applications is to use Amazon Web Services (which Heroku is built on).

### What is AWS?
Amazon Web Services is a _cloud_ computing system offered by Amazon. Amazon operates and maintains several large datacenters of physical computer and networking equipment including servers, hard disks, routers, switches -- collectively known as infrastructure.

Much of this infrastructure is dedicated to running Amazon-specific applications (Amazon.com, Kindle, Alexa, their warehouse management system, etc.). In order to support peak loads, such as during black Friday / cyber Monday, Amazon owns a significant amount of infrastucture that goes unused the rest of the time.

This is where AWS comes in. Through the services provided by AWS and its management system Amazon is able to offer temporary, rental access to its infrastructure for other organizations. Companies can rent, for example, a server with a specific amount of CPU power, RAM, and hard disk space for timespans ranging from a single hour once, to 24/7 for months or years.

Ontop of the services that AWS offers which give access to rent (provision) its infrastructure (known in the cloud computing / devops world as **Infrastructure As A Service**), AWS now offers many services which provide "higher level" capabilities including databases, DNS management, email sending, and multiple deployment systems.

In this lecture we will be looking at one of those deployment options, Elastic Beanstalk, and the associated AWS services that it integrates with.

### What is Elastic Beanstalk?
[Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/) is a deployment system built ontop of AWS that allows for a deployment experience very similar in capability and scope to Heroku.

When deploying to Elastic Beanstalk (EB), developers configure an application for deployment using the [AWS Management Console](https://console.aws.amazon.com/), then use the EB CLI program within the Git repository for their application to trigger a deployment.

EB then packages up the application source code, uploads it to AWS (using the [S3 file storage service](https://aws.amazon.com/s3/)), and creates and connects several resources necessary for running your application:

* Networking setup including firewalls
* One or more load balancers
* One or more web application servers
* A database (configured by you before deployment)

### Components of an Elastic Beanstalk stack
#### Networking
EB uses another AWS service known as [Virtual Private Cloud](https://aws.amazon.com/vpc/) (VPC) to manage the networking setup for your deployed application.

VPC supports a great many options for configuring internet and intranet access to the other resources that AWS offers. In the case of an Elastic Beanstalk deployment, the load balancers are made accessible directly via the Internet while the web servers and database are only accessible internally within AWS by the other components of your application.

#### Load balancers
Load balancers are simple web servers whose job it is to sit "in front" of your web app servers and distribute incoming requests so as to avoid any single web app server from becoming overloaded with requests.

You do not need to write any code for these web servers as they do not do any custom work unique to your application. Instead, you should only need to configure them to know about and talk to your web app servers.

Load balancers have a specific mechanism for determining which web app servers are most overloaded (and thus should be avoided). This mechanism is to send a specific request (known as a "health ping") to each web app server at a regular interval (once per second, perhaps) and measure the time it takes to receive a response.

If no response is received the web app server may be marked as inaccessible/dead and a new one may be started to take its place. For this reason it's important to implement the route used by AWS's load balancers and have it respond with 200 OK -- otherwise the Elastic Beanstalk console will falsely claim that your application is broken!

AWS provides a service for provisioning, configuring, and managing load balancers that is known as [Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/) (ELB).

#### Web application servers
This is the part we're most used to thinking about when doing back-end web application development. Web application servers are the computers which hold and run our custom web application code such as the example Ruby on Rails project we'll deploy in this lecture.

The web application servers are provisioned, configured, and managed using an AWS service called [Elastic Compute Cloud](https://aws.amazon.com/ec2/) (EC2). In many ways this service is the "heart" of AWS, it gives direct access to computers which can run pretty much any server operating system and accompanying software.

However, directly provisioning and configuring computers is a lot of work and so EB automates that process. When we deploy a Ruby on Rails application using EB it automatically:

* Provisions one or more new computers from EC2
* Installs the appropriate operating system on them (using an [Amazon Machine Image](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html)
* Installs all necessary dependencies for Ruby on Rails (including Ruby, gem, bundler among many other programs)
* Downloads your Ruby on Rails application code from S3
* Creates the appropriate environment variables (including custom ones that you've defined)
* Starts the Ruby on Rails web server on a port that the load balancers are configured to communicate with

Elastic Beanstalk can do this automatically for any number of web app servers that you wish to run (based on the traffic needs of your site). It is also capable of automatically choosing when to shut down servers or start new ones based on observed load, so that if your application receives a big spike in traffic it a quickly adjusts to provide a fast response to all of the new users.

#### Database
Most back-end web applications require a database and so EB has options for easily connecting a database to use with your web application servers. While AWS offers multiple database services, currently the only one that integrates directly with EB is the [Relational Database Service](https://aws.amazon.com/rds/) (RDS).

RDS allows you to quickly provision a database of several different flavors including PostgreSQL and MySQL. You provide the size of database you want plus the username and password for logging in, and AWS sets it up and gives you a specific domain name for accessing it.

While this is relatively straight forward, Elastic Beanstalk again makes our lives easier by integrating this setup process into the application configuration web page. Furthermore, when we have an RDS database connected to our application then EB will automatically configure a set of environment variables with the information needed for our code to connect to that database.

#### Heroku
Now that we've taken a pretty significant tour through the different systems that Elastic Beanstalk uses to manage our deployments, lets take a look at how this differs with Heroku.

While it may seem like there's a lot more involved in an Elastic Beanstalk application, in truth both of these systems are very similar! Heroku's system involves every one of the above components and uses them in almost exactly the same ways.

The main difference between the two is that Heroku hides many of the underlying systems from developers which makes learning to use it and deploy your first application significantly faster. The other side to that coin however, is that you have less control over how each component of your deployment stack is configured and Heroku must explicitly support the kind of application you're attempting to deploy.

## Live Demonstration
### Get the application code
Clone the repository from https://github.com/adagold/aws-eb-rails (there is no need to fork this).

### Setup the EB application
1. Log into the [AWS Management Console](https://console.aws.amazon.com/).
1. Go to the [Elastic Beanstalk Management Console](https://us-west-2.console.aws.amazon.com/elasticbeanstalk/home?region=us-west-2#/getting_started) (we're using the Oregon datacenter aka us-west-2).
1. Create a new EB application:
  1. Click "Create New Application" link in the upper-right
  1. Enter "EB Rails Test" in the "Application name" text entry
  1. Click Next
  1. Click Cancel (we'll create an Environment with the CLI)

### Install the EB CLI
1. Run `brew install aws-elasticbeanstalk` in your terminal.
1. Run `eb --version` to check that it was installed correctly.

### Get your AWS credentials
In order for the EB CLI to have access to your AWS account you need to provide it a set of credentials. This is an AWS Access ID and AWS Secret Key.

1. Log into the AWS Management Console.
1. Click on your name in the upper-right navbar.
1. Select "My Security Credentials" from the dropdown.
1. Click "Continue to Security Credentials".
1. Click "Access Keys" from the accordion menu.
1. Click "Create New Access Key".
1. Click "Show Access Key" link and copy down the credentials info OR click "Download Key File" button.

### Initialize EB CLI
1. `cd` into the directory of the cloned project.
1. Run `eb init` and select us-west-2 for your region.
1. Enter your AWS credentials when prompted.
1. Choose "EB Rails Test" from the list of applications.
1. Type `y` to indicate that you're using Ruby.
1. Choose "Ruby 2.3 (Puma)" from the list of platforms.
1. Type `n` to skip using CodeCommit.
1. Type `y` to setup SSH.
1. Choose a name for your SSH keypair (or use the default).
1. Enter a passphrase for your SSH keypair and confirm it.

### Create an Environment
Now that we've created an EB Application and setup the EB CLI to allow us to work with it, we need to create an Environment. In the context of EB an Environment represents a particular deployed version of your application, including all of the configuration for load balancers, code versions (i.e. what commit/branch is being used), and connected databases.

This allows us to have a single Application with multiple Environments, for example one for production and one for staging the next release so that QA can test it out before using it in the production Environment.

Run the following command to create your first EB Environment:
```bash
$ eb create example-env -db -db.engine postgres -db.i db.t2.micro -i t2.micro --envvars SECRET_KEY_BASE=`bundle exec rake secret`
```

This sets up a new Environment using mostly the default options. However, we've explicitly asked for the environment to include a database (specificially a PostgreSQL database), and it opts for using the smallest _instance types_ for both the database and the web app servers.

Instance type is the term AWS uses to identify which "size" of resource is being requested. For databases the `db.t2.micro` instance type is the smallest possible, and the only one that qualifies in the Free Tier, likewise for web application servers the `t2.micro` instance is the only option for usage in the Free Tier.

When the EB CLI prompts you for a database username and password, keep the default `ebroot` for the username and type `password` for the password.

### Check out the application
Run the command `eb open` to open your browser to the deployed application URL.

## Deploying Your Rails Project
There are a few changes that are needed before a Rails project can be deployed to Elastic Beanstalk. In particular, we need to configure the database details for the production environment, and create any environment variables the application will use.

### Database configuration
Rails uses the file `config/database.yml` to determine how it should connect to its database. When we run the command `rails new` to create a new Rails project this file is generated for us and it has sections for each of the three environments: `development`, `test`, and `production`.

Both `development` and `test` are configured by default to use a Postgres database running on the same computer as Rails, which is appropriate for our needs. However, the `production` environment's configuration will need to be updated for deployment to Elastic Beanstalk, because the deployed application will need to connect to a separate computer that is running the RDS database.

Luckily, Elastic Beanstalk gives us environment variables with all of the configuration parameters we need. The following code should work without modification to configure Rails's production database:

```yaml
# config/database.yml

production:
  <<: *default
  database: <%= ENV['RDS_DB_NAME'] %>
  username: <%= ENV['RDS_USERNAME'] %>
  password: <%= ENV['RDS_PASSWORD'] %>
  host: <%= ENV['RDS_HOSTNAME'] %>
  port: <%= ENV['RDS_PORT'] %>
```

**WARNING**: You should completely replace the `production` section of your `config/database.yml` file with the above code snippet. If there are any pieces from the original version of the `production` section it may prevent your application from connecting to the DB properly. Compare your version against the [`config/database.yml`](https://github.com/AdaGold/aws-eb-rails/blob/master/config/database.yml) from the live demonstration app to see if it's the same.

### Setting Environment Variables
The other piece that we need to configure when deploying any Rails app is the environment variables. In particular, Rails requires that the `SECRET_KEY_BASE` variable be set however there may be other environment variables specific to your application (basically everything in your `.env` file) that also must be set.

#### Checking Environment Variables
Before making any changes to the environment variables, we should check what our variables are currently set to. This can be done using the Elastic Beanstalk CLI with `eb printenv`. If your application already has all of the necessary variables set (`SECRET_KEY_BASE` and anything in `.env`), then you can skip the remainder of this section.

#### Setting the Secret Key Base
One variable that Rails requires us to set is the "secret key base", which it uses for encrypting data like the session and cookies. We need to set this variable to a very long random sequence of numbers and letters (a through f). Thankfully, Rails also gives us a command for generating an appropriate value for the secret key base:

```bash
$ rake secret
```

The above command will print a long string of letters and numbers and you can use that string directly when setting the `SECRET_KEY_BASE` variable in Elastic Beanstalk.

#### Setting Environment Variables
Finally, once we know at least one variable that we need to set we can use the Elastic Beanstalk CLI to do so:

```bash
$ eb setenv SECRET_KEY_BASE=abcd1234
```

The above command will set the environment variable `SECRET_KEY_BASE` to have the value `abcd1234`. You should replace `abcd1234` with the output from running the `rake secret` command mentioned earlier.

You can set other variables similarly:

```bash
$ eb setenv GITHUB_CLIENT_ID=dae31c40363c11d0dba6
```

**TIP**: It is possible to set multiple variables at the same time by putting them all in the same command. This is very helpful not just for reducing your typing, but also because **Elastic Beanstalk will re-deploy after each time you set a variable**. Because deploying can take multiple minutes, setting all of the variables at once could save you quite some time.

The syntax for setting multiple variables at once is:

```bash
$ eb setenv VARIABLE_ONE=apple VARIABLE_TWO=banana
```
