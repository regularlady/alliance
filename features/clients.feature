Feature: Pulse Sign In
	In order to use Pulse to track my clients
	As an existing coach
	I want to be able to view my clients

	Scenario: Coach can view clients
	  When I sign in with valid credentials
		And create several clients
		Then I should see my list of clients.





	
	
	