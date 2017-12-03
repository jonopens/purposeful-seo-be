class Page < ApplicationRecord
	belongs_to :site
	has_many :crawls, dependent: :destroy
	has_many :insights, through: :crawls
	has_many :keyterms, dependent: :destroy
	has_many :comments, dependent: :destroy
	validates :site_id, presence: true, numericality: { only_integer: true }
end
