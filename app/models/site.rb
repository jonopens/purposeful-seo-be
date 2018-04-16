class Site < ApplicationRecord
	belongs_to :user
	has_many :insights
	has_many :comments, through: :pages
	has_many :pages, dependent: :destroy
	validates :domain_name, presence: true
	validates :protocol, presence: true
	validates :user_id, presence: true, numericality: { only_integer: true }
end
