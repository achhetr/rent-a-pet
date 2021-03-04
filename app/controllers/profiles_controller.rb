class ProfilesController < ApplicationController
  def edit
    @user = current_user
  end
  def update
    @user.update(pet_params) 
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :mobile, :location, :photo)
  end
end
