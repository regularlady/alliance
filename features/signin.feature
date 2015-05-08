Feature: Pulse Sign In
	In order to use Pulse to track my clients
	As an existing coach
	I want to be able to sign in to Pulse

	Scenario: Coach can sign in with valid information
	  When I sign in with valid credentials
	  Then I should see the message "Signed in successfully"
		And I should be taken to my clients page

	Scenario: Coach cannot sign in without an email address
		When I sign in without an email address
		Then I should see the message "Invalid email or password."

	Scenario: Coach cannot sign in without a password
		When I sign in without any password
		Then I should see the message "Invalid email or password"

	Scenario: Coach cannot sign in with an invalid email address
		When I sign in with an invalid email address
		Then I should see the message "Invalid email or password."

	Scenario: Coach cannot sign in with an invalid password
		When I sign in with an invalid password
		Then I should see the message "Invalid email or password"




	
	
	