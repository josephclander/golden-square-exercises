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

> As a customer
> So that I am reassured that my order will be delivered on time
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## Classes Interface
```
class Order
  def initialize
    # stores basket
  end

  def basket
    # returns the basket (as a hash)
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

  def list
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
# 1. add 1 item to the basket and checkout
menu = Menu.new
order = Order.new
order.add('meal3')
checkout = Checkout.new(menu, order)
checkout.receipt # => "'meal3': 1, total: £5.00"

# 2. add 2 separate items to the basket and checkout
menu = Menu.new
order = Order.new
order.add('meal1')
order.add('meal2')
checkout = Checkout.new(menu, order)
checkout.receipt # => "'meal1': 1, 'meal2': 1, total: £8.50"

# 3. add 2 of the same items to the basket and checkout
menu = Menu.new
order = Order.new
order.add('meal1')
order.add('meal1')
checkout = Checkout.new(menu, order)
checkout.receipt # => "'meal1': 2, total: £8.00"

# 4. order nothing and checkout
menu = Menu.new
order = Order.new
checkout = Checkout.new(menu, order)
checkout.receipt # => throw an error 'You haven't selected any items'

```


## Unit Testing


### Order
```ruby

# 1. constructs
order = Order.new
order.basket # => {}

# 2. add an item
order = Order.new
order.add('menu1')
order.basket # => {'menu1': 1}


```

### Menu
```ruby
# 1. view the menu
menu = Menu.new
menu.list # => {'meal1': 4.00, 'meal2': 4.50, 'meal3': 5.00}

# 2. find cost of an item
menu = Menu.new
menu.cost('meal1') # => 4.00

```
### Checkout (will need doubles)
```ruby



```