# Using Git to Collaborate

So far we've used git to track our changes and mirror them to GitHub. However, some of git's most useful features revolve around collaborating with other people and working on projects together. In this lecture we will set up our environment for collaboration via git, and learn about a couple of these powerful tools.

## Learning Goals
By the end of this lesson, students should be able to...

- Instruct git to _ignore_ certain files
- Use the `git show` and `git diff` commands to review changes
- _Pull_ down someone else's changes to a git repository from GitHub
- Resolve simple _merge conflicts_

## Preliminaries

### Changing Your Default Editor

Many git commands will drop you into an editor. We've seen this with `git commit` - without the `-m "<commit message>"` option, it opens up your shell's editor to compose a commit message. By default this editor is Vim, which isn't very helpful to us since Vim requires a whole bunch of specialized knowledge to use.

So far we've been able to work around this, but as we introduce more complicated git workflows having a functional editor is a must. So let's change our shell's default editor!

The process will be very similar to modifying our command prompt. Open up your `.bash_profile`

```bash
$ atom ~/.bash_profile
```

and add the following lines at the bottom of the file

```bash
# Use Atom as the default editor
export EDITOR="atom --wait"
```

Now, whenever a program (such as git) wants to drop you into an editor, it will open a new window of Atom instead of using Vim. Let's test it out now. Create and `cd` into an empty git repository to play with, create and `git add` a file, and `git commit` without the `-m` flag.

```bash
$ cd ~/Ada/classwork/
$ mkdir git-sandbox
$ cd git-sandbox/
$ git init
$ touch git-atom-test
$ git add git-atom-test
$ git commit
```

Git will wait for you to save the file and close the window, and then use whatever you wrote as the commit message. If you close the window without saving, git will assume you've changed your mind and abort the commit. Pretty slick!

### The `.gitignore` File

Git is a pretty useful tool, but every once in a while there's a file you don't want it to track. Maybe it's a big file that is generated automatically (like a log file), or maybe it's full of sensitive data that you don't want on GitHub (this will be important when we get to Rails). Fortunately git has a solution to this problem.

First, let's create a file we don't want git to know about. Assuming you're still in the `git-sandbox` repository from before

```bash
$ touch secret-secrets.txt
```

If you run `git status`, you should see the file marked as `untracked`. This is a good start, but we want git to ignore it entirely. To do so, we'll create a file called `.gitignore`. Note the leading `.`, which marks this as a hidden file. Git looks for this file in the project root, and anything listed there will be completely ignored. Create the file at the project root

```bash
$ touch .gitignore
```

And add the following lines to it

```gitignore
# Don't push secrets to GitHub!
secret-secrets.txt
```

And then add the `.gitignore` file to git, like you would any other file

```bash
$ git add .gitignore
$ git commit -m "Add .gitingore file, ignore secret-secrets.txt"
```

Now if you run `git status`, you shouldn't see your secrets file at all. Perfect!

## Reviewing Changes

## Pulling Changes from GitHub

## Merge Conflicts

## Git Commands

Here's a handy table of all the git commands we've learned so far.

| Command             | Description |
|---------------------|-------------|
| `git init`          | Initialize an empty git repository
| `git clone <URI>`   | Initialize a git repository from the GitHub repository at the URI
| `git remote -v`     | See where you cloned this repository from
| `git status`        | See the current state of a git repo
| `git diff`          | Show unstaged changes
| `git add <file>`    | Stage (mark as ready to commit) a file
| `git diff --staged` | Show staged changes
| `git commit`        | Commit all staged files. Will drop into an editor unless the `-m <message>` option is provided.
| `git log`           | See a summary of all previous commits
| `git show`          | Show the most recent commit
| `git show <hash>`   | Show the commit with that hash
| `git pull`          | Pull down new commits from GitHub
| `git push`          | Push local commits to GitHub

## What Did We Accomplish?

-

## Additional Resources

-
