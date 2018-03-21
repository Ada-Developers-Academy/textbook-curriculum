# Practice with Entity Relationships

## Setup

We are setting up an online shopping system like Etsy (not really, but bear with me).  


The database will need to track:
- Customers
- Products
- Shopping Carts
- Orders

Note:  **You may be required to create additional join tables as necessary.**

For Customers the database will need to keep track of:
-  Customer first & last names
-  Customer email addresses

Products will have
-  A product name
-  A number available in inventory
-  A price
-  A description

Shopping Carts will have
- The customer the cart belongs to
- Products in the cart along with the quantity

Orders will have
- The customer the order is for
- The products in the order
- The status of the order ("Placed", "Out for Delivery", "Completed", "Returned")


## Exercise
1. Draw what you think the Entity Relationships should look like in this example.  In the ERD Diagram, include the data types of each field.
2. Create the appropriate models in a sample Rails application make sure to have the appropriate belongs_to and has_many associations.

Be ready to talk about your choices.
