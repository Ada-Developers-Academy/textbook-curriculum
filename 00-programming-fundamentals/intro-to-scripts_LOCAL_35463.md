# Introduction to Scripts

## Learning Goals

By the end of this lesson students should be able to...
- Create a Ruby script
- Add an appropriate "shebang" to their Ruby scripts
- Make a Ruby script executable
- Add a Ruby script to their path
- Use command line arguments
- Write code that only runs on the command line.

## What is a Script?

By now you should be familiar with a variety of different commands from the terminal.  Things like `ls` and `touch`.  However, it turns out macOS doesn't come with _every_ command you could ever want.  Things like the `code` and `brew` commands are ones you added yourself.

A "script" is a command written in a "Scripting Language," luckily you already know one, Ruby!  Scripting languages are special in that they are designed to be easy to read _and_ run.  If you were to open the `ls` command all you are would see is a bunch of gibberish.

## How to Run a Script

Start by downloading this [demo script](./demo-script.rb)!

You should already be familiar with the simplest way to run a Ruby script.  You can `ruby ./demo-script.rb`.  If a script is properly formatted with a special comment at the top you can run it with `./demo-script.rb` leaving off the `ruby` from the front.

However, you'll notice you don't have to run `/usr/local/bin/brew` but can just run `brew`.

## `$PATH`

The reason that you can run `brew` without a prefix is because you have it on what's called your `PATH`.  You can see your `PATH` with the echo command.

```sh
echo $PATH
```

Your path is a list of directories that contain scripts you would like to run without a prefix. Traditionally there's a directory named `bin` inside of your home directory that one stores their scripts in.  To create it and add it to your path run:

```sh
$ cd ~ # Go to your home directory.
$ mkdir bin # The "mkdir" command makes a directory.
$ echo 'export PATH="$HOME/bin:$PATH"' >> ~/.profile
```

This will change your path for all _new_ terminals.  Copy `demo-script.rb` into your personal `bin` directory:

```sh
$ mv demo-script.rb ~/bin/
```

Once you open a new terminal you should now be able to type `demo-script.rb` no matter what folder you are in!

## Execute Permission

Unfortunately just adding the shebang to the top of your file isn't enough, you also need to tell the macOS that you want to be able to run it as a command.

Consider `demo-script.rb`:

```ruby
#!/usr/bin/env ruby

puts "Hello, scripting!"
```

```
$ demo-script.rb
-bash: demo-script.rb: Permission denied
```

To give your script permission to run you need to give it execute permission.  You can do this with:

```sh
$ chmod +x ~/bin/demo-script.rb

# Now if you try to run demo-script.rb it works!
$ demo-script.rb
Hello, scripting!
```

## Shebang

Now that we have our script running, let's dive into the details. We call the special comment at the top of `demo-script.rb` a "shebang".  Because it starts with a `#` (a hash) and a `!` (a bang).  We say "shebang" instead of "hashbang" because programmers like being cute.

The shebang just tells macOS how to run the file.  We're not going to get into why it works (since it's a little besides the point at the moment) but you just need to know that `#!/usr/bin/env ruby` will let you run a Ruby file from the command line.

The command `/usr/bin/env ruby` here means "look for the version of Ruby in my `$PATH` and run that".

## Command Line Arguments and `ARGV`

Having a script that always runs the same way is useful, but sometimes you want some information from the user.  We've done this in the past by using `gets` from inside of Ruby however there's another approach that's often simpler.

You've used command line arguments before in the terminal.  When you run `cd Desktop` you are calling the `cd` command with the argument `Desktop`.  Command line arguments are like method arguments except they are for the entire program.

If you want to access command line arguments from inside of your Ruby script the `ARGV` constant is an array containing all of the command line arguments passed to your program.

### A Note on Command Line Arguments

Command line arguments are always strings and are split on whitespace.  Consider a script `greet.rb` that would take in one name as its only argument, such as `Ada Lovelace`. If you call `./greet.rb Ada Lovelace` you're calling `./greet.rb` with two arguments `Ada` and `Lovelace`.  If you want that to be a single argument you need to surround it in quotes (either single or double) like `./greet.rb 'Ada Lovelace'`.

Similarly because everything is a string we need to convert our arguments from a string.

`adder.rb`:
```ruby
#!/usr/bin/env ruby

puts ARGV[0] + ARGV[1]
```

If you call `./adder.rb 1 2` you're going to get back `12` not `3`.  To fix it we need to call `.to_i` to make an integer or `.to_f` to make a floating point number.

`adder.rb`:
```ruby
#!/usr/bin/env ruby

puts ARGV[0].to_i + ARGV[1].to_i
```

`./adder.rb 1 2` will now print `3`.

## Command Line Only Code

Sometimes you will want to have some code only run if you call your program from the command line.  This is common if you have a library that can also be run interactively.

Say we have this super useful greeting library but also want to be able to greet people on the command line.  Since we don't want to greet everyone that `require`s our library we can add a `main` method and then detect if we're being called directly.

`greet.rb`
```ruby
#!/usr/bin/env ruby

def greet(name)
  puts "Hello, #{name.upcase}!"
end

def main
  if ARGV.length > 0 # We want to make sure we have an argument.
    puts "Please provide your name!
  else
    greet(ARGV[0])
  end
end

main if __FILE__ == $PROGRAM_NAME
```

The final line of this program is where the magic happens.  `if __FILE__ == $PROGRAM_NAME` relies on two special variables.  `__FILE__` is the name of your file and `$PROGRAM_NAME` is the name of the current program, so if they are the same that means your script is being run directly and not `require`d.

## Summary

- A **Ruby script** is any Ruby program intended to be run directly by a user.
- A **Shebang** is the special line at the top of your Ruby scripts.  It should read `#!/usr/bin/env ruby`.
- To make a script **executable** run the command `chmod +x` on your script.
- You can add a script to your **`$PATH`** in two ways.
    1. Put the script in a directory already on your `$PATH` (you can check this with `echo $PATH`.
    2. Add the directory the script is in to your path in your `~/.profile`.
- You can access the **command line arguments** using the `ARGV` Ruby constant.
- You can write code that only runs on the command line by comparing `__FILE__` to `$PROGRAM_NAME` (if they are the same you are running as a script!)

## Additional Resources
- [Shebang (Wikipedia)](https://en.wikipedia.org/wiki/Shebang_(Unix))
- [The `env` command](https://en.wikipedia.org/wiki/Env)
- [4 Ways to Write and Run a Ruby Script](https://cobwwweb.com/four-ways-to-write-run-ruby-script)
