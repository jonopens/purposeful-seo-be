class Insight < ApplicationRecord
	belongs_to :crawl
	belongs_to :page
	after_initialize :set_optimization_type, if: :new_record?

	def set_optimization_type
		self.optimization_type ||= "pending"
	end
end
