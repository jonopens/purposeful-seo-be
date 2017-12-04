class Insight < ApplicationRecord
	belongs_to :crawl
	after_initialize :set_completion_status

	def set_completion_status
		self.completion_status = "pending"
	end
end
