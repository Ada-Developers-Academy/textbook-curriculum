# Setting Up the Rails Template

There are a few changes we need to make to the default Rails configuration, to make it suit our needs.

## Instructions

1. Create an empty file named `~/.railsrc`
    ```
    touch ~/.railsrc
    ```

1. Open `~/.railsrc` with your text editor, and add the following lines:
    ```
    -d postgresql
    -m ~/.rails-template.rb
    ```

1. [Copy this file](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/09-intermediate-rails/reference/.rails-template.rb). Navigate to your home directory using `cd ~` and paste the contents in a new file named `.rails-template.rb`.

1. Install yarn 
    ```
    brew install yarn
    ```
