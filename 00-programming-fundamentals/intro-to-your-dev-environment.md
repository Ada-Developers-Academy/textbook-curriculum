# Your Dev Environment

## Introduction

If being a software developer is being a craftsperson, then your computer (your development machine) is your workbench.

Over time, as you get better and better at your coding craft, you should build up preferences and wisdom about:

- tools you like and need
- how to manage those tools, their different versions, and how to use them (or stop using them!)
- how you like to organize things or navigate to things
- shortcuts and display preferences

However, at Ada, **we will require the use of specific tools with specific versions.**

At the very minimum, today we should cover:

1. Our required operating system
1. Some mandatory, foundational tools
1. The expected text editor of our curriculum
1. The recommended work directory for your Ada projects, exercises, notes, and materials

## macOS is our Operating System

macOS is the required operating system for the Ada curriculum.

It isn't required to be a macOS wizard in the Ada curriculum, but it's recommended to get familiar enough with macOS that you can do the following things:

- You can navigate the computer's file system using Finder and Terminal (do you know how to get to your home directory `~`?)
- You can open and quit applications installed on your computer
- You can recognize and execute keyboard shortcuts such as Copy (`⌘ + c`) and Paste (`⌘ + v`)
- You can navigate text using your keyboard arrow keys, or other keyboard shortcuts
- You have an Internet Browser such as Google Chrome or Firefox installed, and you can use it and various search engines

For our full requirements and tips, use [Ada's How to macOS Guide](how-to-macOS.md).

## We Need to Install Tools and Configure our Machine to Assume How to Use Them

We need to equip our development machine now with tools that allow developers to write Ruby code.

At a high-level, these tools that we install prepare and transform our laptops from machines that consumers use for writing documents, Internet-browsing and meme-consuming, managing our bills, taxes, homes, chores, online shopping, making movies and music, to now also saying "hey! our machine can read and run/execute code that **we** write."

Please **follow [The Ada Installfest Guide](installfest.md) in order and completely** in order to make sure you're using only the correct tools for this curriculum.

We will learn about and install so many additional tools during the future curriculum, so get excited!

## Your Text Editor is Your Friend

If [Terminal](https://en.wikipedia.org/wiki/Terminal_(macOS)) is our most important tool as a software developer, [the text editor](https://en.wikipedia.org/wiki/Text_editor) is going to be the second most important tool.

Getting comfortable with using, navigating, and controlling our text editor will happen over time.

To help with getting to know our text editor, we have compiled a list of recommended configurations that the Ada curriculum will regularly reference. Please follow [Ada's guide to Getting to Know Your Text Editor](get-to-know-your-text-editor.md).

## We Have a Recommended Folder Organization Pattern

At Ada, over time, we will make hundreds of files and folders.

If you've never organized that many files and folders, and don't have a preference for how to organize, then we recommend that following this folder structure:

### `~/Developer`
  - This is a folder where you put all of your developer-y code stuff!
  - Make this folder with `$ mkdir ~/Developer` for the first time
  - Navigate to this folder from any location in Terminal with `$ cd ~/Developer`, or using your relative commands to change directories

### `~/Developer/projects`
  - This is a folder where you put all of your Ada projects
  - Make this folder with `$ mkdir ~/Developer/projects` for the first time
  - Navigate from anywhere with `$ cd ~/Developer/projects`

### `~/Developer/classroom`
  - This is a folder where you put all of your notes, exercises, scratchwork, classroom activities, homework, etc
  - Make this folder with `$ mkdir ~/Developer/classroom`
  - Pick one of these two popular ways to organize your notes:
    - Organize notes by week. They will have sub-folders nested in here, such as `~/Developer/classroom/week-1`
    - Organize notes by topic. Recommended topic folder names are `git`, `cs-fun`, `ruby`, `rails`, `js`, `react`, so it is like `~/Developer/classroom/ruby`

Of course, feel free to not follow these recommendations if you have preferred ways of organizing files that will work for you better.

## Exceptions

The tools in this document were picked based on:
- Best practices and common practices in industry
- Availability and price
- Reliability

If you have a good reason to use an alternative tool, talk to the instructional team about it. All of the tools described here are tools that the instructors are equipped to use during class, so use wisdom when thinking about alternative tools.
