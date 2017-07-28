# Grocery Store
This exercise is another opportunity to practice Ruby object-oriented design and development.

Let's simulate a grocery store inventory system! We want to be able to keep track of the products in our grocery store. For each product, we want to track the quantity of that product as well as the location within the store (aisle).

### Narrative
It's Friday morning and Mariya, the general manager at Antelope Hills Organic Co-op, has just finished overseeing the latest shipment of fresh produce and canned goods from a local farmer's collective. After verifying that every item in the manifest has been accounted for she directs the stock clerks to begin unpacking everything while she updates the tracking system to account for the new inventory.

In the back office she sits down at her terminal, runs the STKMGR2K.EXE application and watches as Stock Manager 2000 loads on the screen, then selects "P" to open the products list. Following her usual routine, she finds the first entry on the shipment manifest -- alfalfa sprouts -- and types "ALF" into the search prompt. Seeing that they received seven new crates of sprouts today, she presses "N" at the screen displaying the inventory listings for alfalfa sprouts in order to bring up an entry form for new inventory. She enters "7" and today's date into the form and hits enter.

Mariya continues through this process, second nature to her by now, for the rest of the manifest until she reaches the 27th item. This is one of the new products that the farmer collective's sales people had recently convinced her boss would sell like hot cakes -- because it could be used as a flour replacement if you wanted to make hot cakes.

Back at the products listing page she presses "C" to create a new product entry and fills out the form with "SORGHUM" for the name, and "1 LB BAG" for the unit size. She finishes the form with the standard MSRP given by the collective, the discount price that she had calculated earlier in the week based on estimated demand, and a short description of the product to be printed on the pricing label.

Returning to the main Stock Manager screen, Mariya hits the "A" key to view a list of aisles. She selects "BAKING", then hits "S" to stock a new product on that aisle. On the screen that appears she finds the new "SORGHUM" product in the list and presses enter to add it. She'd have to figure out exactly where to situate it later... maybe some kind of "Ancient Grains" endcap?

Mariya then finishes working through the remaining entries on the manifest, and goes to check on the stock clerk's progress.

### Think
1. Brainstorm about what nouns and verbs you associate with a grocery store inventory system
1. Go through each noun and see ask yourself if it would make sense as a class?
1. Think about how the classes will communicate. What _messages_ will they send and receive?

### Requirements

**Overall**

The grocery store inventory system needs to track the inventory of each product. If a product is "purchased" the quantity of that product should decrease. You need to figure out where to put this logic.

**Product**

At a minimum, each product should:
- have unique fields that describe the product
- include price logic which allows it to be discounted or full price

**Grocery Store**

At a minimum, each grocery store should:
- have a name
- store a collection of products
- keep track of which aisle each product is in
- find products in a specific aisle
- allow you to add new products
- given a customer order (list of product IDs), be able to
  - calculate the total price of the order
  - calculate the total savings

**Workflow**

You should follow good TDD practices and maintain clean git hygiene as you work on this exercise! A nice workflow is as follows:
- Think about the feature you want to implement
- Write pseudocode, possibly on a whiteboard or with pen and paper, possibly including diagrams or drawings. Think about the following questions:
  - What data (arguments, object state) does your method need to work?
  - What is the result (return value, changes in object state) of having run your method?
  - What weird situations might you encounter? Where do you think your method will change how it behaves?
- Use the answers to the previous questions to write tests for the behavior you plan to add
- Write code to make the tests pass
- `git commit`

### Optional
Create a command-line interface for a user to interact with your grocery store. Allow users to interact with the grocery inventory system to do the operations above.
