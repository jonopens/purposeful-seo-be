class Site < ApplicationRecord
	belongs_to :user
	has_many :pages
	has_many :crawls, through: :pages
	has_many :comments, through: :pages
end
