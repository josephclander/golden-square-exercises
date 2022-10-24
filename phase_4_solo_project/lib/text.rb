require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load('twilio.env')

# Twilio to send text confirmation
class Text
  def initialize(checkout, phone)
    @valid = checkout.valid?
    @phone = phone
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def msg
    msg = @client.messages.create(
      body: 'Thank you! Your order was placed and will be delivered before 18:52',
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: @phone
    )
    # return msg for checking
    msg.body
  end
end


# test = Text.new({}, '+447366609548')
# p test.msg

# # Download the helper library from https://www.twilio.com/docs/ruby/install
# require 'rubygems'
# require 'twilio-ruby'
# require_relative '../secret.rb'

# # Find your Account SID and Auth Token at twilio.com/console
# # and set the environment variables. See http://twil.io/secure
# account_sid = ENV['TWILIO_ACCOUNT_SID']
# auth_token = ENV['TWILIO_AUTH_TOKEN']
# @client = Twilio::REST::Client.new(account_sid, auth_token)

# message = @client.messages.create(
#                              body: 'Hi there',
#                              from: '+15017122661',
#                              to: '+15558675310'
#                            )

# puts message.sid
