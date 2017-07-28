# Welcome to the Command Line!
This is a quick review of common tools and commands we'll be using every day!

## What's a UNIX?
We're all using OS X, which is a member of the family of operating systems known as 'nix. They're all based on an operating system called *UNIX* (originally UNICS). They all look and work more or less the same, with some minor differences that you don't need to worry about (until you do).

## Terminal
Use _Spotlight Search_ (`⌘␣`) to find and open a program called _Terminal_.

Most of us are used to GUI-based (**G**raphical **U**ser **I**nterface) operating systems like Windows or OS X, but a command line approach is much more effective for many tasks in programming. For example, Terminal will be the place where you'll navigate through and modify your files and directories. It's also where we run our programs and manage how our code is shared with others.

### Bash
Your terminal is a command interpreter that connects to  a _shell_. The UNIX Shell we're using is called Bash (**B**ourne **A**gain **Sh**ell). It's the default shell for (most) Linux and OS X. Many of the functions and tools needed for Ruby development will be executed from Bash.

### Terminal Terminology
- **Console**: the system as a whole
- **Command Line**: the actual line in the console where you type a command
- **Prompt**: This is the beginning of the command line. It usually provides some contextual information like who you are, where you are and other useful info. It typically ends in a $ (this is represented in this lectures examples). After the prompt is where you will be typing commands.
- **Terminal**: The program we use to interact with the console.

## Running Commands
Commands almost always have 3 parts: `[command] [options] [arguments]`

You could think of it as `verb adverb noun`. You'll often see commands prefixed with a `$`. The `$` is the traditional character denoting the prompt. When you see it in tech documents, it's signifying that the following instructions are meant to be executed on the command line.

Let's look at one command: `$ ls -a`

### What *is* a Command?
In UNIX commands are all tiny little programs. They tend to do one small job or task, with a variety of options. We'll be writing our own later on in this program!

In your Terminal, type `$ man ls` (`man` is short for `man`ual).

`man` is awesome. Usually, commands have very detailed manuals. However, be aware that using `man` will put you in a special reading mode. In this mode...

- Normal commands will no longer work.
- `q` (for quit) exits this mode
- Up and down keys scroll.
- Space bar is page down

## Navigating Directories
Getting around the directories of our computer is a snap!
- `pwd`: **p**resent **w**orking **d**irectory. Use this command to show in what directory you are in.
- `cd`: **c**hange **d**irectory.
    + `cd path/to/files` will change your working directory to the path provided.
    + `cd` with no arguments will return you to your home directory.
    + `.` means the current directory. `..` means the directory immediately above your current directory (parent). So...
        * `cd .` wouldn't take you anywhere, but it does have an interesting side effect we'll utilize in the future.
        * `cd ..` will take you one directory up, to the parent directory
    + the tilde `~` is a shortcut meaning your home directory
        * `cd ~` would change to your have directory, same as just `cd`
        * `cd ~/C5` would change to the `C5` directory in your home folder.
    + Dots can be chained together, so to go two directories up, you would do `cd ../../`
    + `cd -` takes you back to the prior directory that you were in. This is different from the parent directory and more like the back button except it only keeps one directory of history. Running `cd -` again will toggle back and forth between the same two directories. This can be useful if you have a source directory and a documentation directory that you need to switch back and forth between.

## Digging In
Let's take a few minutes and use `man` to explore these commands.

- `mkdir`
- `touch`
- `cp`
- `mv`
- `rm` (learn about the -r option!)
- `less`
- `cat`
- `echo`
- `printf`

## Advanced Techniques
These commands will take lots of practice to master. With them, you can quickly perform very powerful operations.

### grep

**G**lobal **R**egular **E**xpression **P**rint

Powerful command for searching files for strings of text. Although this may not seem like a terribly useful command at first, grep is considered one of the most useful commands in any 'nix system.

### "Piping" and "Writing"
We can string commands together to create powerful compound commands. We can also use the angle bracket character (`>`) to write the output of a command into a file.

```bash
$ printf "bananas\napples\npancakes\n"
$ printf "tacos\noranges\ncupcakes\n" > foods
$ cat foods
```

We use the pipe (`|`) to send the output of one command on to the next one. 

```bash
$ printf "bananas\napples\npancakes\n" | grep "an"
$ cat foods | grep "an"
```

Take note: This idea of chaining commands together is _critical_ in Ruby and many other programming languages!

## What Did We Learn?
* Show folders and files in your current directory
* Show your current location
* Change directories
* Open files
* Create new files and directories
* Copy files to different directories
* Move files to different directories
* Remove files and directories
* Basic use of grep
