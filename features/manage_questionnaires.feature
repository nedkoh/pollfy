Feature: Manage Questionnaires
	In order to Make a Questionnaire
	As an Author
	I want to create and manage Questionnaires

	Scenario: Questionnaires List
		Given I have Questionnaires titled Food, Movies
		When I go to the list of Questionnaires
		Then I should see "Food" 
		And I should see "Movies"