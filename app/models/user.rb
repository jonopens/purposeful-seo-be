class User < ApplicationRecord
	has_secure_password
	has_many :sites
	has_many :pages, through: :sites
	has_many :comments
	validates :email, presence: true, uniqueness: { case_sensitive: false }
end
