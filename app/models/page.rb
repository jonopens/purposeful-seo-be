class Page < ApplicationRecord
	belongs_to :site
	has_many :insights, dependent: :destroy
	has_many :comments, dependent: :destroy
	validates :site_id, presence: true, numericality: { only_integer: true }
end
