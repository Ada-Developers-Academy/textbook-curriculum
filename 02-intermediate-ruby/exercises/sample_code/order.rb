
class OrderItem
  attr_reader :name, :amount, :unit_price, :is_sugary_beverage

  def initialize(name, amount, unit_price, is_sugary_beverage = false)
    @name = name
    @amount = amount
    @unit_price = unit_price
    @is_sugary_beverage = is_sugary_beverage
  end

  def total_sale
    return unit_price * amount
  end
end

class Order
  attr_reader :order_items

  def initialize(items = [])
    @order_items = items
  end

  def add_item(item)
    order_items << item
  end

  def total_sugary_sales
    # Fill in code to calculate the total total_sales
    # of ONLY sugary beverages


  end

  def subtotal
    # Fill in code to calculate subtotal

  end

  def total_taxes
    # Fill in code to satisfy tests

  end

  def total_sales
    # Fill in code to satisfy tests



  end

end
