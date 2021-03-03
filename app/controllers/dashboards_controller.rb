class DashboardsController < ApplicationController

  def index
    @user = current_user 
    @pets = Pet.where(user_id = @user :id)
    @bookings = Booking.where(user_id = @user :id)
  end

end
