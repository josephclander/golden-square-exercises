# Design Recipe for Menu Ordering System

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
>
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
>
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

## Classes Interface
```
class Order
  def initialize
    # stores basket
  end

  def basket
    # shows the basket
  end

  def add(item)
    # adds menu item to basket as text
    # into a hash (so amounts are kept)
  end
end

class Menu
  def initialize
    # holds list of menu items in hash
    # example
    # {'meal1': 4.00, 'meal2': 4.50, 'meal3': 5.00}
  end

  def menu
    # returns the full menu
  end

  def cost(item_title)
    # returns the cost of a selected item
  end
end

class Checkout
  def initialize(basket, menu)
    # stores basket and menu list
  end

  # menu = {'meal1': 4.00, 'meal2': 4.50, 'meal3': 5.00}
  def receipt
    # prints itemised list of receipt
  end
end

```


## Integration Testing

```ruby
# 1. add 2 separate items to the basket and checkout
menu = Menu.new
order = Order.new
order.add('meal1')
order.add('meal2')
checkout = Checkout.new(menu, order)
checkout.receipt # => 

```


## Unit Testing


### Order
```ruby




```

### Menu
```ruby
# 1. view the menu
menu = Menu.new
menu.list



```
### Checkout
```ruby



```