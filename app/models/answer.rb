class Answer < ActiveRecord::Base
	resourcify
	belongs_to :survey
	belongs_to :question
	belongs_to :response
end
