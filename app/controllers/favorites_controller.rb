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
      @markers = @favorites.map do |favorite|
        {
          lat: favorite.collection.latitude,
          lng: favorite.collection.longitude,
          # infoWindow: render_to_string(partial: "infowindow", locals: { collection: collection }),
          image_url: "https://image.flaticon.com/icons/svg/54/54369.svg"
        }
    end
  end
end