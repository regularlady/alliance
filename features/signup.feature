Feature: Pulse Sign Up
	In order to use Pulse to track my clients
	As a new coach
	I want to be able to sign up for Pulse

	Scenario: Coach can signup with valid information
	  When I sign up with valid credentials
	  Then I should see the message "A message with a confirmation link has been sent to your email address"

	Scenario: Coach cannot sign up without an email address
		When I sign up without an email address
		Then I should see the message "Email can't be blank"

	Scenario: Coach cannot sign up without a MEDA email address
		When I sign up without a MEDA email address
		Then I should see the message "Email is invalid. Only MEDA coaches may create accounts."

	Scenario: Coach cannot sign up without a password
		When I sign up without any password
		Then I should see the message "Password can't be blank"
	
	Scenario: Coach cannot sign up without a password that is too short
		When I sign up with a password that is too short
		Then I should see the message "Password is too short (minimum is 8 characters)"

	Scenario: Coach cannot sign up without a password confirmation
		When I sign up without a password confirmation
		Then I should see the message "Password confirmation doesn't match Password"
	
	Scenario: Coach cannot sign up with a mismatched password combo
		When I sign up without a mismatched password combo
		Then I should see the message "Password confirmation doesn't match Password"




	
	
	