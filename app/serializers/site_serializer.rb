class SiteSerializer < ActiveModel::Serializer
  attributes :id, :base_url, :page_count, :user_id
  has_many :pages
  belongs_to :user
end