# Setting Up the Rails Template

There are a few changes we need to make to the default Rails configuration, to make it suit our needs.

## Instructions

1. Create an empty file named `~/.railsrc`
    ```
    $ touch ~/.railsrc
    ```

1. Open `~/.railsrc` with your text editor, and add the following lines:
    ```
    -d postgresql
    -m ~/.rails-template.rb
    ```

1. [Download this file](https://raw.githubusercontent.com/Ada-Developers-Academy/textbook-curriculum/master/08-rails/reference/.rails-template.rb) with `cmd+s`, and save it as `~/.rails-template.rb`
