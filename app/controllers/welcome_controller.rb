class WelcomeController < ApplicationController
	def publicsongs
		@songs = Song.all
		@users = User.all
	end
end
