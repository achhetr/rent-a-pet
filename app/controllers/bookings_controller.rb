class BookingsController < ApplicationController

	def show
		@booking = Booking.find(params[:id])
	end
	
  def index 
    @bookings = Booking.all
  end

end
	