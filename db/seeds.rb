# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#create some roles
["admin", "member", "paidm"].each do |role|
  Role.find_or_create_by_name(role)
end

#create some users
role = Role.find(1)
User.create!(:id => 1, :email => "admin@gmail.com", :password => "nji9NJI(", :encrypted_password => "$2a$10$PtXUTYlBN.DRINuWHlda8.w7CXpPTEuPaNELPVAkf62nCu3HOr5V.", :roles => [role])
User.create!(:id => 2, :email => "member@gmail.com", :password => "nji9NJI(", :encrypted_password => "$2a$10$PtXUTYlBN.DRINuWHlda8.w7CXpPTEuPaNELPVAkf62nCu3HOr5V.")
paidm = Role.find(3)
User.create!(:id => 3, :email => "koko@gmail.com", :password => "nji9NJI(", :encrypted_password => "$2a$10$PtXUTYlBN.DRINuWHlda8.w7CXpPTEuPaNELPVAkf62nCu3HOr5V.", :roles => [paidm])
#Create some question types
QuestionType.create!(:id => 1, :questiontype => "comment")
QuestionType.create!(:id => 2, :questiontype => "multiple")
QuestionType.create!(:id => 3, :questiontype => "radio")
QuestionType.create!(:id => 4, :questiontype => "dropdown")
QuestionType.create!(:id => 5, :questiontype => "date")
QuestionType.create!(:id => 6, :questiontype => "rating")
QuestionType.create!(:id => 7, :questiontype => "textbox")
puts "Ready to rock!"
