class PageSerializer < ActiveModel::Serializer
  attributes :id, :site_id, :page_insight_status, :text_to_html_ratio, :word_count, :title, :meta_desc, :h1, :h2, :last_crawled
  has_many :crawls
  has_many :insights, through: :crawls
  has_many :comments
  has_many :keyterms
end