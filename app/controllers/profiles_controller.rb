class ProfilesController < ApplicationController
  def index
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profiles_params)
    if @profile.save
      redirect_to profiles_path
    else
      render "new",status: :unprocessable_entity
    end
  end 
  
  def edit
    @profile = Profile.find(params[:id])
  end
  
  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profiles_params)
      redirect_to profiles_path
    else
      render "edit",status: :unprocessable_entity
    end
  end
  
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path, notice: "task succesfully deleted!"
  end
  
  private
  def profiles_params
    params.require(:profile).permit(:name,:gender,:bio)
  end
end
