class User < ApplicationRecord
	has_secure_password
	has_many :sites
	has_many :pages, through: :sites
	has_many :comments
end
