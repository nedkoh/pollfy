class Response < ActiveRecord::Base
	resourcify
	belongs_to :survey
	has_many :answers
	accepts_nested_attributes_for :answers
	#, class_name: "Survey",
    #                    foreign_key: "survey_id"
end
