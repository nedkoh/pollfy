Given(/^I have Questionnaires titled (.+)$/) do |titles|
  titles.split(', ').each do |title|
  	Questionnaire.create!(:title => title)
  end
end