require 'order'

describe Order do
  before :each do
    @order = Order.new
  end

  it 'constructs' do
    expect(@order.basket).to eq({})
  end

  it 'adds an item to the basket' do
    @order.add('menu1')
    expect(@order.basket).to eq({ 'menu1': 1 })
  end

  it 'adds 2 separate items to the basket' do
    @order.add('menu1')
    @order.add('menu2')
    expect(@order.basket).to eq({ 'menu1': 1, 'menu2': 1 })
  end

  it 'adds 2 of the same item to the basket' do
    @order.add('menu1')
    @order.add('menu1')
    expect(@order.basket).to eq({ 'menu1': 2 })
  end
end
