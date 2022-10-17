# frozen_string_literal: false

describe Todo do
  context 'added task' do
    it '#task returns task as a string' do
      todo = Todo.new('a task to do')
      expect(todo.task).to eq({ note: 'a task to do', complete: false })
    end
  end
end
