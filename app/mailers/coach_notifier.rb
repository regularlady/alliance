class CoachNotifier < ActionMailer::Base
  default :from => 'clientalert@alliance.org'

  def send_coach_email(coach_email_id)
    @coach_email = CoachEmail.find(coach_email_id)
    mail( :to => @coach_email.email,
    :subject => 'Client Text Received' )
  end
end
