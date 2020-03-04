class CollectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :about, :contact]
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

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user

    if @collection.save
      redirect_to collection_path(@collection)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:title, :description, :price, photos: [] )
  end
end
