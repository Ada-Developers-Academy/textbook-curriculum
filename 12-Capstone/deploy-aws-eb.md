# Deploying to AWS with Elastic Beanstalk

In this lesson you will learn about Amazon Web Services in general and the Elastic Beanstalk Service in particular.

## Learning Goals

After following along with this lesson you should be able to:

1. Follow a guide to deploy a Ruby on Rails web application to EB
1. Troubleshoot issues with deployment involving the database.
1. Manage environment variables in an EB instance.  

## Tutorial Overview

In this tutorial we will clone a rails application, set up an Elastic Beanstalk instance on AWS and deploy the application to that instance. 

## Step 1:  Get the application code

Clone the repository from https://github.com/adagold/aws-eb-rails (there is no need to fork this).

**Make sure to run `bundle install`**

## Step 2: Setup the EB application

1. Log into the [AWS Management Console](https://console.aws.amazon.com/).
1. Go to the [Elastic Beanstalk Management Console](https://us-west-2.console.aws.amazon.com/elasticbeanstalk/home?region=us-west-2#/getting_started) (we're using the Oregon datacenter aka us-west-2).
1. Create a new EB application:
  - Click "Create New Application" link in the upper-right
  - Enter "EB Rails Test" in the "Application name" text entry
  - Click Next
  - Click Cancel (we'll create an Environment with the CLI)

## Step 3:  Install the EB CLI

1. Run `brew install aws-elasticbeanstalk` in your terminal.
1. Run `eb --version` to check that it was installed correctly.

## Step 4: Get your AWS credentials

In order for the EB CLI to have access to your AWS account you need to provide it a set of credentials. This is an AWS Access ID and AWS Secret Key.

1. Log into the AWS Management Console.
1. Click on your name in the upper-right navbar.
1. Select "My Security Credentials" from the dropdown.
1. Click "Continue to Security Credentials".
1. Click "Access Keys" from the accordion menu.
1. Click "Create New Access Key".
1. Click "Show Access Key" link and copy down the credentials info OR click "Download Key File" button.

## Step 5: Initialize EB CLI

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

## Step 6: Create an Environment

Now that we've created an EB Application and setup the EB CLI to allow us to work with it, we need to create an Environment. In the context of EB an Environment represents a particular deployed version of your application, including all of the configuration for load balancers, code versions (i.e. what commit/branch is being used), and connected databases.

This allows us to have a single Application with multiple Environments, for example one for production and one for staging the next release so that QA can test it out before using it in the production Environment.

Run the following command to create your first EB Environment:

```bash
$ eb create example-env -db -db.engine postgres -db.i db.t2.micro -i t2.micro --envvars SECRET_KEY_BASE=`bundle exec rake secret`
```

This sets up a new Environment using mostly the default options. However, we've explicitly asked for the environment to include a database (specificially a PostgreSQL database), and it opts for using the smallest _instance types_ for both the database and the web app servers.  

Instance type is the term AWS uses to identify which "size" of resource is being requested. For databases the `db.t2.micro` instance type is the smallest possible, and the only one that qualifies in the Free Tier, likewise for web application servers the `t2.micro` instance is the only option for usage in the Free Tier.  [AWS supports many different instance types](https://aws.amazon.com/ec2/instance-types/), feel free to read more if you're curious
.

When the EB CLI prompts you for a database username and password, keep the default `ebroot` for the username and type `password` for the password.

Then wait 10 minutes or so, as it will take time for AWS to finish setting up your application.  

### Check out the application
Run the command `eb open` to open your browser to the deployed application URL.

**At this point you should have successfully deployed your first EB instance**.  The following notes are dedicated toward helping you, deploy any changes to the app, and configuring the database, and set environment variables should that be needed.  

## Deploying Your Rails Project
There are a few changes that are needed before a Rails project can be deployed to Elastic Beanstalk. In particular, we need to configure the database details for the production environment, and create any environment variables the application will use.

To deploy your committed changes in your application you can use the command `eb deploy`

## Database configuration

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

## Setting Environment Variables

The other piece that we need to configure when deploying any Rails app is the environment variables. In particular, Rails requires that the `SECRET_KEY_BASE` variable be set however there may be other environment variables specific to your application (basically everything in your `.env` file) that also must be set.

### Checking Environment Variables

Before making any changes to the environment variables, we should check what our variables are currently set to. This can be done using the Elastic Beanstalk CLI with `eb printenv`. If your application already has all of the necessary variables set (`SECRET_KEY_BASE` and anything in `.env`), then you can skip the remainder of this section.

### Setting the Secret Key Base

One variable that Rails requires us to set is the "secret key base", which it uses for encrypting data like the session and cookies. We need to set this variable to a very long random sequence of numbers and letters (a through f). Thankfully, Rails also gives us a command for generating an appropriate value for the secret key base:

```bash
$ rake secret
```

The above command will print a long string of letters and numbers and you can use that string directly when setting the `SECRET_KEY_BASE` variable in Elastic Beanstalk.

### Setting Environment Variables

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

## Elastic Beanstalk Resources

- [Amazon's EB Developer Guide](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html)
- [Django Python 3 and Postgres with EB](https://realpython.com/blog/python/deploying-a-django-app-and-postgresql-to-aws-elastic-beanstalk/)
- [Deploying a Node Site with MongoDB with EB](https://www.mongodb.com/blog/post/develop-and-deploy-a-nodejs-app-to-aws-elastic-beanstalk-and-mongodb-atlas)
