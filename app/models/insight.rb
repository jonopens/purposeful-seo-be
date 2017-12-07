class Insight < ApplicationRecord
	belongs_to :crawl
	belongs_to :page
	after_initialize :set_completion_status

	def set_completion_status
		self.completion_status = "pending"
	end
end
