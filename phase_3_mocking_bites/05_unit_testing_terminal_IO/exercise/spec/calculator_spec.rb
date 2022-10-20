# frozen_string_literal: false

# interactive calculator class
class InteractiveCalculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts 'Hello. I will subtract two numbers.'
    @io.puts 'Please enter a number'
    value1 = @io.gets
    @io.puts 'Please enter another number'
    value2 = @io.gets
    @io.puts 'Here is your result:'
    result = "#{value1} - #{value2} = #{value1 - value2}"
    @io.puts result
  end
end

describe InteractiveCalculator do
  it 'will subtract two given numbers' do
    io = double :io
    expect(io).to receive(:puts).with('Hello. I will subtract two numbers.')
    expect(io).to receive(:puts).with('Please enter a number')
    expect(io).to receive(:gets).and_return(4)
    expect(io).to receive(:puts).with('Please enter another number')
    expect(io).to receive(:gets).and_return(3)
    expect(io).to receive(:puts).with('Here is your result:')
    expect(io).to receive(:puts).with('4 - 3 = 1')

    interactive_calculator = InteractiveCalculator.new(io)
    interactive_calculator.run
  end
end

# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run
