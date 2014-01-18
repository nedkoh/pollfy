class Survey < ActiveRecord::Base
	#require 'carrierwave/orm/activerecord'
	resourcify
	has_many :questions, dependent: :destroy
	has_many :responses, class_name: "Response",
                        foreign_key: "survey_id"
	# dependent: :destroy
	has_many :answers, dependent: :destroy
	accepts_nested_attributes_for :responses
	accepts_nested_attributes_for :answers
	belongs_to :user
	validates :title, presence: true
	mount_uploader :image, ImageUploader
end
