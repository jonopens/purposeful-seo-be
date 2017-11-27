class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :name, :crawl_credits
  has_many :sites
  has_many :pages, through: :sites
  has_many :comments
end