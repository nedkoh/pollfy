class Survey < ActiveRecord::Base
	resourcify
	has_many :questions, dependent: :destroy
	belongs_to :user
	validates :title, presence: true
end
