class PagesController < ApplicationController

  def dashboard
    @user = current_user
    @collections = current_user.collections
    @made_bookings = current_user.bookings
    @received_bookings = Booking.all.select { |booking| booking.collection.user == current_user }
    # raise
  end

  def account
  end

  def about
  end

  def contact
  end

end
