require 'twilio-ruby'
require 'date'

class SendTextWorker
  include Sidekiq::Worker

  def perform(text_message_id)
    @text = TextMessage.find(text_message_id)

    twilio_sid = ENV["TWILIO_ACCT_SID"]
    twilio_token = ENV["TWILIO_AUTH_TOKEN"]
    twilio_phone_number = ENV["TWILIO_PHONE_NUMBER"]

    begin
      @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
      
      @twilio_client.account.sms.messages.create(
        :from => "+1#{twilio_phone_number}",
        :to => @text.phone,
        :body => @text.content)

      rescue Twilio::REST::RequestError => e
        puts e.message
    end

    if e != "400" || e != "500"
      @text.update_attribute(:sentstatus, true)
    end
  end
end