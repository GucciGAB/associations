class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_profile
  end
  
  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to users_path
    else
      render "new",status: :unprocessable_entity
    end
  end 
  
  def edit
    @user = User.find(params[:id])
    @user.build_profile if @user.profile.nil?
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      redirect_to users_path
    else
      render "edit",status: :unprocessable_entity
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "task succesfully deleted!"
  end
  
  private
  def users_params
    params.require(:user).permit(:email, profile_attributes: [:name, :bio, :gender])
  end
end
