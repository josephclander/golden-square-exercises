# frozen_string_literal: false

require 'challenge'

describe GrammarStats do
  describe '#check' do
    before :each do
      @grammar = GrammarStats.new
    end

    it 'returns false if text is blank' do
      expect(@grammar.check('')).to eq(false)
    end

    it 'returns false if text has capital and no ending' do
      expect(@grammar.check('Capital')).to eq(false)
    end

    it 'returns false if text has no capital and ends in .' do
      expect(@grammar.check('capital.')).to eq(false)
    end

    it 'returns true if text starts with capital and ends in .' do
      expect(@grammar.check('Capital.')).to eq(true)
    end

    it 'returns false if neither text starts with capital and ends in .' do
      expect(@grammar.check('capital')).to eq(false)
    end
  end

  describe '#percentage_good' do
    context 'one check' do
      it 'returns 0 for one check that fails' do
        grammar = GrammarStats.new
        grammar.check('capital')
        result = grammar.percentage_good
        expect(result).to eq(0)
      end

      it 'returns 100 for one check that passes' do
        grammar = GrammarStats.new
        grammar.check('Capital.')
        result = grammar.percentage_good
        expect(result).to eq(100)
      end
    end
    context 'two checks' do
      it 'returns 100 both pass' do
        grammar = GrammarStats.new
        grammar.check('Capital.')
        grammar.check('Capital.')
        result = grammar.percentage_good
        expect(result).to eq(100)
      end

      it 'returns 50 one pass one fail' do
        grammar = GrammarStats.new
        grammar.check('Capital.')
        grammar.check('Capital')
        result = grammar.percentage_good
        expect(result).to eq(50)
      end

      it 'returns 0 both fail' do
        grammar = GrammarStats.new
        grammar.check('capital.')
        grammar.check('Capital')
        result = grammar.percentage_good
        expect(result).to eq(0)
      end
    end
    context 'three checks' do
      it 'returns 33 for one pass two fails' do
        grammar = GrammarStats.new
        grammar.check('capital.')
        grammar.check('Capital.')
        grammar.check('Capital')
        result = grammar.percentage_good
        expect(result).to eq(33)
      end
    end
  end
end
