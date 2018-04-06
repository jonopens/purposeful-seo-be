class Insight < ApplicationRecord
	belongs_to :crawl
	belongs_to :page
end
