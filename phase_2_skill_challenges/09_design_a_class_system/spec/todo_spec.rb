require 'todo'

describe Todo do
  it 'constructs' do
    todo1 = Todo.new('task1')
    expect(todo1.task).to eq 'task1'
  end
end