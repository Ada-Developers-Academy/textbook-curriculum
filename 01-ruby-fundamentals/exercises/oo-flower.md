# Flower

## Mission

You are assigned the task of creating a program that tracks flowers for a floral boutique. The florists want a program that will keep track of their extensive assortment of flowers and automatically order any that have low stock. Below is a sample of the information that needs to be tracked by this program.

### Example flower data

| NAME     |     SIZE   |  COLOR | QUANTITY AVAILABLE |  BUNDLES | MAX STOCK | TOTAL SOLD |
| :-------: | :-------: | :----: | :----: | :----: | :----: | :----: |
| Rose       | medium |   red    |  144  | 24 | 350 | 15042 |
| Lily       | medium |  white   |  91   | 20 | 120 | 9241  |
| Tulip      | medium |  yellow  |  179  | 30 | 250 | 8350  |
| Tulip      | medium |  purple  |  52   | 30 | 100 | 2558  |
| Daisy      | medium |  White   |  15   | 50 | 300 | 14839 |


#### The program should also:

- *Access all attributes*
- *Sell a flower*
  - Update quantity available
  - Selling should update the total sold
- *Restock a flower*
  - Flowers can only be ordered in the quantities of their bundles. Reorder as much as possible _before_ the quantity hits the max stock.
  - EX: If there are only 15 daisy's in stock, we want to restock to 300 as closely as possible, without going over. So, we need to order no more than 285 _(300 - 15)_, but can only order in bundles of 50. How many times does 50 go into 285 _(285 / 50)_? 5! So our program needs to order 5 bundles of daisy's, which is 250 _(5 x 50)_. That will update the quantity available to 265.



## Instructions

- Create a new file
- Using object oriented design, write a class that meets the expectations of the florists
- Make sure to have tests for all essential functionality (example tests below)


### Example Tests
Your code does not have to match these tests exactly. This is only an example of what some of your tests might look like.

```ruby
rose = Flower.new({
  name: "rose",
  size: "medium",
  color: "red",
  quantity_available: 144,
  bundles: 24,
  max_stock: 350,
  total_sold: 15042  
  })


puts rose.name

#Sell some roses (46 total)
rose.sell(12)
rose.sell(1)
rose.sell(24)

#Check stock and total sold
puts rose.quantity_available
  #=> 98
puts rose.total_sold
  #=> 15088



#restock roses (logic below)
rose.restock
puts rose.quantity_available
  #=> 338
```

### Logic behind `rose.restock`

|     |   THE MATH   |  WHAT IS HAPPENING | RESULT |
| :------- | :------ | :------ | :------ |
| 1. | 350 - 98 = __252__| Subtract amount of flowers available (98) from the max stock (350).  | __Max amount of flowers that can be ordered__. |
| 2. | 252 / 24 = __10__ | Divide max amount of flowers that can be ordered (252) by amount of flowers in a bundle (24). |  __Amount of bundles ordered.__ |
| 3. | 10 x 24 = __240__ | Multiple the amount of bundles (10) by the number of flowers in a bundle (24).  |   __Amount of flowers ordered__. |
| 4. | 98 + 240 = __338__ | Add the amount of flowers available (98) to amount of flowers ordered (240).  |  __Amount of flowers now available at the boutique__ |
