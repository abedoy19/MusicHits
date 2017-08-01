class WelcomeController < ApplicationController
	def publicsongs
		@songs = Song.all
	end
end
