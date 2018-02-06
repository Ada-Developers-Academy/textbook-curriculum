# Get to Know Your Friendly Text Editor

## Atom
[Atom](https://atom.io/) is a powerful new text editor created by Github. It's build using node.js and other web technologies.  Atom is the text editor we will be using and supporting at Ada.

### There are lots of other editors.
And every person you ask will have a favorite with a very personal list of reasons why their choice is right. Take these with a grain of salt. Use what makes the most sense to you. It's likely you'll change editors every couple of years anyway.  The most important thing is that the editor works for you and meshes with your workflow.

## More About Atom

### Themes
Themes change the way your editor looks, similar to packages
enter the `Preference` and click on the `Themes` tab, browse, and install.

You can even customize themes using a language called CSS, which we'll be learning in a few weeks.

### Packages

One of the most powerful parts of Atom is the ability to install custom packages. These can add features as weird and varied as:

- Linters (spellchecker for code)
- A minimap of your code
- Autocomplete for common patterns
- A tool to let you pick colors

We'll add some of these as they become relevant. Feel free to look some up if they interest you, but for now just know that they exist.

## Awesome Keyboard Shortcuts

Shortcut | Effect
---      | ---
`⌘⇧p`    | Open the _Command Palette_ to execute commands in the editor
`⌘t`     | Search files, open in a new tab
`⌘l`     | Select the current line
`⌘⇧d`    | Copy the current line
`⌃⇧k`    | Delete the current line
`⌘^up` & `⌘^down` | Move the active line up or down
`⌘d`     | Select the next instance of the highlighted string
`⌃⇧up` & `⌃⇧down` | add a cursor in the same position on the line above/below. Press `esc` to get back to a single cursor.
`⌘\`     | Open/close the Tree View pane
`⌘/`     | Comment out the current line

Remember that normal OSX keyboard shortcuts will work here too!

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

One of the best things about Atom is its flexibility - you can customize just about anything about it! As an example of this (and because it's super useful) we'll add a custom keyboard shortcut to fix indentation in our programs.

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

Automatic indentation isn't just to make code look good, it's also a powerful tool that allows your human eyes to find problems like a forgotten `end` statement. Use it regularly, and please don't turn in assignments with sloppy indentation!

## Resources
-  [Atom & Sublime Compared](https://www.codementor.io/mattgoldspink/best-text-editor-atom-sublime-vim-visual-studio-code-du10872i7)
- Some decent text editors
  - [Microsoft's Visual Studio Code](https://code.visualstudio.com/)
  - [Sublime Text](https://www.sublimetext.com/)
-  [Youtube video on 10 Essential Atom Packages](https://www.youtube.com/watch?v=aiXNKHKWlmY)
