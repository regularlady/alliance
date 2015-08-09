require 'twilio-ruby'
require 'date'

class TextMessage < ActiveRecord::Base

  belongs_to :client, dependent: :destroy
  belongs_to :step, dependent: :destroy
  has_many :coach_emails
  validates :content, presence: true

  before_save :grab_phone

  def grab_phone
    self.phone = phone
  end

  def send_text_message(message, phone)

    twilio_sid = ENV["TWILIO_ACCT_SID"]
    twilio_token = ENV["TWILIO_AUTH_TOKEN"]
    twilio_phone_number = ENV["TWILIO_PHONE_NUMBER"]
 
    begin
      @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    
      @twilio_client.account.sms.messages.create(
        :from => "+1#{twilio_phone_number}",
        :to => phone,
        :body => message)

      rescue Twilio::REST::RequestError => e
        puts e.message
    end

    if e != "400" || e != "500"
      self.sentstatus = true
    end

    self.save!
  end  
end
