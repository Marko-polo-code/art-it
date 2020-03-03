class CollectionsController < ApplicationController
  def index
    if params[:q]
      @collections = Collection.where("title ILIKE ?", "%" + params[:q] + "%")
    else 
      @collections = Collection.all
    end
  end
  
 
  def show
    @collection = Collection.find(params[:id])
    @booking = Booking.new
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:title, :description, :price, :user_id )
  end
end
