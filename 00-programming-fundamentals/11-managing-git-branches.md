# Managing Git Branches
## Learning Goals
- Explore how Git tracks _branches_
- Learn common uses of the `checkout` command for managing _branches_
- Examine the difference between _merge_ and _rebase_
- Discuss when to _branch_, when to _merge_, and when to _rebase_

## Branches
Much of this discussion is going to happen on the whiteboard with sticky notes and drawing. However, here's a list of handy Git commands for working with branches:

### File Commands:
- `git checkout [path/to/file]`: reverts any changes to the specified file(s) to their last committed state.
- `git checkout .`: reverts all changes to tracked files to their last committed state.

### Branch Maintenance Commands:
- `git checkout [branch_name]`: switches Git to an __existing__ branch.
- `git branch [branch_name]`: creates a new branch _but does not switch to it_.
- `git checkout -b [branch_name]`: creates a new branch and switches Git to this __new__ branch.
- `git branch -a`: shows a list of all local and remote branches.
- `git branch -d [branch_name]`: delete the specified branch

### Branch Sharing Commands:
- `git push -u [remote] [branch_name]`: pushes an _untracked_ local branch to the specified remote and instructs Git to keep the two associated. You only use `-u` the very first time you push a new branch upstream.
- `git push [remote] [branch_name]`: pushes commits on the _current branch_ to the _tracked branch_ of a remote.
- `git merge [branch_name]`: performs a recursive merge by first identifying the point of divergence between the _current branch_ and the specified _local branch_ and then applying commits from the specified branch to the current branch in order of commit history.
- `git pull [remote]`: Same as `merge`, except it directs Git to merge a _remote branch_ with the current local branch.

### Rebase Commands:
- `git rebase [branch_name]`: performs a _rebase_ of the current branch. Rebase is a three step process:
  - Rebase identifies the point of divergence between the current branch and the specified branch
  - Rebase rewinds the current branch to the point of divergence
  - Rebase then applies new commits from the specified branch to the current branch
  - Finally, rebase applies the commits unique to the current branch _as new commits to the top of the current branch_.
- `git pull [remote] --rebase`: Same as `rebase`, except it directs Git to rebase a _remote branch_ with the current local branch.


## Resources
[Git SCM Documentation](https://git-scm.com/book/ch3-2.html)  
[Atlassian Tutorial](https://www.atlassian.com/git/tutorials/using-branches/git-branch)
