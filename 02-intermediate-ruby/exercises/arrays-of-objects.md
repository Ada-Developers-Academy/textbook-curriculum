# Exercise:  Processing an Array of Objects

You've been contracted by a hip bar/grill in Singapore to finish writing a system calculating the bills for each order another developer started.  An `Order` will consist of a number of `OrderItem`s which will each have a name, quantity and unit price and indicate if alcohol is included.

You can find the code [here.](sample_code/order.rb)

Your team leader has provided the following tests.

```ruby
describe 'Order' do
  let (:item1) { OrderItem.new('Martini', 2, 3.00, true) }
  let (:item2) { OrderItem.new('Pretzels', 1, 1.50, false) }
  let (:item3) { OrderItem.new('Beer', 3, 4.50, true) }
  let (:item4) { OrderItem.new('Burger', 2, 4.75, false) }

  describe 'total_alcohol_sales' do
    it 'can calculate the total alcohol sales' do
      # Arrange
      order = Order.new([item1, item2, item3, item4])

      # Act-Assert
      expect(order.total_alcohol_sales).must_be_close_to 3 * 2 + 3 * 4.5, 0.01
    end

    it 'will give 0 if the order does not include booze' do
      # Arrange
      order = Order.new([item2, item4])

      # Act-Assert
      expect(order.total_alcohol_sales).must_be_close_to 0, 0.01
    end

    it 'will return 0 if there are no items in the order' do
      # Arrange
      order = Order.new()

      # Act-Assert
      expect(order.total_alcohol_sales).must_be_close_to 0, 0.01
    end
  end

  describe 'total_taxes include 8% sales tax and additional 10% alcohol tax' do
    it 'will return 0 if there are no items in the order' do
      # Arrange
      order = Order.new()

      # Act-Assert
      expect(order.total_taxes).must_be_close_to 0, 0.01
    end

    it 'will calculate the 8% sales tax' do
      # Arrange
      order = Order.new([item2, item4])

      # Act-Assert
      expect(order.total_taxes).must_be_close_to( (1 * 1.5 + 2 * 4.75) * 0.08, 0.01)
    end
  end

  describe 'total sales' do
    it 'will return 0 if there are no OrderItems' do
      # Arrange
      order = Order.new([])

      # Act-Assert
      expect(order.total_sales).must_equal 0
    end

    it 'will total up sales for multiple orders including sales tax and alcohol taxes' do
      # Arrange
      order = Order.new([item2, item4])

      # Act
      total_sales = order.total_sales
      expected_total_sales = item2.total_sale * 1.08 +
      (item4.total_sale * 1.18)

      # Assert
      expect(total_sales).must_be_close_to expected_total_sales, 0.01
    end
  end
end
```
