class Survey < ActiveRecord::Base
	resourcify
	has_many :questions
	validates :title, presence: true
end
