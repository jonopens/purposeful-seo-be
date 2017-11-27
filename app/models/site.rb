class Site < ApplicationRecord
	belongs_to :user
	has_many :pages, dependent: :destroy
	has_many :crawls, through: :pages
	has_many :comments, through: :pages
end
