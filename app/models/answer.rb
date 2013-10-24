class Answer < ActiveRecord::Base
	resourcify
	belongs_to :question
end
