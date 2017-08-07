class SongsController < ApplicationController

   # Para que no realice las acciones del controlador en caso de no estar registrado.
   before_action :authenticate_user!, except: [:index]
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
      @song = current_user.songs.new(song_params)
      if @song.save
         redirect_to songs_path
      else
         render :new
      end
   end

   # Editar.
   def edit
      @song = Song.find(params[:id])
   end

   def update
      @song = Song.find(params[:id])
      if @song.update(song_params)
         redirect_to songs_path
      else
         render :edit
      end
   end

   # Eliminar
   def destroy
      @song = Song.find(params[:id])
      @song.destroy
      redirect_to songs_path
   end

   # Buscar
   def search
      @song = Song.find_by(params[:name])
   end

   private 
   def song_params
      params.require(:song).permit(:name, :singer, :album, :genre, :state)
   end
end