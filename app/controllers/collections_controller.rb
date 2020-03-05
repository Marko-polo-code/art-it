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
    @average_rating = @collection.reviews.pluck(:rating).sum / @collection.reviews.length
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
    set_collection
  end

  def update
    set_collection
    @collection.update(collection_params)

    if @collection.save
      redirect_to collection_path(@collection)
    else
      render :edit
    end
  end

  def destroy
    set_collection
    @collection.destroy
    redirect_to dashboard_path
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:title, :description, :price, photos: [] )
  end
end
