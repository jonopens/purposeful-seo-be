class CrawlSerializer < ActiveModel::Serializer
	attributes :page_id, :status_code, :html_content, :body_text
	has_many :insights
	belongs_to :page

end