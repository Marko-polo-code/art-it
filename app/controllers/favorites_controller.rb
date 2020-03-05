class FavoritesController < ApplicationController
  skip_after_action :verify_policy_scoped, :only => :index
  skip_after_action :verify_authorized, :only => :destroy


    def create
      favorite = Favorite.new
      collection = Collection.find(params[:collection_id].to_i)
      authorize collection
      favorite.collection = collection
      favorite.user = current_user
      favorite.save!
      redirect_to :root
    end

    def destroy

      favorite = Favorite.find(params[:id])
      favorite.destroy
      redirect_to my_favorites_path
    end

    def index
      @favorites = Favorite.all
    end
  end
