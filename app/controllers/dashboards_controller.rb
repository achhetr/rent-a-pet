class DashboardsController < ApplicationController

  def index
    @pets = current_user.pets
    @booking_offers = current_user.bookings
    @my_bookings = Booking.where(user_id: current_user.id)
  end

end
