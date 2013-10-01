class Survey < ActiveRecord::Base
	resourcify
	has_many :questions
end
