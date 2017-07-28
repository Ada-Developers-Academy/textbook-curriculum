# ￼Intro to Git
## Learning Goals
- Learn the What, Why, and How of Version Control
- Track changes to files with Git
- Document our change in with a good commit message

## Version Control
Git is a "distributed version control" system:

- **Distributed**: used in opposition to Centralized. This means that there is no single "correct" computer for the source code to exist upon. Each person who uses or writes the code will have their own copy of the code and its history.
- **Version**: This refers to the idea that source code files change over time. When you save a file, that is a single version of the file. When you add a new line of code and save it again, that is a new version of the file.
- **Control**: The Git system is used to control or manage the process of creating new Versions of source code files, and the process of distributing those versions to other people.

## But Why???
_Version Control_ is used in software development because we have multiple people working together to build a single project, and we need to coordinate that process of working together to ensure it is reliable and efficient. While most of our work until now has been individual, it's important to recognize that the "multiple people" in the above statement may also refer to you and yourself *in the future*.

As an analogy, it might help to consider the case of a group of artists working on a gigantic mural. To ensure that the overall design and intention of the mural is achieved, the artists must coordinate amongst themselves to avoid painting over each others' work. A similar dynamic exists for multiple programmers working on a set of files for a programming project.

## Lets Git Started!
We are going to go through the Git workflow, step by step. We will use the image below as we reference each step in the process.
[![Git Lifecycle](images/git-lifecycle.png)](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics)

### Creating a repository
With Git, a collection of files, and all of the versions of those files, are called a _repository_ (or repo). Before Git can start _tracking_ the different versions of your files, we need to create a repository:

```bash
$ cd ~/sandbox
$ mkdir git-learnin
$ cd git-learnin
$ git init
Initialized empty Git repository in /Users/.../git-learnin/.git/
```

When you create a repository it starts empty -- there are no files and no versions tracked within it. We can see this by using a command to view the current `status` of our repository:

```bash
$ git status
On branch master

Initial commit

nothing to commit (create/copy files and use "git add" to track)
```

### Putting files into Git
Great! Now that we have a repository, we need to add some files into it. Lets first create a file so we have something to work with.

##### Create
```bash
$ echo "This is a file!" > first-file.txt
```

##### Add

After that we can `add` the file, which prepares it to be put into the repository.

```bash
$ git add first-file.txt
```

##### Status

Now that we have "staged" the file `first-file.txt` with the `git add` command, we can again use `git status` to check on our repository:

```bash
$ git status
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

          new file:   first-file.txt
```

##### Commit

Here we see that Git is telling us we have a pending change to the repository -- adding a new file named `first-file.txt`. However, that change is not yet part of the repository! We can affirm to Git that we really want to do make this change by using `commit`:

```bash
$ git commit -m "Add first-file.txt"
[master (root-commit) e88b5ce] Add first-file.txt
 1 file changed, 1 insertion(+)
  create mode 100644 first-file.txt
```

__Note:__ Your computer may say something different for the `e88b5ce` part.

The reason we used the `-m "Add first-file.txt"` option for the `git commit` command is because Git is a real stickler about documenting all of your changes!

When you `commit` a change, Git requires that you explain yourself. This is highly important, as it will help other people (and your future self!) understand what changes you made without having to read the complete details.

## A Little Historical Context
### Viewing your history in Git
Now that we've committed a change to Git we can take a look at the history of our repository, which shows all of the changes that have been committed, in reverse chronological order:

##### Log

```bash
$ git log
commit e88b5ce3fd005121da62a34aea3dcdba497a7d3f
Author: Charles Ellis <hamled@hamled.name>
Date:   Mon Sep 28 16:51:38 2015 -0700

    Add first-file.txt
```

Since we've only made a single commit so far, the `log` only shows a single entry.

##### All Together Now!

 As we make more changes and commit them into the repository, we'll get more entries. Lets try that now!

```bash
$ echo "This is a second file!" > second-file.txt
$ git add second-file.txt
$ git commit -m "Add another file"
[master 475047a] Add another file
 1 file changed, 1 insertion(+)
  create mode 100644 second-file.txt

$ git log
commit 475047a5c721aa1ce2744cbc43ebb32351e2c305
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:24:55 2015 -0700

    Add another file

commit e88b5ce3fd005121da62a34aea3dcdba497a7d3f
Author: Charles Ellis <hamled@hamled.name>
Date:   Mon Sep 28 16:51:38 2015 -0700

    Add first-file.txt
```

Now we have two entries in the history of our Git repo! These entries are generally known as _commits_, because you use the `commit` command to create them. Also, notice that the `git status` command says "nothing to commit, working directory clean". This message indicates that Git doesn't see any pending changes at this time -- because we just committed those changes!

### Updating files with Git
So far, we've created two commits by adding a new file two times. Lets try changing one of these existing files, instead.

```bash
$ echo "This is the new file content!" > first-file.txt
$ git add first-file.txt
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   first-file.txt

$ git commit -m "Update first-file.txt with new content"
[master 474d3fe] Update first-file.txt with new content
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git status
On branch master
nothing to commit, working directory clean

$ git log
commit 474d3fe29d17add79937cb94370d2f94fbde1705
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:40:07 2015 -0700

    Update first-file.txt with new content

commit 475047a5c721aa1ce2744cbc43ebb32351e2c305
Author: Charles Ellis <hamled@hamled.name>
Date:   Tue Sep 29 09:24:55 2015 -0700

    Add another file

commit e88b5ce3fd005121da62a34aea3dcdba497a7d3f
Author: Charles Ellis <hamled@hamled.name>
Date:   Mon Sep 28 16:51:38 2015 -0700

    Add first-file.txt
```

This process looks pretty similar to the previous one in which we added `second-file.txt`. The only important differences are where Git is telling us about the change that we're making:
- `modified:   first-file.txt`
- `1 file changed, 1 insertion(+), 1 deletion(-)`

With these two lines Git is showing us first what file we have modified in our pending change, before we commit it. And second (after we commit it), what the actual modification to that file was -- we removed one line (the original "This is a file!"), and added one line (the new "This is the new file content!").

## Commit Early, Commit Often
Commits, ideally, should be _atomic_. That is, any single commit should include changes that encompass a single idea. This is a habit that must be built. It's easy to "get in the zone" while programming and, before, you know it, you've got fifty changes in ten files and you're not sure how you ended up there. Making _commits_ is fast and provides you a history of how you got from there to here. Here's some good examples of when to _commit_:

- you finish a new feature
- you write code that necessitates two or more lines of comments to explain
- you make a change to one file that necessitates a change in another
- you change the _method signature_ of a method that's already in Git
