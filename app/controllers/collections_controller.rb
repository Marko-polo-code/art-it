class CollectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :about, :contact]

  def index
    if params[:q].present?
      @collections = policy_scope(Collection).geocoded.search_by_title_and_address(params[:q])
    else
    @collections = policy_scope(Collection).geocoded
    end

    @markers = @collections.map do |collection|
      {
        lat: collection.latitude,
        lng: collection.longitude,
        # infoWindow: render_to_string(partial: "infowindow", locals: { collection: collection }),
        image_url: "https://image.flaticon.com/icons/svg/54/54369.svg"
      }
    end
    @collections = policy_scope(Collection)
    
    if params[:q]
      @collections = Collection.where("title ILIKE ?", "%" + params[:q] + "%")
    end
end




  def show
    @collection = Collection.find(params[:id])
    authorize @collection
    @booking = Booking.new
    if user_signed_in? && !current_user.bookings.empty?
      @existing_booking = current_user.bookings.where(collection_id: @collection.id).last
      @review = Review.new
    end

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
    params.require(:collection).permit(:title, :description, :address, :price, photos: [] )
  end
end
