class BookingsController < ApplicationController
  before_action :set_booking, only: [:create, :new]

	def show
		@booking = Booking.find(params[:id])
	end
	
  def index 
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.total_price = total_price
    @booking.pet = @pet
    @booking.user = current_user
    if @booking.save
      redirect_to dashboards_path
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.offer_accepted
      @booking.offer_accepted = false
    else
      @booking.offer_accepted = true
    end
    @booking.save
    redirect_to dashboards_path
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

  def total_price
    start_time = booking_params[:start_time]
    end_time = booking_params[:end_time]
    start_time_booking = start_time.to_date
    end_time_booking = end_time.to_date
    ((end_time_booking - start_time_booking).to_i + 1) * @pet.price
  end

  def set_booking
    @pet = Pet.find(params[:pet_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time) 
  end

end
	