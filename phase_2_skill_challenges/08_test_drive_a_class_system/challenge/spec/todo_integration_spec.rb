# frozen_string_literal: false

require 'todo_list'
require 'todo'

describe 'add tasks and show incomplete' do
  context 'added one task' do
    it 'returns that task' do
      list = TodoList.new
      todo1 = Todo.new('a task to do')
      list.add(todo1)
      expect(list.incomplete).to eq([todo1])
    end
  end
end
