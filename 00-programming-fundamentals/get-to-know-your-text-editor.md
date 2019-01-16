# Get to Know Your Friendly Text Editor

Most of our time coding will be spent in a text editor. When we are more familiar with our tools, we should get the following benefits:

- save time, so we're not spending so much time figuring out where a button is or how to do something with our text, cursor, or mouse manually
- give us comfort and a familiar home
- have confidence and power to adjust our workflow when we learn that something should change and be better
- give us the ability to focus on the other programming tasks at hand

## VS Code

We will use the text editor VS Code at Ada in the classroom portion. [VS Code](https://code.visualstudio.com/) is a text editor built by Microsoft. We've chosen to use VS Code specifically because:

- it supports features that are important to us (language support, debugging tools that we will use in the future, and more)
- it is lightweight (it is not too cumbersome)
- it has plenty of support and documentation should we ever need help
- it's customizable, allowing us to be flexible in case something changes
- it's free!

### There are a lot of other editors.
And every person you ask will have a favorite with a very personal list of reasons why their choice is right. Take these with a grain of salt. Use what makes the most sense to you. It's likely you'll change editors every couple of years anyway.  The most important thing is that the editor works for you and meshes with your workflow.

### Adoption at Ada

Beginning in C11, the Ada Developers Academy classroom portion is converting from using the text editor [Atom](https://atom.io/) to the text editor [VS Code](https://code.visualstudio.com/).

Please note that if there are any mentions of `Atom` or the command `atom .`, that the document is outdated.

## Installing the `code` command to open VS Code

It will be powerful for us to master the flow of going from our Terminal to going to our text editor, and back.

Let's say that we're in Terminal, and we're in a project directory that has files for our project, such as `assignment.rb`. We want to open that folder that contains `assignment.rb` in VS Code. VS Code lets us open files by using the `File > Open` menu in the top left corner of our laptop, or `⌘O` as a shortcut, but we have an even better way: using the command line command.

First, we need to install this command. Below is the instructions copied/pasted from [the official VS Code documentation on how to do it](https://code.visualstudio.com/docs/setup/mac):

1. Launch VS Code.
1. Open the Command Palette (⇧⌘P) and type 'shell command' to find the **Shell Command: Install 'code' command in PATH** command.
1. Restart the terminal for the new `$PATH` value to take effect. You'll be able to type '`code .`' in any folder to start editing files in that folder.

To "restart the terminal," you can just quit (or `⌘Q`) the terminal application, and then reopen it.


Now, you can navigate back to your cool folder that has `assignment.rb` in the Terminal, and then use the command `code .` to use the `code` command and give it the parameter of the current directory (`.`)!

## More About VS Code

### Themes

Themes change the way your editor looks. You can configure, install, remove themes in any of the following ways:

// TODO

- A
- B

### Packages

One of the most powerful parts of VS Code is the ability to install custom packages. These can add features as weird and varied as:

- Linters (spellchecker for code)
- Autocomplete for common patterns
- A tool to let you pick colors
- Adding fireworks to your code

We'll add some of these as they become relevant. Feel free to look some up if they interest you, but for now just know that they exist.

## Awesome Keyboard Shortcuts

// TODO: update

Shortcut | Effect
---      | ---
`⌘⇧p`    | Open the _Command Palette_ to execute commands in the editor
`⌘t`     | Search files, open in a new tab
<!-- `⌘l`     | Select the current line -->
<!-- `⌘⇧d`    | Copy the current line -->
<!-- `⌃⇧k`    | Delete the current line -->
<!-- `⌘^up` & `⌘^down` | Move the active line up or down -->
`⌘d`     | Select the next instance of the highlighted string
<!-- `⌃⇧up` & `⌃⇧down` | add a cursor in the same position on the line above/below. Press `esc` to get back to a single cursor. -->
<!-- `⌘\`     | Open/close the Tree View pane -->
`⌘/`     | Comment out the current line

Remember that normal macOS keyboard shortcuts will work here too!

Shortcut | Effect
---      | ---
`⌥left` & `⌥right` | Jump left or right by one word
`⌘left` & `⌘right` | Jump to the beginning or the end of the current line
`⌘up` & `⌘down` | Jump to the top or the bottom of the document
`⌘⇧[` & `⌘⇧]` | Switch tabs left or right
`⌘,`     | Open the settings page
`⌘w`     | Close the current tab
`⌘⇧w`    | Close the current window (all tabs)

### Adding a Custom Shortcut

// TODO

<!-- One of the best things about Atom is its flexibility - you can customize just about anything about it! As an example of this (and because it's super useful) we'll add a custom keyboard shortcut to fix indentation in our programs.

1. Open up the `Settings` page with `⌘,` (`cmd-comma`)
1. Click on the `Keybindings` tab
1. In the paragraph at the top, click on the link to `your keymap file`. This will open a new tab with the file `keymap.cson`
1. Scroll to the bottom and copy-paste the following code into `keymap.cson`:
    ```cson
    # Fix indentation on selected rows
    'atom-text-editor':
      'cmd-i': 'editor:auto-indent'
    ```
1. Now if we hit `⌘i` (`cmd-i`) when we have lines of code selected, Atom will do its best to fix the indentation for us

Automatic indentation isn't just to make code look good, it's also a powerful tool that allows your human eyes to find problems like a forgotten `end` statement. Use it regularly, and please don't turn in assignments with sloppy indentation! -->

## Resources
<!-- -  [Atom & Sublime Compared](https://www.codementor.io/mattgoldspink/best-text-editor-atom-sublime-vim-visual-studio-code-du10872i7) -->
- Some decent text editors
  <!-- - [Microsoft's Visual Studio Code](https://code.visualstudio.com/) -->
  - [Sublime Text](https://www.sublimetext.com/)
<!-- -  [Youtube video on 10 Essential Atom Packages](https://www.youtube.com/watch?v=aiXNKHKWlmY) -->
