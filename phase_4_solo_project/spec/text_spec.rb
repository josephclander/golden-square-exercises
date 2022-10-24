require 'text'
require 'dotenv'
Dotenv.load('twilio.env')

describe Text do
  context '#text received valid basket' do
    it 'returns "Thank you! Your order was placed and will be delivered before 18:52"' do
      checkout = double(:checkout, valid?: true)
      phone = ENV['MY_PHONE_NUMBER']
      text = Text.new(checkout, phone)
      expect(text.msg).to eq('Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 18:52')
    end
  end
end
