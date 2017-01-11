# Install the World! Or at least some package managers!
Many of you will have some set of these tools installed, but we're going to go through them together and make sure everyone is set to go.

Follow the steps below, typing any necessary code into the Terminal application.

If you've got pieces installed, help your fellow students!

## Xcode Command-Line Tools
Xcode is an **integrated development environment** (often called an **IDE**) for creating apps for Mac, iPhone, and iPad. We don't need it in it's entirety, we're just going to download one piece of the whole. _Command Line Tools_ is a component of Xcode that provides a _compiler_ for OS X.

**You should have installed Xcode Command-Line tools in JumpStart.**

### Trust but Verify
Run `$ xcode-select -p`. If it tells you `/Library/Developer/CommandLineTools`, you're ready to move on.

If the Xcode Command-Line tools are not installed you can install it with:
`xcode-select -p` and be patient because it will take time to install.

## Homebrew
[Homebrew](http://brew.sh/) is a **package manager** that simplifies installing software on OS X. Package managers are very common, and each language/framework/stack tends to have their own or preferred tool.

To install, copypasta this into your terminal:

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

You may need to enter your computer password to complete the installation.

### Trust but Verify
Run `$ brew doctor`. Brew is super great at telling you what else it may need. Sometimes there are file permissions to fix. Sometimes there's a warning that can be ignored. If there's anything ever wrong with Brew, `brew doctor` will usually be able to tell you what it is and how to fix it.

## Git
Git is an open source distributed version control system. We will talk about Git in significant detail later. The short version is that we will use Git to version and share our code with others.

We install Git with Brew: `$ brew install git`.

#### Configuring Git
We need to do some configuration so Git knows who we are, and so that it gives us colorful feedback. After Brew finishes the install, run these commands:

```bash
$ git config --global user.name "Your Actual Name"
$ git config --global user.email "The Email Associated with Your Github Account"
$ git config --global color.diff auto
$ git config --global color.status auto
$ git config --global color.branch auto
```

### Trust but Verify
- `$ git config --get user.name` Should show your name
- `$ git config --get user.email` Should show your email

## RVM
[RVM](http://rvm.io) (Ruby Version Manager) is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems. In essence, RVM is a package manager specifically for working with Ruby code.

[**You should have installed RVM in JumpStart.**](https://github.com/Ada-Developers-Academy/jump-start/blob/master/lessons/07-environment-setup/notes/installfest.md)

### Trust but Verify
- `$ rvm version` should tell you something like _rvm 1.26.11 (latest)..._

## Upgrade Ruby!
- Upgrade Ruby to 2.4.0 with RVM: `$ rvm install 2.4.0`
- When it finishes, set it as the default version: `$ rvm use 2.4.0 --default`

### Trust but Verify
- `$ ruby -v` should return _ruby 2.4.0p0_ (your `p` version might be different)
- `which ruby` should return a path like _/Users/ada/.rvm/rubies/ruby-2.4.0/bin/ruby_
- `which gem` should return a path like _/Users/ada/.rvm/rubies/ruby-2.4.0/bin/gem_

## Text Editor(s)
There are many options for text editors. _Sublime Text_, _TextMate_ and _Atom_ are popular **Graphic User Interface (GUI)** editors. _vim_ and _emacs_ are popular editors that operate directly on the command line.

**You should have already installed a text editor in Jump Start, but if not, please install [Atom](https://atom.io/) now.**
