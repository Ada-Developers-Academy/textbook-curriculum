
class OrderItem
  attr_reader :name, :amount, :unit_price, :is_alcohol

  def initialize(name, amount, unit_price, is_alcohol = false)
    @name = name
    @amount = amount
    @unit_price = unit_price
    @is_alcohol = is_alcohol
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

  def total_alcohol_sales
    # Fill in code to satify tests






  end

  def total_taxes
    # Fill in code to satisfy tests





  end

  def total_sales
    # Fill in code to satisfy tests






  end

end
