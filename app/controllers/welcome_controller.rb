class WelcomeController < ApplicationController
	def create
		cancion = "%#{params[:keyword]}%"
      if !cancion.nil? then 
         @songs = Song.where("name LIKE ? OR singer LIKE ?", cancion, cancion)
      else
         @songs = Song.all
      end

      respond_to do |format|
         format.html { redirect_to root_path }
         format.js
      end
	end
end
