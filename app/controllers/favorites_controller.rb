class FavoritesController < ApplicationController


  	def index
      @favorites = Favorite.where(user_id: current_user)
    end

  	def create
  		favorite_params = params.require(:favorite).permit(:beer_id, :name, :user_id)
  		@favorite = Favorite.new(favorite_params)
      @favorite.user_id = current_user.id
      @favorite.save
      redirect_to favorites_path
	  end

  	def destroy
      @favorite = Favorite.find(params[:id])
      @favorite.destroy
      redirect_to favorites_path
  	end

    private

end