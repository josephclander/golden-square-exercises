# frozen_string_literal: false

# repeat strings
class StringRepeater
  def initialize(io)
    @io = io
  end

  def run
    @io.puts 'Hello. I will repeat a string many times.'
    @io.puts 'Please enter a string'
    string = @io.gets.chomp
    @io.puts 'Please enter a number of repeats'
    repeats = @io.gets
    @io.puts 'Here is your result:'
    result = string * repeats
    @io.puts result
  end
end

describe StringRepeater do
  it 'returns a repeated string a given number of times' do
    io = double :io
    expect(io).to receive(:puts).with('Hello. I will repeat a string many times.')
    expect(io).to receive(:puts).with('Please enter a string')
    expect(io).to receive(:gets).and_return('TWIX')
    expect(io).to receive(:puts).with('Please enter a number of repeats')
    expect(io).to receive(:gets).and_return(10)
    expect(io).to receive(:puts).with('Here is your result:')
    expect(io).to receive(:puts).with('TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX')

    string_repeater = StringRepeater.new(io)
    string_repeater.run
  end
end

# need to replace 'Kernal' object with generic 'io' so that we can use a double

# string_repeater = StringRepeater.new(Kernal)
# string_repeater.run
