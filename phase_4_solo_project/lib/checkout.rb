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

    output = ''
    @order.basket.each_pair { |item, freq| output << "#{item}: #{freq}, " }
    output << "total: £#{total}"
  end

  private

  def total
    total = 0
    @order.basket.each_pair do |item, freq|
      raise "At least one of your items doesn't exist" unless @menu.list[item]

      total += freq * @menu.list[item]
    end
    format '%.2f', total
  end
end
