# frozen_string_literal: false

require 'date'
require 'json'
require 'net/http'

# time error class
class TimeError
  # Returns difference in seconds between server time
  # and the time on this computer
  def error
    get_server_time - Time.now
  end

  private

  def get_server_time
    text_response = Net::HTTP.get(URI('https://worldtimeapi.org/api/ip'))
    json = JSON.parse(text_response)
    DateTime.parse(json['utc_datetime']).to_time
  end
end
