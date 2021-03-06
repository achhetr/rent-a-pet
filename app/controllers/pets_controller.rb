class PetsController < ApplicationController

  def index
    if params[:location].nil? || params[:location].empty?
      @pets = Pet.all
      @users = User.all
    else
      @pets = []
      @users = User.near("#{params[:location]}, Victoria, Australia", params[:distance].to_i, order: :distance)
      @users.each do |user|
        @pets << Pet.where(user_id: user.id)
      end
      @pets.flatten!
    end     
    @pets.reject { |pet| pet.user_id != current_user}
    @markers = @users.geocoded.map do |user|     
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { user: user })
      }
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
