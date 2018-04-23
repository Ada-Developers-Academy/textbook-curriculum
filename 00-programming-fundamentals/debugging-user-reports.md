# Debugging from User Reports
Debugging any application usually takes one of two forms: either you encounter the bug yourself while developing the application, or a user encounters the bug and files a report. You've already seen the first form of debugging quite a lot here at Ada because it's a natural, necessary part of building software.

The second form of debugging is something that you will likely begin to experience during your internship, and it has some unique aspects to it that inform the approach you'll need to take when debugging. Specifically, it is necessary to translate from the user's report into a set of "reproduction steps" (also called a "repro") which can be followed to trigger the bug.

In some organizations this work is the purview of dedicated customer support and/or QA team members, but in smaller companies the responsibility often falls on developers as well. In either case it is important to get this experience to be able to work effectively with the groups that support the live/production deployment of the system or application.

## Creating Repro Steps
We need to create these repro steps because users of our application generally do not have any understanding of how it actually works. They only see the user interface and so their explanation of what went wrong is usually framed in terms of how things are presented in the UI.

For example, they might make a purchase from your store and see that it does not show up in their purchases list. They might then report this to you as a bug with the purchase list. But upon investigation you might find that the issue was actually due to the payment gateway system returning an error code that your application did not expect, resulting in the purchase being dropped from the database.

Once you have a set of repro steps for a specific bug you can follow them in your local development environment and see the full error message and details (which are generally hidden from users in production deployments). At this point you can follow the same debugging process as when you encounter an error yourself.

## Example
Here's an example of the kind of user report that you might receive, and the resulting repro steps we could generate. For this example imagine that you are working on an e-commerce website that has a shopping cart feature.

### User Report
> I added the Silver Tails Dog Infrared Massager. But I added two somehow. When I tried to remove one from my cart it went away entirely!

### Repro Steps
1. Open the website in Chrome.
1. Sign up for a new account using the standard sign up procedure.
1. Use the product search bar to search for "silver tails dog infrared massager"
1. Click on the result labeled "Silver Tails Dog Infrared Massager with 2-Heated Heads."
1. Click on the "Add to Cart" button.
1. Press the browser's back button.
1. Click on the "Add to Cart" button again.
1. Observe that the quantity for the above item is listed as 2.
1. Open the quantity drop-down for the item and select "1".
1. Click the "Update item" button next to the drop-down.
1. Observe that the item "Silver Tails Dog Infrared Massager with 2-Heated Heads." is no longer listed in the cart.

### Important Considerations
As you can see above the repro steps for this example bug are much more detailed and thorough than what the user presented. This additional detail will be instrumental in helping a developer (possibly you) pin-point the exact code that was involved when the bug was triggered. There are some additional things to take note of:

* The repro steps should be as exact as possible. For the first step we didn't say "Open the website in a browser" -- this is important to minimize the variation between how you or the QA person reproduced the bug and how the developer fixing it is reproducing the bug.

  Sometimes if a developer receives an issue ticket (how bugs and feature work are tracked) with some lenience or variation in how the repro steps could be followed they will try it one way and not trigger the bug, and then they will mark the issue as resolved because it's not a real bug.
* The repro steps should involve the original report's details to the greatest extent possible. In these repro steps we continued to use the dog massager item, even though this bug might affect other items.

  While you can sometimes generalize the repro steps, it's not always obvious when that is possible or not. In those cases err on the side of caution and re-use the details from the initial report -- they might be critical to diagnosing the underlying bug.
* The repro steps should conclude with an observation. Generally the final part of any set of repro steps is to observe the unexpected behavior, this makes it clear specifically how the bug is manifesting (at a user level) in the final context of the repro steps.
