# Merge Conflict Carnival
## Overview
This year the Ada staff has generously agreed to contribute their culinary skills to a coding bootcamp booth offering food & info pamphlets at the [Georgetown Carnival](http://www.georgetowncarnival.com/). It's the day before the festivities kick off and _someone's_ Cavalier King Charles Spaniel has done his best to shred all of their recipes! Oh no! Can you help Ada staff put everything back together and save Carnival?

In this activity you'll be working with your fellow Adies to put together multiple scraps from a single recipe using Git. You'll accomplish this by successively merging in content from each individuals' copy of the recipes repo. Once all the of merges are finished (and any merge conflicts resolved) you'll have a complete recipe document which can be submitted to the original repository with a pull request.

## Learning Goals
The goal of this activity is to give you exposure to the process of resolving merge conflicts. Because merge conflicts are a natural part of any collaborative development effort, this is an important skill to have as a developer.

With this activity you will be able to encounter and resolve merge conflicts in a controlled scenario where the correct resolution of all merge conflicts is clear.

## Instructions
### Baseline Setup
Before we can start putting the recipe together we need to make sure that everyone in your group is working from the same starting point and can effectively contribute to the recipe building effort.

1. **Split into groups**: Each table is marked with a particular group number and everyone at that table will be part of the group. There should be six people in each group.
1. **Fork the activity repo**: One person in your group should fork the carnival-recipes repo and then add everyone else as a collaborator.
1. **Clone the forked repo**: Everyone else in your group should clone the forked repository.
1. **Find your recipe scrap**: Each group is assigned six recipe scraps that should all be part of the same recipe. You can split these scraps up amongst your group however you wish. The scraps assigned to each group are listed in the carnival-recipes repo. If your group has fewer than six people someone may need to take multiple scraps.
1. **Add your recipe scrap**: Copy the contents of your recipe scrap into the recipe file and then add and commit your changes to the recipe file. After completing this step each person in your group should have **different** content within the recipe file in their local repository.

**Do not** push your changes to GitHub yet! If you're finished early with this step help your groupmates.

### Building the recipe
Once everyone in your group has completed the baseline setup instructions above you're ready to start building the recipe together.

#### General advice
There are a few things to look out for when working through this activity:

- If you're still unsure about what a merge conflict is, or how to resolve one please review the [Merge Conflicts curriculum](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/00-programming-fundamentals/git-merge-conflicts.md).
- You can review the [slides](https://docs.google.com/presentation/d/15OFyyoNJevzk7IpdZCP6VwMLju0MVS2pv0qeETLOa6Q/edit?usp=sharing) and [example walkthrough video](https://adaacademy.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=1db4901c-852c-44f0-a5ee-5777ca094bf9) if you are unsure about how to complete the activity.
- The end result should be a real, usable recipe. The original recipe files were all complete works from various recipe websites online.
- If you find that the result of one of your merges is missing critical ingredients or any numbered steps, you should go back and double check that you didn't lose any lines while resolving a merge conflict.
- Your recipe scraps may have duplicate lines. We've added these in to more accurately portray the full range of potential merge conflicts. **Important**: you should get rid of any duplicate lines while merging.
- There's no "right" way to do this activity, all of the strategies listed below are valid ways to build the recipe file.
- Have fun!

#### Recipe building process
Because each member of your group now has a different version of the recipe file in their local repository, building the complete recipe by merging those versions together will result in merge conflicts. To handle those merge conflicts sensibly your group should use the following process to construct the final recipe file:

1. Split your group into two teams of three.
1. Both teams will use the _round robin_ strategy separately.
    - Decide within each team the order for each person to push their changes.
    - When you've got the order figured out wait for the other team to finish before proceeding.
1. Both teams start pushing their changes simultaneously, kind of like the _ad-hoc_ strategy.
    - **Remember**: Whoever on your team is pushing their changes must successfully finish that process (including fixing any merge conflicts!) before the next person can begin.
    - Work with your fellow team members to resolve any merge conflicts.
1. Once everyone's changes have been merged together, the group as a whole should review it for completeness.
    - Make sure that none of the lines from your individual scrap are missing from the final result.
    - If there are any fixes needed, pick one person in the group to make the necessary changes and commit them.
1. When everyone agrees that the recipe looks correct _one_ person should submit a PR to the original carnival-recipes repo.
1. Finally, debrief with your whole group about how things went.
    - What went well? What didn't?
    - Were there any merge conflicts that were particularly tricky to figure out?
    - How could this process have been made easier?
    - Write up a set of steps to follow when dealing with merge conflicts.

#### Collaboration strategies
There are a number of ways that a group of developers can collaborate to handle merging their changes together into a final, correct result. Each strategy has pros and cons. For example if a particular strategy is good for minimizing the number of complex merge conflicts, it probably requires a slower development process in which developers are often waiting on their peers to merge in changes before they can start working.

- **Round robin**: This strategy involves direct coordination between everyone in the group, resulting in a strictly ordered merge sequence.
  - One at a time each person pushes their changes and resolves any merge conflicts.
  - The next person in turn pulls those changes and pushes their own until everyone's changes have been pushed.
- **Ad-hoc**: This approach relies the most upon Git's merge coordination capabilities to ensure that everyone's changes get merged in properly.
  - Essentially, everyone attempts to `git push` at once.
  - The first person to get there doesn't have to merge, but everyone after that probably will.
- **Branched**: This approach is kind of a mix of the other two.
  - It uses a more advanced feature of Git known as _branching_.
  - Branching is generally considered the heart of a Git-based workflow and you'll have an opportunity to try it on a larger team project.
