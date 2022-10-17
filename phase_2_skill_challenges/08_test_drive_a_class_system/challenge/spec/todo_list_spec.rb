# frozen_string_literal: false

describe TodoList do
  context 'initially' do
    it 'constructs' do
      list = TodoList.new
      expect(list.incomplete).to eq([])
    end
  end
end
