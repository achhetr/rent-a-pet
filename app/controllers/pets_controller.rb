class PetsController < ApplicationController

  def index
    if params[:location].nil?
      @pets = Pet.all
    else
      @users = User.near("#{params[:location]}, Australia")
      parse
    end         
  end
    
  def destroy
    @pets = Pet.find(params[:id])
    if @pets.destroy
      redirect_to pets_path
    else
      render pets_path 
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def new
    @pet = Pet.new
  end
  
  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
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
    params.require(:pet).permit(:name, :description, :pet_type, :photo, :image_url, :price)
  end

end
