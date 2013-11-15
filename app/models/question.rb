class Question < ActiveRecord::Base
	resourcify
	belongs_to :survey
	#has_many :answers, dependent: :destroy
end
