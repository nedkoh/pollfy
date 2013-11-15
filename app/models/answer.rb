class Answer < ActiveRecord::Base
	resourcify
	#belongs_to :question
	belongs_to :survey
end
