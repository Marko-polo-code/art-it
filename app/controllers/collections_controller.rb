class CollectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :about, :contact]
  def index
    @collections = policy_scope(Collection).geocoded #returns flats with coordinates

    @markers = @collections.map do |collection|
      {
        lat: collection.latitude,
        lng: collection.longitude,
        # infoWindow: render_to_string(partial: "infowindow", locals: { collection: collection }),
        image_url: helpers.asset_url("https://lh3.googleusercontent.com/proxy/UUC72lDE751OmAkbnCJK70fKSvIYm4MWFJyxomljCx0LKOXLMrkrIOCqBqgZQ-Y5B6N2ivowr1rapPyJ3Qui23fIYxv686b-6lv2-8XOKRu9w6bgpDlZl5D09aoi0bL-9FyD30z5EI4OnA")
      }
    end
    @collections = policy_scope(Collection)

    if params[:q].present?
      @collections = Collection.search_by_title_and_address(params[:q])
    else
      @collections = Collection.all
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
