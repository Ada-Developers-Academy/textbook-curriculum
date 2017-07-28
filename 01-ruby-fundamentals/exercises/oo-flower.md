# Flower

## Mission

You are assigned the task of creating a program that tracks flowers for a floral botique. The florists want a program that will keep track of their extensive assortment of flowers and automatically order any that have low stock. Below is a sample of the information that needs to be tracked by this program.

### Example flower data
| NAME     |     SIZE   |  COLOR | QUANTITY |  BUNDLES | MAX STOCK |
| :-------: | :-------: | :----: | :----: | :----: | :----: | :----: |
| Rose       | medium |   red    | 144   | 24 | 250 |
| Lily       | medium |  white   |   91  | 20 | 120 |
| Tulip      | medium |  yellow  |  179  | 30 | 250 |
| Tulip      | medium |  purple  |  52   | 30 | 100 |
| Daisy      | medium |  White   |  15   | 50 | 300 |

#### The program should also:
- Have a way of updating a flower's quantity
- See a list of all available flowers
- See what flower have less than 30 available (In order to know what flowers need to be restocked)
- Automatically order flowers
  - Flowers can only be ordered in the quantities of their bundles. Reorder as much as possible before the quantity hits the max stock.
    - EX: If there are only 15 daisy's in stock, we want to restock to 300 as closely as possible, without going over. So, we need to order no more than 285 _(300 - 15)_, but can only order in bundles of 50. How many times does 50 go into 285 _(285 / 50)_? 5! So our program needs to order 5 bundles of daisy's, which is 250 _(5 x 50)_. That will update the quantity to 265. 

## Instructions

- Create a new file
- Using object oriented design, write a class that meets the expectations of the florists
- Make sure to have tests for all functionality of
