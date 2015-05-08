require 'mail'
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      m = Mail::Address.new(value)
      
      # Verify that 'm' contains a domain, that domain matches the non-profits
      # domain, and that value is an email address   
      r = m.domain!=nil && m.domain.match(Rails.application.secrets.email_domain) && m.address == value

    rescue Exception => e   
      r = false
    end
    record.errors[attribute] << (options[:message] || "is invalid. Only MEDA coaches may create accounts.") unless r
  end
end