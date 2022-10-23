require 'checkout'
# require 'menu'
# require 'order'

describe Checkout do
  context 'received menu and basket for 1 item' do
    it 'returns a receipt for that order' do
      menu = double(:menu, list: { 'meal1': 4.00, 'meal2': 4.50, 'meal3': 5.00 })
      order = double(:order, basket: { 'meal3': 1 })
      checkout = Checkout.new(menu, order)
      expect(checkout.receipt).to eq 'meal3: 1, total: £5.00'
    end
  end

  context 'received menu and basket for 2 separate items' do
    it 'returns a receipt for that order' do
      menu = double(:menu, list: { 'meal1': 4.00, 'meal2': 4.50, 'meal3': 5.00 })
      order = double(:order, basket: { 'meal1': 1, 'meal2': 1 })
      checkout = Checkout.new(menu, order)
      expect(checkout.receipt).to eq 'meal1: 1, meal2: 1, total: £8.50'
    end
  end

  context 'received menu and basket for 2 of the same item' do
    it 'returns a receipt for that order' do
      menu = double(:menu, list: { 'meal1': 4.00, 'meal2': 4.50, 'meal3': 5.00 })
      order = double(:order, basket: { 'meal1': 2 })
      checkout = Checkout.new(menu, order)
      expect(checkout.receipt).to eq 'meal1: 2, total: £8.00'
    end
  end

  context 'received menu and basket with no items' do
    it 'returns an error' do
      menu = double(:menu, list: { 'meal1': 4.00, 'meal2': 4.50, 'meal3': 5.00 })
      order = double(:order, basket: {})
      checkout = Checkout.new(menu, order)
      expect { checkout.receipt }.to raise_error "You haven't selected any items"
    end
  end

  context 'received menu and basket with at least one illegal item' do
    it 'returns an error' do
      menu = double(:menu, list: { 'meal1': 4.00, 'meal2': 4.50, 'meal3': 5.00 })
      order = double(:order, basket: { 'NOT_REAL': 1 })
      checkout = Checkout.new(menu, order)
      expect { checkout.receipt }.to raise_error "At least one of your items doesn't exist"
    end
  end
end
