class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end


  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @booking = Booking.find(params[:booking_id])
    authorize @review
    @review.booking = @booking
    @review.save
    redirect_to collection_path(@booking.collection)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating, :booking_id)
  end
end
