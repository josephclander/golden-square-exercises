# frozen_string_literal: false

# fib numbers are:

# 1, 1, 2, 3, 5, 8, 13, 21, ...

require 'fib'

describe 'fib' do
  it 'returns 1 when fib(1)' do
    expect(fib(1)).to eql(1)
  end

  it 'returns 1 when fib(2)' do
    expect(fib(2)).to eql(1)
  end

  it 'returns 2 when fib(3)' do
    expect(fib(3)).to eql(2)
  end

  it 'returns 3 when fib(4)' do
    expect(fib(4)).to eql(3)
  end

  it 'returns 5 when fib(5)' do
    expect(fib(5)).to eql(5)
  end

  it 'returns 8 when fib(6)' do
    expect(fib(6)).to eql(8)
  end

  it 'returns 13 when fib(7)' do
    expect(fib(7)).to eql(13)
  end
end
