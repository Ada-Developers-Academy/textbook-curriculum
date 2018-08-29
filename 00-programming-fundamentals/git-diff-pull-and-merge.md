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

So far we've been able to work around this, but as we introduce more complicated git workflows having a functional editor is a must. So let's change our shell's default editor! Run the following command in your terminal:

```bash
$ git config --global core.editor "atom --wait"
```

Now, whenever git wants to drop you into an editor, it will open a new window of Atom instead of using Vim. Let's test it out now. Create and `cd` into an empty git repository to play with, create and `git add` a file, and `git commit` without the `-m` flag.

```bash
$ cd ~/Ada/classwork/
$ mkdir git-sandbox
$ cd git-sandbox/
$ git init
$ touch git-atom-test.txt
$ git add git-atom-test.txt
$ git commit
```

Git will wait for you to save the file and close the window, and then use whatever you wrote as the commit message. If you close the window without saving, git will assume you've changed your mind and abort the commit. Pretty slick!

### The `.gitignore` File

Git is a pretty useful tool, but every once in a while there's a file you don't want it to track. Maybe it's a big file that is generated automatically (like a log file), or maybe it's full of sensitive data that you don't want on GitHub (this will be important when we get to Rails). Fortunately git has a solution to this problem.

First, let's create a file we don't want git to know about. Assuming you're still in the `git-sandbox` repository from before

```bash
$ touch secret-secrets.txt
```

If you run `git status`, you should see the file marked as `untracked`. This is a good start, but we want git to ignore it entirely. To do so, we'll create a file called `.gitignore`. Note the leading `.`, which marks this as a hidden file, meaning it won't show up in Finder or in the results of `ls` without the `-a` option. Git looks for this file in the project root, and anything listed there will be completely ignored. Create the file at the project root

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

Often when you're working with git, it's useful to see what's changed since your last commit, or what a previous commit looked like. To do so we'll use the `git diff` and `git show` commands.

### Viewing Uncommitted Work

The `git diff` command is used to view uncommitted changes. Since a diff can be quite large, `git diff` will drop you into a pager, just like `man` or `git log`. Remember, use the arrow keys to scroll up and down, `/` to search, and `q` to quit.

There are two different versions of `git diff`. The first, with no options, shows _unstaged_ changes (changes that haven't been `git add`ed). Let's see it in action

```bash
$ touch file.txt
$ atom file.txt # Make and save some changes
$ git diff
```

You should see all the changes you've made, organized by file. Lines you've added will have a plus in front of them and appear in green, while lines you've removed will be prefixed with a minus and appear in red. Git counts any change to a line as a removing the old line and adding the new one, even if you only changed a single character.

If you `git add` the file, you'll notice that `git diff` no longer displays any changes. That's where the second version of `git diff` comes in. With the `--staged` flag, git will display all staged (`git add`ed) changes. Other than that, the output format will be the same.

```bash
$ git add file.txt
$ git diff          # Displays no changes
$ git diff --staged # Displays expected changes
```

Both versions of `git diff` are particularly useful when you're writing a commit message, and trying to remember what the heck you just did.

### Viewing Commits

The `git show` command displays an existing commit. Its output is very similar to `git diff`, except that the commit message is shown on top.

With no arguments, `git show` displays the most recent commit

```bash
$ git commit -m "Added file.txt to test out git diff"
$ git show
```

`git show` can display a commit other than the most recent one, but it takes a little work. We'll need to copy the **commit hash**, that long string of numbers and letters, that corresponds to our commit. You can find the commit hash using `git log`. Go ahead and copy it to your clipboard.

![Finding a commit in the git log](images/git-log-output.png)

Note that your commit hash will look different than the one in the image. To show that commit use `git show <paste-commit-hash-here>`

```bash
$ git show 157d556f2635b3c8fe838b3fa456af5145b77bae
```

## Exercise: Collaborating with Git

Follow the link in the calendar to the Git Pull Activity, and follow the instructions there.

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
| `git pull`          | Pull down all new commits from GitHub
| `git push`          | Push all local commits to GitHub

## What Did We Accomplish?

- Change our shell's default editor to Atom
- Tell git to ignore files using the `.gitignore` file
- View uncommitted work using `git diff`
- View previous commits using `git show`
- Pull down changes from GitHub using `git pull`
- Resolve a simple merge conflict

## Additional Resources

- [Git Tower on reading diffs](https://www.git-tower.com/learn/git/ebook/en/command-line/advanced-topics/diffs)
- [Git documentation on pull](https://git-scm.com/docs/git-pull)
