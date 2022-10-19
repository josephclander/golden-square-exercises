# frozen_string_literal: false

require 'cat_facts'

describe CatFacts do
  it 'returns a catfact' do
    fake_requester = double(:requester)
    allow(fake_requester).to receive(:get).with(
      URI('https://catfact.ninja/fact')
    ).and_return('{"fact":"Many cats love having their forehead gently stroked.","length":52}')
    cat_fact = CatFacts.new(fake_requester)

    expect(cat_fact.provide).to eq 'Cat fact: Many cats love having their forehead gently stroked.'
  end
end
