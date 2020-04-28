# What to do when you clone a new rails repo?

To get started with an existing rails project

1. Clone the repository with `git clone <LINK>`
1. (optional) Checkout the appropriate branch with `git checkout <BRANCH-NAME>`
1. Download the gem dependencies with `bundle install`
1. Download JavaScript dependencies with `yarn`
1. Reset the database with `rails db:reset`
1. Just to be safe run any migrations with `rails db:migrate`.

Then you should be able to run the rails server with `rails server`
