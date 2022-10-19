# frozen_string_literal: false

require 'json'
require 'net/http'

# cat facts
class CatFacts
  def initialize(requester)
    @requester = requester
  end

  def provide
    "Cat fact: #{get_cat_fact['fact']}"
  end

  private

  def get_cat_fact
    text_response = @requester.get(URI('https://catfact.ninja/fact'))
    JSON.parse(text_response)
  end
end
