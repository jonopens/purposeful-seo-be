class CrawlSerializer < ActiveModel::Serializer
	attributes :id, :page_id, :status_code, :html_content
	has_many :insights
	belongs_to :page

end