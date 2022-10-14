# frozen_string_literal: false

require 'roman'

describe Roman do
  before :all do
    @roman = Roman.new
  end
  describe '#convert' do
    context 'standard characters' do
      it 'convert 1 to I' do
        expect(@roman.convert(1)).to eq('I')
      end

      it 'convert 5 to V' do
        expect(@roman.convert(5)).to eq('V')
      end

      it 'convert 10 to X' do
        expect(@roman.convert(10)).to eq('X')
      end

      it 'convert 50 to L' do
        expect(@roman.convert(50)).to eq('L')
      end

      it 'convert 100 to C' do
        expect(@roman.convert(100)).to eq('C')
      end
    end
  end
end

describe Roman do
  before :all do
    @roman = Roman.new
  end
  describe '#convert' do
    context 'standard multi characters' do
      it 'convert 2 to II' do
        expect(@roman.convert(2)).to eq('II')
      end

      it 'convert 35 to XXXV' do
        expect(@roman.convert(35)).to eq('XXXV')
      end
    end
  end
end

describe Roman do
  before :all do
    @roman = Roman.new
  end
  describe '#convert' do
    context 'non-standard multi characters' do
      it 'convert 4 to IV' do
        expect(@roman.convert(4)).to eq('IV')
      end

      it 'convert 9 to IX' do
        expect(@roman.convert(9)).to eq('IX')
      end

      it 'convert 45 to XL' do
        expect(@roman.convert(45)).to eq('XLV')
      end

      it 'convert 98 to XCVIII' do
        expect(@roman.convert(98)).to eq('XCVIII')
      end
    end
  end
end
