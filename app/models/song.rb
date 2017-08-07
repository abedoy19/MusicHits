class Song < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates :singer, presence: true
end
