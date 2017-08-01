class Song < ApplicationRecord
	validates :name, presence: true
	validates :singer, presence: true
end
