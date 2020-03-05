class CollectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :about, :contact]
  def index
    @collections = policy_scope(Collection).geocoded #returns flats with coordinates

    @markers = @collections.map do |collection|
      {
        lat: collection.latitude,
        lng: collection.longitude,
        # infoWindow: render_to_string(partial: "infowindow", locals: { collection: collection }),
        image_url: helpers.asset_url("https://previews.123rf.com/images/skywears/skywears1905/skywears190500034/124468345-permanent-marker-icon-vector.jpg")
      }
    end
    if params[:q]
      @collections = Collection.where("title ILIKE ?", "%" + params[:q] + "%")
    else
      @collections = policy_scope(Collection)
    end
  
end

  def show
    @collection = Collection.find(params[:id])
    authorize @collection
    @booking = Booking.new
    if !@collection.reviews.empty?
      @average_rating = @collection.reviews.pluck(:rating).sum / @collection.reviews.length
    end
  end

  def new
    @collection = Collection.new
    authorize @collection
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    authorize @collection

    if @collection.save
      redirect_to collection_path(@collection)
    else
      render :new
    end
  end

  def edit
    set_collection
    authorize @collection
  end

  def update
    set_collection
    authorize @collection
    @collection.update(collection_params)

    if @collection.save
      redirect_to collection_path(@collection)
    else
      render :edit
    end
  end

  def destroy
    set_collection
    authorize @collection
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