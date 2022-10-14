require 'challenge'

describe 'todo_finder' do
  it 'returns false when given an empty string' do
    result = todo_finder('')
    expect(result).to eq false
  end
  it 'returns false when given a single word in a string without "#TODO"' do
    result = todo_finder('none')
    expect(result).to eq false
  end
  it 'returns true when given a string "#TODO"' do
    result = todo_finder('#TODO')
    expect(result).to eq true
  end
  it 'returns false when given multiple words in a string without "#TODO"' do
    result = todo_finder('there is no todo')
    expect(result).to eq false
  end
  it 'returns true when given multiple words in a string with "#TODO"' do
    result = todo_finder('there is a #TODO')
    expect(result).to eq true
  end
end
