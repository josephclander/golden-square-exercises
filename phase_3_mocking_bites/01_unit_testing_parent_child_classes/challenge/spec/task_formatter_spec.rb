# frozen_string_literal: false

require 'task_formatter'

describe TaskFormatter do
  context 'one task incomplete' do
    it 'returns one task formatted as incomplete' do
      task = double(:task, title: 'Walk the dog', complete?: false)
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq('- [ ] Walk the dog')
    end
    it 'returns one task formatted as complete' do
      task = double(:task, title: 'Walk the dog', complete?: true)
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq('- [x] Walk the dog')
    end
  end
end
