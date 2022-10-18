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

  context 'added two tasks' do
    it 'returns both tasks' do
      list = TodoList.new
      todo1 = Todo.new('a task to do')
      todo2 = Todo.new('a second task to do')
      list.add(todo1)
      list.add(todo2)
      expect(list.incomplete).to eq([todo1, todo2])
    end
  end

  describe 'add tasks and return as complete' do
    context 'added two incomplete tasks' do
      it 'returns no complete tasks' do
        list = TodoList.new
        todo1 = Todo.new('a task to do')
        todo2 = Todo.new('a second task to do')
        list.add(todo1)
        list.add(todo2)
        expect(list.complete).to eq([])
      end
    end

    context 'added two tasks, marked one complete' do
      it 'returns one complete task' do
        list = TodoList.new
        todo1 = Todo.new('a task to do')
        todo2 = Todo.new('a second task to do')
        list.add(todo1)
        list.add(todo2)
        todo1.mark_done!
        expect(list.complete).to eq([todo1])
      end
    end

    context 'added two tasks, marked both complete' do
      it 'returns two complete task' do
        list = TodoList.new
        todo1 = Todo.new('a task to do')
        todo2 = Todo.new('a second task to do')
        list.add(todo1)
        list.add(todo2)
        todo1.mark_done!
        todo2.mark_done!
        expect(list.complete).to eq([todo1, todo2])
      end
    end
  end

  describe 'how to mark all tasks as complete' do
    context 'all tasks are incomplete' do
      it 'returns all tasks as complete' do
        list = TodoList.new
        todo1 = Todo.new('a task to do')
        todo2 = Todo.new('a second task to do')
        list.add(todo1)
        list.add(todo2)
        list.give_up!
        expect(list.complete).to eq([todo1, todo2])
      end
    end

    context 'one tasks is  already complete' do
      it 'returns all tasks as complete' do
        list = TodoList.new
        todo1 = Todo.new('a task to do')
        todo2 = Todo.new('a second task to do')
        list.add(todo1)
        list.add(todo2)
        todo2.mark_done!
        list.give_up!
        expect(list.complete).to eq([todo1, todo2])
      end
    end

    context 'all tasks are already complete' do
      it 'returns all tasks as complete' do
        list = TodoList.new
        todo1 = Todo.new('a task to do')
        todo2 = Todo.new('a second task to do')
        list.add(todo1)
        list.add(todo2)
        todo1.mark_done!
        todo2.mark_done!
        list.give_up!
        expect(list.complete).to eq([todo1, todo2])
      end
    end
  end
end
