# What Are Pull Requests Actually?

## Learning Goals

- Define what a pull request is
- Practice opening PRs
- Practice reviewing PRs

## Group Exercise

With your group, use any online resource to find answers for the following questions:

1. What is a pull request (PR) used for?
1. PRs are usually used to compare how many branches of code at a time?
1. What does it mean when a PR is...
    - open?
    - closed?
    - merged?
1. How can a team use PRs to...
    - review code?
    - comment on code?
    - approve code?
    - collaborate on code?
    - request changes?

### Practice PR Collaboration

As a group, assign each person as role A, B, C, or D. If there aren't four people in the group, follow the instructions as best as y'all can.

1. Person A should fork [this PR practice repo](https://github.com/AdaGold/pr-practice) to their personal account
1. Person A should add all members (B, C, and D) as collaborators to this repo, and ensure they have push permissions
1. Person A should share their repo URL with B, C, and D
1. All people (A, B, C, and D) should clone this repo to their computers
1. All people (A, B, C, and D) should create a branch on their local machine, and name this branch by their initials and then `/feature-branch-example` ( For example, if Simon's initials were "sdr", then `$ git checkout -b sdr/feature-branch-example`)
1. All people should spend less than 2 minutes making some changes and git commits on their own branch:
    - Make at least one `.txt` file, with some text in it, such as `$ touch favorite-color.txt` or `$ touch my-secrets.txt`
    - add and commit here
    - Modify the content for the appropriate section in the existing `README` file
    - add and commit here
1. All people should push their commits to their own branch (for example `git push origin sdr/feature-branch-example`)
1. All people should open a PR that compares their branch against the `master` branch
1. Each person will review one other person's PR
    - Person A should review Person B's PR
    - Person B should review Person C's PR
    - Person C should review Person D's PR
    - Person D should review Person A's PR
    - Use this as an opportunity to test the PR functionality. How do you:
      - review all file changes?
      - comment on a single line of code?
      - comment on the overall PR?
      - review, and say that you approve?
      - review, and say that you request changes?
1. Each reviewer should comment on the PR with a comment that says "ship it", "looks good to me", "lgtm", ":+1:", or some other similar comment
1. Once the PR has approval, the owner of the PR should merge their PR, and delete the branch

If it says that the PR has merge conflicts, resolve them with the recommendations that GitHub gives you.

## Conclusion

Historically, we've found that team collaboration often times goes more smoothly if the team uses PRs.

Regardless of Ada projects, most teams in industry practice merging code through pull requests.
