require 'order'
require 'menu'
require 'checkout'

describe 'Integration' do
  before :each do
    @menu = Menu.new
    @order = Order.new
  end

  context 'ordered 1 item' do
    it 'checkouts out with 1 item' do
      @order.add('meal3')
      checkout = Checkout.new(@menu, @order)
      expect(checkout.receipt).to eq 'meal3: 1, total: £5.00'
    end
  end

  context 'ordered 2 separate items' do
    it 'checkouts out with 2 separate items' do
      @order.add('meal1')
      @order.add('meal2')
      checkout = Checkout.new(@menu, @order)
      expect(checkout.receipt).to eq 'meal1: 1, meal2: 1, total: £8.50'
    end
  end

  context 'ordered 2 of the same item' do
    it 'checkouts out with 2 of the same item' do
      @order.add('meal1')
      @order.add('meal1')
      checkout = Checkout.new(@menu, @order)
      expect(checkout.receipt).to eq 'meal1: 2, total: £8.00'
    end
  end

  context 'ordered nothing' do
    it 'checkout raises an error' do
      checkout = Checkout.new(@menu, @order)
      expect { checkout.receipt }.to raise_error "You haven't selected any items"
    end
  end
end
