Feature: Manage Surveys
	In order to Make a Survey
	As an Author
	I want to create and manage Surveys

	Scenario: Surveys List
		Given I have Surveys titled Food, Movies
		When I go to the list of Surveys
		Then I should see "Food" 
		And I should see "Movies"