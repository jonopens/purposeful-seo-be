class Site < ApplicationRecord
	belongs_to :user
	has_many :pages, dependent: :destroy
	has_many :crawls, through: :pages
	has_many :comments, through: :pages
	validates :domain_name, presence: true
	validates :protocol, presence: true
	validates :user_id, presence: true, uniqueness: { only_integer: true }
end
