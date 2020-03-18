class BookingsController < ApplicationController

  def new
    year = params[:booking]["start_date(1i)"].to_i
    month = params[:booking]["start_date(2i)"].to_i
    day = params[:booking]["start_date(3i)"].to_i
    start_date = Date.new(year, month, day)
    year = params[:booking]["end_date(1i)"].to_i
    month = params[:booking]["end_date(2i)"].to_i
    day = params[:booking]["end_date(3i)"].to_i
    end_date = Date.new(year, month, day)
    @booking = Booking.new
    authorize @booking
    @booking.start_date = start_date
    @booking.end_date = end_date
    @collection = Collection.find(params[:collection_id])
    @booking.total_price = (@booking.end_date - @booking.start_date).to_i * @collection.price
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    # we need `collection_id` to associate booking with corresponding collection
    @collection = Collection.find(params[:collection_id])
    @booking.collection = @collection
    @booking.user = current_user

    if  @booking.save
      redirect_to booking_path(@booking)
    else
      render "new"
    end
  end


  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end


  def accept
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = "accepted"
    @booking.save
    redirect_to dashboard_path, notice: "Booking accepted"
  end

  def reject
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = "rejected"
    @booking.save
    redirect_to dashboard_path, notice: "Booking rejected"
  end

  private


  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :user_approved)
  end
end
