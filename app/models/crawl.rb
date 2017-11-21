class Crawl < ApplicationRecord
	belongs_to :page
	has_many :insights
end
