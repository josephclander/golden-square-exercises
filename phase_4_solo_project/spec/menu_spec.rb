require 'menu'

describe Menu do
  it 'returns a hash with the items and cost' do
    menu = Menu.new
    expect(menu.list).to eq({ 'meal1': 4.00, 'meal2': 4.50, 'meal3': 5.00 })
  end

  it 'returns the cost of a given item' do
    menu = Menu.new
    expect(menu.cost('meal1')).to eq(4.00)
  end

  it 'returns the cost of another item' do
    menu = Menu.new
    expect(menu.cost('meal2')).to eq(4.50)
  end
end
