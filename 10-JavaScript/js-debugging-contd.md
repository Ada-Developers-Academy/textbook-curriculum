# JavaScript Debugging, Continued

## Learning Goals
- Use Google Chrome Dev Tools and debug breakpoints to _step over_, _step into_, or _step out of_
- Familiarize yourself with the Network tab in the Google Chrome Dev Tools

## What is a breakpoint?
Recall: A **breakpoint** is an intentional stopping or pausing place in a program, put in place for debugging purposes.

We set breakpoints through the Google Chrome Developer Tools to pause the execution of a line. We press the "play" (or "Resume script execution") button to resume it, until the next breakpoint.

## Stepping
You can choose to step through code one line at a time.

The button to the right of the "resume" button is the "step over next function call" button. While the code is paused, you can use this button to execute the current line, and pause at the next line.

The button to the right of the "step over" button is the "step into" button. This code steps into the executed code of the current line-- if there is a function call, our debugger will bring us to the first line of execution within that function that was just called.

## Monitoring Network
Find the Network tab in Google Chrome Dev tools.

This tab shows all of the network calls that the app makes, the responses to those calls, and the data and information related.

This panel will help any developer understand what requests are being made, and what's coming back.
