# Get to Know Your Friendly Text Editor

## Atom
[Atom](https://atom.io/) is a powerful new text editor created by Github. It's build using node.js and other web technologies.  Atom is the text editor we will be using and supporting at Ada.

### There are lots of other editors.
And every person you ask will have a favorite with a very personal list of reasons why their choice is right. Take these with a grain of salt. Use what makes the most sense to you. It's likely you'll change editors every couple of years anyway.  The most important thing is that the editor works for you and meshes with your workflow.  

## More About Atom
### Packages
We can install add-ons in Atom through it's internal package manager.

1. Open the preferences pane from the app menu `Atom > Preferences...` (or press `⌘,`).
2. Click on the `Packages` tab in the left menu. This will show you the packages that are installed by default.
3. Click on the '+Install' tab in the left menu. Search and install the following packages:
    - Autoclose HTML
    - Color Picker
    - Linter
    - Linter ruby
    - Linter CSSlint
    - Atom Zurb Foundation
    - Sublime Style Column Selection
    - Eslint


#### Term:  Linter

*  A Linter is a name for a program that flags suspicious code that are probably errors.  You'll see the error message at the bottom of your text editor like this:

![Linter Error Msg](images/linter.png "Linter Error Message")


### Themes
Themes change the way your editor looks, similar to packages
enter the `Preference` and click on the `Themes` tab, browse, and install.

### Customizing Themes
There are many ways to customize Atom, but most simple is to edit the stylesheet

- Open the Command Pallet (`⌘⇧p`) and type "open your stylesheet", and press enter.
- Try writing some CSS (don't worry we'll learn it in the future):

```css
.editor {
  background-color: red;
}
```

Press `⌘s` to save and you should see the change instantly!

You can select any part of the application to manipulate with CSS.
To browse the CSS selectors for the app open the debug console with `⌘⌥i`

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

Remember that normal osx keyboard shortcuts will work here too!

Shortcut | Effect
---      | ---
`⌥left` & `⌥right` | Jump left or right by one word
`⌘left` & `⌘right` | Jump to the beginning or the end of the current line
`⌘up` & `⌘down` | Jump to the top or the bottom of the document
`⌘⇧[` & `⌘⇧]` | Switch tabs left or right
`⌘w`     | Close the current tab
`⌘⇧w`    | Close the current window (all tabs)

## Resources
-  [Atom & Sublime Compared](https://www.codementor.io/mattgoldspink/best-text-editor-atom-sublime-vim-visual-studio-code-du10872i7)
- Some decent text editors
  - [Microsoft's Visual Studio Code](https://code.visualstudio.com/)
  - [Sublime Text](https://www.sublimetext.com/)
-  [Youtube video on 10 Essential Atom Packages](https://www.youtube.com/watch?v=aiXNKHKWlmY)
