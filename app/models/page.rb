class Page < ApplicationRecord
	belongs_to :site
	has_many :crawls
	has_many :insights, through: :crawls
	has_many :keyterms
	has_many :comments
end
