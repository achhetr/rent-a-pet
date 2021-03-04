class BookingsController < ApplicationController
  before_action :set_booking, only: [:create, :new]

	def show
		@booking = Booking.find(params[:id])
	end
	
  def index 
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    # @booking.total_price = 
    if @booking.save
      redirect_to dashboards_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to dashboards_path
    else
      render :new
    end
  end

  private

  # def total_price
  #   (end_time - start_time).to_i  * pet.price
  # end

  def set_booking
    @pet = Pet.find(params[:pet_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :total_price)
  end

end
	