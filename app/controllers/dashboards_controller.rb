class DashboardsController < ApplicationController

  def index
    @pets = current_user.pets
    # @booking_offers = current_user.bookings
    @booking_offers = Booking.all.select do |booking|
      booking.pet.user.id == current_user.id
    end 
    @my_bookings = Booking.where(user_id: current_user.id)
  end

end
