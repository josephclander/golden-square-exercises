# frozen_string_literal: false

# interactive calculator class
class InteractiveCalculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts 'Hello. I will subtract two numbers.'
    @io.puts 'Please enter a number'
    value1 = get_number
    @io.puts 'Please enter another number'
    value2 = get_number
    @io.puts 'Here is your result:'
    result = "#{value1} - #{value2} = #{value1 - value2}"
    @io.puts result
  end

  private

  def get_number
    response = @io.gets
    # strings that look like numbers can be converted
    return response.to_i if response.to_i.to_s == response.to_s

    raise 'Must input a number'
  end
end

describe InteractiveCalculator do
  it 'will subtract two given numbers using the terminal' do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with('Hello. I will subtract two numbers.').ordered
    expect(terminal).to receive(:puts).with('Please enter a number').ordered
    expect(terminal).to receive(:gets).and_return(4).ordered
    expect(terminal).to receive(:puts).with('Please enter another number').ordered
    expect(terminal).to receive(:gets).and_return(3).ordered
    expect(terminal).to receive(:puts).with('Here is your result:').ordered
    expect(terminal).to receive(:puts).with('4 - 3 = 1').ordered

    interactive_calculator = InteractiveCalculator.new(terminal)
    interactive_calculator.run
  end

  it 'fails if the input is not a number' do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with('Hello. I will subtract two numbers.').ordered
    expect(terminal).to receive(:puts).with('Please enter a number').ordered
    expect(terminal).to receive(:gets).and_return('not_a_number').ordered

    interactive_calculator = InteractiveCalculator.new(terminal)
    expect { interactive_calculator.run }.to raise_error 'Must input a number'
  end
end

# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run

###############
#    NOTES    #
###############

# .ordered ensures the calls are received in the order you put them in
