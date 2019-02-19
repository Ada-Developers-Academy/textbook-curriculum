# Introduction to Scripts

## What is a script?

By now you should be familiar with a variety of different commands from the terminal.  Things like `ls` and `touch`.  However, it turns out macOS doesn't come with _every_ command you could ever want.  Things like the `code` and `brew` commands are once you added yourself.

A "script" is a command written in a "Scripting Language," luckily you already know one, Ruby!  Scripting languages are special in that they are designed to be easy to read _and_ run.  If you were to open the `ls` command all you are would see is a bunch of gibberish.

## How to run a script

Start by downloading this [demo script](./demo-script.rb)!

You should already be familiar with the simplest way to run a Ruby script.  You can `ruby ./demo-script.rb`.  If a script is properly formatted with a magic comment at the top you can run it with `./demo-script-rb` leaving off the `ruby` from the front.

However, you'll notice you don't have to run `/usr/local/bin/brew` but can just run `brew`.

## Paths

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

## Shebang

We call the magic comment at the top of `demo-script.rb` a "shebang".  Because it starts with a `#` (a hash) and a `!` (a bang).  We say "shebang" instead of "hashbang" because programmers like being cute.

The shebang just tells macOS how to run the file.  We're not going to get into why it works (since it's a little complicated) but you just need to know that `#!/usr/bin/env ruby` will let you run a Ruby file from the command line.

## Execute Permission

Unfortunately just adding the shebang to the top of your file isn't enough, you also need to tell the macOS that you want to be able to run it as a command.

Copy/paste the following into `my-new-script.rb`:

```ruby
#!/usr/bin/env ruby

puts "Success!"
```

```
$ ./my-new-script.rb
-bash: ./my-new-script.rb: Permission denied
```

To give your script permission to run you need to give it execute permission.  You can do this with:

```
$ chmod +x my-new-script.rb

# Now if you try to run my-new-script.rb it works!
$ ./my-new-script.rb
Success!
```
