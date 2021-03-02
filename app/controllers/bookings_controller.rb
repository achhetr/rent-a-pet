class BookingsController < ApplicationController
    def show
     @booking = Booking.find(params[:pet_id])
    end
    
end
	