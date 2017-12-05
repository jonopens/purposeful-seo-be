class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :created_at, :updated_at, :last_login
  has_many :sites
  has_many :pages, through: :sites
  has_many :comments
end