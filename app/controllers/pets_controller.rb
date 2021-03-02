class PetsController < ApplicationController
    def index
    @pets = Pets.all
            
    end
    
    def destroy
        @pets = Pets.find(parmas[:pet_id])
        @pets.destroy
        redirect_to pets_path
    end

  
end
