class Question < ActiveRecord::Base
	resourcify
	belongs_to :survey
	has_many :answers, dependent: :destroy
	validates :title, :qtype, :page, :order, :survey_id, :user_id, presence: true
end
