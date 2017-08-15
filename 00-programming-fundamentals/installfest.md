# Install the World! Or at least some package managers!
Many of you will have some set of these tools installed, but we're going to go through them together and make sure everyone is set to go.

Follow the steps below, typing any necessary code into the Terminal application.

If you've got pieces installed, help your fellow students!

## Xcode Command-Line Tools
Xcode is an **integrated development environment** (often called an **IDE**) for creating apps for Mac, iPhone, and iPad. We don't need it in it's entirety, we're just going to download one piece of the whole. _Command Line Tools_ is a component of Xcode that provides a _compiler_ for OS X.

**You should have installed Xcode Command-Line tools in JumpStart.**

### Trust but Verify

If the Xcode Command-Line tools are not installed you can install it with:
`xcode-select -p` If the command shows a directory path like `/Applications/Xcode.app/Contents/Developer` then it's installed properly.  

If the command does not show a directory path and instead something like `xcode-select: error: unable to get active developer directory, use xcode-select --switch to set one (or see man xcode-select)` you can install it with `xcode-select --install` select install and then grab coffee because it will take a bit of time.  

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
- Upgrade Ruby to 2.4.1 with RVM: `$ rvm install 2.4.1`
- When it finishes, set it as the default version: `$ rvm use 2.4.1 --default`

### Trust but Verify
- `$ ruby -v` should return _ruby 2.4.1p111_ (your `p` version might be different)
- `which ruby` should return a path like _/Users/ada/.rvm/rubies/ruby-2.4.1/bin/ruby_
- `which gem` should return a path like _/Users/ada/.rvm/rubies/ruby-2.4.1/bin/gem_

## Text Editor(s)
There are many options for text editors. _Sublime Text_, _TextMate_ and _Atom_ are popular **Graphic User Interface (GUI)** editors. _vim_ and _emacs_ are popular editors that operate directly on the command line.

**You should have already installed a text editor in Jump Start, but if not, please install [Atom](https://atom.io/) now.**

## It's All About Communication!

Lastly we you should already have Ada's primary mode of communication installed... [**Slack!**](https://slack.com/downloads/osx).  While it is **possible** to get by using the Slack website.  We recommend **strongly** to use the Desktop client.  Simply follow the link above and install it, or go to the Mac Appstore and install Slack that way.  

When Ada has announcements or students want to share general information we generally use Slack.  We only use e-mail for personal communication, things we need to keep a record of (like absences).  


It's also critically important to use Emoji's (not really, but it's fun!).  So once you have Slack running  follow the directions [**here**](https://get.slack.help/hc/en-us/articles/206870177-Create-custom-emoji) to install a Slack Emoji of your choice.  

You can find a great site for Slack Emoji's [**here**](https://slackmojis.com/).
