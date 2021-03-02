class BookingsController < ApplicationController
  before_action :set_cocktail, only: [:create, :new]

  def def new
    @booking = Booking.new
  end

  def create
    @booking = Book.new(booking_params)
    @booking.pet = @pet
    if @booking.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def set_booking
    @booking = Pet.find(params[:pet_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :total_price, :user_id, :pet_id)
  end
  
end
