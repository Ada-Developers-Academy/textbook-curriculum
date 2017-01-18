# Heroku Installfest

## Sign up for Heroku
* Go to [Heroku](http://heroku.com)
* Click the big Sign Up button
* Enter your email address. (Use the same email address for Heroku, git, github, and ssh.)
* Heroku will send you an activation email.
  * Open it and click on the activation link.
  * It will take you to the Heroku site.
  * Enter and confirm your password.
  * Hit Save.

Heroku *can* be a free service, but you will eventually have to add a credit card (I think after 5 apps), although it is still free unless you use add-ons or increase the performance. The value Heroku provides is worth hundreds of dollars, feel lucky that this exists and all you have to do is provide a number and not actually pay anything.

## Install Heroku Toolbelt
The [Heroku Toolbelt](https://toolbelt.heroku.com/) is a suite of tools used for interacting with Heroku on the command line. Go to the site and then click the download link.and install.

### Trust, but verify
Type this in the terminal: `$ heroku version`

Expected result is something like:
```bash
heroku-toolbelt/3.42.50 (x86_64-darwin10.8.0) ruby/1.9.3
heroku-cli/4.29.4-6a9494e (amd64-darwin) go1.6
```
### Authenticate with Heroku
Run `heroku login`. This will prompt for the email & password combination. Enter them and look for the _Authentication successful_ message:

```bash
$ heroku login
Enter your Heroku credentials.
Email: adam@example.com
Password (typing will be hidden):
Authentication successful.
```

That's it!
