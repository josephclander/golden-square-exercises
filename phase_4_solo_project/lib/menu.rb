# actions for the menu
class Menu
  def initialize
    @menu = { 'meal1': 4.00, 'meal2': 4.50, 'meal3': 5.00 }
  end

  def list
    @menu
  end

  def cost(item)
    @menu[item.to_sym]
  end
end
