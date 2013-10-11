class Survey < ActiveRecord::Base
	#require 'carrierwave/orm/activerecord'
	resourcify
	has_many :questions, dependent: :destroy
	belongs_to :user
	validates :title, presence: true
	mount_uploader :image, ImageUploader
end
