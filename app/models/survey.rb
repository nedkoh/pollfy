class Survey < ActiveRecord::Base
	#require 'carrierwave/orm/activerecord'
	resourcify
	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy
	accepts_nested_attributes_for :answers
	belongs_to :user
	validates :title, presence: true
	mount_uploader :image, ImageUploader
end
