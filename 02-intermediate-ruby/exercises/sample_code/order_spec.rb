require_relative 'order'

require 'minitest/autorun'
require 'minitest/reporters'
require 'pry'

Minitest::Reporters.use!

describe 'Order' do
  let (:item1) { OrderItem.new('Soda', 2, 3.00, true) }
  let (:item2) { OrderItem.new('Pretzels', 1, 1.50, false) }
  let (:item3) { OrderItem.new('Root Beer', 3, 4.50, true) }
  let (:item4) { OrderItem.new('Burger', 2, 4.75, false) }

  describe 'total_sugary_sales' do
    it 'can calculate the total sugary sales' do
      # Arrange
      order = Order.new([item1, item2, item3, item4])

      # Act-Assert
      expect(order.total_sugary_sales).must_be_close_to 3 * 2 + 3 * 4.5, 0.01
    end

    it 'will give 0 if the order does not include a sugary drink' do
      # Arrange
      order = Order.new([item2, item4])

      # Act-Assert
      expect(order.total_sugary_sales).must_be_close_to 0, 0.01
    end

    it 'will return 0 if there are no items in the order' do
      # Arrange
      order = Order.new()

      # Act-Assert
      expect(order.total_sugary_sales).must_be_close_to 0, 0.01
    end
  end

  describe 'total_taxes include 8% sales tax and additional 10% sugary beverage tax' do
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

    it 'will total up sales for multiple orders including sales tax and sugary beverage taxes' do
      # Arrange
      order = Order.new([item2, item3])

      # Act
      total_sales = order.total_sales
      expected_total_sales = item2.total_sale * 1.08 +
      (item3.total_sale * 1.18)

      # Assert
      expect(total_sales).must_be_close_to expected_total_sales, 0.01
    end
  end
end
