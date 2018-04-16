class SiteSerializer < ActiveModel::Serializer
  attributes :id, :full_url, :domain_name, :protocol, :user_id
  has_many :pages
  has_many :insights
end
