class SongsController < ApplicationController
	# GET /songs
   def index
   	@songs = Song.all
   end
   # GET /songs/:id
   def show
   	@song = Song.find(params[:id])
   end
   # GET /songs/new
   def new
   	@song = Song.new
   end
   # POST /songs
   def create
      @song = Song.new(song_params)

      if @song.save
         redirect_to @song
      else
         render :new
      end
   end

   private 
   def song_params
      params.require(:song).permit(:name, :singer, :album, :genre)
   end
end