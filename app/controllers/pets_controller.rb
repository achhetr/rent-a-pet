class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end
  
  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end
  def show
    @pet = Pet.find(params[:id])
  end

  private 

  def pet_params
    params.require(:pet).permit(:name, :description, :type, :image_url, :price)
  end
end
