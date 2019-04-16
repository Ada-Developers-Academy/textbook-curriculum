# Using Pull Requests for Branches

## Learning Goals
- Learn how to create a Pull Request from a branch.
- Learn how to review a pull request.
- Learn how to merge a pull request.

## Creating a Pull Request

You've dealt with Pull Requests between forks before, however they are also extremely helpful when using branches as well!

To create a pull request first push your branch to Github: `git push -u origin [branch_name]`.

Then open your repository on Github and click on the "X branches" link near the top.

![A screenshot of Github showing the location of the branch link](images/branch-button.png)

From the branches page locate the branch you are interested in the "Your Branches" section and click "New pull request".

![A screenshot of Github showing the location of the "New pull request" button.](images/new-pr-button.png)

Once you're on the "Open a pull request" page you have one final step.  Fill in your title and description and then click "Create pull request".  In the sidebar you can add your teammates as reviewers if you'd like so that they receive an email telling them to review the PR.

![A screenshot of Github showing the location of the "Create pull request" button.](images/create-pull-request.png)

## Reviewing a Pull Request

To start we need to go into the "Files changed" section of the pull request.

![A screenshot showing the files changed link.](images/files-changed-button.png)

To add a comment hover over the margin for the line you would like to comment on and click on the blue plus sign.

![A screenshot showing the comment plus sign button.](images/add-a-comment-button.png)

This will open a box that lets you leave a comment and then begin a code review.  Choose "Start a review" and not "Add a single comment".

![A screenshot of the review comment window.](images/add-a-comment.png)

To finish reviewing a Pull Request click on the green "Review changes" button in the upper right corner.

![A screenshot of Github showing the location of the "Review changes" button.](images/review-changes-button.png)

This will open a box giving you space to write a comment and three options:

- Comment: use this when you don't have an opinion on whether or not the PR should be merged.
- Approve: use this when you think the PR should be merged.
- Request changes: use this when you think the PR needs more work before merging.

![A screenshot showing Github's "Review changes" dialog.](images/review-changes-dialog.png)

Click "Submit review" to finish.

## Merging a Pull Request

Once a PR has been reviewed click back into the "Conversation" view.

![A screenshot showing the conversation view button for a PR.](images/conversation-button.png)

Scroll down to the bottom until you get to the "Merge pull request" box.  Click on "Merge pull request" to merge the PR and then click "Confirm merge".

![A screenshot of the PR merging UI.](images/merge-pull-request.png)

Your PR might say that you aren't ready to merge because there are conflicts with the base branch.  In this case you probably need to merge `master` (see [Working with Branches](#working-with-branches)).

## Resources

- [Github: Creating a Pull Request](https://help.github.com/en/articles/creating-a-pull-request)
- [Github: Merging a Pull Request](https://help.github.com/en/articles/merging-a-pull-request)
