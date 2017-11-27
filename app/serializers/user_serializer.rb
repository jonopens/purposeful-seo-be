class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :crawl_credits
  has_many :sites
  has_many :comments
end