# Extend Digital Clock Project

Earlier you used events & jQuery selectors to build a JavaScript powered digital clock.  Now we will extend it with jQuery click events and add some buttons to change how the clock displays.

## Changing Color

Add 3 buttons with text showing the names of colors.  Add an `onClick` event to the buttons which changes the text color of the clock to match the button.  An effective strategy would be to create css classes and use jQuery to switch the class the clock is styled with.

## Changing Font & Alignment

Next, add a pair of buttons, one with the text "left", and one saying "right". When the "right" button is clicked, the text of the clock should align left, and when the right button is clicked it should align right.  Then add a pair of buttons with the text set to the fonts of your choice.  When those buttons are clicked change the clock's font to match.

## Optional Enhancement

As an optional enhancement add a 12-hour button which changes the clock to display in 12-hour time like 5:05:45pm, and a 24-hour button which changes the clock to display in 24-hour mode like 17:05:45.  Create only **one** button that toggles the clock between 24-hour and 12-hour time.
