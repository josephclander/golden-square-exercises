# frozen_string_literal: false

require 'tasklist'

describe TaskList do
  before :each do
    @tasks = TaskList.new
  end
  describe '#list' do
    it 'returns "no tasks in the list" when no tasks' do
      expect(@tasks.list).to eq('0 tasks')
    end

    it 'returns "1. Wash clothes" when list called' do
      @tasks.add('Wash clothes')
      expect(@tasks.list).to eq('1. Wash clothes')
    end

    it 'returns "1. Wash clothes, 2. Paint the shed" when list called' do
      @tasks.add('Wash clothes')
      @tasks.add('Paint the shed')
      expect(@tasks.list).to eq('1. Wash clothes, 2. Paint the shed')
    end
  end
end

describe TaskList do
  before :each do
    @tasks = TaskList.new
  end
  describe '#complete' do
    it 'returns "no tasks in the list" when no tasks' do
      expect(@tasks.complete(1)).to eq('0 tasks')
    end

    it 'returns "no tasks in the list" having removed the only task' do
      @tasks.add('Wash clothes')
      expect(@tasks.complete(1)).to eq('0 tasks')
    end

    it 'returns "1. Paint the shed" having removed original task 1' do
      @tasks.add('Wash clothes')
      @tasks.add('Paint the shed')
      expect(@tasks.complete(1)).to eq('1. Paint the shed')
    end

    it 'returns "no such task" if no such task' do
      @tasks.add('Wash clothes')
      expect(@tasks.complete(2)).to eq('0 tasks')
    end

    it 'returns "no such task" if no such task' do
      @tasks.add('Wash clothes')
      expect(@tasks.complete('1')).to eq('0 tasks')
    end
  end
end
