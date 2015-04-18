class Answer < ActiveRecord::Base
	resourcify
	belongs_to :survey
	belongs_to :question
	belongs_to :response
	validates :survey_id, :question_id, presence: true
end
