class Question < ActiveRecord::Base
	resourcify
	belongs_to :survey
end
