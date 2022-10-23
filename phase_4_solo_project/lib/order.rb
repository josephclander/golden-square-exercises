# looks after the ordering from the customer
class Order
  attr_reader :basket

  def initialize
    @basket = {}
  end

  def add(item)
    if @basket[item.to_sym]
      @basket[item.to_sym] += 1
    else
      @basket[item.to_sym] = 1
    end
  end
end
