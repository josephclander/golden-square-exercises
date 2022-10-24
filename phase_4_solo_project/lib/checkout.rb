# frozen_string_literal: false

# to deal with checking out process
class Checkout
  def initialize(menu, order)
    @order = order
    @menu = menu
  end
  # example
  # @order.basket = { 'meal1': 1, 'meal2': 1 }
  # @menu.list = {'meal1': 4.00, 'meal2': 4.50, 'meal3': 5.00}

  def receipt
    raise "You haven't selected any items" if @order.basket.empty?

    raise "At least one of your items doesn't exist" unless valid?

    output = ''
    @order.basket.each_pair { |item, freq| output << "#{item}: #{freq}, " }
    output << "total: £#{total}"
  end

  def valid?
    @order.basket.each_key do |item|
      return false unless @menu.list[item]
    end
    true
  end

  private

  def total
    total = 0
    @order.basket.each_pair do |item, freq|
      total += freq * @menu.list[item]
    end
    format '%.2f', total
  end
end
