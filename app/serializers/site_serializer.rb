class SiteSerializer < ActiveModel::Serializer
  attributes :id, :full_url, :domain_name, :protocol, :page_count, :user_id
  has_many :pages
  belongs_to :user
end